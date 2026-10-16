local Parent = script:FindFirstAncestor("Moments").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Dialog = FoundationModule.Dialog
local RadioGroup = FoundationModule.RadioGroup
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local config = {
	report = "Feature.Moments.Action.Report",
	cancel = "Feature.Moments.Action.Cancel",
	["continue"] = "Feature.Moments.Action.Continue",
	reportDialogTitle = "Feature.Moments.Title.ReportPost",
	reportReasonBreaksRules = "Feature.Moments.Label.ReportReason.BreaksRules",
	reportReasonIntellectualProperty = "Feature.Moments.Label.ReportReason.IntellectualProperty",
	ipReportCodeLabel = "Feature.ReportAbuse.Label.YourReportCode",
	ipReportSubmittedBody = "Feature.ReportAbuse.Description.IpInfringementReportModal",
	ipReportSubmittedClose = "Feature.ReportAbuse.Action.Close",
	ipReportSubmittedTitle = "Feature.ReportAbuse.Title.SelectInSceneIpReport"
}

return function(p1) --[[ Line: 39 | Named "ReportMomentDialog" ]]
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), Dialog (copy), FoundationModule (copy), View (copy), Text (copy), RadioGroup (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local Safety, Safety2 = ReactModule.useState("Safety")
	local Text1, v1 = ReactModule.useState("------")
	ReactModule.useEffect(function() --[[ Line: 46 ]]
		-- upvalues: p1 (copy), Safety2 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), v1 (copy)
		if p1.isOpen then
			Safety2("Safety")
			UseStateResult2(false)
			UseStateResult2_1(false)
			v1("------")
		end
	end, { p1.isOpen })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 55 ]]
		-- upvalues: UseStateResult1 (copy), Safety (copy), UseStateResult2_1 (copy), p1 (copy), v1 (copy), UseStateResult2 (copy)
		if UseStateResult1 then return end
		local IsIntellectualProperty = Safety == "IntellectualProperty"
		UseStateResult2_1(true)
		
		if not IsIntellectualProperty then
			UseStateResult2_1(false)
			p1.onClose()
		end
		task.spawn(function() --[[ Line: 69 ]]
			-- upvalues: p1 (upval), Safety (copy), IsIntellectualProperty (copy), v1 (upval), UseStateResult2 (upval), UseStateResult2_1 (upval)
			local OnSubmitReportResult = p1.onSubmitReport(Safety, IsIntellectualProperty)
			
			if IsIntellectualProperty then
				v1(if OnSubmitReportResult and OnSubmitReportResult ~= "" then OnSubmitReportResult else "------")
				UseStateResult2(true)
				UseStateResult2_1(false)
			end
		end)
	end, { UseStateResult1, Safety, p1.onClose, p1.onSubmitReport })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 83 ]]
		-- upvalues: UseStateResult1 (copy), p1 (copy)
		if not UseStateResult1 then
			p1.onClose()
			
			return
		end
	end, { UseStateResult1, p1.onClose })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 91 ]]
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(false)
		p1.onClose()
	end, { p1.onClose })
	
	return if UseStateResult then ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		onClose = UseResult2,
		size = FoundationModule.Enums.DialogSize.Medium
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, {
			LayoutOrder = 1,
			text = UseLocalizationResult.ipReportSubmittedTitle
		}),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			ReportCodeContent = ReactModule.createElement(View, { tag = "col align-x-center gap-small size-full-0 auto-y" }, {
				ReportCodeLabel = ReactModule.createElement(Text, {
					tag = "auto-xy text-title-medium text-align-x-center content-default",
					LayoutOrder = 1,
					Text = UseLocalizationResult.ipReportCodeLabel
				}),
				ReportCode = ReactModule.createElement(Text, {
					tag = "auto-xy text-heading-medium text-align-x-center content-emphasis",
					LayoutOrder = 2,
					Text = Text1
				}),
				ReportSubmittedBody = ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
					RichText = true,
					LayoutOrder = 3,
					Text = UseLocalizationResult.ipReportSubmittedBody
				})
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = UseLocalizationResult.ipReportSubmittedClose,
					variant = FoundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = UseResult2
				}
			}
		})
	}) elseif p1.isOpen then ReactModule.createElement(Dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		onClose = UseResult1,
		size = FoundationModule.Enums.DialogSize.Medium
	}, {
		DialogTitle = ReactModule.createElement(Dialog.Title, {
			LayoutOrder = 1,
			text = UseLocalizationResult.reportDialogTitle
		}),
		DialogContent = ReactModule.createElement(Dialog.Content, { LayoutOrder = 2 }, {
			ReportReasons = ReactModule.createElement(RadioGroup.Root, { value = Safety, onValueChanged = Safety2 }, {
				BreaksRules = ReactModule.createElement(RadioGroup.Item, {
					value = "Safety",
					label = UseLocalizationResult.reportReasonBreaksRules
				}),
				IntellectualProperty = ReactModule.createElement(RadioGroup.Item, {
					value = "IntellectualProperty",
					label = UseLocalizationResult.reportReasonIntellectualProperty
				})
			})
		}),
		DialogActions = ReactModule.createElement(Dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = if Safety == "IntellectualProperty" then UseLocalizationResult["continue"] else UseLocalizationResult.report,
					variant = FoundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = UseResult,
					isDisabled = UseStateResult1
				},
				{
					text = UseLocalizationResult.cancel,
					variant = FoundationModule.Enums.ButtonVariant.Standard,
					onActivated = UseResult1,
					isDisabled = UseStateResult1
				}
			}
		})
	}) else nil
end