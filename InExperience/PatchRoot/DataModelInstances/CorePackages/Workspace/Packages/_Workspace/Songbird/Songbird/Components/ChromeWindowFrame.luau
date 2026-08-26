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

local function _(p1)
	-- upvalues: useEffect (ref), guiService (ref), contextActionService (ref)
	useEffect(function()
		-- upvalues: p1 (ref), guiService (copy), contextActionService (copy)
		if p1 then
			contextActionService:BindCoreAction("UnfocusMusicWindow", function(_, p2)
				-- upvalues: guiService (copy)
				if p2 == Enum.UserInputState.End then
					guiService.SelectedCoreObject = nil
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonB)
			
			return function()
				-- upvalues: contextActionService (copy)
				contextActionService:UnbindCoreAction("UnfocusMusicWindow")
			end
		end
		return nil
	end, { p1 })
end

local t = {
	autoCollapseSeconds = 3,
	isSubMenuOpen = false,
	isFocused = false,
	onToggleSubMenu = function() end
}

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), foundationModule (ref), useRef (ref), responsiveModule (ref), getFFlagChromeMusicWindowTopbarReappearsOnGamepad (ref), usePrevious (ref), getFFlagSongbirdPopoverSubmenuModule (ref), constantsModule (ref), createNextOrder (ref), useState (ref), useCallback (ref), useEffect (ref), runService (ref), guiService (ref), contextActionService (ref), reactModule (ref), collapsibleFrameModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = foundationModule.Hooks.useTokens()
	local var3 = useRef(nil)
	local var4 = useRef(nil)
	local var5 = responsiveModule.useLastInput()
	local var6 = if getFFlagChromeMusicWindowTopbarReappearsOnGamepad() then usePrevious(var5) else nil
	local var7 = if not (getFFlagSongbirdPopoverSubmenuModule() or typeof(var1.overflowButtonRef) ~= "table" or not var1.overflowButtonRef.current) then (var1.overflowButtonRef.current.AbsolutePosition + Vector2.new(var2.Gap.Small + constantsModule.SUBMENU_WIDTH, 0)).X < var1.overflowButtonRef.current:FindFirstAncestorOfClass("ScreenGui").AbsoluteSize.X else true
	local var8 = createNextOrder()
	local var9 = useRef(nil)
	local var10, var11 = useState(true)
	local var12 = useCallback(function()
		-- upvalues: var1 (ref)
		if var1.onClose then
			var1.onClose()
		end
	end, { var1.onClose })
	local var13 = useCallback(function(p2)
		-- upvalues: var9 (ref), var11 (ref), foundationModule (copy)
		var9.current = nil
		var11(true)
		
		if p2 == foundationModule.Enums.ControlState.Default then
			var9.current = os.time()
		end
	end, {})
	useEffect(function()
		-- upvalues: var5 (ref), responsiveModule (copy), var1 (ref), runService (copy), var9 (ref), var11 (ref)
		if var5 ~= responsiveModule.Input.Pointer then return end
		if var1.autoCollapseSeconds and var1.autoCollapseSeconds > 0 then
			local heartbeatConnection = runService.Heartbeat:Connect(function()
				-- upvalues: var9 (copy), var1 (copy), var11 (copy)
				if var9.current and var1.autoCollapseSeconds <= os.time() - var9.current then
					var11(false)
				end
			end)
			
			return function()
				-- upvalues: heartbeatConnection (ref)
				heartbeatConnection:Disconnect()
			end
		end
		return nil
	end, { var1.autoCollapseSeconds, var5 })
	local var14, var15 = useState(Vector2.new(1e999, 1e999))
	local var16 = useCallback(function(p2)
		-- upvalues: var15 (ref)
		var15(p2.AbsoluteSize)
	end, {})
	useEffect(function()
		-- upvalues: var4 (ref), var1 (ref)
		local current = var4.current
		
		if current then
			local selectionChangedConnection = current.SelectionChanged:Connect(function(_, _, p2)
				-- upvalues: current (ref), var1 (copy)
				if not current:IsAncestorOf(p2) and var1.onUnfocus then
					var1.onUnfocus()
				end
			end)
			
			return function()
				-- upvalues: selectionChangedConnection (ref)
				selectionChangedConnection:Disconnect()
			end
		end
		return nil
	end, { var1.onUnfocus })
	useEffect(function()
		-- upvalues: var1 (ref), guiService (copy), var3 (ref)
		if var1.isFocused then
			guiService.SelectedCoreObject = var3.current
		end
	end, { var1.isFocused })
	local isFocused = var1.isFocused
	useEffect(function()
		-- upvalues: isFocused (ref), guiService (copy), contextActionService (copy)
		if isFocused then
			contextActionService:BindCoreAction("UnfocusMusicWindow", function(_, p2)
				-- upvalues: guiService (copy)
				if p2 == Enum.UserInputState.End then
					guiService.SelectedCoreObject = nil
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonB)
			
			return function()
				-- upvalues: contextActionService (copy)
				contextActionService:UnbindCoreAction("UnfocusMusicWindow")
			end
		end
		return nil
	end, { isFocused })
	
	if getFFlagChromeMusicWindowTopbarReappearsOnGamepad() then
		useEffect(function()
			-- upvalues: var6 (ref), var5 (ref), responsiveModule (copy), var11 (ref)
			if var6 and var5 ~= var6 and var5 ~= responsiveModule.Input.Pointer then
				var11(true)
			end
		end, { var5, var6 })
	end
	return reactModule.createElement(foundationModule.View, {
		tag = "auto-xy",
		sizeConstraint = { MaxSize = if var1.maxSize then var1.maxSize else nil },
		stateLayer = {
			affordance = foundationModule.Enums.StateLayerAffordance.None
		},
		selectionGroup = {
			SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
			SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
			SelectionBehaviorRight = Enum.SelectionBehavior.Stop,
			SelectionBehaviorUp = Enum.SelectionBehavior.Stop
		},
		onStateChanged = var13,
		ref = if getFFlagSongbirdPopoverSubmenuModule() then var4 else nil
	}, {
		WindowFrame = reactModule.createElement(foundationModule.View, {
			tag = "size-full-0 auto-y bg-over-media-100 radius-medium col gap-xxsmall stroke-emphasis"
		}, {
			CollapsibleTitleBar = reactModule.createElement(collapsibleFrameModule, { isCollapsed = not var10, LayoutOrder = var8() }, {
				TitleBar = reactModule.createElement(foundationModule.View, { tag = "size-full-0 auto-y row flex-between items-center" }, {
					Actions = reactModule.createElement(foundationModule.View, {
						tag = "auto-xy row",
						LayoutOrder = var8(),
						onAbsoluteSizeChanged = var16
					}, {
						CloseButton = reactModule.createElement(foundationModule.IconButton, {
							icon = foundationModule.Enums.IconName.X,
							layoutOrder = var8(),
							size = foundationModule.Enums.IconSize.Medium,
							onActivated = var12,
							ref = var3
						})
					}),
					CenterAlignedTitle = reactModule.createElement(foundationModule.View, { tag = "size-full-0 shrink auto-y", LayoutOrder = var8() }, {
						Title = reactModule.createElement(foundationModule.Text, {
							tag = "size-full-0 text-title-medium content-emphasis",
							Text = var1.title,
							fontStyle = var2.Typography.TitleMedium,
							Position = UDim2.new(0, -var14.X / 2, 0, 0)
						})
					})
				})
			}),
			Divider = if var10 then reactModule.createElement(foundationModule.View, {
				backgroundStyle = var2.Color.Stroke.Emphasis,
				Size = UDim2.new(1, 0, 0, 1),
				LayoutOrder = var8()
			}) else nil,
			Content = reactModule.createElement(foundationModule.View, {
				tag = "size-full-0 auto-y row flex-between items-center padding-left-small padding-y-small",
				LayoutOrder = var8()
			}, {
				Body = reactModule.createElement(foundationModule.View, {
					tag = "size-full-0 auto-y shrink clip",
					LayoutOrder = var8()
				}, var1.children),
				Actions = reactModule.createElement(foundationModule.View, {
					tag = "auto-xy row flex-between items-center",
					LayoutOrder = var8()
				}, {
					CustomActions = if var1.actions then reactModule.createElement(foundationModule.View, { tag = "row auto-xy", LayoutOrder = var8() }, var1.actions) else nil,
					OverflowButton = if getFFlagSongbirdPopoverSubmenuModule() then if var1.menuItems and var5 ~= responsiveModule.Input.Directional then reactModule.createElement(foundationModule.IconButton, {
						icon = "icons/common/overflow",
						size = foundationModule.Enums.IconSize.Medium,
						onActivated = var1.onToggleSubMenu,
						LayoutOrder = var8()
					}) else nil elseif var1.submenu and var5 ~= responsiveModule.Input.Directional then reactModule.createElement(foundationModule.IconButton, {
						icon = "icons/common/overflow",
						size = foundationModule.Enums.IconSize.Medium,
						onActivated = var1.onToggleSubMenu,
						LayoutOrder = var8(),
						ref = var1.overflowButtonRef
					}) else nil
				})
			})
		}),
		SubMenu = if getFFlagSongbirdPopoverSubmenuModule() then nil elseif var1.submenu and var1.isSubMenuOpen then reactModule.createElement(foundationModule.View, {
			tag = "auto-xy bg-over-media-200 radius-medium padding-small",
			Position = if var7 then UDim2.fromScale(1, 0) + UDim2.fromOffset(var2.Gap.Small, 0) else UDim2.new(1, (-constantsModule.SUBMENU_WIDTH) - constantsModule.ICON_BUTTON_WIDTH / 2, 1, 0) + UDim2.fromOffset(var2.Gap.Small / 2, var2.Gap.Small)
		}, var1.submenu) else nil,
		OverflowMenu = if getFFlagSongbirdPopoverSubmenuModule() and var1.menuItems then reactModule.createElement(foundationModule.Menu, {
			isOpen = var1.isSubMenuOpen,
			items = var1.menuItems,
			side = foundationModule.Enums.PopoverSide.Right,
			align = foundationModule.Enums.PopoverAlign.Center,
			anchorRef = var4,
			onPressedOutside = var1.onToggleSubMenu
		}) else nil
	})
end