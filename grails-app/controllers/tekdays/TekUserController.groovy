package tekdays

class TekUserController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [tekUserInstanceList: TekUser.list(params), tekUserInstanceTotal: TekUser.count()]
    }

    def create = {
        def tekUserInstance = new TekUser()
        tekUserInstance.properties = params
        return [tekUserInstance: tekUserInstance]
    }

    def save = {
        def tekUserInstance = new TekUser(params)
        if (tekUserInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'tekUser.label', default: 'TekUser'), tekUserInstance.id])}"
            redirect(action: "show", id: tekUserInstance.id)
        }
        else {
            render(view: "create", model: [tekUserInstance: tekUserInstance])
        }
    }

    def show = {
        def tekUserInstance = TekUser.get(params.id)
        if (!tekUserInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tekUser.label', default: 'TekUser'), params.id])}"
            redirect(action: "list")
        }
        else {
            [tekUserInstance: tekUserInstance]
        }
    }

    def edit = {
        def tekUserInstance = TekUser.get(params.id)
        if (!tekUserInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tekUser.label', default: 'TekUser'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [tekUserInstance: tekUserInstance]
        }
    }

    def update = {
        def tekUserInstance = TekUser.get(params.id)
        if (tekUserInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (tekUserInstance.version > version) {
                    
                    tekUserInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'tekUser.label', default: 'TekUser')] as Object[], "Another user has updated this TekUser while you were editing")
                    render(view: "edit", model: [tekUserInstance: tekUserInstance])
                    return
                }
            }
            tekUserInstance.properties = params
            if (!tekUserInstance.hasErrors() && tekUserInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'tekUser.label', default: 'TekUser'), tekUserInstance.id])}"
                redirect(action: "show", id: tekUserInstance.id)
            }
            else {
                render(view: "edit", model: [tekUserInstance: tekUserInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tekUser.label', default: 'TekUser'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def tekUserInstance = TekUser.get(params.id)
        if (tekUserInstance) {
            try {
                tekUserInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'tekUser.label', default: 'TekUser'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'tekUser.label', default: 'TekUser'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'tekUser.label', default: 'TekUser'), params.id])}"
            redirect(action: "list")
        }
    }
}
