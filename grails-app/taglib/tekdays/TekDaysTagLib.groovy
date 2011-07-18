package tekdays

class TekDaysTagLib {

    def messageThread = {attrs ->
        def messages = attrs.messages.findAll{msg -> !msg.parent}
        processMessages(messages, 0)
    }
    
    def loginToggle = {
        out << "<div>"
        if (session.user) {
            out << "<span style='float:left'>"
            out << "Welcome ${session.user}."
            out << "</span><span style='float:right; margin-right:10px'>"
            out << "<a href='${createLink(controller:'tekUser', action:'logout')}'>"
            out << "Logout</a></span>"
        }
        else {
            out << "<span style='float:right; margin-right:10px'>"
            out << "<a href='${createLink(controller:'tekUser', action:'login')}'>"
            out << "Login </a></span>"
        }
        out << "</div><br/>"
    }
    
    def organizerEvents = {
        if (session.user) {
            def events = TekEvent.findAllByOrganizer(session.user)
            if (events) {
                out << "<div style='margin-left:25px; margin-top: 25px; width:85%'>"
                out << "<h3>Events you are organizing:</h3>"
                out << "<ul>"
                events.each {
                    out << "<li><a href='"
                    out << "${createLink(controller:'tekEvent', action:'show', id:it.id)}'>"
                    out << "${it}</a></li>"
                }
                out << "</ul>"
                out << "</div>"
            }
        }
    }
    
    def volunteerEvents = {
        if (session.user) {
            def events = TekEvent.createCriteria().list {
                volunteers {
                    eq('id', session.user?.id)
                }
            }
            if (events) {
                out << "<div style='margin-left:25px; margin-top: 25px; width:85%'>"
                out << "<h3>Events you volunteered for:</h3>"
                out << "<ul>"
                events.each{
                    out << "<li><a href='"
                    out << "${createLink(controller:'tekEvent', action:'show', id:it.id)}'>"
                    out << "${it}</a></li>"
                }
                out << "</ul>"
                out << "</div>"
            }
        }
    }
    
    def volunteerButton = { attrs ->
        if (session.user) {
            def user = session.user.merge()
            def event = TekEvent.get(attrs.eventId)
            println "want to see if this line gets printed..."
            if (event && !event.volunteers.contains(user)) {
                out << "<span id='volunteerSpan' class='menuButton'>"
                out << "<button id='volunteerButton' type='button'>"
                out << "Volunteer for this Event"
                out << "</button>"
                out << "</span>"
            }
        }
    }
    
    void processMessages(messages, indent) {
        messages.each {msg ->
            def body = "${msg?.author} - ${msg?.subject}"
            out << "<div style='height:30; margin-left:${indent * 20};'"
            out << "${remoteLink(action:'showDetail', id:msg.id, update:'details', body)}"
            out << "</div>"
            
            def children = Message.findAllByParent(msg)
            if(children){
                processMessages(children, indent + 1)
            }
        }
    }
}
