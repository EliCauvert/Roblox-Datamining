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

return reactModule.memo(function(p0)
	-- upvalues: useTokens (ref), reactModule (ref), useLocalization (ref), fFlagUpdateInGameAssetReportingCTAs (ref), dashModule (ref), sheet (ref), view (ref), iconButton (ref), buttonVariant (ref), iconName (ref), text (ref), inputLabel (ref), inputSize (ref), sideModalDropdownButtonModule (ref), textArea (ref), button (ref), isShowGenericIllegalContentReportingLink (ref), genericReportLink (ref), optionSelectorGroup (ref)
	local selectOnePrompt
	local var7 = useTokens()
	local var8, var9 = reactModule.useState(true)
	local none, none_1 = reactModule.useState("None")
	local var12, var13 = reactModule.useState(if p0.preselected then p0.preselected.problem else nil)
	local var14, var15 = reactModule.useState(if p0.preselected then p0.preselected.surface else nil)
	local var16, var17 = reactModule.useState("")
	local none_2, none_3 = reactModule.useState("None")
	local var20 = useLocalization({
		problemHeading = "Feature.ReportAbuse.Label.WhatWasWrong",
		surfaceHeading = "Feature.ReportAbuse.Label.WhereDidItHappen",
		selectOnePrompt = "Feature.ReportAbuse.Label.PleaseSelectOne",
		commentHeading = "Feature.ReportAbuse.Label.TellUsWhatHappenedNoOptional",
		textAreaPlaceholder = "Feature.SettingsHub.Label.ReportComment",
		continueButton = "Feature.ReportAbuse.Action.Continue",
		titleIpInfringement = "Feature.ReportAbuse.Title.SelectInSceneContinueYourReport",
		submitButton = if fFlagUpdateInGameAssetReportingCTAs then "Feature.ReportAbuse.Label.Report" else "Feature.ReportAbuse.Action.Submit"
	})
	local var21 = reactModule.useCallback(function(p1)
		-- upvalues: var17 (ref)
		var17(p1)
	end, {})
	local var22 = reactModule.useCallback(function()
		-- upvalues: none_1 (ref)
		none_1("Problem")
	end, {})
	local var23 = reactModule.useCallback(function()
		-- upvalues: none_1 (ref)
		none_1("Surface")
	end, {})
	local var24 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), p0 (ref)
		var9(false)
		task.wait(0.3)
		p0.onClose()
	end, { p0.onClose })
	local var25 = reactModule.useCallback(function()
		-- upvalues: none_1 (ref)
		none_1("None")
	end, {})
	local var26 = reactModule.useCallback(function(p2)
		-- upvalues: none (ref), dashModule (copy), p0 (ref), var13 (ref), var15 (ref), var25 (ref)
		if none == "Problem" then
			var13(dashModule.find(p0.problems, function(p3)
				-- upvalues: p2 (ref)
				return p3.value == p2
			end))
		else
			var15(dashModule.find(p0.surfaces, function(p4)
				-- upvalues: p2 (ref)
				return p4.value == p2
			end))
		end
		var25()
	end, { none, p0.problems, p0.surfaces, var25 })
	local var27 = var12 and var12.value == "ip infringement"
	local var28 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), var14 (ref), none_3 (ref), var27 (ref), var24 (ref), p0 (ref), var16 (ref)
		local var48 = if var12 ~= nil then "" else var12.value
		local var49 = if var14 ~= nil then "" else var14.value
		
		if var48 == "" and var49 == "" then
			none_3("Both")
			
			return
		elseif var48 == "" then
			none_3("Problem")
			
			return
		elseif var49 == "" and not var27 then
			none_3("Surface")
			
			return
		end
		none_3("None")
		var24()
		p0.onSubmit(var48, var49, var16)
	end, {
		var12, var14, var16, var24, p0.onSubmit, var27
	})
	local createElement = reactModule.createElement
	local fragment = reactModule.Fragment
	local var29 = nil
	local t = {}
	local createElement_1 = reactModule.createElement
	local root = sheet.Root
	local t_1 = { isOpen = var8, onClose = var24 }
	local t_2 = {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = false }, reactModule.createElement(view, { tag = "size-full-0 auto-y row gap-medium align-y-center" }, {
			Icon = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				variant = buttonVariant.Utility,
				icon = iconName.X,
				onActivated = var24
			}),
			Title = reactModule.createElement(text, {
				RichText = true,
				tag = "auto-xy text-wrap text-heading-small text-align-x-left",
				LayoutOrder = 2,
				Text = if var27 then var20.titleIpInfringement else p0.title
			})
		}))
	}
	local createElement_2 = reactModule.createElement
	local content = sheet.Content
	local var33 = nil
	local t_3 = {}
	local createElement_3 = reactModule.createElement
	local var35 = view
	local t_4 = {
		tag = "size-full-0 auto-y col gap-small",
		LayoutOrder = 1
	}
	local t_5 = {
		ProblemHeading = reactModule.createElement(inputLabel, {
			LayoutOrder = 1,
			Text = var20.problemHeading,
			size = inputSize.Small
		}),
		ProblemDropdownButton = reactModule.createElement(sideModalDropdownButtonModule, {
			layoutOrder = 2,
			text = if var12 then var12.label else var20.chooseOne,
			onActivated = var22,
			isDropdownError = if none_2 ~= "Problem" then none_2 == "Both" else true
		})
	}
	local createElement_4 = reactModule.createElement
	local var38 = text
	local t_6 = {
		RichText = true,
		tag = "auto-xy text-wrap text-align-x-left text-body-small",
		LayoutOrder = 3
	}
	
	if none_2 ~= "Problem" then
		selectOnePrompt = none_2 == "Both" and (var20.selectOnePrompt or "")
	end
	local var41
	t_6.Text = selectOnePrompt
	t_6.textStyle = var7.Color.System.Alert
	t_5.ProblemSubtext = createElement_4(var38, t_6)
	t_3.ProblemFrame = createElement_3(var35, t_4, t_5)
	
	if var27 then
		var41 = nil
	else
		local selectOnePrompt_1
		var41 = reactModule.createElement
		local var42 = view
		local t_7 = {
			tag = "size-full-0 auto-y col gap-small",
			LayoutOrder = 2
		}
		local t_8 = {
			SurfaceHeading = reactModule.createElement(inputLabel, {
				LayoutOrder = 1,
				Text = var20.surfaceHeading,
				size = inputSize.Small
			}),
			SurfaceDropdownButton = reactModule.createElement(sideModalDropdownButtonModule, {
				layoutOrder = 2,
				text = if var14 then var14.label else var20.chooseOne,
				onActivated = var23,
				isDropdownError = if none_2 ~= "Surface" then none_2 == "Both" else true
			})
		}
		local createElement_5 = reactModule.createElement
		local var45 = text
		local t_9 = {
			RichText = true,
			tag = "auto-xy text-wrap text-align-x-left text-body-small",
			LayoutOrder = 3
		}
		
		if none_2 ~= "Surface" then
			selectOnePrompt_1 = none_2 == "Both" and (var20.selectOnePrompt or "")
		end
		t_9.Text = selectOnePrompt_1
		t_9.textStyle = var7.Color.System.Alert
		t_8.SurfaceSubtext = createElement_5(var45, t_9)
		var41 = var41(var42, t_7, t_8)
	end
	t_3.ProblemSurface = var41
	t_3.TextArea = if var27 then nil else reactModule.createElement(textArea, {
		isRequired = false,
		LayoutOrder = 3,
		label = var20.commentHeading,
		text = var16,
		placeholder = var20.textAreaPlaceholder,
		onChanged = var21,
		width = UDim.new(1, 0)
	})
	t_2.Content = createElement_2(content, var33, t_3)
	t_2.Actions = reactModule.createElement(sheet.Actions, nil, {
		ActionsFrame = reactModule.createElement(view, { tag = "size-full-0 auto-xy col gap-small" }, {
			SubmitButton = reactModule.createElement(button, {
				LayoutOrder = 0,
				text = if var27 then var20.continueButton else var20.submitButton,
				onActivated = var28,
				variant = buttonVariant.Emphasis,
				width = UDim.new(1, 0)
			}),
			GenericReportLink = if isShowGenericIllegalContentReportingLink() then reactModule.createElement(genericReportLink, {}) else nil
		})
	})
	t.MainSheet = createElement_1(root, t_1, t_2)
	t.OptionSheet = reactModule.createElement(sheet.Root, { isOpen = none ~= "None", onClose = var25 }, {
		Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = false }, reactModule.createElement(view, { tag = "auto-xy row gap-medium align-y-center" }, {
			Icon = reactModule.createElement(iconButton, {
				LayoutOrder = 1,
				variant = buttonVariant.Utility,
				icon = iconName.ChevronLargeLeft,
				onActivated = var25
			}),
			Title = reactModule.createElement(text, {
				RichText = true,
				tag = "auto-xy text-align-x-left text-wrap text-heading-small text-align-x-left",
				LayoutOrder = 2,
				Text = if none == "Problem" then var20.problemHeading else var20.surfaceHeading
			})
		})),
		Content = reactModule.createElement(sheet.Content, nil, {
			Padding = reactModule.createElement(view, { tag = "padding-top-xxsmall", LayoutOrder = 1 }),
			OptionsList = reactModule.createElement(optionSelectorGroup.Root, {
				LayoutOrder = 2,
				value = if none == "Problem" and var12 ~= nil then var12.value elseif none == "Surface" and var14 ~= nil then var14.value else "",
				onValueChanged = var26
			}, dashModule.map(p0[if none == "Problem" then "problems" else "surfaces"], function(p5)
				-- upvalues: reactModule (copy), optionSelectorGroup (copy), inputSize (copy)
				return reactModule.createElement(optionSelectorGroup.Item, {
					key = p5.value,
					value = p5.value,
					label = p5.label,
					description = p5.description,
					size = inputSize.Small
				})
			end))
		})
	})
	
	return createElement(fragment, var29, t)
end)