local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local constantsModule = require(foundation.Constants)
local dashModule = require(parent.Dash)
local flagsModule = require(foundation.Utility.Flags)
local imageModule = require(foundation.Components.Image)
local popoverContextModule = require(script.Parent.Parent.PopoverContext)
local viewModule = require(foundation.Components.View)
local isPointInGuiObjectBoundsModule = require(foundation.Utility.isPointInGuiObjectBounds)
local useFloatingModule = require(script.Parent.Parent.useFloating)
local useOverlayModule = require(foundation.Providers.Overlay.useOverlay)
local usePointerPositionModule = require(foundation.Utility.usePointerPosition)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local popoverAlignModule = require(foundation.Enums.PopoverAlign)
local popoverSideModule = require(foundation.Enums.PopoverSide)
local radiusModule = require(foundation.Enums.Radius)
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local stateLayerAffordanceModule = require(foundation.Enums.StateLayerAffordance)
local elevationLayerModule = require(foundation.Enums.ElevationLayer)
local _ = require(foundation.Components.Types)
local useElevationModule = require(foundation.Providers.Elevation.useElevation)
local elevationOwnerScope = require(foundation.Providers.Elevation.ElevationProvider).ElevationOwnerScope
local t = {
	hasArrow = true,
	side = popoverSideModule.Bottom,
	align = popoverAlignModule.Center,
	selection = constantsModule.MODAL.DISABLE_SELECTION,
	selectionGroup = constantsModule.MODAL.TRAP_FOCUS,
	radius = radiusModule.Medium
}
local t_1 = {
	[radiusModule.Small] = "radius-small",
	[radiusModule.Medium] = "radius-medium",
	[radiusModule.Circle] = "radius-circle"
}
local SHADOW_IMAGE = constantsModule.SHADOW_IMAGE
local SHADOW_SIZE = constantsModule.SHADOW_SIZE

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), popoverContextModule (ref), useOverlayModule (ref), useTokensModule (ref), useElevationModule (ref), elevationLayerModule (ref), usePointerPositionModule (ref), useFloatingModule (ref), isPointInGuiObjectBoundsModule (ref), flagsModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), imageModule (ref), SHADOW_IMAGE (ref), SHADOW_SIZE (ref), dashModule (ref), t_1 (ref), elevationOwnerScope (ref), reactRobloxModule (ref)
	local var1
	local var2 = withDefaultsModule(p1, t)
	local var3 = reactModule.useContext(popoverContextModule)
	local isInstance = typeof(var3.anchor) == "Instance"
	local var4 = if isInstance then var2.hasArrow else false
	local var5 = useOverlayModule()
	local var6 = useTokensModule()
	local var7 = useElevationModule(elevationLayerModule.Popover, { stackAboveOwner = true })
	local size200 = var6.Size.Size_200
	local var8 = size200 * 1.414213562373 / 2
	local backgroundStyle = var2.backgroundStyle or var6.Color.Surface.Surface_100
	local var9, var10 = reactModule.useState(nil)
	local var11, var12 = reactModule.useState(nil)
	local var13 = usePointerPositionModule(var11)
	reactModule.useImperativeHandle(p2, function()
		-- upvalues: var9 (ref)
		return var9
	end, { var9 })
	local var14, var15, var16, var17, var18, var19 = useFloatingModule(var3.isOpen, var3.anchor, var9, var5, var2.side, var2.align, if var4 then var8 else 0)
	local var20 = reactModule.useRef(nil)
	local var21 = reactModule.useCallback(function(p1)
		-- upvalues: var20 (ref), var12 (ref), var2 (ref), var3 (ref), isInstance (ref), var13 (ref), isPointInGuiObjectBoundsModule (copy)
		if var20.current then
			var20.current:Disconnect()
		end
		var12(p1)
		
		if p1 ~= nil and var2.onPressedOutside then
			var20.current = p1:GetPropertyChangedSignal("GuiState"):Connect(function()
				-- upvalues: p1 (ref), var3 (copy), isInstance (copy), var13 (copy), isPointInGuiObjectBoundsModule (copy), var2 (copy)
				if p1.GuiState == Enum.GuiState.Press then
					if var3.anchor and isInstance then
						local anchor = var3.anchor
						
						if isPointInGuiObjectBoundsModule(anchor, var13:getValue()) then return end
						if anchor.GuiState ~= Enum.GuiState.Idle then return end
					end
					var2.onPressedOutside()
				end
			end)
		end
	end, { var2.onPressedOutside, var3.anchor })
	reactModule.useEffect(function()
		-- upvalues: var20 (ref)
		return function()
			-- upvalues: var20 (copy)
			if var20.current then
				var20.current:Disconnect()
			end
		end
	end, {})
	local var22 = if flagsModule.FoundationPopoverContentAnchorFix then reactModule.joinBindings({ var14, var19, var16 }):map(function(p1)
		local var1 = p1[1]
		local var2 = p1[2]
		local var3 = p1[3]
		
		return UDim2.fromOffset(var1.X - var2.X * var3.X.Offset, var1.Y - var2.Y * var3.Y.Offset)
	end) else nil
	
	if var3.isOpen then
		var1 = reactModule.createElement
		var1 = var1(viewModule, {
			tag = "size-full",
			ZIndex = var7.zIndex,
			Visible = var15,
			testId = `{var3.testId}--container`
		}, {
			Backdrop = if var2.onPressedOutside and var3.isOpen then reactModule.createElement(viewModule, {
				ZIndex = 1,
				tag = "position-center-center anchor-center-center",
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				Size = UDim2.fromScale(2, 2),
				ref = var21,
				testId = `{var3.testId}--backdrop`
			}) else nil,
			Shadow = reactModule.createElement(imageModule, {
				ZIndex = 2,
				AnchorPoint = var19,
				Image = SHADOW_IMAGE,
				Size = var16:map(function(p1)
					-- upvalues: SHADOW_SIZE (copy)
					return p1 + UDim2.fromOffset(SHADOW_SIZE, SHADOW_SIZE)
				end),
				Position = reactModule.joinBindings({ var14, var19 }):map(function(p1)
					-- upvalues: SHADOW_SIZE (copy)
					return UDim2.fromOffset(p1[1].X + SHADOW_SIZE / 2 * (if p1[2].X == 0 then -1 else 1), p1[1].Y + SHADOW_SIZE / 2 * (if p1[2].Y == 0 then -1 else 1) + 2)
				end),
				slice = {
					center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE + 1, SHADOW_SIZE + 1)
				},
				imageStyle = var6.Color.Extended.Black.Black_20,
				testId = `{var3.testId}--shadow`
			}),
			Arrow = if var4 then reactModule.createElement(viewModule, {
				Rotation = 45,
				ZIndex = 3,
				tag = "anchor-center-center",
				Size = UDim2.fromOffset(size200, size200),
				Position = var17:map(function(p1)
					return UDim2.fromOffset(p1.X, p1.Y)
				end),
				backgroundStyle = backgroundStyle,
				testId = `{var3.testId}--arrow`
			}) else nil,
			Content = reactModule.createElement(viewModule, {
				ZIndex = 4,
				AnchorPoint = if flagsModule.FoundationPopoverContentAnchorFix then Vector2.zero else var19,
				Position = if flagsModule.FoundationPopoverContentAnchorFix then var22 else var14:map(function(p1)
					return UDim2.fromOffset(p1.X, p1.Y)
				end),
				selection = var2.selection,
				selectionGroup = var2.selectionGroup,
				sizeConstraint = { MaxSize = var18 },
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				onActivated = if var2.onPressedOutside or var2.DO_NOT_USE_hasContentInputSink then dashModule.noop else nil,
				backgroundStyle = backgroundStyle,
				tag = `auto-xy {t_1[var2.radius]}`,
				ref = var10,
				testId = `{var3.testId}--content`
			}, reactModule.createElement(elevationOwnerScope, { owner = var7 }, var2.children))
		})
	else
		var1 = nil
	end
	return if var5 == nil then var1 else reactRobloxModule.createPortal(var1, var5)
end)