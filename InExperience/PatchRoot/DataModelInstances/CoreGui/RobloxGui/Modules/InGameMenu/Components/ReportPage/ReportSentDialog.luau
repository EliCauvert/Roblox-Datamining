local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local contextActionService = game:GetService("ContextActionService")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local t = inGameMenuDependenciesModule.t
local parent = script.Parent.Parent.Parent
local assetsModule = require(parent.Resources.Assets)
local closeReportSentDialogModule = require(parent.Actions.CloseReportSentDialog)
local constantsModule = require(parent.Resources.Constants)
local withLocalizationModule = require(parent.Localization.withLocalization)
local infoDialogModule = require(parent.Components.InfoDialog)
local focusHandlerModule = require(script.Parent.Parent.Connection.FocusHandler)
local reportSentDialog = roact.PureComponent:extend("ReportSentDialog")
reportSentDialog.validateProps = t.strictInterface({
	isReportSentOpen = t.boolean,
	onDismiss = t.callback,
	inputType = t.optional(t.string)
})

function reportSentDialog.init(p0)
	-- upvalues: roact (ref)
	p0.buttonRef = roact.createRef()
end

function reportSentDialog.renderFocusHandler(p1)
	-- upvalues: roact (ref), focusHandlerModule (ref), constantsModule (ref), guiService (ref), contextActionService (ref)
	return roact.createElement(focusHandlerModule, {
		isFocused = p1.props.inputType == constantsModule.InputType.Gamepad and p1.props.isReportSentOpen,
		didFocus = function()
			-- upvalues: guiService (copy), p1 (ref), contextActionService (copy)
			guiService:RemoveSelectionGroup("ReportSentDialogGroup")
			guiService:AddSelectionParent("ReportSentDialogGroup", p1.buttonRef:getValue())
			guiService.SelectedCoreObject = p1.buttonRef:getValue()
			contextActionService:BindCoreAction("ReporSentDialogSinkAction", function(_, _)
				return Enum.ContextActionResult.Sink
			end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.ButtonY, Enum.KeyCode.ButtonX)
		end,
		didBlur = function()
			-- upvalues: contextActionService (copy), guiService (copy)
			contextActionService:UnbindCoreAction("ReporSentDialogSinkAction")
			guiService:RemoveSelectionGroup("ReportSentDialogGroup")
		end
	})
end

function reportSentDialog.render(p2)
	-- upvalues: withLocalizationModule (ref), roact (ref), infoDialogModule (ref), assetsModule (ref)
	return withLocalizationModule({
		titleText = "CoreScripts.InGameMenu.Report.ThanksForReport",
		bodyText = "CoreScripts.InGameMenu.Report.WillReviewBody",
		dismissText = "CoreScripts.InGameMenu.Ok"
	})(function(p3)
		-- upvalues: roact (copy), infoDialogModule (copy), assetsModule (copy), p2 (ref)
		return roact.createFragment({
			Dialog = roact.createElement(infoDialogModule, {
				titleText = p3.titleText,
				bodyText = p3.bodyText,
				dismissText = p3.dismissText,
				iconImage = assetsModule.Images.SuccessTick,
				buttonRef = p2.buttonRef,
				onDismiss = p2.props.onDismiss,
				visible = p2.props.isReportSentOpen
			}),
			FocusHandler = p2:renderFocusHandler()
		})
	end)
end

return roactRodux.UNSTABLE_connect2(function(p4, _)
	return {
		isReportSentOpen = p4.report.reportSentOpen,
		inputType = p4.displayOptions.inputType
	}
end, function(p5)
	-- upvalues: closeReportSentDialogModule (ref)
	return {
		onDismiss = function()
			-- upvalues: p5 (ref), closeReportSentDialogModule (copy)
			p5(closeReportSentDialogModule())
		end
	}
end)(reportSentDialog)