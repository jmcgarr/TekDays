package tekdays

class TekEvent {
    
    String city
    String name
    TekUser organizer
    String venue
    Date startDate
    Date endDate
    String description
    String twitterId
    String twitterPassword
    
    String toString() {
        "$name, $city"
    }
    
    static hasMany = [volunteers : TekUser, 
                      respondents: String, 
                      sponsorships: Sponsorship,
                      tasks: Task,
                      messages: Message]
    
    static searchable = true

    static constraints = {
        name()
        city()
        description(maxSize:5000)
        organizer()
        venue()
        startDate()
        endDate()
        volunteers(nullable: true)
        sponsorships(nullable:true)
        tasks(nullable:true)
        messages(nullable:true)
        twitterId(nullable:true)
        twitterPassword(nullable:true)
    }
}
