local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local CoreGui = game:GetService("CoreGui")
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FoundationModule = require(Parent.Foundation)
local InputHandlersModule = require(Parent.InputHandlers)
local ReactModule = require(Parent.React)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local AppFocusRoot = FocusNavigationUtilsModule.AppFocusRoot
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local OverlayProvider = FoundationModule.OverlayProvider
local Popover = FoundationModule.Popover
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local PopoverSide = FoundationModule.Enums.PopoverSide
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility
local ScrollView = FoundationModule.ScrollView
local Text = FoundationModule.Text
local UseLayerCollectorFunction = require(Parent.UIBlox).Core.Layout.LayerCollector.useLayerCollector
local UseTokensFunction = FoundationModule.Hooks.useTokens
local View = FoundationModule.View
local SideModalDropdownButtonModule = require(GenericAbuseReporting.Common.SideModalDropdownButton)
local UseScrollbarOffsetModule = require(GenericAbuseReporting.Common.useScrollbarOffset)

return ReactModule.memo(function(p1) --[[ Line: 44 | Named "DropdownWithPopover" ]]
	-- upvalues: UseLayerCollectorFunction (copy), UseTokensFunction (copy), ReactModule (copy), UseScrollbarOffsetModule (copy), ReactFocusNavigationModule (copy), CoreGui (copy), View (copy), Text (copy), OverlayProvider (copy), Popover (copy), SideModalDropdownButtonModule (copy), PopoverAlign (copy), PopoverSide (copy), AppFocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), ScrollView (copy), ScrollBarVisibility (copy)
	local UseLayerCollectorResult = UseLayerCollectorFunction()
	local UseTokensResult = UseTokensFunction()
	local AbsoluteSize = UseLayerCollectorResult.absoluteSize
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({})
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(Vector2.new(0, 0))
	local UseFocusGuiObjectResult = ReactFocusNavigationModule.useFocusGuiObject()
	local UseRefResult = ReactModule.useRef(nil)
	local VRCentralOverlay = CoreGui:FindFirstChild("VRCentralOverlay")
	local CentralOverlaySurfaceGui = if VRCentralOverlay then VRCentralOverlay:FindFirstChild("CentralOverlay_SurfaceGui") else nil
	local UseResult = ReactModule.useCallback(function() --[[ Line: 68 ]]
		-- upvalues: CentralOverlaySurfaceGui (copy), UseFocusGuiObjectResult (copy), UseRefResult (copy), UseStateResult2 (copy)
		if not CentralOverlaySurfaceGui then
			UseFocusGuiObjectResult(UseRefResult.current)
		end
		UseStateResult2(false)
	end, {
		UseRefResult.current,
		UseFocusGuiObjectResult,
		CentralOverlaySurfaceGui
	})
	
	return ReactModule.createElement(OverlayProvider, { gui = CentralOverlaySurfaceGui }, {
		DropdownWithPopover = ReactModule.createElement(View, {
			tag = "size-full-0 auto-y",
			ref = UseRefResult,
			onAbsoluteSizeChanged = function(Frame) --[[ Line: 126 ]]
				-- upvalues: UseStateResult2_2 (copy)
				UseStateResult2_2(Frame.AbsoluteSize)
			end,
			LayoutOrder = p1.layoutOrder
		}, {
			Popover = ReactModule.createElement(Popover.Root, { isOpen = UseStateResult }, {
				Anchor = ReactModule.createElement(Popover.Anchor, nil, ReactModule.createElement(View, {
					Size = UDim2.new(0, UseStateResult3.X, 0, UseStateResult3.Y)
				}, {
					DropdownButton = ReactModule.createElement(SideModalDropdownButtonModule, {
						onActivated = ReactModule.useCallback(function() --[[ Line: 116 ]]
							-- upvalues: UseStateResult2 (copy), UseStateResult (copy)
							UseStateResult2(not UseStateResult)
						end, { UseStateResult }),
						text = if UseStateResult1.text and #UseStateResult1.text > 0 then UseStateResult1.text else p1.placeholder,
						isDropdownError = p1.errorState
					})
				})),
				Content = ReactModule.createElement(Popover.Content, {
					hasArrow = false,
					align = PopoverAlign.Center,
					side = PopoverSide.Bottom,
					onPressedOutside = UseResult,
					selection = { Selectable = true }
				}, {
					DropdownPopup = ReactModule.createElement(View, { tag = "auto-xy" }, {
						AppFocusRoot = ReactModule.createElement(AppFocusRoot, {
							surfaceIdentifier = if UseStateResult then FocusNavigableSurfaceIdentifierEnum.ModerationOverlay else FocusNavigableSurfaceIdentifierEnum.PopUp,
							isIsolated = UseStateResult,
							customEventHandlers = {
								[FocusNavigationEventNameEnum.NavigateBack] = { handler = InputHandlersModule.onRelease(UseResult) }
							}
						}, {
							ReactModule.createElement(ScrollView, {
								gradientHeight = 15,
								Size = UDim2.new(0, math.min(AbsoluteSize.X, UseStateResult4.X + UseScrollbarOffsetModule(UseStateResult5, UseStateResult6)), 0, (math.min(AbsoluteSize.Y, UseStateResult4.Y))),
								scroll = {
									AutomaticCanvasSize = Enum.AutomaticSize.Y,
									CanvasSize = UDim2.new(1, 0, 0, 0),
									ScrollingDirection = Enum.ScrollingDirection.Y,
									scrollBarVisibility = ScrollBarVisibility.Always
								},
								onAbsoluteCanvasSizeChanged = function(ScrollFrame) --[[ Line: 194 ]]
									-- upvalues: UseStateResult2_4 (copy)
									UseStateResult2_4(ScrollFrame.AbsoluteCanvasSize)
								end,
								onAbsoluteWindowSizeChanged = function(p2) --[[ Line: 197 ]]
									-- upvalues: UseStateResult2_5 (copy)
									UseStateResult2_5(p2.AbsoluteWindowSize)
								end
							}, {
								BaseMenu = ReactModule.createElement(View, {
									tag = "auto-y col align-y-center gap-xsmall padding-xsmall",
									Size = UDim2.new(0, UseStateResult3.X + UseTokensResult.Stroke.Standard * 2, 0, 0),
									onAbsoluteSizeChanged = function(Frame) --[[ Line: 204 ]]
										-- upvalues: UseStateResult2_3 (copy)
										UseStateResult2_3(Frame.AbsoluteSize)
									end,
									ref = ReactModule.useRef(nil)
								}, (ReactModule.useMemo(function() --[[ Line: 76 ]]
									-- upvalues: p1 (copy), UseStateResult2_1 (copy), UseResult (copy), ReactModule (upval), View (upval), UseStateResult1 (copy), Text (upval)
									local Elements = {}
									
									for _, cellData in ipairs(p1.cellDatas) do
										table.insert(Elements, ReactModule.createElement(View, {
											onActivated = function() --[[ Line: 79 ]]
												-- upvalues: p1 (upval), cellData (copy), UseStateResult2_1 (upval), UseResult (upval)
												p1.onChange(if cellData.value == nil then cellData.text else cellData.value)
												UseStateResult2_1(cellData)
												UseResult()
											end,
											selection = { Selectable = true },
											tag = {
												["size-full-0"] = true,
												["auto-y"] = true,
												["padding-small"] = true,
												["radius-medium"] = true,
												["bg-shift-200"] = UseStateResult1 == cellData
											}
										}, {
											TextContainer = ReactModule.createElement(View, { tag = "size-full-0 auto-y" }, {
												Text = ReactModule.createElement(Text, {
													TextWrapped = true,
													tag = "auto-xy",
													Text = cellData.text,
													TextXAlignment = Enum.TextXAlignment.Left
												})
											})
										}))
									end
									return Elements
								end, { p1.cellDatas, UseStateResult1, p1.onChange, UseResult })))
							})
						})
					})
				})
			})
		})
	})
end)