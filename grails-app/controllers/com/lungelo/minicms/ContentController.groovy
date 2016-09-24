package com.lungelo.minicms
import com.macrobit.grails.plugins.attachmentable.core.Attachmentable


import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class ContentController {

	static allowedMethods = [save: "POST", update: "POST ", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Content.list(params), model:[contentInstanceCount: Content.count()]
    }

    def show(Content contentInstance) {
		println "In the show controller..."
		println contentInstance.attachments
        respond contentInstance
		println "Exit show controller..."
    }

    def create() {
        respond new Content(params)
    }

    @Transactional
    def save(Content contentInstance) {
		println "In the save controller..."
        if (contentInstance == null) {
            notFound()
            return
        }

        if (contentInstance.hasErrors()) {
            respond contentInstance.errors, view:'create'
            return
        }
		println "Attaching files"
		
        contentInstance.save flush:true

		attachUploadedFilesTo(contentInstance)
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'content.label', default: 'Content'), contentInstance.id])
                redirect contentInstance
            }
            '*' { respond contentInstance, [status: CREATED] }
        }
    }

    def edit(Content contentInstance) {
		println "In the edit controller.."
        respond contentInstance
		println "Exit edit controller"
    }

    @Transactional
    def update(Content contentInstance) {
		println "In the update controller..."
        if (contentInstance == null) {
            notFound()
            return
        }

        if (contentInstance.hasErrors()) {
            respond contentInstance.errors, view:'edit'
            return
        }
		println "Uploading attachments..."
		attachUploadedFilesTo(contentInstance, [""+"C:"+ contentInstance.id])
		println "Attachments uploaded."
        contentInstance.save flush:true
		println contentInstance.getTotalAttachments(['pictures']) 
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Content.label', default: 'Content'), contentInstance.id])
                redirect contentInstance
            }
            '*'{ respond contentInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Content contentInstance) {
		println "In the delete controller.."
        if (contentInstance == null) {
            notFound()
            return
        }

        contentInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Content.label', default: 'Content'), contentInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT } 
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'content.label', default: 'Content'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
