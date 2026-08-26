local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local dashModule = require(parent.Dash)
local dsaIllegalContentReportingModule = require(parent.DsaIllegalContentReporting)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local reactModule = require(parent.React)
local button = foundationModule.Button
local buttonVariant = foundationModule.Enums.ButtonVariant
local genericReportLink = dsaIllegalContentReportingModule.GenericReportLink
local iconButton = foundationModule.IconButton
local iconName = foundationModule.Enums.IconName
local inputLabel = foundationModule.InputLabel
local inputSize = foundationModule.Enums.InputSize
local isShowGenericIllegalContentReportingLink = dsaIllegalContentReportingModule.isShowGenericIllegalContentReportingLink
local optionSelectorGroup = foundationModule.OptionSelectorGroup
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local textArea = foundationModule.TextArea
local useLocalization = localizationModule.Hooks.useLocalization
local useTokens = foundationModule.Hooks.useTokens
local view = foundationModule.View
local sideModalDropdownButtonModule = require(genericAbuseReporting.Common.SideModalDropdownButton)
local fFlagUpdateInGameAssetReportingCTAs = require(parent.SharedFlags).FFlagUpdateInGameAssetReportingCTAs

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), useLocalization (ref), fFlagUpdateInGameAssetReportingCTAs (ref), dashModule (ref), sheet (ref), view (ref), iconButton (ref), buttonVariant (ref), iconName (ref), text (ref), inputLabel (ref), inputSize (ref), sideModalDropdownButtonModule (ref), textArea (ref), button (ref), isShowGenericIllegalContentReportingLink (ref), genericReportLink (ref), optionSelectorGroup (ref)
	local selectOnePrompt
	local var1 = useTokens()
	local var2, var3 = reactModule.useState(true)
	local none, none_1 = reactModule.useState("None")
	local var4, var5 = reactModule.useState(if p1.preselected then p1.preselected.problem else nil)
	local var6, var7 = reactModule.useState(if p1.preselected then p1.preselected.surface else nil)
	local var8, var9 = reactModule.useState("")
	local none_2, none_3 = reactModule.useState("None")
	local var10 = useLocalization({
		problemHeading = "Feature.ReportAbuse.Label.WhatWasWrong",
		surfaceHeading = "Feature.ReportAbuse.Label.WhereDidItHappen",
		selectOnePrompt = "Feature.ReportAbuse.Label.PleaseSelectOne",
		commentHeading = "Feature.ReportAbuse.Label.TellUsWhatHappenedNoOptional",
		textAreaPlaceholder = "Feature.SettingsHub.Label.ReportComment",
		continueButton = "Feature.ReportAbuse.Action.Continue",
		titleIpInfringement = "Feature.ReportAbuse.Title.SelectInSceneContinueYourReport",
		submitButton = if fFlagUpdateInGameAssetReportingCTAs then "Feature.ReportAbuse.Label.Report" else "Feature.ReportAbuse.Action.Submit"
	})
	local var11 = reactModule.useCallback(function(p2)
		-- upvalues: var9 (ref)
		var9(p2)
	end, {})
	local var12 = reactModule.useCallback(function()
		-- upvalues: none_1 (ref)
		none_1("Problem")
	end, {})
	local var13 = reactModule.useCallback(function()
		-- upvalues: none_1 (ref)
		none_1("Surface")
	end, {})
	local var14 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), p1 (ref)
		var3(false)
		task.wait(0.3)
		p1.onClose()
	end, { p1.onClose })
	local var15 = reactModule.useCallback(function()
		-- upvalues: none_1 (ref)
		none_1("None")
	end, {})
	local var16 = reactModule.useCallback(function(p2)
		-- upvalues: none (ref), dashModule (copy), p1 (ref), var5 (ref), var7 (ref), var15 (ref)
		if none == "Problem" then
			var5(dashModule.find(p1.problems, function(p3)
				-- upvalues: p2 (ref)
				return p3.value == p2
			end))
		else
			var7(dashModule.find(p1.surfaces, function(p3)
				-- upvalues: p2 (ref)
				return p3.value == p2
			end))
		end
		var15()
	end, { none, p1.problems, p1.surfaces, var15 })
	local var17 = var4 and var4.value == "ip infringement"
	local var18 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), var6 (ref), none_3 (ref), var17 (ref), var14 (ref), p1 (ref), var8 (ref)
		local var19 = if var4 ~= nil then "" else var4.value
		local var20 = if var6 ~= nil then "" else var6.value
		
		if var19 == "" and var20 == "" then
			none_3("Both")
			
			return
		elseif var19 == "" then
			none_3("Problem")
			
			return
		elseif var20 == "" and not var17 then
			none_3("Surface")
			
			return
		end
		none_3("None")
		var14()
		p1.onSubmit(var19, var20, var8)
	end, {
		var4, var6, var8, var14, p1.onSubmit, var17
	})
	local createElement = reactModule.createElement
	local fragment = reactModule.Fragment
	local var19 = nil
	local t = {}
	local createElement_1 = reactModule.createElement
	local root = sheet.Root
	local t_1 = { isOpen = var2, onClose = var14 }
	local t_2 = {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = false }, reactModule.createElement(view, { tag = "size-full-0 auto-y row gap-medium align-y-center" }, {
			Icon = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				variant = buttonVariant.Utility,
				icon = iconName.X,
				onActivated = var14
			}),
			Title = reactModule.createElement(text, {
				RichText = true,
				tag = "auto-xy text-wrap text-heading-small text-align-x-left",
				LayoutOrder = 2,
				Text = if var17 then var10.titleIpInfringement else p1.title
			})
		}))
	}
	local createElement_2 = reactModule.createElement
	local content = sheet.Content
	local var20 = nil
	local t_3 = {}
	local createElement_3 = reactModule.createElement
	local var21 = view
	local t_4 = {
		tag = "size-full-0 auto-y col gap-small",
		LayoutOrder = 1
	}
	local t_5 = {
		ProblemHeading = reactModule.createElement(inputLabel, {
			LayoutOrder = 1,
			Text = var10.problemHeading,
			size = inputSize.Small
		}),
		ProblemDropdownButton = reactModule.createElement(sideModalDropdownButtonModule, {
			layoutOrder = 2,
			text = if var4 then var4.label else var10.chooseOne,
			onActivated = var12,
			isDropdownError = if none_2 ~= "Problem" then none_2 == "Both" else true
		})
	}
	local createElement_4 = reactModule.createElement
	local var22 = text
	local t_6 = {
		RichText = true,
		tag = "auto-xy text-wrap text-align-x-left text-body-small",
		LayoutOrder = 3
	}
	
	if none_2 ~= "Problem" then
		selectOnePrompt = none_2 == "Both" and (var10.selectOnePrompt or "")
	end
	local var23
	t_6.Text = selectOnePrompt
	t_6.textStyle = var1.Color.System.Alert
	t_5.ProblemSubtext = createElement_4(var22, t_6)
	t_3.ProblemFrame = createElement_3(var21, t_4, t_5)
	
	if var17 then
		var23 = nil
	else
		local selectOnePrompt_1
		var23 = reactModule.createElement
		local var24 = view
		local t_7 = {
			tag = "size-full-0 auto-y col gap-small",
			LayoutOrder = 2
		}
		local t_8 = {
			SurfaceHeading = reactModule.createElement(inputLabel, {
				LayoutOrder = 1,
				Text = var10.surfaceHeading,
				size = inputSize.Small
			}),
			SurfaceDropdownButton = reactModule.createElement(sideModalDropdownButtonModule, {
				layoutOrder = 2,
				text = if var6 then var6.label else var10.chooseOne,
				onActivated = var13,
				isDropdownError = if none_2 ~= "Surface" then none_2 == "Both" else true
			})
		}
		local createElement_5 = reactModule.createElement
		local var25 = text
		local t_9 = {
			RichText = true,
			tag = "auto-xy text-wrap text-align-x-left text-body-small",
			LayoutOrder = 3
		}
		
		if none_2 ~= "Surface" then
			selectOnePrompt_1 = none_2 == "Both" and (var10.selectOnePrompt or "")
		end
		t_9.Text = selectOnePrompt_1
		t_9.textStyle = var1.Color.System.Alert
		t_8.SurfaceSubtext = createElement_5(var25, t_9)
		var23 = var23(var24, t_7, t_8)
	end
	t_3.ProblemSurface = var23
	t_3.TextArea = if var17 then nil else reactModule.createElement(textArea, {
		isRequired = false,
		LayoutOrder = 3,
		label = var10.commentHeading,
		text = var8,
		placeholder = var10.textAreaPlaceholder,
		onChanged = var11,
		width = UDim.new(1, 0)
	})
	t_2.Content = createElement_2(content, var20, t_3)
	t_2.Actions = reactModule.createElement(sheet.Actions, nil, {
		ActionsFrame = reactModule.createElement(view, { tag = "size-full-0 auto-xy col gap-small" }, {
			SubmitButton = reactModule.createElement(button, {
				LayoutOrder = 0,
				text = if var17 then var10.continueButton else var10.submitButton,
				onActivated = var18,
				variant = buttonVariant.Emphasis,
				width = UDim.new(1, 0)
			}),
			GenericReportLink = if isShowGenericIllegalContentReportingLink() then reactModule.createElement(genericReportLink, {}) else nil
		})
	})
	t.MainSheet = createElement_1(root, t_1, t_2)
	t.OptionSheet = reactModule.createElement(sheet.Root, { isOpen = none ~= "None", onClose = var15 }, {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = false }, reactModule.createElement(view, { tag = "auto-xy row gap-medium align-y-center" }, {
			Icon = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				variant = buttonVariant.Utility,
				icon = iconName.ChevronLargeLeft,
				onActivated = var15
			}),
			Title = reactModule.createElement(text, {
				RichText = true,
				tag = "auto-xy text-align-x-left text-wrap text-heading-small text-align-x-left",
				LayoutOrder = 2,
				Text = if none == "Problem" then var10.problemHeading else var10.surfaceHeading
			})
		})),
		Content = reactModule.createElement(sheet.Content, nil, {
			Padding = reactModule.createElement(view, { tag = "padding-top-xxsmall", LayoutOrder = 1 }),
			OptionsList = reactModule.createElement(optionSelectorGroup.Root, {
				LayoutOrder = 2,
				value = if none == "Problem" and var4 ~= nil then var4.value elseif none == "Surface" and var6 ~= nil then var6.value else "",
				onValueChanged = var16
			}, dashModule.map(p1[if none == "Problem" then "problems" else "surfaces"], function(p2)
				-- upvalues: reactModule (copy), optionSelectorGroup (copy), inputSize (copy)
				return reactModule.createElement(optionSelectorGroup.Item, {
					key = p2.value,
					value = p2.value,
					label = p2.label,
					description = p2.description,
					size = inputSize.Small
				})
			end))
		})
	})
	
	return createElement(fragment, var19, t)
end)