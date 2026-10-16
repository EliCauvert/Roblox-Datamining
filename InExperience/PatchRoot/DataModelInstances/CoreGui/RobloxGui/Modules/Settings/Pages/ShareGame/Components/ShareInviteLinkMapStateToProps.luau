local ReducerDependencies = require(game:GetService("CorePackages").Workspace.Packages.NotificationsCommon).ReducerDependencies
local ShareLinksNetworking = ReducerDependencies.ShareLinksNetworking
local ShareLinksRodux = ReducerDependencies.ShareLinksRodux

return function(p1) --[[ Line: 8 ]]
	-- upvalues: ShareLinksNetworking (copy), ShareLinksRodux (copy)
	return {
		shareInviteLink = p1.ShareLinks.Invites.ShareInviteLink,
		fetchShareInviteLinkNetworkStatus = ShareLinksNetworking.GenerateLink.getStatus(p1, {
			linkType = ShareLinksRodux.Enums.LinkType.ExperienceInvite.rawValue()
		})
	}
end