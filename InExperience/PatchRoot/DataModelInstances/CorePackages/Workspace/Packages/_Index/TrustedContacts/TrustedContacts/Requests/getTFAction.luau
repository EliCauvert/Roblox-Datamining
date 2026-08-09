local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local httpModule = require(trustedContacts.Parent.Http)
local myHttpRequestModule = require(trustedContacts.Networking.myHttpRequest)
local _ = require(trustedContacts.TrustedFriendActions.TFActionsEnum)

return function(p0, p1) --[[ line: 14 ]]
	-- upvalues: httpModule (ref), myHttpRequestModule (ref)
	return myHttpRequestModule(string.format("%s/profile-platform-api/v1/profiles/get", httpModule.Url.APIS_URL), "POST", {
		postBody = {
			profileType = "User",
			profileId = p0,
			components = {
				{
					component = "TrustedFriendActions",
					context = if p1 and p1.friendRequestToken and type(p1.friendRequestToken) == "table" then table.concat(p1.friendRequestToken, ",") else nil
				}
			}
		}
	}):andThen(function(p2) --[[ line: 36 ]]
		local action
		if p2 then
			action = p2.responseBody and (p2.responseBody.components and (p2.responseBody.components.TrustedFriendActions and (p2.responseBody.components.TrustedFriendActions.action or nil)))
		end
		return action
	end)
end