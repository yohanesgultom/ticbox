class UrlMappings {

	static mappings = {
        "/$controller/$action?/$id?"{
            constraints {
                // apply constraints here
            }
        }

        "/oauth/success"(controller: "shiroOAuth", action: "onSuccess")
        "/oauth/callback/$provider"(controller: "oauth", action: "callback")
        "/"(view: "ticbox")
        "500"(view:'/error')

        "/policies/termsOfUse"(view: "/policies/termsOfUse")
        "/policies/privacy"(view: "/policies/privacy")
        "/policies/antiSpam"(view: "/policies/antiSpam")
        "/policies/surveyContent"(view: "/policies/surveyContent")
        "/policies/surveyTermsOfService"(view: "/policies/surveyTermsOfService")
    }
}
