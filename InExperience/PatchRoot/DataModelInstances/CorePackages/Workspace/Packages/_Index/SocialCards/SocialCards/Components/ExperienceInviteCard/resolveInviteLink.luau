local Parent = script.Parent
local Parent1 = Parent:FindFirstAncestor("SocialCards").Parent
local HttpClientModule = require(Parent1.HttpClient)
local UrlBase = require(Parent1.UrlBuilder).UrlBase
local _ = require(Parent.InviteTypes)
local ToIdModule = require(Parent.toId)
local ToNonEmptyStringModule = require(Parent.toNonEmptyString)

local function decode(p1, p2)
	-- upvalues: ToIdModule (copy), ToNonEmptyStringModule (copy)
	local NotificationExperienceInviteData = (if typeof(p1) == "table" then p1 else {}).notificationExperienceInviteData
	
	if typeof(NotificationExperienceInviteData) ~= "table" then
		error("Malformed resolve-link response")
	end
	if ToIdModule(NotificationExperienceInviteData.universeId) == p2.universeId then
		local NonEmptyStringModule = ToNonEmptyStringModule(NotificationExperienceInviteData.launchData)
		local IdModule = ToIdModule(NotificationExperienceInviteData.placeId)
		
		return if NotificationExperienceInviteData.status == "Valid" and IdModule ~= nil then {
			placeId = IdModule,
			gameInstanceId = ToNonEmptyStringModule(NotificationExperienceInviteData.instanceId),
			launchData = NonEmptyStringModule
		} else {
			placeId = p2.rootPlaceId,
			launchData = NonEmptyStringModule
		}
	else
		return nil
	end
end

return function(LinkId, p1, Network)
	-- upvalues: HttpClientModule (copy), UrlBase (copy), decode (copy)
	return HttpClientModule.asPromise((HttpClientModule.fetch({
		method = "POST",
		analyticsKey = "social-cards.resolve-invite-link",
		retry = false,
		url = UrlBase.APIS .. "/sharelinks/v1/resolve-link",
		body = {
			linkType = "NotificationExperienceInvite",
			linkId = LinkId
		},
		headers = { Accept = "application/json" },
		decode = function(p2)
			-- upvalues: decode (upval), p1 (copy)
			return (decode(p2, p1))
		end,
		network = Network
	}))):timeout(5):catch(function()
		return nil
	end)
end