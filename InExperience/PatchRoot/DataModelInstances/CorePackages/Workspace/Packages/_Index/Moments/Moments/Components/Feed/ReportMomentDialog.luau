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

return function(p1)
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), dialog (ref), foundationModule (ref), view (ref), text (ref), radioGroup (ref)
	local var1 = useLocalization(t)
	local var2, var3 = reactModule.useState(false)
	local var4, var5 = reactModule.useState(false)
	local safety, safety_1 = reactModule.useState("Safety")
	local var6, var7 = reactModule.useState("------")
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), safety_1 (ref), var3 (ref), var5 (ref), var7 (ref)
		if p1.isOpen then
			safety_1("Safety")
			var3(false)
			var5(false)
			var7("------")
		end
	end, { p1.isOpen })
	local var8 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), safety (ref), var5 (ref), p1 (ref), var7 (ref), var3 (ref)
		if var4 then return end
		local isIntellectualProperty = safety == "IntellectualProperty"
		var5(true)
		
		if not isIntellectualProperty then
			var5(false)
			p1.onClose()
		end
		task.spawn(function()
			-- upvalues: p1 (copy), safety (ref), isIntellectualProperty (ref), var7 (copy), var3 (copy), var5 (copy)
			local var9 = p1.onSubmitReport(safety, isIntellectualProperty)
			
			if isIntellectualProperty then
				var7(if var9 and var9 ~= "" then var9 else "------")
				var3(true)
				var5(false)
			end
		end)
	end, { var4, safety, p1.onClose, p1.onSubmitReport })
	local var9 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), p1 (ref)
		if var4 then
			return
		end
		p1.onClose()
	end, { var4, p1.onClose })
	local var10 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), p1 (ref)
		var3(false)
		p1.onClose()
	end, { p1.onClose })
	
	return if var2 then reactModule.createElement(dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		onClose = var10,
		size = foundationModule.Enums.DialogSize.Medium
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var1.ipReportSubmittedTitle }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			ReportCodeContent = reactModule.createElement(view, { tag = "col align-x-center gap-small size-full-0 auto-y" }, {
				ReportCodeLabel = reactModule.createElement(text, {
					tag = "auto-xy text-title-medium text-align-x-center content-default",
					LayoutOrder = 1,
					Text = var1.ipReportCodeLabel
				}),
				ReportCode = reactModule.createElement(text, {
					tag = "auto-xy text-heading-medium text-align-x-center content-emphasis",
					LayoutOrder = 2,
					Text = var6
				}),
				ReportSubmittedBody = reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
					RichText = true,
					LayoutOrder = 3,
					Text = var1.ipReportSubmittedBody
				})
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = var1.ipReportSubmittedClose,
					variant = foundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = var10
				}
			}
		})
	}) elseif p1.isOpen then reactModule.createElement(dialog.Root, {
		disablePortal = false,
		hasBackdrop = true,
		onClose = var9,
		size = foundationModule.Enums.DialogSize.Medium
	}, {
		DialogTitle = reactModule.createElement(dialog.Title, { LayoutOrder = 1, text = var1.reportDialogTitle }),
		DialogContent = reactModule.createElement(dialog.Content, { LayoutOrder = 2 }, {
			ReportReasons = reactModule.createElement(radioGroup.Root, { value = safety, onValueChanged = safety_1 }, {
				BreaksRules = reactModule.createElement(radioGroup.Item, { value = "Safety", label = var1.reportReasonBreaksRules }),
				IntellectualProperty = reactModule.createElement(radioGroup.Item, {
					value = "IntellectualProperty",
					label = var1.reportReasonIntellectualProperty
				})
			})
		}),
		DialogActions = reactModule.createElement(dialog.Actions, {
			LayoutOrder = 3,
			actions = {
				{
					text = if safety == "IntellectualProperty" then var1["continue"] else var1.report,
					variant = foundationModule.Enums.ButtonVariant.Emphasis,
					onActivated = var8,
					isDisabled = var4
				},
				{
					text = var1.cancel,
					variant = foundationModule.Enums.ButtonVariant.Standard,
					onActivated = var9,
					isDisabled = var4
				}
			}
		})
	}) else nil
end