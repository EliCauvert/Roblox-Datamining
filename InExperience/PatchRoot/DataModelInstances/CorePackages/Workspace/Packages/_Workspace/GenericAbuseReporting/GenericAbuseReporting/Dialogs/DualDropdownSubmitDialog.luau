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

local function _(p0, p1) --[[ line: 43 | named "getContentRightPadding" ]]
	return if p1.Y < p0.Y then 16 else 1
end

return function(p2) --[[ line: 47 | named "DualDropdownSubmitDialog" ]]
	-- upvalues: useTokens (ref), useLayerCollector (ref), reactModule (ref), useLocalizedStringsModule (ref), useLocalization (ref), createNextOrder (ref), view (ref), sideModalModule (ref), scrollViewGradientModule (ref), text (ref), sideModalDropdownButtonModule (ref), commentTextFieldModule (ref), buttonListModule (ref)
	local var10 = useTokens()
	local absoluteSize = useLayerCollector().absoluteSize
	local var11, var12 = reactModule.useState(false)
	local var13, var14 = reactModule.useState(false)
	local var15, var16 = reactModule.useState("")
	local var17, var18 = reactModule.useState("")
	local var19, var20 = reactModule.useState("")
	local var21, var22 = reactModule.useState("")
	local var23, var24 = reactModule.useState("")
	local var25, var26 = reactModule.useState(false)
	local var27, var28 = reactModule.useState(false)
	local var29, var30 = reactModule.useState(false)
	local var31, var32 = reactModule.useState("")
	local var33 = reactModule.useRef(nil)
	local var34, var35 = reactModule.useState(Vector2.zero)
	local var36, var37 = reactModule.useState(Vector2.zero)
	local var38 = useLocalizedStringsModule()
	local var39 = useLocalization({
		submitDialogProblemSubheading = "Feature.ReportAbuse.Label.WhatWasWrong",
		submitDialogSurfaceSubheading = "Feature.ReportAbuse.Label.WhereDidItHappen",
		selectOnePrompt = "Feature.ReportAbuse.Label.PleaseSelectOne",
		submitDialogCommentSubheading = "Feature.ReportAbuse.Label.TellUsWhatHappenedNoOptional",
		submitDialogTextBoxPlaceholder = "Feature.SettingsHub.Label.ReportComment",
		submitDialogOptional = "Feature.ReportAbuse.Label.Optional",
		chooseOne = "Feature.ReportAbuse.Label.ChooseOne"
	})
	local var40 = createNextOrder()
	reactModule.useLayoutEffect(function() --[[ line: 80 ]]
		-- upvalues: var33 (ref), var35 (ref), var37 (ref)
		if var33.current then
			local scrollingFrame = var33.current:FindFirstChildWhichIsA("ScrollingFrame")
			
			if scrollingFrame then
				var35(scrollingFrame.AbsoluteCanvasSize)
				var37(scrollingFrame.AbsoluteWindowSize)
				local var42 = scrollingFrame:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function() --[[ line: 89 ]]
					-- upvalues: var35 (copy), scrollingFrame (ref)
					var35(scrollingFrame.AbsoluteCanvasSize)
				end)
				local var43 = scrollingFrame:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function() --[[ line: 94 ]]
					-- upvalues: var37 (copy), scrollingFrame (ref)
					var37(scrollingFrame.AbsoluteWindowSize)
				end)
				
				return function() --[[ line: 97 ]]
					-- upvalues: var42 (ref), var43 (ref)
					var42:Disconnect()
					var43:Disconnect()
				end
			end
		else
			var35(Vector2.zero)
			var37(Vector2.zero)
		end
		return function() --[[ line: 106 ]] end
	end, { var33.current, absoluteSize })
	
	return reactModule.createElement(view, { tag = "size-full auto-xy" }, {
		ReportFlowModal = reactModule.createElement(sideModalModule, {
			screenSize = absoluteSize,
			buttonProps = {
				text = var38.formSubmit,
				onActivated = reactModule.useCallback(function() --[[ line: 109 ]]
					-- upvalues: p2 (ref), var15 (ref), var21 (ref), var31 (ref)
					p2.onSubmit(var15, var21, var31)
				end, { p2.onSubmit, var15, var21, var31 }),
				validateState = reactModule.useCallback(function() --[[ line: 113 ]]
					-- upvalues: var15 (ref), var21 (ref), var12 (ref), var14 (ref)
					if var15 ~= "" and var21 ~= "" then
						return true
					elseif var15 == "" then
						var12(true)
					end
					if var21 == "" then
						var14(true)
					end
					return false
				end, { var15, var21, var12, var14 })
			},
			footerContent = p2.footerContent,
			onAbandon = p2.onAbandon,
			title = var38.formTitle,
			width = math.min(400, absoluteSize.X - 50),
			height = math.min(500, absoluteSize.Y - 50)
		}, {
			SubmitReportFrame = reactModule.createElement(scrollViewGradientModule, {
				gradientHeight = 40,
				Size = UDim2.new(1, 0, 1, 0),
				ref = var33
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
					PaddingRight = UDim.new(0, if var36.Y < var34.Y then 16 else 1)
				}),
				ReportProblemFrame = reactModule.createElement(view, {
					ZIndex = 3,
					tag = "size-full-0 auto-y col align-x-left",
					LayoutOrder = var40()
				}, {
					ProblemHeading = reactModule.createElement(text, {
						tag = "auto-xy padding-bottom-medium",
						Text = "1. " .. var39.submitDialogProblemSubheading,
						fontStyle = var10.Typography.TitleLarge,
						textStyle = var10.Color.Content.Emphasis,
						LayoutOrder = var40()
					}),
					ProblemDropdownPosition = reactModule.createElement(view, {
						tag = "col align-x-left",
						Size = UDim2.new(1, 0, 0, 48),
						LayoutOrder = var40()
					}, {
						ProblemDropdown = reactModule.createElement(sideModalDropdownButtonModule, {
							setDropdownError = var12,
							onActivated = function() --[[ line: 185 ]]
								-- upvalues: var26 (ref), var30 (ref)
								var26(true)
								var30(false)
							end,
							title = var39.submitDialogProblemSubheading,
							text = if var17 ~= "" then var17 else var39.chooseOne,
							isDropdownError = var11
						}),
						ProblemSubtext = reactModule.createElement(text, {
							TextWrapped = true,
							tag = "auto-xy padding-top-xxsmall",
							Text = if var11 then var39.selectOnePrompt else var19,
							TextXAlignment = Enum.TextXAlignment.Left,
							fontStyle = var10.Typography.BodySmall,
							textStyle = if var11 then var10.Color.System.Alert else var10.Color.Content.Muted,
							LayoutOrder = var40()
						})
					})
				}),
				ReportSurfaceFrame = reactModule.createElement(view, {
					tag = "size-full-0 auto-y col align-x-left",
					LayoutOrder = var40()
				}, {
					SurfaceHeading = reactModule.createElement(text, {
						tag = "auto-xy padding-bottom-medium",
						Text = "2. " .. var39.submitDialogSurfaceSubheading,
						fontStyle = var10.Typography.TitleLarge,
						textStyle = var10.Color.Content.Emphasis,
						LayoutOrder = var40()
					}),
					SurfaceDropdownPosition = reactModule.createElement(view, {
						tag = "col align-x-left",
						Size = UDim2.new(1, 0, 0, 48),
						LayoutOrder = var40()
					}, {
						SurfaceDropdown = reactModule.createElement(sideModalDropdownButtonModule, {
							setDropdownError = var14,
							onActivated = function() --[[ line: 224 ]]
								-- upvalues: var28 (ref), var30 (ref)
								var28(true)
								var30(false)
							end,
							title = var39.submitDialogSurfaceSubheading,
							text = if var21 ~= "" then var23 else var39.chooseOne,
							isDropdownError = var13
						}),
						SurfaceSubtext = reactModule.createElement(text, {
							TextWrapped = true,
							tag = "auto-xy padding-top-xxsmall",
							Text = if var13 then var39.selectOnePrompt else "",
							TextXAlignment = Enum.TextXAlignment.Left,
							fontStyle = var10.Typography.BodySmall,
							textStyle = var10.Color.System.Alert,
							LayoutOrder = var40()
						})
					})
				}),
				ReportCommentFrame = reactModule.createElement(view, {
					tag = "size-full-0 auto-y col align-x-left",
					LayoutOrder = var40()
				}, {
					CommentHeading = reactModule.createElement(text, {
						tag = "auto-xy padding-bottom-medium",
						Text = "3. " .. var39.submitDialogCommentSubheading,
						fontStyle = var10.Typography.TitleLarge,
						textStyle = var10.Color.Content.Emphasis,
						LayoutOrder = var40()
					}),
					CommentTextContainer = reactModule.createElement(view, {
						tag = "size-full-0 auto-y col align-x-left stroke-thick stroke-default radius-medium",
						LayoutOrder = var40()
					}, {
						CommentTextField = reactModule.createElement(commentTextFieldModule, {
							text = var31,
							backgroundColor3 = var10.Color.Surface.Surface_100.Color3,
							placeholderText = var39.submitDialogTextBoxPlaceholder,
							onUpdate = var32,
							layoutOrder = var40()
						})
					}),
					CommentSubtext = reactModule.createElement(text, {
						TextWrapped = true,
						tag = "auto-xy padding-top-xxsmall",
						Text = var39.submitDialogOptional,
						TextXAlignment = Enum.TextXAlignment.Left,
						fontStyle = var10.Typography.CaptionSmall,
						LayoutOrder = var40()
					})
				})
			})
		}),
		DropdownSideModalBackground = if var25 or var27 then reactModule.createElement(view, { tag = "size-full" }, {
			DropdownSideModalContainer = reactModule.createElement(view, { tag = "size-full" }, {
				DropdownSideModal = reactModule.createElement(sideModalModule, {
					screenSize = absoluteSize,
					title = if var25 then var39.submitDialogProblemSubheading else var39.submitDialogSurfaceSubheading,
					width = math.min(400, absoluteSize.X - 50) - 50,
					height = math.min(500, absoluteSize.Y - 50) - 50,
					onAbandon = reactModule.useCallback(function() --[[ line: 127 ]]
						-- upvalues: var26 (ref), var28 (ref)
						var26(false)
						var28(false)
					end, { var26, var28 }),
					closeWithAnimation = var29
				}, {
					ScrollView = reactModule.createElement(scrollViewGradientModule, { gradientHeight = 48, Size = UDim2.new(1, 0, 1, 0) }, {
						Padding = reactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, 16) }),
						ButtonList = reactModule.createElement(buttonListModule, {
							options = if var25 then p2.reportProblems else p2.reportSurfaces,
							onSelected = function(p3, p4) --[[ line: 304 ]]
								-- upvalues: var25 (ref), var16 (ref), var18 (ref), var12 (ref), var30 (ref), var22 (ref), var24 (ref), var14 (ref)
								if var25 then
									var16(p3)
									var18(p4)
									var12(false)
									var30(true)
									
									return
								end
								var22(p3)
								var24(p4)
								var14(false)
								var30(true)
							end,
							setDescription = if var25 then var20 else nil,
							defaultValue = if var25 then var15 else var21
						})
					})
				})
			})
		}) else nil
	})
end