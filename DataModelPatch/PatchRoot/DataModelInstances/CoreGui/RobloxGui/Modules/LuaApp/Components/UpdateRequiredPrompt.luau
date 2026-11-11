local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local TModule = require(CorePackages.Packages.t)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppUpdateService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppUpdateService
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local UpdateMessageType = require(CorePackages.Workspace.Packages.RobloxAppUpdate).UpdateMessageType
local UpdateRequiredPrompt = RoactModule.PureComponent:extend("UpdateRequiredPrompt")
UpdateRequiredPrompt.validateProps = TModule.interface({
	canPerformBinaryUpdate = TModule.optional(TModule.boolean),
	showInternalChannelMessage = TModule.optional(TModule.boolean),
	updateMessageType = TModule.optional(TModule.string),
	closeOverlay = TModule.callback,
	screenSize = TModule.Vector2,
	appUpdateService = if game:GetEngineFeature("AutoUpgradeEngineFeatureOnly") then TModule.table else nil
})

function UpdateRequiredPrompt.init(p1)
	function p1.performManagedUpdate()
		-- upvalues: p1 (copy)
		p1.props.appUpdateService:performManagedUpdate()
	end
end

function UpdateRequiredPrompt.render(p1)
	-- upvalues: UpdateMessageType (copy), WithLocalizationModule (copy), RoactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	return WithLocalizationModule({
		titleText = "CommonUI.Controls.Label.ForceUpdateTitle",
		buttonText = "CommonUI.Controls.Action.CloseRoblox",
		cancelButtonText = "Feature.GamePage.LabelCancelField",
		bodyText = if p1.props.updateMessageType then if p1.props.updateMessageType == UpdateMessageType.BetaProgram then "CommonUI.Controls.Label.BetaProgramUpdateMessage" elseif p1.props.updateMessageType == UpdateMessageType.InternalChannel then "CommonUI.Controls.Label.ChannelConfigurationUpdateMessage" else "CommonUI.Controls.Label.ForceUpdateBody" elseif p1.props.showInternalChannelMessage then "CommonUI.Controls.Label.ChannelConfigurationUpdateMessage" else "CommonUI.Controls.Label.ForceUpdateBody"
	})(function(p2)
		-- upvalues: RoactModule (upval), InteractiveAlert (upval), p1 (copy), ButtonType (upval)
		return (RoactModule.createElement(InteractiveAlert, {
			screenSize = p1.props.screenSize,
			title = p2.titleText,
			bodyText = p2.bodyText,
			buttonStackInfo = {
				buttons = {
					if p1.props.canPerformBinaryUpdate then {
						buttonType = ButtonType.PrimarySystem,
						props = {
							text = p2.buttonText,
							onActivated = p1.performManagedUpdate
						}
					} else {
						buttonType = ButtonType.Secondary,
						props = {
							text = p2.cancelButtonText,
							onActivated = p1.props.closeOverlay
						}
					}
				}
			}
		}))
	end)
end

return RoactServices.connect({ appUpdateService = AppUpdateService })((RoactRoduxModule.connect(function(p2, _)
	return { screenSize = p2.ScreenSize }
end, function(Callback)
	-- upvalues: SetCentralOverlayModule (copy)
	return {
		closeOverlay = function()
			-- upvalues: Callback (copy), SetCentralOverlayModule (upval)
			Callback(SetCentralOverlayModule())
		end
	}
end)(UpdateRequiredPrompt)))