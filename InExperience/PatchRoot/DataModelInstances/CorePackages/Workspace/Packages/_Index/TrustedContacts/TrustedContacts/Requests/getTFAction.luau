local TrustedContacts = script:FindFirstAncestor("TrustedContacts")
local HttpService = game:GetService("HttpService")
local HttpModule = require(TrustedContacts.Parent.Http)
local MyHttpRequestModule = require(TrustedContacts.Networking.myHttpRequest)
local _ = require(TrustedContacts.TrustedFriendActions.TFActionsEnum)
local FFlagTFPassQRCodeSourceModule = require(TrustedContacts.Flags.FFlagTFPassQRCodeSource)

return function(ProfileId, p1)
	-- upvalues: HttpModule (copy), FFlagTFPassQRCodeSourceModule (copy), HttpService (copy), MyHttpRequestModule (copy)
	local Formatted = string.format("%s/profile-platform-api/v1/profiles/get", HttpModule.Url.APIS_URL)
	local Json = nil
	local Joined = nil
	
	if FFlagTFPassQRCodeSourceModule then
		local config = {
			friendRequestToken = p1 and p1.friendRequestToken or nil,
			isQrCodeFlow = if p1 and p1.sentFromQrCode then true else nil
		}
		
		if next(config) then
			Json = HttpService:JSONEncode(config)
		end
	else
		Joined = if p1 and p1.friendRequestToken and type(p1.friendRequestToken) == "table" then table.concat(p1.friendRequestToken, ",") else nil
	end
	return MyHttpRequestModule(Formatted, "POST", {
		postBody = {
			profileType = "User",
			profileId = ProfileId,
			components = {
				{
					component = "TrustedFriendActions",
					context = if FFlagTFPassQRCodeSourceModule then Json else Joined
				}
			}
		}
	}):andThen(function(Result)
		return Result and Result.responseBody and Result.responseBody.components and Result.responseBody.components.TrustedFriendActions and Result.responseBody.components.TrustedFriendActions.action or nil
	end)
end