local trustedContacts = script:FindFirstAncestor("TrustedContacts")
local httpService = game:GetService("HttpService")
local httpModule = require(trustedContacts.Parent.Http)
local myHttpRequestModule = require(trustedContacts.Networking.myHttpRequest)
local _ = require(trustedContacts.TrustedFriendActions.TFActionsEnum)
local fFlagTFPassQRCodeSourceModule = require(trustedContacts.Flags.FFlagTFPassQRCodeSource)

return function(p0, p1) --[[ line: 17 ]]
	-- upvalues: httpModule (ref), fFlagTFPassQRCodeSourceModule (ref), httpService (ref), myHttpRequestModule (ref)
	local formattedText = string.format("%s/profile-platform-api/v1/profiles/get", httpModule.Url.APIS_URL)
	local var6 = nil
	local var7 = nil
	
	if fFlagTFPassQRCodeSourceModule then
		local t = {
			friendRequestToken = if p1 then p1.friendRequestToken else nil,
			isQrCodeFlow = if p1 and p1.sentFromQrCode then true else nil
		}
		
		if next(t) then
			var6 = httpService:JSONEncode(t)
		end
	var7 = if p1 and p1.friendRequestToken and type(p1.friendRequestToken) == "table" then table.concat(p1.friendRequestToken, ",") else nil
	return myHttpRequestModule(formattedText, "POST", {
		postBody = {
			profileType = "User",
			profileId = p0,
			components = {
				{
					component = "TrustedFriendActions",
					context = if fFlagTFPassQRCodeSourceModule then var6 else var7
				}
			}
		}
	}):andThen(function(p2) --[[ line: 50 ]]
		local action
		if p2 then
			action = p2.responseBody and (p2.responseBody.components and (p2.responseBody.components.TrustedFriendActions and (p2.responseBody.components.TrustedFriendActions.action or nil)))
		end
		return action
	end)
end