package tekdays

class TekDaysTagLib {

    def messageThread = {attrs ->
        def messages = attrs.messages.findAll{msg -> !msg.parent}
        processMessages(messages, 0)
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
