local songbird = script:FindFirstAncestor("Songbird")
local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")
local cryoModule = require(songbird.Parent.Cryo)
local foundationModule = require(songbird.Parent.Foundation)
local reactModule = require(songbird.Parent.React)
local reactUtilsModule = require(songbird.Parent.ReactUtils)
local responsiveModule = require(songbird.Parent.Responsive)
local collapsibleFrameModule = require(songbird.Components.CollapsibleFrame)
local constantsModule = require(songbird.constants)
local getFFlagSongbirdPopoverSubmenuModule = require(songbird.Flags.getFFlagSongbirdPopoverSubmenu)
local getFFlagChromeMusicWindowTopbarReappearsOnGamepad = require(songbird.Parent.SharedFlags).GetFFlagChromeMusicWindowTopbarReappearsOnGamepad
local createNextOrder = reactUtilsModule.createNextOrder
local usePrevious = reactUtilsModule.usePrevious
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef
local useState = reactModule.useState

local function _(p0) --[[ line: 28 | named "useUnfocusKeybind" ]]
	-- upvalues: useEffect (ref), guiService (ref), contextActionService (ref)
	useEffect(function() --[[ line: 29 ]]
		-- upvalues: p0 (ref), guiService (copy), contextActionService (copy)
		if p0 then
			contextActionService:BindCoreAction("UnfocusMusicWindow", function(_, p1) --[[ line: 31 | named "unfocus" ]]
				-- upvalues: guiService (copy)
				if p1 == Enum.UserInputState.End then
					guiService.SelectedCoreObject = nil
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonB)
			
			return function() --[[ line: 42 ]]
				-- upvalues: contextActionService (copy)
				contextActionService:UnbindCoreAction("UnfocusMusicWindow")
			end
		end
		return nil
	end, { p0 })
end

local t = {
	autoCollapseSeconds = 3,
	isSubMenuOpen = false,
	isFocused = false,
	onToggleSubMenu = function() --[[ line: 70 ]] end
}

