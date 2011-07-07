package tekdays

import grails.test.*

class TaskServiceTests extends GrailsUnitTestCase {
    
    def taskService
    
    protected void setUp() {
        super.setUp()
        new TekUser(fullName:'Tammy Tester',
                    userName:'tester',
                    email:'tester@test.com',
                    website:'test.com',
                    bio:'A test person').save()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testAddDefaultTasks() {
        def e = new TekEvent(name:'Test Event',
                             city:'TestCity, USA',
                             description:'Test Description',
                             organizer:TekUser.findByUserName('tester'),
                             venue:'TestCenter',
                             startDate:new Date(),
                             endDate:new Date() + 1)
        taskService.addDefaultTasks(e)
        assertEquals e.tasks.size(), 6
    }
}
