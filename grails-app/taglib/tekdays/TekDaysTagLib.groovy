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