return function(p2) --[[ line: 75 | named "ChromeWindowFrame" ]]
	-- upvalues: cryoModule (ref), t (ref), foundationModule (ref), useRef (ref), responsiveModule (ref), getFFlagChromeMusicWindowTopbarReappearsOnGamepad (ref), usePrevious (ref), getFFlagSongbirdPopoverSubmenuModule (ref), constantsModule (ref), createNextOrder (ref), useState (ref), useCallback (ref), useEffect (ref), runService (ref), guiService (ref), contextActionService (ref), reactModule (ref), collapsibleFrameModule (ref)
	local var13 = cryoModule.Dictionary.join(t, p2)
	local var14 = foundationModule.Hooks.useTokens()
	local var15 = useRef(nil)
	local var16 = useRef(nil)
	local var17 = responsiveModule.useLastInput()
	local var18 = if getFFlagChromeMusicWindowTopbarReappearsOnGamepad() then usePrevious(var17) else nil
	local var19 = if not (getFFlagSongbirdPopoverSubmenuModule() or typeof(var13.overflowButtonRef) ~= "table" or not var13.overflowButtonRef.current) then (var13.overflowButtonRef.current.AbsolutePosition + Vector2.new(var14.Gap.Small + constantsModule.SUBMENU_WIDTH, 0)).X < var13.overflowButtonRef.current:FindFirstAncestorOfClass("ScreenGui").AbsoluteSize.X else true
	local var20 = createNextOrder()
	local var21 = useRef(nil)
	local var22, var23 = useState(true)
	local var24 = useCallback(function() --[[ line: 101 ]]
		-- upvalues: var13 (ref)
		if var13.onClose then
			var13.onClose()
		end
	end, { var13.onClose })
	local var25 = useCallback(function(p3) --[[ line: 108 ]]
		-- upvalues: var21 (ref), var23 (ref), foundationModule (copy)
		var21.current = nil
		var23(true)
		
		if p3 == foundationModule.Enums.ControlState.Default then
			var21.current = os.time()
		end
	end, {})
	useEffect(function() --[[ line: 124 ]]
		-- upvalues: var17 (ref), responsiveModule (copy), var13 (ref), runService (copy), var21 (ref), var23 (ref)
		if var17 ~= responsiveModule.Input.Pointer then return end
		if var13.autoCollapseSeconds and var13.autoCollapseSeconds > 0 then
			local heartbeatConnection = runService.Heartbeat:Connect(function() --[[ line: 132 ]]
				-- upvalues: var21 (copy), var13 (copy), var23 (copy)
				if var21.current and var13.autoCollapseSeconds <= os.time() - var21.current then
					var23(false)
				end
			end)
			
			return function() --[[ line: 140 ]]
				-- upvalues: heartbeatConnection (ref)
				heartbeatConnection:Disconnect()
			end
		end
		return nil
	end, { var13.autoCollapseSeconds, var17 })
	local var26, var27 = useState(Vector2.new(1e999, 1e999))
	local var28 = useCallback(function(p4) --[[ line: 148 ]]
		-- upvalues: var27 (ref)
		var27(p4.AbsoluteSize)
	end, {})
	useEffect(function() --[[ line: 152 ]]
		-- upvalues: var16 (ref), var13 (ref)
		local current = var16.current
		
		if current then
			local selectionChangedConnection = current.SelectionChanged:Connect(function(_, _, p5) --[[ line: 156 | named "onSelectionChanged" ]]
				-- upvalues: current (ref), var13 (copy)
				if not current:IsAncestorOf(p5) and var13.onUnfocus then
					var13.onUnfocus()
				end
			end)
			
			return function() --[[ line: 166 ]]
				-- upvalues: selectionChangedConnection (ref)
				selectionChangedConnection:Disconnect()
			end
		end
		return nil
	end, { var13.onUnfocus })
	useEffect(function() --[[ line: 173 ]]
		-- upvalues: var13 (ref), guiService (copy), var15 (ref)
		if var13.isFocused then
			guiService.SelectedCoreObject = var15.current
		end
	end, { var13.isFocused })
	local isFocused = var13.isFocused
	useEffect(function() --[[ line: 29 ]]
		-- upvalues: isFocused (ref), guiService (copy), contextActionService (copy)
		if isFocused then
			contextActionService:BindCoreAction("UnfocusMusicWindow", function(_, p6) --[[ line: 31 | named "unfocus" ]]
				-- upvalues: guiService (copy)
				if p6 == Enum.UserInputState.End then
					guiService.SelectedCoreObject = nil
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonB)
			
			return function() --[[ line: 42 ]]
				-- upvalues: contextActionService (copy)
				contextActionService:UnbindCoreAction("UnfocusMusicWindow")
			end
		end
		return nil
	end, { isFocused })
	
	if getFFlagChromeMusicWindowTopbarReappearsOnGamepad() then
		useEffect(function() --[[ line: 185 ]]
			-- upvalues: var18 (ref), var17 (ref), responsiveModule (copy), var23 (ref)
			if var18 and var17 ~= var18 and var17 ~= responsiveModule.Input.Pointer then
				var23(true)
			end
		end, { var17, var18 })
	end
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy",
		sizeConstraint = { MaxSize = if var13.maxSize then var13.maxSize else nil },
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		selectionGroup = {
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop
		},
		onStateChanged = var25,
		ref = if getFFlagSongbirdPopoverSubmenuModule() then var16 else nil
	}, {
		WindowFrame = reactModule.createElement(foundationModule.View, {
			tag = "size-full-0 auto-y bg-over-media-100 radius-medium col gap-xxsmall stroke-emphasis"
		}, {
			CollapsibleTitleBar = reactModule.createElement(collapsibleFrameModule, { isCollapsed = not var22, LayoutOrder = var20() }, {
				TitleBar = reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y row flex-between items-center" }, {
					Actions = reactModule.createElement(foundationModule.View, {
						tag = "auto-xy row",
						LayoutOrder = var20(),
						onAbsoluteSizeChanged = var28
					}, {
						CloseButton = reactModule.createElement(foundationModule.IconButton, {
							icon = foundationModule.Enums.IconName.X,
							layoutOrder = var20(),
							size = foundationModule.Enums.IconSize.Medium,
							onActivated = var24,
							ref = var15
						})
					}),
					CenterAlignedTitle = reactModule.createElement(foundationModule.View, { tag = "size-full-0 shrink auto-y", LayoutOrder = var20() }, {
						Title = reactModule.createElement(foundationModule.Text, {
							tag = "size-full-0 text-title-medium content-emphasis",
							Text = var13.title,
							fontStyle = var14.Typography.TitleMedium,
							Position = UDim2.new(0, -var26.X / 2, 0, 0)
						})
					})
				})
			}),
			Divider = if var22 then reactModule.createElement(foundationModule.View, {
				backgroundStyle = var14.Color.Stroke.Emphasis,
				Size = UDim2.new(1, 0, 0, 1),
				LayoutOrder = var20()
			}) else nil,
			Content = reactModule.createElement(foundationModule.View, {
				tag = "size-full-0 auto-y row flex-between items-center padding-left-small padding-y-small",
				LayoutOrder = var20()
			}, {
				Body = reactModule.createElement(foundationModule.View, {
					tag = "size-full-0 auto-y shrink clip",
					LayoutOrder = var20()
				}, var13.children),
				Actions = reactModule.createElement(foundationModule.View, {
					tag = "auto-xy row flex-between items-center",
					LayoutOrder = var20()
				}, {
					CustomActions = if var13.actions then reactModule.createElement(foundationModule.View, { tag = "row auto-xy", LayoutOrder = var20() }, var13.actions) else nil,
					OverflowButton = if getFFlagSongbirdPopoverSubmenuModule() then if var13.menuItems and var17 ~= responsiveModule.Input.Directional then reactModule.createElement(foundationModule.IconButton, {
						icon = "icons/common/overflow",
						size = foundationModule.Enums.IconSize.Medium,
						onActivated = var13.onToggleSubMenu,
						LayoutOrder = var20()
					}) else nil elseif var13.submenu and var17 ~= responsiveModule.Input.Directional then reactModule.createElement(foundationModule.IconButton, {
						icon = "icons/common/overflow",
						size = foundationModule.Enums.IconSize.Medium,
						onActivated = var13.onToggleSubMenu,
						LayoutOrder = var20(),
						ref = var13.overflowButtonRef
					}) else nil
				})
			})
		}),
		SubMenu = if getFFlagSongbirdPopoverSubmenuModule() then nil elseif var13.submenu and var13.isSubMenuOpen then reactModule.createElement(foundationModule.View, {
			tag = "auto-xy bg-over-media-200 radius-medium padding-small",
			Position = if var19 then UDim2.fromScale(1, 0) + UDim2.fromOffset(var14.Gap.Small, 0) else UDim2.new(1, (-constantsModule.SUBMENU_WIDTH) - constantsModule.ICON_BUTTON_WIDTH / 2, 1, 0) + UDim2.fromOffset(var14.Gap.Small / 2, var14.Gap.Small)
		}, var13.submenu) else nil,
		OverflowMenu = if getFFlagSongbirdPopoverSubmenuModule() and var13.menuItems then reactModule.createElement(foundationModule.Menu, {
			isOpen = var13.isSubMenuOpen,
			items = var13.menuItems,
			side = foundationModule.Enums.PopoverSide.Right,
			align = foundationModule.Enums.PopoverAlign.Center,
			anchorRef = var16,
			onPressedOutside = var13.onToggleSubMenu
		}) else nil
	})
end