local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local ConstantsModule = require(Modules.LuaApp.Constants)
local LeaveRobloxAlert = RoactModule.PureComponent:extend("LeaveRobloxAlert")

function LeaveRobloxAlert.init(p1)
	function p1.closeAlert()
		-- upvalues: p1 (copy)
		p1.props.closeAlert()
	end
end

function LeaveRobloxAlert.render(p1)
	-- upvalues: WithLocalizationModule (copy), RoactModule (copy), ConstantsModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local ContinueFunc = p1.props.continueFunc
	
	return WithLocalizationModule({
		titleText = "Feature.GameDetails.Message.LeavingRobloxTitle",
		bodyText = "Feature.GameDetails.Message.ExternalLinkWarning",
		cancelButtonText = "Feature.GamePage.LabelCancelField",
		confirmButtonText = "Feature.GameDetails.Action.Continue"
	})(function(p2)
		-- upvalues: RoactModule (upval), ConstantsModule (upval), InteractiveAlert (upval), ButtonType (upval), p1 (copy), ContinueFunc (copy)
		return (RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Active = true,
			Selectable = false,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = ConstantsModule.Color.BLACK
		}, {
			AlertWindow = RoactModule.createElement(InteractiveAlert, {
				title = p2.titleText,
				bodyText = p2.bodyText,
				buttonStackInfo = {
					buttons = {
						{
							buttonType = ButtonType.Secondary,
							props = { onActivated = p1.closeAlert, text = p2.cancelButtonText }
						},
						{
							buttonType = ButtonType.PrimarySystem,
							props = { onActivated = ContinueFunc, text = p2.confirmButtonText }
						}
					}
				},
				screenSize = p1.props.screenSize
			})
		}))
	end)
end

return (RoactServices.connect({ localization = RoactLocalizationModule })((RoactRoduxModule.connect(function(p1, _)
	return { screenSize = p1.ScreenSize }
end, function(Callback)
	-- upvalues: CloseCentralOverlayModule (copy)
	return {
		closeAlert = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			return Callback(CloseCentralOverlayModule())
		end
	}
end)(LeaveRobloxAlert))))