package tekdays

import grails.test.*

class TekUserTests extends GrailsUnitTestCase {
    
    protected void setUp() {
        super.setUp()
    }

    protected void tearDown() {
        super.tearDown()
    }

    void testToString() {

        def user = new TekUser(fullName: 'Mike McGarr',
                               userName: 'porterhouse91',
                               password: 'th1s1sf@k3',
                               email: 'foo@bar.com',
                               website: 'http://earlyandoften.wordpress.com',
                               bio: '''All work and no play makes Jack a very dull boy.''')
        assertThat 'Mike McGarr', user.toString()
    }
}
