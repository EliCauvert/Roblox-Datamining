local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local constantsModule = require(foundation.Constants)
local dashModule = require(parent.Dash)
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

return reactModule.forwardRef(function(p0, p1) --[[ line: 76 | named "PopoverContent" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), popoverContextModule (ref), useOverlayModule (ref), useTokensModule (ref), useElevationModule (ref), elevationLayerModule (ref), usePointerPositionModule (ref), useFloatingModule (ref), isPointInGuiObjectBoundsModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), imageModule (ref), SHADOW_IMAGE (ref), SHADOW_SIZE (ref), dashModule (ref), t_1 (ref), elevationOwnerScope (ref), reactRobloxModule (ref)
	local var44
	local var22 = withDefaultsModule(p0, t)
	local var23 = reactModule.useContext(popoverContextModule)
	local isInstance = typeof(var23.anchor) == "Instance"
	local var25 = if isInstance then var22.hasArrow else false
	local var26 = useOverlayModule()
	local var27 = useTokensModule()
	local var28 = useElevationModule(elevationLayerModule.Popover, { stackAboveOwner = true })
	local size200 = var27.Size.Size_200
	local var29 = size200 * 1.414213562373 / 2
	local backgroundStyle = var22.backgroundStyle or var27.Color.Surface.Surface_100
	local var31, var32 = reactModule.useState(nil)
	local var33, var34 = reactModule.useState(nil)
	local var35 = usePointerPositionModule(var33)
	reactModule.useImperativeHandle(p1, function() --[[ line: 95 ]]
		-- upvalues: var31 (ref)
		return var31
	end, { var31 })
	local var36, var37, var38, var39, var40, var41 = useFloatingModule(var23.isOpen, var23.anchor, var31, var26, var22.side, var22.align, if var25 then var29 else 0)
	local var42 = reactModule.useRef(nil)
	local var43 = reactModule.useCallback(function(p2) --[[ line: 111 ]]
		-- upvalues: var42 (ref), var34 (ref), var22 (ref), var23 (ref), isInstance (ref), var35 (ref), isPointInGuiObjectBoundsModule (copy)
		if var42.current then
			var42.current:Disconnect()
		end
		var34(p2)
		
		if p2 ~= nil and var22.onPressedOutside then
			var42.current = p2:GetPropertyChangedSignal("GuiState"):Connect(function() --[[ line: 118 ]]
				-- upvalues: p2 (ref), var23 (copy), isInstance (copy), var35 (copy), isPointInGuiObjectBoundsModule (copy), var22 (copy)
				if p2.GuiState == Enum.GuiState.Press then
					if var23.anchor and isInstance then
						local anchor = var23.anchor
						
						if isPointInGuiObjectBoundsModule(anchor, var35:getValue()) then return end
						if anchor.GuiState ~= Enum.GuiState.Idle then return end
					end
					var22.onPressedOutside()
				end
			end)
		end
	end, { var22.onPressedOutside, var23.anchor })
	reactModule.useEffect(function() --[[ line: 141 ]]
		-- upvalues: var42 (ref)
		return function() --[[ line: 142 ]]
			-- upvalues: var42 (copy)
			if var42.current then
				var42.current:Disconnect()
			end
		end
	end, {})
	
	if var23.isOpen then
		var44 = reactModule.createElement
		var44 = var44(viewModule, {
			tag = "size-full",
			ZIndex = var28.zIndex,
			Visible = var37,
			testId = `{var23.testId}--container`
		}, {
			Backdrop = if var22.onPressedOutside and var23.isOpen then reactModule.createElement(viewModule, {
				ZIndex = 1,
				tag = "position-center-center anchor-center-center",
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				Size = UDim2.fromScale(2, 2),
				ref = var43,
				testId = `{var23.testId}--backdrop`
			}) else nil,
			Shadow = reactModule.createElement(imageModule, {
				ZIndex = 2,
				AnchorPoint = var41,
				Image = SHADOW_IMAGE,
				Size = var38:map(function(p3) --[[ line: 172 ]]
					-- upvalues: SHADOW_SIZE (copy)
					return p3 + UDim2.fromOffset(SHADOW_SIZE, SHADOW_SIZE)
				end),
				Position = reactModule.joinBindings({ var36, var41 }):map(function(p4) --[[ line: 175 ]]
					-- upvalues: SHADOW_SIZE (copy)
					return UDim2.fromOffset(p4[1].X + SHADOW_SIZE / 2 * (if p4[2].X == 0 then -1 else 1), p4[1].Y + SHADOW_SIZE / 2 * (if p4[2].Y == 0 then -1 else 1) + 2)
				end),
				slice = {
					center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE + 1, SHADOW_SIZE + 1)
				},
				imageStyle = var27.Color.Extended.Black.Black_20,
				testId = `{var23.testId}--shadow`
			}),
			Arrow = if var25 then reactModule.createElement(viewModule, {
				Rotation = 45,
				ZIndex = 3,
				tag = "anchor-center-center",
				Size = UDim2.fromOffset(size200, size200),
				Position = var39:map(function(p5) --[[ line: 193 ]]
					return UDim2.fromOffset(p5.X, p5.Y)
				end),
				backgroundStyle = backgroundStyle,
				testId = `{var23.testId}--arrow`
			}) else nil,
			Content = reactModule.createElement(viewModule, {
				ZIndex = 4,
				AnchorPoint = var41,
				Position = var36:map(function(p6) --[[ line: 205 ]]
					return UDim2.fromOffset(p6.X, p6.Y)
				end),
				selection = var22.selection,
				selectionGroup = var22.selectionGroup,
				sizeConstraint = { MaxSize = var40 },
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				onActivated = if var22.onPressedOutside or var22.DO_NOT_USE_hasContentInputSink then dashModule.noop else nil,
				backgroundStyle = backgroundStyle,
				tag = `auto-xy {t_1[var22.radius]}`,
				ref = var32,
				testId = `{var23.testId}--content`
			}, reactModule.createElement(elevationOwnerScope, { owner = var28 }, var22.children))
		})
	else
		var44 = nil
	end
	return if var26 == nil then var44 else reactRobloxModule.createPortal(var44, var26)
end)