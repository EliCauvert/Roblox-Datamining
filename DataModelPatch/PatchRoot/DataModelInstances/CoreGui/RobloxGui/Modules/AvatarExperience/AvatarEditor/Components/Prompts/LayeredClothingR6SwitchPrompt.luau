local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local WithOverlayFocusHandlingModule = require(Modules.AvatarExperience.Common.Components.withOverlayFocusHandling)
local WithMappedNavigationParamsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withMappedNavigationParams)
local SetAvatarTypeModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetAvatarType)
local RemoveLayeredClothingModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.RemoveLayeredClothing)
local RemoveMakeupModule = require(Modules.AvatarExperience.AvatarEditor.Actions.RemoveMakeup)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local FFlagAXBlockMakeupEquipR6 = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXBlockMakeupEquipR6
local LayeredClothingR6SwitchPrompt = RoactModule.PureComponent:extend("LayeredClothingR6SwitchPrompt")
LayeredClothingR6SwitchPrompt.validateProps = TModule.strictInterface({
	onOverlayClosed = TModule.optional(TModule.callback),
	defaultChildRef = TModule.optional(TModule.table),
	focusController = TModule.optional(TModule.table),
	navigation = TModule.table,
	screenSize = TModule.Vector2,
	setAvatarType = TModule.callback,
	removeLayeredClothing = TModule.callback,
	removeMakeup = if FFlagAXBlockMakeupEquipR6 then TModule.callback else nil
})

function LayeredClothingR6SwitchPrompt.init(p1)
	-- upvalues: FFlagAXBlockMakeupEquipR6 (copy), ConstantsModule (copy), NavigationUtilsModule (copy)
	function p1.switchToR6()
		-- upvalues: p1 (copy), FFlagAXBlockMakeupEquipR6 (upval), ConstantsModule (upval)
		p1.props.removeLayeredClothing()
		
		if FFlagAXBlockMakeupEquipR6 then
			p1.props.removeMakeup()
		end
		p1.props.setAvatarType(ConstantsModule.AvatarType.R6)
		p1.closePrompt()
	end
	
	function p1.closePrompt()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.props.navigation)
	end
end

function LayeredClothingR6SwitchPrompt.renderLocalized(p1, p2)
	-- upvalues: RoactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	return RoactModule.createElement(InteractiveAlert, {
		title = p2.titleText,
		bodyText = p2.bodyText,
		buttonStackInfo = {
			buttons = {
				{
					isDefaultChild = true,
					props = { onActivated = p1.closePrompt, text = p2.cancelButtonText }
				},
				{
					buttonType = ButtonType.PrimarySystem,
					props = { onActivated = p1.switchToR6, text = p2.confirmButtonText }
				}
			}
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = p1.props.screenSize,
		defaultChildRef = p1.props.defaultChildRef
	})
end

function LayeredClothingR6SwitchPrompt.render(p1)
	-- upvalues: WithLocalizationFunction (copy)
	return WithLocalizationFunction({
		titleText = "Common.AlertsAndOptions.Title.Warning",
		bodyText = "Feature.Avatar.Label.LayeredClothingSwitchR6Warning",
		confirmButtonText = "CommonUI.Controls.Action.Confirm",
		cancelButtonText = "Feature.Avatar.Action.Cancel"
	})(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderLocalized(p2)
	end)
end

return (WithMappedNavigationParamsModule((WithOverlayFocusHandlingModule((RoactRoduxModule.connect(function(p1, _)
	return { screenSize = p1.ScreenSize }
end, function(Callback)
	-- upvalues: SetAvatarTypeModule (copy), RemoveLayeredClothingModule (copy), FFlagAXBlockMakeupEquipR6 (copy), RemoveMakeupModule (copy)
	return {
		setAvatarType = function(p1)
			-- upvalues: Callback (copy), SetAvatarTypeModule (upval)
			Callback(SetAvatarTypeModule(p1))
		end,
		removeLayeredClothing = function()
			-- upvalues: Callback (copy), RemoveLayeredClothingModule (upval)
			Callback(RemoveLayeredClothingModule())
		end,
		removeMakeup = if FFlagAXBlockMakeupEquipR6 then function()
			-- upvalues: Callback (copy), RemoveMakeupModule (upval)
			Callback(RemoveMakeupModule())
		end else nil
	}
end)(LayeredClothingR6SwitchPrompt))))))