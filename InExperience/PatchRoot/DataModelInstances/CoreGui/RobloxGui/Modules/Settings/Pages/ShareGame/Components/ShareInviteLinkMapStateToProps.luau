local reducerDependencies = require(game:GetService("CorePackages").Workspace.Packages.NotificationsCommon).ReducerDependencies
local shareLinksNetworking = reducerDependencies.ShareLinksNetworking
local shareLinksRodux = reducerDependencies.ShareLinksRodux

return function(p1)
	-- upvalues: shareLinksNetworking (ref), shareLinksRodux (ref)
	return {
		shareInviteLink = p1.ShareLinks.Invites.ShareInviteLink,
		fetchShareInviteLinkNetworkStatus = shareLinksNetworking.GenerateLink.getStatus(p1, {
			linkType = shareLinksRodux.Enums.LinkType.ExperienceInvite.rawValue()
		})
	}
end