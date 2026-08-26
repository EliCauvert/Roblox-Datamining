local reducerDependencies = require(game:GetService("CorePackages").Workspace.Packages.NotificationsCommon).ReducerDependencies
local shareLinksNetworking = reducerDependencies.ShareLinksNetworking
local shareLinksRodux = reducerDependencies.ShareLinksRodux

return function(p1)
	-- upvalues: shareLinksNetworking (ref), shareLinksRodux (ref)
	return {
		fetchShareInviteLink = function()
			-- upvalues: p1 (ref), shareLinksNetworking (copy), shareLinksRodux (copy)
			p1(shareLinksNetworking.GenerateLink.API({
				linkType = shareLinksRodux.Enums.LinkType.ExperienceInvite.rawValue()
			}))
		end
	}
end