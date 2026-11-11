local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local Focusable = require(CorePackages.Packages.RoactGamepad).Focusable
local TwoStepRequiredOverlayModule = require(script.Parent.TwoStepRequiredOverlay)
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local NavigateDownToSecuritySettingsModule = require(Modules.LuaApp.Thunks.NavigateDownToSecuritySettings)
local ExtendResult = RoactModule.PureComponent:extend(script.Name)

function ExtendResult.init(p1)
	function p1.closePrompt()
		-- upvalues: p1 (copy)
		p1.props.navigation.goBack()
	end
	
	function p1.navigateToSecuritySettings()
		-- upvalues: p1 (copy)
		p1.closePrompt()
		p1.props.navigateToSecuritySettings()
	end
end

function ExtendResult.render(p1)
	-- upvalues: RoactModule (copy), Focusable (copy), TwoStepRequiredOverlayModule (copy)
	return RoactModule.createElement(Focusable.Frame, { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 1) }, {
		TwoStepRequiredOverlay = RoactModule.createElement(TwoStepRequiredOverlayModule, {
			closePrompt = p1.closePrompt,
			navigateToSecuritySettings = p1.navigateToSecuritySettings,
			screenSize = p1.props.screenSize
		})
	})
end

return (WithNavigationFunction((WithMappedNavigationParamsModule((WithOverlayFocusHandlingModule((RoactRoduxModule.connect(function(p1)
	return { screenSize = p1.ScreenSize }
end, function(Callback)
	-- upvalues: NavigateDownToSecuritySettingsModule (copy)
	return {
		navigateToSecuritySettings = function()
			-- upvalues: Callback (copy), NavigateDownToSecuritySettingsModule (upval)
			Callback(NavigateDownToSecuritySettingsModule())
		end
	}
end)(ExtendResult))))))))