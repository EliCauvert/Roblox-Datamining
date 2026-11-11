local CorePackages = game:GetService("CorePackages")
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local _ = require(CorePackages.Workspace.Packages.Navigation)

return function()
	-- upvalues: AppPage (copy)
	return {
		{
			[AppPage.TransferRobuxFlow] = {
				getScreen = function()
					return require(script.Parent.CurrencyTransferUniversalAppWrapper)
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