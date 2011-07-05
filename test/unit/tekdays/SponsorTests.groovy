package tekdays

import grails.test.*

class SponsorTests extends GrailsUnitTestCase {
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testToString() {
        def sponsor = new Sponsor(name: 'Oracle',
                                  website: 'www.oracle.com',
                                  description: 'Big commercial organization.')
        
        assertEquals 'Oracle', sponsor.toString()
    }
}
