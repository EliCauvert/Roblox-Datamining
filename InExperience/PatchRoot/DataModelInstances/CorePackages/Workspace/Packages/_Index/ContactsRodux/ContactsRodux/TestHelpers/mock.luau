local roduxModule = require(script.Parent.Parent.Parent.Rodux)

return {
	mockFindContactFriends = "FIND_CONTACT_FRIENDS_SUCCEEDED_ACTION",
	mockGetContactEntitiesByContactId = "GET_CONTACT_ENTITIES",
	mockUploadContacts = "UPLOAD_CONTACTS",
	mockFindContactFriendsAction = roduxModule.makeActionCreator("FIND_CONTACT_FRIENDS_SUCCEEDED_ACTION", function() --[[ line: 5 ]]
		return {
			responseBody = {
				userContactIds = {
					"abc-123-456-1235",
					"bglk-124f-323fd-2443f",
					"fgk49rf-45f0-fsdf45-fd341",
					"gfg4-f1sd-fdfet5-34sddhu"
				}
			}
		}
	end),
	mockGetContactEntitiesByContactIdAction = roduxModule.makeActionCreator("GET_CONTACT_ENTITIES", function() --[[ line: 19 ]]
		return {
			responseBody = {
				userContactsEntities = {
					{
						id = "abc-123-456-1235",
						name = "Boberson Bob",
						mutualContacts = false
					},
					{
						id = "bglk-124f-323fd-2443f",
						name = "Smith John",
						mutualContacts = false
					},
					{
						id = "fgk49rf-45f0-fsdf45-fd341",
						name = "Robertson Robert",
						mutualContacts = false
					},
					{
						id = "gfg4-f1sd-fdfet5-34sddhu",
						name = "Folds Ben",
						mutualContacts = false
					}
				}
			}
		}
	end),
	mockUploadContactsAction = roduxModule.makeActionCreator("UPLOAD_CONTACTS", function(p0) --[[ line: 49 ]]
		return {
			responseBody = if p0 then { matchedContactFields = p0 } else {
				matchedContactFields = {
					{
						userContactId = "abc-123-456-1235",
						idAssignedByFE = "Boberson Bob1"
					},
					{
						userContactId = "abc-456-1235",
						idAssignedByFE = "Danderson Dan1"
					},
					{
						userContactId = "abc-123-456",
						idAssignedByFE = "Goferson Goff2"
					},
					{
						userContactId = "abc-1235",
						idAssignedByFE = "Toferson Toff1"
					}
				}
			}
		}
	end)
}