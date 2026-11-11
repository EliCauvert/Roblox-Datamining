local ReducerDependencies = require(game:GetService("CorePackages").Workspace.Packages.NotificationsCommon).ReducerDependencies
local ShareLinksNetworking = ReducerDependencies.ShareLinksNetworking
local ShareLinksRodux = ReducerDependencies.ShareLinksRodux

return function(Callback)
	-- upvalues: ShareLinksNetworking (copy), ShareLinksRodux (copy)
	return {
		fetchShareInviteLink = function()
			-- upvalues: Callback (copy), ShareLinksNetworking (upval), ShareLinksRodux (upval)
			Callback(ShareLinksNetworking.GenerateLink.API({
				linkType = ShareLinksRodux.Enums.LinkType.ExperienceInvite.rawValue()
			}))
		end
	}
end