package tekdays

class DashboardController {

    def twitterService
    
    def index = { }
    
    def dashboard = {
        def event = TekEvent.get(params.id)
        if (event) {
            if (event.organizer.userName == session.user.userName 
                || event.volunteers.collect{it.userName}.contains(session.user.userName)) {
            
                def tasks = Task.findAllByEventAndCompleted(event, false, [max: 5, sort:'dueDate'])
                def volunteers = event.volunteers
                def messages = Message.findAllByEventAndParentIsNull(event, [sort:'id', order:'desc'])
                def sponsorships = event.sponsorships
                println "sponsorships are ${sponsorships}"
                return [event: event, tasks: tasks, volunteers: volunteers, messages: messages, sponsorships: sponsorships]    
            }
            else {
                flash.message = "Access to dashboard for ${event.name} denied."
                redirect(controller:'tekEvent', action:'list')
            }
        }
        else {
            flash.message = "No event was found with an id of ${param.id}"
            redirect(controller:'tekEvent', action:'list')
        }
    }
    
    def tweet = {
        def event = TekEvent.get(params.id)
        if (event) {
            twitterService.setStatus(params.status, [username:event.twitterId, password:event.twitterPassword])
        }
        redirect(action:dashboard, id:event.id)
    }
}
