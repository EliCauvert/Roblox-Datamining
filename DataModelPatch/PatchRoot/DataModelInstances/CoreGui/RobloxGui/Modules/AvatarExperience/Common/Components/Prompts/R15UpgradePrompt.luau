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
local ToggleEquipAssetModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.ToggleEquipAsset)
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local AXFixR15PromptDismiss = game:DefineFastFlag("AXFixR15PromptDismiss", false)
local R15UpgradePrompt = RoactModule.PureComponent:extend("R15UpgradePrompt")
R15UpgradePrompt.validateProps = TModule.strictInterface({
	bodyTextKey = TModule.string,
	onSwitchSelected = TModule.optional(TModule.callback),
	onOverlayClosed = TModule.optional(TModule.callback),
	onOverlayClosedPostClose = TModule.optional(TModule.callback),
	defaultChildRef = TModule.optional(TModule.table),
	focusController = TModule.optional(TModule.table),
	navigation = TModule.table,
	screenSize = TModule.Vector2,
	setAvatarType = TModule.callback,
	toggleEquipAsset = TModule.callback
})

function R15UpgradePrompt.init(p1)
	-- upvalues: ConstantsModule (copy), NavigationUtilsModule (copy)
	function p1.switchToR15()
		-- upvalues: p1 (copy), ConstantsModule (upval)
		p1.props.setAvatarType(ConstantsModule.AvatarType.R15)
		
		if p1.props.onSwitchSelected then
			p1.props.onSwitchSelected()
		end
		p1.closePrompt()
	end
	
	function p1.closePrompt()
		-- upvalues: NavigationUtilsModule (upval), p1 (copy)
		NavigationUtilsModule.closeOverlay(p1.props.navigation)
		
		if p1.props.onOverlayClosedPostClose then
			p1.props.onOverlayClosedPostClose()
		end
	end
end

function R15UpgradePrompt.renderLocalized(p1, p2)
	-- upvalues: AXFixR15PromptDismiss (copy), RoactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	return if AXFixR15PromptDismiss then RoactModule.createElement("TextButton", {
		Size = UDim2.fromScale(1, 1),
		Transparency = 1,
		Selectable = false,
		[RoactModule.Event.Activated] = p1.closePrompt
	}, {
		InteractiveAlert = RoactModule.createElement(InteractiveAlert, {
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
						props = {
							onActivated = p1.switchToR15,
							text = p2.confirmButtonText
						}
					}
				}
			},
			position = UDim2.fromScale(0.5, 0.5),
			screenSize = p1.props.screenSize,
			defaultChildRef = p1.props.defaultChildRef
		})
	}) else RoactModule.createElement(InteractiveAlert, {
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
					props = {
						onActivated = p1.switchToR15,
						text = p2.confirmButtonText
					}
				}
			}
		},
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = p1.props.screenSize,
		defaultChildRef = p1.props.defaultChildRef
	})
end

function R15UpgradePrompt.render(p1)
	-- upvalues: WithLocalizationFunction (copy)
	return WithLocalizationFunction({
		titleText = "Feature.Avatar.Label.SwitchToR15",
		confirmButtonText = "Feature.Avatar.Action.Switch",
		cancelButtonText = "Feature.Avatar.Action.Cancel",
		bodyText = p1.props.bodyTextKey
	})(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderLocalized(p2)
	end)
end

return (WithMappedNavigationParamsModule((WithOverlayFocusHandlingModule((RoactRoduxModule.connect(function(p1, _)
	return { screenSize = p1.ScreenSize }
end, function(Callback)
	-- upvalues: SetAvatarTypeModule (copy), ToggleEquipAssetModule (copy)
	return {
		setAvatarType = function(p1)
			-- upvalues: Callback (copy), SetAvatarTypeModule (upval)
			Callback(SetAvatarTypeModule(p1))
		end,
		toggleEquipAsset = function(p1, p2, p3)
			-- upvalues: Callback (copy), ToggleEquipAssetModule (upval)
			Callback(ToggleEquipAssetModule(p1, p2, p3))
		end
	}
end)(R15UpgradePrompt))))))