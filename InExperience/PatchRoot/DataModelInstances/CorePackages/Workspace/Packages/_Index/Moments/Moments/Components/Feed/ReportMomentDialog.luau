local parent = script:FindFirstAncestor("Moments").Parent
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local dialog = foundationModule.Dialog
local radioGroup = foundationModule.RadioGroup
local text = foundationModule.Text
local view = foundationModule.View
local useLocalization = localizationModule.Hooks.useLocalization
local t = {
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

return function(p0) --[[ line: 39 | named "ReportMomentDialog" ]]
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), dialog (ref), foundationModule (ref), view (ref), text (ref), radioGroup (ref)
	local var4 = useLocalization(t)
	local var5, var6 = reactModule.useState(false)
	local var7, var8 = reactModule.useState(false)
	local safety, safety_1 = reactModule.useState("Safety")
	local var11, var12 = reactModule.useState("------")
	reactModule.useEffect(function() --[[ line: 46 ]]
		-- upvalues: p0 (ref), safety_1 (ref), var6 (ref), var8 (ref), var12 (ref)
		if p0.isOpen then
			safety_1("Safety")
			var6(false)
			var8(false)
			var12("------")
		end
	end, { p0.isOpen })
	local var13 = reactModule.useCallback(function() --[[ line: 55 ]]
		-- upvalues: var7 (ref), safety (ref), var8 (ref), p0 (ref), var12 (ref), var6 (ref)
		if var7 then return end
		local isIntellectualProperty = safety == "IntellectualProperty"
		var8(true)
		
		if not isIntellectualProperty then
			var8(false)
			p0.onClose()
		end
		task.spawn(function() --[[ line: 69 ]]
			-- upvalues: p0 (copy), safety (ref), isIntellectualProperty (ref), var12 (copy), var6 (copy), var8 (copy)
			local var17 = p0.onSubmitReport(safety, isIntellectualProperty)
			
			if isIntellectualProperty then
				var12(if var17 and var17 ~= "" then var17 else "------")
				var6(true)
				var8(false)
			end
		end)
	end, { var7, safety, p0.onClose, p0.onSubmitReport })
	local var14 = reactModule.useCallback(function() --[[ line: 83 ]]
		-- upvalues: var7 (ref), p0 (ref)
		if var7 then
			return
		end
		p0.onClose()
	end, { var7, p0.onClose })
	local var15 = reactModule.useCallback(function() --[[ line: 91 ]]
		-- upvalues: var6 (ref), p0 (ref)
		var6(false)
		p0.onClose()
	end, { p0.onClose })
	
	return if var5 then reactModule.createElement(dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		onClose = var15,
		size = foundationModule.Enums.DialogSize.Medium
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var4.ipReportSubmittedTitle }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			ReportCodeContent = reactModule.createElement(view, { tag = "col align-x-center gap-small size-full-0 auto-y" }, {
				ReportCodeLabel = reactModule.createElement(text, {
					tag = "auto-xy text-title-medium text-align-x-center content-default",
					LayoutOrder = 1,
					Text = var4.ipReportCodeLabel
				}),
				ReportCode = reactModule.createElement(text, {
					tag = "auto-xy text-heading-medium text-align-x-center content-emphasis",
					LayoutOrder = 2,
					Text = var11
				}),
				ReportSubmittedBody = reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
					RichText = true,
					LayoutOrder = 3,
					Text = var4.ipReportSubmittedBody
				})
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var4.ipReportSubmittedClose,
					variant = foundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = var15
				}
			}
		})
	}) elseif p0.isOpen then reactModule.createElement(dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		onClose = var14,
		size = foundationModule.Enums.DialogSize.Medium
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var4.reportDialogTitle }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			ReportReasons = reactModule.createElement(radioGroup.Root, { value = safety, onValueChanged = safety_1 }, {
				BreaksRules = reactModule.createElement(radioGroup.Item, { value = "Safety", label = var4.reportReasonBreaksRules }),
				IntellectualProperty = reactModule.createElement(radioGroup.Item, {
					value = "IntellectualProperty",
					label = var4.reportReasonIntellectualProperty
				})
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = if safety == "IntellectualProperty" then var4["continue"] else var4.report,
					variant = foundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = var13,
					isDisabled = var7
				},
				{
					text = var4.cancel,
					variant = foundationModule.Enums.ButtonVariant.Standard,
					onActivated = var14,
					isDisabled = var7
				}
			}
		})
	}) else nil
end