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
                def blurb = Blurb.findByName("custom_${event.id}")
                if (!blurb) {
                    blurb = new Blurb(name:"custom_${event.id}", content:"").save()
                }
                println "sponsorships are ${sponsorships}"
                return [event: event, tasks: tasks, volunteers: volunteers, messages: messages, sponsorships: sponsorships, blurb: blurb]    
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
    
    def updateBlurb = {
        def blurb = Blurb.get(params.id)
        blurb.content = params.content
        blurb.save()
        redirect(action:'dashboard', id:params.eventId)
    }
}
