local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local httpService = game:GetService("HttpService")
local httpModule = require(trustedContacts.Parent.Http)
local myHttpRequestModule = require(trustedContacts.Networking.myHttpRequest)
local _ = require(trustedContacts.TrustedFriendActions.TFActionsEnum)
local fFlagTFPassQRCodeSourceModule = require(trustedContacts.Flags.FFlagTFPassQRCodeSource)

return function(p1, p2)
	-- upvalues: httpModule (ref), fFlagTFPassQRCodeSourceModule (ref), httpService (ref), myHttpRequestModule (ref)
	local formattedText = string.format("%s/profile-platform-api/v1/profiles/get", httpModule.Url.APIS_URL)
	local var1 = nil
	local var2 = nil
	
	if fFlagTFPassQRCodeSourceModule then
		local t = {
			friendRequestToken = if p2 then p2.friendRequestToken else nil,
			isQrCodeFlow = if p2 and p2.sentFromQrCode then true else nil
		}
		
		if next(t) then
			var1 = httpService:JSONEncode(t)
		end
	var2 = if p2 and p2.friendRequestToken and type(p2.friendRequestToken) == "table" then table.concat(p2.friendRequestToken, ",") else nil
	return myHttpRequestModule(formattedText, "POST", {
		postBody = {
			profileType = "User",
			profileId = p1,
			components = {
				{
					component = "TrustedFriendActions",
					context = if fFlagTFPassQRCodeSourceModule then var1 else var2
				}
			}
		}
	}):andThen(function(p3)
		local action
		if p3 then
			action = p3.responseBody and (p3.responseBody.components and (p3.responseBody.components.TrustedFriendActions and (p3.responseBody.components.TrustedFriendActions.action or nil)))
		end
		return action
	end)
end