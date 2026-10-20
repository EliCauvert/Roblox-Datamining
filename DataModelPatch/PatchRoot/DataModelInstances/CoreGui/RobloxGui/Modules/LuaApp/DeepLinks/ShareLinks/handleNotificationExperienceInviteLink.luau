local Default = require(game:GetService("CorePackages").Workspace.Packages.ExperienceService).GameProtocol.default
local ShareLinkTypesModule = require(script.Parent.ShareLinkTypes)
local _ = require(script.Parent.Types)
local FFlagShareLinkAddReferredByPlayerIdLaunchParamModule = require(script.Parent.Flags.FFlagShareLinkAddReferredByPlayerIdLaunchParam)

return function(p1, p2)
	-- upvalues: FFlagShareLinkAddReferredByPlayerIdLaunchParamModule (copy), ShareLinkTypesModule (copy), Default (copy)
	local NotificationExperienceInviteData = p1.responseBody.notificationExperienceInviteData
	
	if NotificationExperienceInviteData and NotificationExperienceInviteData.placeId then
		local IsNotLaunchDataMatch: boolean = NotificationExperienceInviteData.launchData and NotificationExperienceInviteData.launchData ~= ""
		local InviterId = FFlagShareLinkAddReferredByPlayerIdLaunchParamModule and NotificationExperienceInviteData.inviterId
		p2.launchGame(NotificationExperienceInviteData.placeId, ShareLinkTypesModule.NotificationExperienceInviteLinkType, {
			launchData = if IsNotLaunchDataMatch then NotificationExperienceInviteData.launchData else nil,
			userId = NotificationExperienceInviteData.inviterId,
			referredByPlayerId = if InviterId then NotificationExperienceInviteData.inviterId else nil
		}, Default, "NotificationExperienceInviteLink")
		
		return
	end
end