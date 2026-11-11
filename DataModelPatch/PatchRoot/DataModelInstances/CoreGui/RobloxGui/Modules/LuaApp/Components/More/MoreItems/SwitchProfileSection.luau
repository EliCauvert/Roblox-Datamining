local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local MoreSectionModule = require(Modules.LuaApp.TenFootUI.MoreComponents.MoreSection)
local MoreStatusButtonModule = require(Modules.LuaApp.TenFootUI.MoreComponents.MoreStatusButton)
local BodyText = require(Modules.LuaApp.TenFootUI.MoreComponents.MoreText).BodyText
local _ = require(script.Parent.Types)
local ThirdPartyUserService = game:GetService("ThirdPartyUserService")

local function onSwitchProfile()
	-- upvalues: ThirdPartyUserService (copy)
	if ThirdPartyUserService then
		ThirdPartyUserService:ShowAccountPicker()
	end
end

return function(p1)
	-- upvalues: UseAppPolicyModule (copy), UseLocalizationFunction (copy), ReactModule (copy), MoreSectionModule (copy), MoreStatusButtonModule (copy), onSwitchProfile (copy), BodyText (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		switchProfile = "Feature.Settings.Heading.SwitchProfile",
		open = "Feature.Settings.Label.Open",
		title = p1.titleKey,
		switchProfileDescription = {
			"Feature.Settings.Description.SwitchProfile",
			platform = UseAppPolicyModule(function(p2)
				return p2.getPlatformDisplayName()
			end)
		}
	})
	
	return ReactModule.createElement(MoreSectionModule, {
		layoutOrder = p1.layoutOrder,
		withDivider = p1.withDivider,
		title = UseLocalizationResult.title
	}, {
		ReactModule.createElement(MoreStatusButtonModule, {
			layoutOrder = 1,
			title = UseLocalizationResult.switchProfile,
			status = UseLocalizationResult.open,
			onActivated = onSwitchProfile
		}),
		ReactModule.createElement(BodyText, {
			layoutOrder = 2,
			text = UseLocalizationResult.switchProfileDescription
		})
	})
end