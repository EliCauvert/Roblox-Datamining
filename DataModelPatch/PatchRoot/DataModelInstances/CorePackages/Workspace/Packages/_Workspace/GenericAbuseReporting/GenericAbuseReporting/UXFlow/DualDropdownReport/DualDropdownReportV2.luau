local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local DashModule = require(Parent.Dash)
local DsaIllegalContentReportingModule = require(Parent.DsaIllegalContentReporting)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local GenericReportLink = DsaIllegalContentReportingModule.GenericReportLink
local IconButton = FoundationModule.IconButton
local IconName = FoundationModule.Enums.IconName
local InputLabel = FoundationModule.InputLabel
local InputSize = FoundationModule.Enums.InputSize
local IsShowGenericIllegalContentReportingLinkFunction = DsaIllegalContentReportingModule.isShowGenericIllegalContentReportingLink
local OptionSelectorGroup = FoundationModule.OptionSelectorGroup
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local TextArea = FoundationModule.TextArea
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local SideModalDropdownButtonModule = require(GenericAbuseReporting.Common.SideModalDropdownButton)
local FFlagReportIPInfringement = require(Parent.SharedFlags).FFlagReportIPInfringement

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), UseLocalizationFunction (copy), DashModule (copy), FFlagReportIPInfringement (copy), Sheet (copy), View (copy), IconButton (copy), ButtonVariant (copy), IconName (copy), Text (copy), InputLabel (copy), InputSize (copy), SideModalDropdownButtonModule (copy), TextArea (copy), Button (copy), IsShowGenericIllegalContentReportingLinkFunction (copy), GenericReportLink (copy), OptionSelectorGroup (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local None, None2 = ReactModule.useState("None")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(p1.preselected and p1.preselected.problem or nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(p1.preselected and p1.preselected.surface or nil)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState("")
	local None1, None2_1 = ReactModule.useState("None")
	local UseLocalizationResult = UseLocalizationFunction({
		problemHeading = "Feature.ReportAbuse.Label.WhatWasWrong",
		surfaceHeading = "Feature.ReportAbuse.Label.WhereDidItHappen",
		selectOnePrompt = "Feature.ReportAbuse.Label.PleaseSelectOne",
		commentHeading = "Feature.ReportAbuse.Label.TellUsWhatHappenedNoOptional",
		textAreaPlaceholder = "Feature.SettingsHub.Label.ReportComment",
		submitButton = "Feature.ReportAbuse.Action.Submit",
		continueButton = "Feature.ReportAbuse.Action.Continue",
		titleIpInfringement = "Feature.ReportAbuse.Title.SelectInSceneContinueYourReport"
	})
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_3 (copy)
		UseStateResult2_3(p2)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: None2 (copy)
		None2("Surface")
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), p1 (copy)
		UseStateResult2(false)
		task.wait(0.3)
		p1.onClose()
	end, { p1.onClose })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: None2 (copy)
		None2("None")
	end, {})
	local IsIpInfringement: boolean = FFlagReportIPInfringement and (UseStateResult1 and UseStateResult1.value == "ip infringement")
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		MainSheet = ReactModule.createElement(Sheet.Root, { isOpen = UseStateResult, onClose = UseResult2 }, {
			Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = false }, ReactModule.createElement(View, { tag = "size-full-0 auto-y row gap-medium align-y-center" }, {
				Icon = ReactModule.createElement(IconButton, {
					LayoutOrder = 1,
					variant = ButtonVariant.Utility,
					icon = IconName.X,
					onActivated = UseResult2
				}),
				Title = ReactModule.createElement(Text, {
					RichText = true,
					tag = "auto-xy text-wrap text-heading-small text-align-x-left",
					LayoutOrder = 2,
					Text = if IsIpInfringement then UseLocalizationResult.titleIpInfringement else p1.title
				})
			})),
			Content = ReactModule.createElement(Sheet.Content, nil, {
				ProblemFrame = ReactModule.createElement(View, {
					tag = "size-full-0 auto-y col gap-small",
					LayoutOrder = 1
				}, {
					ProblemHeading = ReactModule.createElement(InputLabel, {
						LayoutOrder = 1,
						Text = UseLocalizationResult.problemHeading,
						size = InputSize.Small
					}),
					ProblemDropdownButton = ReactModule.createElement(SideModalDropdownButtonModule, {
						layoutOrder = 2,
						text = UseStateResult1 and UseStateResult1.label or UseLocalizationResult.chooseOne,
						onActivated = ReactModule.useCallback(function()
							-- upvalues: None2 (copy)
							None2("Problem")
						end, {}),
						isDropdownError = None1 == "Problem" or None1 == "Both"
					}),
					ProblemSubtext = ReactModule.createElement(Text, {
						RichText = true,
						tag = "auto-xy text-wrap text-align-x-left text-body-small",
						LayoutOrder = 3,
						Text = (None1 == "Problem" or None1 == "Both") and UseLocalizationResult.selectOnePrompt or "",
						textStyle = UseTokensResult.Color.System.Alert
					})
				}),
				ProblemSurface = if IsIpInfringement then nil else ReactModule.createElement(View, {
					tag = "size-full-0 auto-y col gap-small",
					LayoutOrder = 2
				}, {
					SurfaceHeading = ReactModule.createElement(InputLabel, {
						LayoutOrder = 1,
						Text = UseLocalizationResult.surfaceHeading,
						size = InputSize.Small
					}),
					SurfaceDropdownButton = ReactModule.createElement(SideModalDropdownButtonModule, {
						layoutOrder = 2,
						text = UseStateResult3 and UseStateResult3.label or UseLocalizationResult.chooseOne,
						onActivated = UseResult1,
						isDropdownError = None1 == "Surface" or None1 == "Both"
					}),
					SurfaceSubtext = ReactModule.createElement(Text, {
						RichText = true,
						tag = "auto-xy text-wrap text-align-x-left text-body-small",
						LayoutOrder = 3,
						Text = (None1 == "Surface" or None1 == "Both") and UseLocalizationResult.selectOnePrompt or "",
						textStyle = UseTokensResult.Color.System.Alert
					})
				}),
				TextArea = if IsIpInfringement then nil else ReactModule.createElement(TextArea, {
					isRequired = false,
					LayoutOrder = 3,
					label = UseLocalizationResult.commentHeading,
					text = UseStateResult4,
					placeholder = UseLocalizationResult.textAreaPlaceholder,
					onChanged = UseResult,
					width = UDim.new(1, 0)
				})
			}),
			Actions = ReactModule.createElement(Sheet.Actions, nil, {
				ActionsFrame = ReactModule.createElement(View, { tag = "size-full-0 auto-xy col gap-small" }, {
					SubmitButton = ReactModule.createElement(Button, {
						LayoutOrder = 0,
						text = if IsIpInfringement then UseLocalizationResult.continueButton else UseLocalizationResult.submitButton,
						onActivated = ReactModule.useCallback(function()
							-- upvalues: UseStateResult1 (copy), UseStateResult3 (copy), None2_1 (copy), IsIpInfringement (copy), UseResult2 (copy), p1 (copy), UseStateResult4 (copy)
							local Value = if UseStateResult1 == nil then "" else UseStateResult1.value
							local Value1 = if UseStateResult3 == nil then "" else UseStateResult3.value
							
							if Value == "" and Value1 == "" then
								None2_1("Both")
								
								return
							end
							if Value == "" then
								None2_1("Problem")
								
								return
							end
							if Value1 == "" and not IsIpInfringement then
								None2_1("Surface")
								
								return
							else
								None2_1("None")
								UseResult2()
								p1.onSubmit(Value, Value1, UseStateResult4)
							end
						end, {
							UseStateResult1, UseStateResult3, UseStateResult4, UseResult2, p1.onSubmit,
							IsIpInfringement
						}),
						variant = ButtonVariant.Emphasis,
						width = UDim.new(1, 0)
					}),
					GenericReportLink = if IsShowGenericIllegalContentReportingLinkFunction() then ReactModule.createElement(GenericReportLink, {}) else nil
				})
			})
		}),
		OptionSheet = ReactModule.createElement(Sheet.Root, { isOpen = None ~= "None", onClose = UseResult3 }, {
			Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = false }, ReactModule.createElement(View, { tag = "auto-xy row gap-medium align-y-center" }, {
				Icon = ReactModule.createElement(IconButton, {
					LayoutOrder = 1,
					variant = ButtonVariant.Utility,
					icon = IconName.ChevronLargeLeft,
					onActivated = UseResult3
				}),
				Title = ReactModule.createElement(Text, {
					RichText = true,
					tag = "auto-xy text-align-x-left text-wrap text-heading-small text-align-x-left",
					LayoutOrder = 2,
					Text = None == "Problem" and UseLocalizationResult.problemHeading or UseLocalizationResult.surfaceHeading
				})
			})),
			Content = ReactModule.createElement(Sheet.Content, nil, {
				Padding = ReactModule.createElement(View, { tag = "padding-top-xxsmall", LayoutOrder = 1 }),
				OptionsList = ReactModule.createElement(OptionSelectorGroup.Root, {
					LayoutOrder = 2,
					value = if None == "Problem" and UseStateResult1 ~= nil then UseStateResult1.value elseif None == "Surface" and UseStateResult3 ~= nil then UseStateResult3.value else "",
					onValueChanged = ReactModule.useCallback(function(p2)
						-- upvalues: None (copy), DashModule (upval), p1 (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseResult3 (copy)
						if None == "Problem" then
							UseStateResult2_1((DashModule.find(p1.problems, function(p3): boolean
								-- upvalues: p2 (copy)
								return p3.value == p2
							end)))
						else
							UseStateResult2_2((DashModule.find(p1.surfaces, function(p3): boolean
								-- upvalues: p2 (copy)
								return p3.value == p2
							end)))
						end
						UseResult3()
					end, { None, p1.problems, p1.surfaces, UseResult3 })
				}, DashModule.map(p1[if None == "Problem" then "problems" else "surfaces"], function(p2)
					-- upvalues: ReactModule (upval), OptionSelectorGroup (upval), InputSize (upval)
					return ReactModule.createElement(OptionSelectorGroup.Item, {
						key = p2.value,
						value = p2.value,
						label = p2.label,
						description = p2.description,
						size = InputSize.Small
					})
				end))
			})
		})
	})
end)