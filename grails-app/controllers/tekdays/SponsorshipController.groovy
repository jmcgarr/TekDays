package tekdays

class SponsorshipController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
        redirect(action: "list", params: params)
    }

    def list = {
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [sponsorshipInstanceList: Sponsorship.list(params), sponsorshipInstanceTotal: Sponsorship.count()]
    }

    def create = {
        def sponsorshipInstance = new Sponsorship()
        sponsorshipInstance.properties = params
        return [sponsorshipInstance: sponsorshipInstance]
    }

    def save = {
        def sponsorshipInstance = new Sponsorship(params)
        if (sponsorshipInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'sponsorship.label', default: 'Sponsorship'), sponsorshipInstance.id])}"
            redirect(action: "show", id: sponsorshipInstance.id)
        }
        else {
            render(view: "create", model: [sponsorshipInstance: sponsorshipInstance])
        }
    }

    def show = {
        def sponsorshipInstance = Sponsorship.get(params.id)
        if (!sponsorshipInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sponsorship.label', default: 'Sponsorship'), params.id])}"
            redirect(action: "list")
        }
        else {
            [sponsorshipInstance: sponsorshipInstance]
        }
    }

    def edit = {
        def sponsorshipInstance = Sponsorship.get(params.id)
        if (!sponsorshipInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sponsorship.label', default: 'Sponsorship'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [sponsorshipInstance: sponsorshipInstance]
        }
    }

    def update = {
        def sponsorshipInstance = Sponsorship.get(params.id)
        if (sponsorshipInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (sponsorshipInstance.version > version) {
                    
                    sponsorshipInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'sponsorship.label', default: 'Sponsorship')] as Object[], "Another user has updated this Sponsorship while you were editing")
                    render(view: "edit", model: [sponsorshipInstance: sponsorshipInstance])
                    return
                }
            }
            sponsorshipInstance.properties = params
            if (!sponsorshipInstance.hasErrors() && sponsorshipInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'sponsorship.label', default: 'Sponsorship'), sponsorshipInstance.id])}"
                redirect(action: "show", id: sponsorshipInstance.id)
            }
            else {
                render(view: "edit", model: [sponsorshipInstance: sponsorshipInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sponsorship.label', default: 'Sponsorship'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
        def sponsorshipInstance = Sponsorship.get(params.id)
        if (sponsorshipInstance) {
            try {
                sponsorshipInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'sponsorship.label', default: 'Sponsorship'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'sponsorship.label', default: 'Sponsorship'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'sponsorship.label', default: 'Sponsorship'), params.id])}"
            redirect(action: "list")
        }
    }
}
