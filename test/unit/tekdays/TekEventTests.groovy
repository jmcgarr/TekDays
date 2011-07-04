package tekdays

import grails.test.*

class TekEventTests extends GrailsUnitTestCase {
    
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testToString() {

        def tekEvent = new TekEvent(name: 'Groovy One',
                                    city: 'San Francisco, CA',
                                    organizer: 'John Doe',
                                    venue: 'Moscone Center',
                                    startDate: new Date('6/2/2009'),
                                    endDate: new Date('6/5/2009'),
                                    description: 'This conference will cover all...')
        
        assertEquals 'Groovy One, San Francisco, CA', tekEvent.toString()
    }
}
