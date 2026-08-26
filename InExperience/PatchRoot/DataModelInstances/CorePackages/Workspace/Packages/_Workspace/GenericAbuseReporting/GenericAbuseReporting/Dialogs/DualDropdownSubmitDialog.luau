local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local UIBloxModule = require(parent.UIBlox)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local useLocalizedStringsModule = require(genericAbuseReporting.LocalizationKeys.useLocalizedStrings)
local useLayerCollector = UIBloxModule.Core.Layout.LayerCollector.useLayerCollector
local view = foundationModule.View
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local createNextOrder = require(parent.ReactUtils).createNextOrder
local buttonListModule = require(genericAbuseReporting.Common.ButtonList)
local commentTextFieldModule = require(genericAbuseReporting.Common.CommentTextField)
local _ = require(genericAbuseReporting.Common.ReasonDropdown)
local scrollViewGradientModule = require(genericAbuseReporting.Common.ScrollViewGradient)
local sideModalModule = require(genericAbuseReporting.Common.SideModal)
local sideModalDropdownButtonModule = require(genericAbuseReporting.Common.SideModalDropdownButton)

local function _(p1, p2)
	return if p2.Y < p1.Y then 16 else 1
end

return function(p1)
	-- upvalues: useTokens (ref), useLayerCollector (ref), reactModule (ref), useLocalizedStringsModule (ref), useLocalization (ref), createNextOrder (ref), view (ref), sideModalModule (ref), scrollViewGradientModule (ref), text (ref), sideModalDropdownButtonModule (ref), commentTextFieldModule (ref), buttonListModule (ref)
	local var1 = useTokens()
	local absoluteSize = useLayerCollector().absoluteSize
	local var2, var3 = reactModule.useState(false)
	local var4, var5 = reactModule.useState(false)
	local var6, var7 = reactModule.useState("")
	local var8, var9 = reactModule.useState("")
	local var10, var11 = reactModule.useState("")
	local var12, var13 = reactModule.useState("")
	local var14, var15 = reactModule.useState("")
	local var16, var17 = reactModule.useState(false)
	local var18, var19 = reactModule.useState(false)
	local var20, var21 = reactModule.useState(false)
	local var22, var23 = reactModule.useState("")
	local var24 = reactModule.useRef(nil)
	local var25, var26 = reactModule.useState(Vector2.zero)
	local var27, var28 = reactModule.useState(Vector2.zero)
	local var29 = useLocalizedStringsModule()
	local var30 = useLocalization({
		submitDialogProblemSubheading = "Feature.ReportAbuse.Label.WhatWasWrong",
		submitDialogSurfaceSubheading = "Feature.ReportAbuse.Label.WhereDidItHappen",
		selectOnePrompt = "Feature.ReportAbuse.Label.PleaseSelectOne",
		submitDialogCommentSubheading = "Feature.ReportAbuse.Label.TellUsWhatHappenedNoOptional",
		submitDialogTextBoxPlaceholder = "Feature.SettingsHub.Label.ReportComment",
		submitDialogOptional = "Feature.ReportAbuse.Label.Optional",
		chooseOne = "Feature.ReportAbuse.Label.ChooseOne"
	})
	local var31 = createNextOrder()
	reactModule.useLayoutEffect(function()
		-- upvalues: var24 (ref), var26 (ref), var28 (ref)
		if var24.current then
			local scrollingFrame = var24.current:FindFirstChildWhichIsA("ScrollingFrame")
			
			if scrollingFrame then
				var26(scrollingFrame.AbsoluteCanvasSize)
				var28(scrollingFrame.AbsoluteWindowSize)
				local var32 = scrollingFrame:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function()
					-- upvalues: var26 (copy), scrollingFrame (ref)
					var26(scrollingFrame.AbsoluteCanvasSize)
				end)
				local var33 = scrollingFrame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
					-- upvalues: var28 (copy), scrollingFrame (ref)
					var28(scrollingFrame.AbsoluteWindowSize)
				end)
				
				return function()
					-- upvalues: var32 (ref), var33 (ref)
					var32:Disconnect()
					var33:Disconnect()
				end
			end
		else
			var26(Vector2.zero)
			var28(Vector2.zero)
		end
		return function() end
	end, { var24.current, absoluteSize })
	
	return reactModule.createElement(view, { tag = "size-full auto-xy" }, {
		ReportFlowModal = reactModule.createElement(sideModalModule, {
			screenSize = absoluteSize,
			buttonProps = {
				text = var29.formSubmit,
				onActivated = reactModule.useCallback(function()
					-- upvalues: p1 (ref), var6 (ref), var12 (ref), var22 (ref)
					p1.onSubmit(var6, var12, var22)
				end, { p1.onSubmit, var6, var12, var22 }),
				validateState = reactModule.useCallback(function()
					-- upvalues: var6 (ref), var12 (ref), var3 (ref), var5 (ref)
					if var6 ~= "" and var12 ~= "" then
						return true
					elseif var6 == "" then
						var3(true)
					end
					if var12 == "" then
						var5(true)
					end
					return false
				end, { var6, var12, var3, var5 })
			},
			footerContent = p1.footerContent,
			onAbandon = p1.onAbandon,
			title = var29.formTitle,
			width = math.min(400, absoluteSize.X - 50),
			height = math.min(500, absoluteSize.Y - 50)
		}, {
			SubmitReportFrame = reactModule.createElement(scrollViewGradientModule, {
				gradientHeight = 40,
				Size = UDim2.new(1, 0, 1, 0),
				ref = var24
			}, {
				Layout = reactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, 30),
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Padding = reactModule.createElement("UIPadding", {
					PaddingBottom = UDim.new(0, 10),
					PaddingLeft = UDim.new(0, 1),
					PaddingRight = UDim.new(0, if var27.Y < var25.Y then 16 else 1)
				}),
				ReportProblemFrame = reactModule.createElement(view, {
					ZIndex = 3,
					tag = "size-full-0 auto-y col align-x-left",
					LayoutOrder = var31()
				}, {
					ProblemHeading = reactModule.createElement(text, {
						tag = "auto-xy padding-bottom-medium",
						Text = "1. " .. var39.submitDialogProblemSubheading,
						fontStyle = var1.Typography.TitleLarge,
						textStyle = var1.Color.Content.Emphasis,
						LayoutOrder = var31()
					}),
					ProblemDropdownPosition = reactModule.createElement(view, {
						tag = "col align-x-left",
						Size = UDim2.new(1, 0, 0, 48),
						LayoutOrder = var31()
					}, {
						ProblemDropdown = reactModule.createElement(sideModalDropdownButtonModule, {
							setDropdownError = var3,
							onActivated = function()
								-- upvalues: var17 (ref), var21 (ref)
								var17(true)
								var21(false)
							end,
							title = var30.submitDialogProblemSubheading,
							text = if var8 ~= "" then var8 else var30.chooseOne,
							isDropdownError = var2
						}),
						ProblemSubtext = reactModule.createElement(text, {
							TextWrapped = true,
							tag = "auto-xy padding-top-xxsmall",
							Text = if var2 then var30.selectOnePrompt else var10,
							TextXAlignment = Enum.TextXAlignment.Left,
							fontStyle = var1.Typography.BodySmall,
							textStyle = if var2 then var1.Color.System.Alert else var1.Color.Content.Muted,
							LayoutOrder = var31()
						})
					})
				}),
				ReportSurfaceFrame = reactModule.createElement(view, {
					tag = "size-full-0 auto-y col align-x-left",
					LayoutOrder = var31()
				}, {
					SurfaceHeading = reactModule.createElement(text, {
						tag = "auto-xy padding-bottom-medium",
						Text = "2. " .. var39.submitDialogSurfaceSubheading,
						fontStyle = var1.Typography.TitleLarge,
						textStyle = var1.Color.Content.Emphasis,
						LayoutOrder = var31()
					}),
					SurfaceDropdownPosition = reactModule.createElement(view, {
						tag = "col align-x-left",
						Size = UDim2.new(1, 0, 0, 48),
						LayoutOrder = var31()
					}, {
						SurfaceDropdown = reactModule.createElement(sideModalDropdownButtonModule, {
							setDropdownError = var5,
							onActivated = function()
								-- upvalues: var19 (ref), var21 (ref)
								var19(true)
								var21(false)
							end,
							title = var30.submitDialogSurfaceSubheading,
							text = if var12 ~= "" then var14 else var30.chooseOne,
							isDropdownError = var4
						}),
						SurfaceSubtext = reactModule.createElement(text, {
							TextWrapped = true,
							tag = "auto-xy padding-top-xxsmall",
							Text = if var4 then var30.selectOnePrompt else "",
							TextXAlignment = Enum.TextXAlignment.Left,
							fontStyle = var1.Typography.BodySmall,
							textStyle = var1.Color.System.Alert,
							LayoutOrder = var31()
						})
					})
				}),
				ReportCommentFrame = reactModule.createElement(view, {
					tag = "size-full-0 auto-y col align-x-left",
					LayoutOrder = var31()
				}, {
					CommentHeading = reactModule.createElement(text, {
						tag = "auto-xy padding-bottom-medium",
						Text = "3. " .. var39.submitDialogCommentSubheading,
						fontStyle = var1.Typography.TitleLarge,
						textStyle = var1.Color.Content.Emphasis,
						LayoutOrder = var31()
					}),
					CommentTextContainer = reactModule.createElement(view, {
						tag = "size-full-0 auto-y col align-x-left stroke-thick stroke-default radius-medium",
						LayoutOrder = var31()
					}, {
						CommentTextField = reactModule.createElement(commentTextFieldModule, {
							text = var22,
							backgroundColor3 = var1.Color.Surface.Surface_100.Color3,
							placeholderText = var30.submitDialogTextBoxPlaceholder,
							onUpdate = var23,
							layoutOrder = var31()
						})
					}),
					CommentSubtext = reactModule.createElement(text, {
						TextWrapped = true,
						tag = "auto-xy padding-top-xxsmall",
						Text = var30.submitDialogOptional,
						TextXAlignment = Enum.TextXAlignment.Left,
						fontStyle = var1.Typography.CaptionSmall,
						LayoutOrder = var31()
					})
				})
			})
		}),
		DropdownSideModalBackground = if var16 or var18 then reactModule.createElement(view, { tag = "size-full" }, {
			DropdownSideModalContainer = reactModule.createElement(view, { tag = "size-full" }, {
				DropdownSideModal = reactModule.createElement(sideModalModule, {
					screenSize = absoluteSize,
					title = if var16 then var30.submitDialogProblemSubheading else var30.submitDialogSurfaceSubheading,
					width = math.min(400, absoluteSize.X - 50) - 50,
					height = math.min(500, absoluteSize.Y - 50) - 50,
					onAbandon = reactModule.useCallback(function()
						-- upvalues: var17 (ref), var19 (ref)
						var17(false)
						var19(false)
					end, { var17, var19 }),
					closeWithAnimation = var20
				}, {
					ScrollView = reactModule.createElement(scrollViewGradientModule, { gradientHeight = 48, Size = UDim2.new(1, 0, 1, 0) }, {
						Padding = reactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, 16) }),
						ButtonList = reactModule.createElement(buttonListModule, {
							options = if var16 then p1.reportProblems else p1.reportSurfaces,
							onSelected = function(p2, p3)
								-- upvalues: var16 (ref), var7 (ref), var9 (ref), var3 (ref), var21 (ref), var13 (ref), var15 (ref), var5 (ref)
								if var16 then
									var7(p2)
									var9(p3)
									var3(false)
									var21(true)
									
									return
								end
								var13(p2)
								var15(p3)
								var5(false)
								var21(true)
							end,
							setDescription = if var16 then var11 else nil,
							defaultValue = if var16 then var6 else var12
						})
					})
				})
			})
		}) else nil
	})
end