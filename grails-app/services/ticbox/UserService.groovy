package ticbox

import org.apache.shiro.crypto.hash.Sha256Hash

class UserService {
    def respondentService

    def createUser(Map params) throws Exception {
        User newUser = new User(
            username: params.username,
            passwordHash: new Sha256Hash(params.password).toHex(),
            email: params.email
        )

        newUser.save()

        if (newUser && !newUser.hasErrors()) {
            try {

                Role role

                switch(params.userType){
                    case "surveyor" :
                        role = Role.findByName("Surveyor")

                        new SurveyorProfile(
                                email: params.email,
                                companyName: params.company,
                                userAccount: newUser
                        ).save()
                    break

                    case "respondent" :
                        role = Role.findByName("Respondent")

                        newUser.respondentProfile = new RespondentProfile()
                        newUser.save()
                        params.id = newUser.id
                        respondentService.updateRespondentDetail(newUser, params)
                        // reference point
                        respondentService.processReference(params.referrer, newUser)
                    break

                    case "admin" :
                        role = Role.findByName("Admin")
                    break
                }

                if (role) {
                    newUser.roles = [role]

                }else{
                    throw new Exception("Cannot get user's role")
                }

                newUser.save()

            } catch (e) {
                throw new Exception("Error in creating profile, ${e.message}")
            }
        }else{
            throw new Exception("Error in creating user, ${newUser ? newUser.errors : ''}")
        }

        return newUser
    }

    def deleteUsers(String[] ids) throws Exception {
        List<Long> delIds = HelperService.getListOfLong(ids)
        def users = User.findAll{
            inList("_id", delIds)
        }
        if (users) {
            User.deleteAll(users)
        } else {
            throw new Exception("No user was found")
        }
    }

}
