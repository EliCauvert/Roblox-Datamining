local CorePackages = game:GetService("CorePackages")
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local _ = require(CorePackages.Workspace.Packages.Navigation)
local FeatureTileAdPlayerOverlayTransparencyPercent = game:DefineFastInt("FeatureTileAdPlayerOverlayTransparencyPercent", 20)

return function()
	-- upvalues: AppPage (copy), CorePackages (copy), FeatureTileAdPlayerOverlayTransparencyPercent (copy)
	return {
		{
			[AppPage.FeatureTileAdPlayer] = {
				getScreen = function()
					-- upvalues: CorePackages (upval)
					return require(CorePackages.Workspace.Packages.FeatureTileAdPlayer).FeatureTileAdPlayer
				end,
				navigationOptions = {
					overlayEnabled = true,
					transparent = true,
					absorbInput = true,
					renderUnderlyingPage = true,
					disableBackButton = true,
					overlayTransparency = FeatureTileAdPlayerOverlayTransparencyPercent / 100
				}
			}
		}
	}
end