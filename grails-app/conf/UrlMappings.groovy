class UrlMappings {

	static mappings = {
		"/$controller/$action?/$id?"{
			constraints {
				// apply constraints here
			}
		}
        
        "/events/$nickname" {
            controller = "tekEvent"
            action = "show"
        }

		"/"(view:"/index")
		"500"(view:'/error')
	}
}
