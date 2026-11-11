local GuiService = game:GetService("GuiService")
local ContextActionService = game:GetService("ContextActionService")
local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent.Parent
local AssetsModule = require(Parent.Resources.Assets)
local CloseReportSentDialogModule = require(Parent.Actions.CloseReportSentDialog)
local ConstantsModule = require(Parent.Resources.Constants)
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local InfoDialogModule = require(Parent.Components.InfoDialog)
local FocusHandlerModule = require(script.Parent.Parent.Connection.FocusHandler)
local ReportSentDialog = Roact.PureComponent:extend("ReportSentDialog")
ReportSentDialog.validateProps = T.strictInterface({
	isReportSentOpen = T.boolean,
	onDismiss = T.callback,
	inputType = T.optional(T.string)
})

function ReportSentDialog.init(p1)
	-- upvalues: Roact (copy)
	p1.buttonRef = Roact.createRef()
end

function ReportSentDialog.renderFocusHandler(p1)
	-- upvalues: Roact (copy), FocusHandlerModule (copy), ConstantsModule (copy), GuiService (copy), ContextActionService (copy)
	return Roact.createElement(FocusHandlerModule, {
		isFocused = p1.props.inputType == ConstantsModule.InputType.Gamepad and p1.props.isReportSentOpen,
		didFocus = function()
			-- upvalues: GuiService (upval), p1 (copy), ContextActionService (upval)
			GuiService:RemoveSelectionGroup("ReportSentDialogGroup")
			GuiService:AddSelectionParent("ReportSentDialogGroup", p1.buttonRef:getValue())
			GuiService.SelectedCoreObject = p1.buttonRef:getValue()
			ContextActionService:BindCoreAction("ReporSentDialogSinkAction", function(_, _)
				return Enum.ContextActionResult.Sink
			end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonY, Enum.KeyCode.ButtonX)
		end,
		didBlur = function()
			-- upvalues: ContextActionService (upval), GuiService (upval)
			ContextActionService:UnbindCoreAction("ReporSentDialogSinkAction")
			GuiService:RemoveSelectionGroup("ReportSentDialogGroup")
		end
	})
end

function ReportSentDialog.render(p1)
	-- upvalues: WithLocalizationModule (copy), Roact (copy), InfoDialogModule (copy), AssetsModule (copy)
	return WithLocalizationModule({
		titleText = "CoreScripts.InGameMenu.Report.ThanksForReport",
		bodyText = "CoreScripts.InGameMenu.Report.WillReviewBody",
		dismissText = "CoreScripts.InGameMenu.Ok"
	})(function(p2)
		-- upvalues: Roact (upval), InfoDialogModule (upval), AssetsModule (upval), p1 (copy)
		return Roact.createFragment({
			Dialog = Roact.createElement(InfoDialogModule, {
				titleText = p2.titleText,
				bodyText = p2.bodyText,
				dismissText = p2.dismissText,
				iconImage = AssetsModule.Images.SuccessTick,
				buttonRef = p1.buttonRef,
				onDismiss = p1.props.onDismiss,
				visible = p1.props.isReportSentOpen
			}),
			FocusHandler = p1:renderFocusHandler()
		})
	end)
end

return RoactRodux.UNSTABLE_connect2(function(p1, _)
	return {
		isReportSentOpen = p1.report.reportSentOpen,
		inputType = p1.displayOptions.inputType
	}
end, function(Callback)
	-- upvalues: CloseReportSentDialogModule (copy)
	return {
		onDismiss = function()
			-- upvalues: Callback (copy), CloseReportSentDialogModule (upval)
			Callback(CloseReportSentDialogModule())
		end
	}
end)(ReportSentDialog)