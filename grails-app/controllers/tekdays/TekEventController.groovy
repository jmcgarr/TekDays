package tekdays

class TekEventController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [tekEventInstanceList: TekEvent.list(params), tekEventInstanceTotal: TekEvent.count()]
    }

    def create = {
        def tekEventInstance = new TekEvent()
        tekEventInstance.properties = params
        return [tekEventInstance: tekEventInstance]
    }

    def save = {
        def tekEventInstance = new TekEvent(params)
        if (tekEventInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'tekEvent.label', default: 'TekEvent'), tekEventInstance.id])}"
            redirect(action: "show", id: tekEventInstance.id)
        }
        else {
            render(view: "create", model: [tekEventInstance: tekEventInstance])
        }
    }

    def show = {
        def tekEventInstance = TekEvent.get(params.id)
        if (!tekEventInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tekEvent.label', default: 'TekEvent'), params.id])}"
            redirect(action: "list")
        }
        else {
            [tekEventInstance: tekEventInstance]
        }
    }

    def edit = {
        def tekEventInstance = TekEvent.get(params.id)
        if (!tekEventInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tekEvent.label', default: 'TekEvent'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [tekEventInstance: tekEventInstance]
        }
    }

    def update = {
        def tekEventInstance = TekEvent.get(params.id)
        if (tekEventInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (tekEventInstance.version > version) {
                    
                    tekEventInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'tekEvent.label', default: 'TekEvent')] as Object[], "Another user has updated this TekEvent while you were editing")
                    render(view: "edit", model: [tekEventInstance: tekEventInstance])
                    return
                }
            }
            tekEventInstance.properties = params
            if (!tekEventInstance.hasErrors() && tekEventInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'tekEvent.label', default: 'TekEvent'), tekEventInstance.id])}"
                redirect(action: "show", id: tekEventInstance.id)
            }
            else {
                render(view: "edit", model: [tekEventInstance: tekEventInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tekEvent.label', default: 'TekEvent'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def tekEventInstance = TekEvent.get(params.id)
        if (tekEventInstance) {
            try {
                tekEventInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'tekEvent.label', default: 'TekEvent'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'tekEvent.label', default: 'TekEvent'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tekEvent.label', default: 'TekEvent'), params.id])}"
            redirect(action: "list")
        }
    }
}
