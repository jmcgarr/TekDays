package tekdays

class Sponsor {
    
    String name
    String website
    String description
    byte[] logo
    static hasMany=[sponsorships:Sponsorship]
    
    String toString() {
        name
    }

    static constraints = {
        name(blank:false)
        website(blank:false)
        description(nullable:true, maxSize:5000)
        logo(nullable:true, maxSize:1000000)
        sponsorships(nullable:true)
    }
}
