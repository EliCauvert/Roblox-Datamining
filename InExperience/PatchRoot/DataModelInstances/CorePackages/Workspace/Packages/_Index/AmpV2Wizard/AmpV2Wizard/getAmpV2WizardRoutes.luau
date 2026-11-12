local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local Parent = AmpV2Wizard.Parent
local AppPage = require(Parent.RobloxAppEnums).AppPage
local _ = require(Parent.Navigation)

return function()
	-- upvalues: AppPage (copy), AmpV2Wizard (copy)
	return {
		{
			[AppPage.AmpV2Wizard] = {
				getScreen = function()
					-- upvalues: AmpV2Wizard (upval)
					return require(AmpV2Wizard.AmpV2WizardRoute)
				end,
				navigationOptions = {
					overlayEnabled = true,
					transparent = true,
					absorbInput = true,
					renderUnderlyingPage = true,
					disableBackButton = true,
					bottomTabBarHidden = true,
					sideTabBarHidden = false
				}
			}
		}
	}
end