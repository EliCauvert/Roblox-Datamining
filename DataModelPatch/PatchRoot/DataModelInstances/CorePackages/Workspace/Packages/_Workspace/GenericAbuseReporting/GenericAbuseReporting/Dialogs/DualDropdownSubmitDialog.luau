local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseLocalizedStringsModule = require(GenericAbuseReporting.LocalizationKeys.useLocalizedStrings)
local UseLayerCollectorFunction = require(Parent.UIBlox).Core.Layout.LayerCollector.useLayerCollector
local View = FoundationModule.View
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local CreateNextOrderFunction = require(Parent.ReactUtils).createNextOrder
local ButtonListModule = require(GenericAbuseReporting.Common.ButtonList)
local CommentTextFieldModule = require(GenericAbuseReporting.Common.CommentTextField)
local _ = require(GenericAbuseReporting.Common.ReasonDropdown)
local ScrollViewGradientModule = require(GenericAbuseReporting.Common.ScrollViewGradient)
local SideModalModule = require(GenericAbuseReporting.Common.SideModal)
local SideModalDropdownButtonModule = require(GenericAbuseReporting.Common.SideModalDropdownButton)

local function _(p1, p2): number
	return if p2.Y < p1.Y then 16 else 1
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseLayerCollectorFunction (copy), ReactModule (copy), UseLocalizedStringsModule (copy), UseLocalizationFunction (copy), CreateNextOrderFunction (copy), View (copy), SideModalModule (copy), ScrollViewGradientModule (copy), Text (copy), SideModalDropdownButtonModule (copy), CommentTextFieldModule (copy), ButtonListModule (copy)
	local UseTokensResult = UseTokensFunction()
	local AbsoluteSize = UseLayerCollectorFunction().absoluteSize
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState("")
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState("")
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState("")
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState("")
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState("")
	local UseStateResult8, UseStateResult2_7 = ReactModule.useState(false)
	local UseStateResult9, UseStateResult2_8 = ReactModule.useState(false)
	local UseStateResult10, UseStateResult2_9 = ReactModule.useState(false)
	local UseStateResult11, UseStateResult2_10 = ReactModule.useState("")
	local UseRefResult = ReactModule.useRef(nil)
	local UseStateResult12, UseStateResult2_11 = ReactModule.useState(Vector2.zero)
	local UseStateResult13, UseStateResult2_12 = ReactModule.useState(Vector2.zero)
	local UseLocalizedStringsModuleResult = UseLocalizedStringsModule()
	local UseLocalizationResult = UseLocalizationFunction({
		submitDialogProblemSubheading = "Feature.ReportAbuse.Label.WhatWasWrong",
		submitDialogSurfaceSubheading = "Feature.ReportAbuse.Label.WhereDidItHappen",
		selectOnePrompt = "Feature.ReportAbuse.Label.PleaseSelectOne",
		submitDialogCommentSubheading = "Feature.ReportAbuse.Label.TellUsWhatHappenedNoOptional",
		submitDialogTextBoxPlaceholder = "Feature.SettingsHub.Label.ReportComment",
		submitDialogOptional = "Feature.ReportAbuse.Label.Optional",
		chooseOne = "Feature.ReportAbuse.Label.ChooseOne"
	})
	local NextOrder = CreateNextOrderFunction()
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseRefResult (copy), UseStateResult2_11 (copy), UseStateResult2_12 (copy)
		if UseRefResult.current then
			local ScrollingFrame = UseRefResult.current:FindFirstChildWhichIsA("ScrollingFrame")
			
			if ScrollingFrame then
				UseStateResult2_11(ScrollingFrame.AbsoluteCanvasSize)
				UseStateResult2_12(ScrollingFrame.AbsoluteWindowSize)
				local Connection = ScrollingFrame:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function()
					-- upvalues: UseStateResult2_11 (upval), ScrollingFrame (copy)
					UseStateResult2_11(ScrollingFrame.AbsoluteCanvasSize)
				end)
				local Connection1 = ScrollingFrame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
					-- upvalues: UseStateResult2_12 (upval), ScrollingFrame (copy)
					UseStateResult2_12(ScrollingFrame.AbsoluteWindowSize)
				end)
				
				return function()
					-- upvalues: Connection (copy), Connection1 (copy)
					Connection:Disconnect()
					Connection1:Disconnect()
				end
			end
		else
			UseStateResult2_11(Vector2.zero)
			UseStateResult2_12(Vector2.zero)
		end
		return function() end
	end, { UseRefResult.current, AbsoluteSize })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2_7 (copy), UseStateResult2_8 (copy)
		UseStateResult2_7(false)
		UseStateResult2_8(false)
	end, { UseStateResult2_7, UseStateResult2_8 })
	
	return ReactModule.createElement(View, { tag = "size-full auto-xy" }, {
		ReportFlowModal = ReactModule.createElement(SideModalModule, {
			screenSize = AbsoluteSize,
			buttonProps = {
				text = UseLocalizedStringsModuleResult.formSubmit,
				onActivated = ReactModule.useCallback(function()
					-- upvalues: p1 (copy), UseStateResult3 (copy), UseStateResult6 (copy), UseStateResult11 (copy)
					p1.onSubmit(UseStateResult3, UseStateResult6, UseStateResult11)
				end, {
					p1.onSubmit,
					UseStateResult3,
					UseStateResult6,
					UseStateResult11
				}),
				validateState = ReactModule.useCallback(function(): boolean
					-- upvalues: UseStateResult3 (copy), UseStateResult6 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy)
					if UseStateResult3 ~= "" and UseStateResult6 ~= "" then
						return true
					end
					if UseStateResult3 == "" then
						UseStateResult2(true)
					end
					if UseStateResult6 == "" then
						UseStateResult2_1(true)
					end
					return false
				end, {
					UseStateResult3,
					UseStateResult6,
					UseStateResult2,
					UseStateResult2_1
				})
			},
			footerContent = p1.footerContent,
			onAbandon = p1.onAbandon,
			title = UseLocalizedStringsModuleResult.formTitle,
			width = math.min(400, AbsoluteSize.X - 50),
			height = math.min(500, AbsoluteSize.Y - 50)
		}, {
			SubmitReportFrame = ReactModule.createElement(ScrollViewGradientModule, {
				gradientHeight = 40,
				Size = UDim2.new(1, 0, 1, 0),
				ref = UseRefResult
			}, {
				Layout = ReactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, 30),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Padding = ReactModule.createElement("UIPadding", {
					PaddingBottom = UDim.new(0, 10),
					PaddingLeft = UDim.new(0, 1),
					PaddingRight = UDim.new(0, if UseStateResult13.Y < UseStateResult12.Y then 16 else 1)
				}),
				ReportProblemFrame = ReactModule.createElement(View, {
					ZIndex = 3,
					tag = "size-full-0 auto-y col align-x-left",
					LayoutOrder = NextOrder()
				}, {
					ProblemHeading = ReactModule.createElement(Text, {
						tag = "auto-xy padding-bottom-medium",
						Text = "1. " .. UseLocalizationResult.submitDialogProblemSubheading,
						fontStyle = UseTokensResult.Typography.TitleLarge,
						textStyle = UseTokensResult.Color.Content.Emphasis,
						LayoutOrder = NextOrder()
					}),
					ProblemDropdownPosition = ReactModule.createElement(View, {
						tag = "col align-x-left",
						Size = UDim2.new(1, 0, 0, 48),
						LayoutOrder = NextOrder()
					}, {
						ProblemDropdown = ReactModule.createElement(SideModalDropdownButtonModule, {
							setDropdownError = UseStateResult2,
							onActivated = function()
								-- upvalues: UseStateResult2_7 (copy), UseStateResult2_9 (copy)
								UseStateResult2_7(true)
								UseStateResult2_9(false)
							end,
							title = UseLocalizationResult.submitDialogProblemSubheading,
							text = if UseStateResult4 == "" then UseLocalizationResult.chooseOne else UseStateResult4 or UseLocalizationResult.chooseOne,
							isDropdownError = UseStateResult
						}),
						ProblemSubtext = ReactModule.createElement(Text, {
							TextWrapped = true,
							tag = "auto-xy padding-top-xxsmall",
							Text = UseStateResult and UseLocalizationResult.selectOnePrompt or UseStateResult5,
							TextXAlignment = Enum.TextXAlignment.Left,
							fontStyle = UseTokensResult.Typography.BodySmall,
							textStyle = UseStateResult and UseTokensResult.Color.System.Alert or UseTokensResult.Color.Content.Muted,
							LayoutOrder = NextOrder()
						})
					})
				}),
				ReportSurfaceFrame = ReactModule.createElement(View, {
					tag = "size-full-0 auto-y col align-x-left",
					LayoutOrder = NextOrder()
				}, {
					SurfaceHeading = ReactModule.createElement(Text, {
						tag = "auto-xy padding-bottom-medium",
						Text = "2. " .. UseLocalizationResult.submitDialogSurfaceSubheading,
						fontStyle = UseTokensResult.Typography.TitleLarge,
						textStyle = UseTokensResult.Color.Content.Emphasis,
						LayoutOrder = NextOrder()
					}),
					SurfaceDropdownPosition = ReactModule.createElement(View, {
						tag = "col align-x-left",
						Size = UDim2.new(1, 0, 0, 48),
						LayoutOrder = NextOrder()
					}, {
						SurfaceDropdown = ReactModule.createElement(SideModalDropdownButtonModule, {
							setDropdownError = UseStateResult2_1,
							onActivated = function()
								-- upvalues: UseStateResult2_8 (copy), UseStateResult2_9 (copy)
								UseStateResult2_8(true)
								UseStateResult2_9(false)
							end,
							title = UseLocalizationResult.submitDialogSurfaceSubheading,
							text = if UseStateResult6 == "" then UseLocalizationResult.chooseOne else UseStateResult7 or UseLocalizationResult.chooseOne,
							isDropdownError = UseStateResult1
						}),
						SurfaceSubtext = ReactModule.createElement(Text, {
							TextWrapped = true,
							tag = "auto-xy padding-top-xxsmall",
							Text = UseStateResult1 and UseLocalizationResult.selectOnePrompt or "",
							TextXAlignment = Enum.TextXAlignment.Left,
							fontStyle = UseTokensResult.Typography.BodySmall,
							textStyle = UseTokensResult.Color.System.Alert,
							LayoutOrder = NextOrder()
						})
					})
				}),
				ReportCommentFrame = ReactModule.createElement(View, {
					tag = "size-full-0 auto-y col align-x-left",
					LayoutOrder = NextOrder()
				}, {
					CommentHeading = ReactModule.createElement(Text, {
						tag = "auto-xy padding-bottom-medium",
						Text = "3. " .. UseLocalizationResult.submitDialogCommentSubheading,
						fontStyle = UseTokensResult.Typography.TitleLarge,
						textStyle = UseTokensResult.Color.Content.Emphasis,
						LayoutOrder = NextOrder()
					}),
					CommentTextContainer = ReactModule.createElement(View, {
						tag = "size-full-0 auto-y col align-x-left stroke-thick stroke-default radius-medium",
						LayoutOrder = NextOrder()
					}, {
						CommentTextField = ReactModule.createElement(CommentTextFieldModule, {
							text = UseStateResult11,
							backgroundColor3 = UseTokensResult.Color.Surface.Surface_100.Color3,
							placeholderText = UseLocalizationResult.submitDialogTextBoxPlaceholder,
							onUpdate = UseStateResult2_10,
							layoutOrder = NextOrder()
						})
					}),
					CommentSubtext = ReactModule.createElement(Text, {
						TextWrapped = true,
						tag = "auto-xy padding-top-xxsmall",
						Text = UseLocalizationResult.submitDialogOptional,
						TextXAlignment = Enum.TextXAlignment.Left,
						fontStyle = UseTokensResult.Typography.CaptionSmall,
						LayoutOrder = NextOrder()
					})
				})
			})
		}),
		DropdownSideModalBackground = if UseStateResult8 or UseStateResult9 then ReactModule.createElement(View, { tag = "size-full" }, {
			DropdownSideModalContainer = ReactModule.createElement(View, { tag = "size-full" }, {
				DropdownSideModal = ReactModule.createElement(SideModalModule, {
					screenSize = AbsoluteSize,
					title = if UseStateResult8 then UseLocalizationResult.submitDialogProblemSubheading else UseLocalizationResult.submitDialogSurfaceSubheading,
					width = math.min(400, AbsoluteSize.X - 50) - 50,
					height = math.min(500, AbsoluteSize.Y - 50) - 50,
					onAbandon = UseResult,
					closeWithAnimation = UseStateResult10
				}, {
					ScrollView = ReactModule.createElement(ScrollViewGradientModule, { gradientHeight = 48, Size = UDim2.new(1, 0, 1, 0) }, {
						Padding = ReactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, 16) }),
						ButtonList = ReactModule.createElement(ButtonListModule, {
							options = if UseStateResult8 then p1.reportProblems else p1.reportSurfaces,
							onSelected = function(p2, p3)
								-- upvalues: UseStateResult8 (copy), UseStateResult2_2 (copy), UseStateResult2_3 (copy), UseStateResult2 (copy), UseStateResult2_9 (copy), UseStateResult2_5 (copy), UseStateResult2_6 (copy), UseStateResult2_1 (copy)
								if UseStateResult8 then
									UseStateResult2_2(p2)
									UseStateResult2_3(p3)
									UseStateResult2(false)
									UseStateResult2_9(true)
									
									return
								else
									UseStateResult2_5(p2)
									UseStateResult2_6(p3)
									UseStateResult2_1(false)
									UseStateResult2_9(true)
								end
							end,
							setDescription = if UseStateResult8 then UseStateResult2_4 else nil,
							defaultValue = if UseStateResult8 then UseStateResult3 else UseStateResult6
						})
					})
				})
			})
		}) else nil
	})
end