local CorePackages = game:GetService("CorePackages")
local TelemetryService = game:GetService("TelemetryService")
local ReactModule = require(CorePackages.Packages.React)
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
local FoundationModule = require(CorePackages.Packages.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Dialog = FoundationModule.Dialog
local DialogSize = FoundationModule.Enums.DialogSize
local ConstantsModule = require(Modules.LuaApp.Constants)
local EnableSurveyPromptTelemetry = game:DefineFastFlag("EnableSurveyPromptTelemetry", false)
local UpdateCopyAndDesignOfSurveyPrompt = game:DefineFastFlag("UpdateCopyAndDesignOfSurveyPrompt", false)
local SurveyPrompt = RoactModule.PureComponent:extend("SurveyPrompt")
local config = {
	eventName = "SurveyPrompt",
	description = "Interactions with the qualtrics survey prompt",
	backends = { "EventIngest" },
	throttlingPercentage = game:DefineFastInt("SurveyPromptEventThrottleHunderedthsPercent", 0),
	lastUpdated = { 2025, 10, 29 }
}
local StandardizedFields = { "addSessionId", "addOSInfo", "addSessionInfo" }

local function _(p1, p2)
	return if p2 and p2 ~= "" then p2 else p1
end

function SurveyPrompt.init(p1)
	-- upvalues: EnableSurveyPromptTelemetry (copy), TelemetryService (copy), config (copy), StandardizedFields (copy)
	function p1.closePrompt()
		-- upvalues: EnableSurveyPromptTelemetry (upval), TelemetryService (upval), config (upval), StandardizedFields (upval), p1 (copy)
		if EnableSurveyPromptTelemetry then
			TelemetryService:LogEvent(config, {
				standardizedFields = StandardizedFields,
				customFields = { action = "closeButton" }
			})
		end
		p1.props.closeAlert()
		p1.props.closeFunc()
	end
	
	function p1.openSurvey()
		-- upvalues: EnableSurveyPromptTelemetry (upval), TelemetryService (upval), config (upval), StandardizedFields (upval), p1 (copy)
		if EnableSurveyPromptTelemetry then
			TelemetryService:LogEvent(config, {
				standardizedFields = StandardizedFields,
				customFields = { action = "openButton" }
			})
		end
		p1.props.closeAlert()
		p1.props.continueFunc()
	end
end

function SurveyPrompt.render(p1)
	-- upvalues: WithLocalizationModule (copy), UpdateCopyAndDesignOfSurveyPrompt (copy), ReactModule (copy), Dialog (copy), DialogSize (copy), ButtonVariant (copy), RoactModule (copy), ConstantsModule (copy), InteractiveAlert (copy), ButtonType (copy)
	return WithLocalizationModule({
		titleText = "Feature.QualtricsSurveyPrompt.Heading.Title",
		cancelButtonText = "Feature.QualtricsSurveyPrompt.Action.Close",
		confirmButtonText = "CommonUI.Features.Action.Go",
		titleText2 = "Feature.QualtricsSurveyPrompt.Heading.GiveUsFeedback",
		bodyText2 = "Feature.QualtricsSurveyPrompt.Description.TakeAQuickSurvey",
		cancelButtonText2 = "Feature.QualtricsSurveyPrompt.Action.Cancel",
		confirmButtonText2 = "Feature.QualtricsSurveyPrompt.Action.Continue"
	})(function(p2)
		-- upvalues: p1 (copy), UpdateCopyAndDesignOfSurveyPrompt (upval), ReactModule (upval), Dialog (upval), DialogSize (upval), ButtonVariant (upval), RoactModule (upval), ConstantsModule (upval), InteractiveAlert (upval), ButtonType (upval)
		local TitleText = p2.titleText
		local TitleText1 = p1.props.titleText
		local TitleText2 = if TitleText1 and TitleText1 ~= "" then TitleText1 else TitleText
		local FeatureQualtricsSurveyPromptDescriptionPromptText = p1.props.localization:Format("Feature.QualtricsSurveyPrompt.Description.PromptText", p1.props.displayName)
		local BodyText = p1.props.bodyText
		local BodyText1 = if BodyText and BodyText ~= "" then BodyText else FeatureQualtricsSurveyPromptDescriptionPromptText
		local CancelButtonText = p2.cancelButtonText
		local CancelButtonText1 = p1.props.cancelButtonText
		local CancelButtonText2 = if CancelButtonText1 and CancelButtonText1 ~= "" then CancelButtonText1 else CancelButtonText
		local ConfirmButtonText = p2.confirmButtonText
		local ConfirmButtonText1 = p1.props.confirmButtonText
		local ConfirmButtonText2 = if ConfirmButtonText1 and ConfirmButtonText1 ~= "" then ConfirmButtonText1 else ConfirmButtonText
		
		return if UpdateCopyAndDesignOfSurveyPrompt then ReactModule.createElement(Dialog.Root, {
			hasBackdrop = true,
			size = DialogSize.Small,
			onClose = p1.closePrompt
		}, {
			DialogTitle = ReactModule.createElement(Dialog.Title, { text = p2.titleText2 }),
			DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
				DialogText = ReactModule.createElement(Dialog.Text, { Text = p2.bodyText2 })
			}),
			DialogActions = ReactModule.createElement(Dialog.Actions, {
				LayoutOrder = 3,
				actions = {
					{
						text = p2.cancelButtonText2,
						variant = ButtonVariant.Standard,
						onActivated = p1.closePrompt
					},
					{
						text = p2.confirmButtonText2,
						variant = ButtonVariant.Emphasis,
						onActivated = p1.openSurvey
					}
				}
			})
		}) else RoactModule.createElement("Frame", {
			BackgroundTransparency = 0.5,
			Active = true,
			Selectable = false,
			Size = UDim2.new(1, 0, 1, 0),
			BackgroundColor3 = ConstantsModule.Color.BLACK
		}, {
			AlertWindow = RoactModule.createElement(InteractiveAlert, {
				bodyText = BodyText1,
				title = TitleText2,
				buttonStackInfo = {
					buttons = {
						{
							buttonType = ButtonType.Secondary,
							props = { onActivated = p1.closePrompt, text = CancelButtonText2 }
						},
						{
							buttonType = ButtonType.PrimarySystem,
							props = { onActivated = p1.openSurvey, text = ConfirmButtonText2 }
						}
					}
				},
				screenSize = p1.props.screenSize
			})
		})
	end)
end

return (RoactServices.connect({ localization = RoactLocalizationModule })((RoactRoduxModule.connect(function(p1, _)
	local User = p1.Users[p1.LocalUserId]
	
	return {
		screenSize = p1.ScreenSize,
		displayName = if User then User.displayName or User.name else "Robloxian"
	}
end, function(Callback)
	-- upvalues: CloseCentralOverlayModule (copy)
	return {
		closeAlert = function()
			-- upvalues: Callback (copy), CloseCentralOverlayModule (upval)
			return Callback(CloseCentralOverlayModule())
		end
	}
end)(SurveyPrompt))))