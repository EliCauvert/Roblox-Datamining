local CorePackages = game:GetService("CorePackages")
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local _ = require(CorePackages.Workspace.Packages.Navigation)

return function()
	-- upvalues: AppPage (copy)
	return {
		{
			[AppPage.ProfilePlatform] = {
				getScreen = function()
					return require(script.Parent.ProfilePlatformUniversalAppWrapper)
				end,
				navigationOptions = {
					overlayEnabled = true,
					transparent = true,
					absorbInput = true,
					overlayTransparency = 0.5,
					renderUnderlyingPage = true,
					disableBackButton = true
				}
			}
		}
	}
end