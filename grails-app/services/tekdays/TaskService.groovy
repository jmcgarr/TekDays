package tekdays

class TaskService {

    static transactional = true

    def addDefaultTasks(tekEvent) {
        if (tekEvent.tasks?.size() > 0)
            return // We only want to add tasks to a new event

        tekEvent.addToTasks new Task(title: 'Identify potential venues')
        tekEvent.addToTasks new Task(title: 'Get price / availability of venues')
        tekEvent.addToTasks new Task(title: 'Compile potential sponsor list')
        tekEvent.addToTasks new Task(title: 'Design promotional materials')
        tekEvent.addToTasks new Task(title: 'Compile potential advertising avenues')
        tekEvent.addToTasks new Task(title: 'Locate swag provider (preferably local)')
        tekEvent.save()
    }
}
