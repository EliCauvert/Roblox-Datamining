-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:06 2026 Pacific Standard Time.

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
local flagsModule = require(foundation.Utility.Flags)
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

return reactModule.forwardRef(function(p0, p1) --[[ line: 77 | named "PopoverContent" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), reactModule (ref), popoverContextModule (ref), useOverlayModule (ref), useTokensModule (ref), useElevationModule (ref), elevationLayerModule (ref), usePointerPositionModule (ref), useFloatingModule (ref), isPointInGuiObjectBoundsModule (ref), viewModule (ref), stateLayerAffordanceModule (ref), imageModule (ref), SHADOW_IMAGE (ref), SHADOW_SIZE (ref), flagsModule (ref), dashModule (ref), t_1 (ref), elevationOwnerScope (ref), reactRobloxModule (ref)
	local var45
	local var23 = withDefaultsModule(p0, t)
	local var24 = reactModule.useContext(popoverContextModule)
	local isInstance = typeof(var24.anchor) == "Instance"
	local var26 = if isInstance then var23.hasArrow else false
	local var27 = useOverlayModule()
	local var28 = useTokensModule()
	local var29 = useElevationModule(elevationLayerModule.Popover, { stackAboveOwner = true })
	local size200 = var28.Size.Size_200
	local var30 = size200 * 1.414213562373 / 2
	local backgroundStyle = var23.backgroundStyle or var28.Color.Surface.Surface_100
	local var32, var33 = reactModule.useState(nil)
	local var34, var35 = reactModule.useState(nil)
	local var36 = usePointerPositionModule(var34)
	reactModule.useImperativeHandle(p1, function() --[[ line: 96 ]]
		-- upvalues: var32 (ref)
		return var32
	end, { var32 })
	local var37, var38, var39, var40, var41, var42 = useFloatingModule(var24.isOpen, var24.anchor, var32, var27, var23.side, var23.align, if var26 then var30 else 0)
	local var43 = reactModule.useRef(nil)
	local var44 = reactModule.useCallback(function(p2) --[[ line: 112 ]]
		-- upvalues: var43 (ref), var35 (ref), var23 (ref), var24 (ref), isInstance (ref), var36 (ref), isPointInGuiObjectBoundsModule (copy)
		if var43.current then
			var43.current:Disconnect()
		end
		var35(p2)
		
		if p2 ~= nil and var23.onPressedOutside then
			var43.current = p2:GetPropertyChangedSignal("GuiState"):Connect(function() --[[ line: 119 ]]
				-- upvalues: p2 (ref), var24 (copy), isInstance (copy), var36 (copy), isPointInGuiObjectBoundsModule (copy), var23 (copy)
				if p2.GuiState == Enum.GuiState.Press then
					if var24.anchor and isInstance then
						local anchor = var24.anchor
						
						if isPointInGuiObjectBoundsModule(anchor, var36:getValue()) then return end
						if anchor.GuiState ~= Enum.GuiState.Idle then return end
					end
					var23.onPressedOutside()
				end
			end)
		end
	end, { var23.onPressedOutside, var24.anchor })
	reactModule.useEffect(function() --[[ line: 142 ]]
		-- upvalues: var43 (ref)
		return function() --[[ line: 143 ]]
			-- upvalues: var43 (copy)
			if var43.current then
				var43.current:Disconnect()
			end
		end
	end, {})
	
	if var24.isOpen then
		var45 = reactModule.createElement
		var45 = var45(viewModule, {
			tag = "size-full",
			ZIndex = var29.zIndex,
			Visible = var38,
			testId = `{var24.testId}--container`
		}, {
			Backdrop = if var23.onPressedOutside and var24.isOpen then reactModule.createElement(viewModule, {
				ZIndex = 1,
				tag = "position-center-center anchor-center-center",
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				Size = UDim2.fromScale(2, 2),
				ref = var44,
				testId = `{var24.testId}--backdrop`
			}) else nil,
			Shadow = reactModule.createElement(imageModule, {
				ZIndex = 2,
				AnchorPoint = var42,
				Image = SHADOW_IMAGE,
				Size = var39:map(function(p3) --[[ line: 173 ]]
					-- upvalues: SHADOW_SIZE (copy)
					return p3 + UDim2.fromOffset(SHADOW_SIZE, SHADOW_SIZE)
				end),
				Position = reactModule.joinBindings({ var37, var42 }):map(function(p4) --[[ line: 176 ]]
					-- upvalues: SHADOW_SIZE (copy)
					return UDim2.fromOffset(p4[1].X + SHADOW_SIZE / 2 * (if p4[2].X == 0 then -1 else 1), p4[1].Y + SHADOW_SIZE / 2 * (if p4[2].Y == 0 then -1 else 1) + 2)
				end),
				slice = {
					center = Rect.new(SHADOW_SIZE, SHADOW_SIZE, SHADOW_SIZE + 1, SHADOW_SIZE + 1)
				},
				imageStyle = var28.Color.Extended.Black.Black_20,
				testId = `{var24.testId}--shadow`
			}),
			Arrow = if var26 then reactModule.createElement(viewModule, {
				Rotation = 45,
				ZIndex = 3,
				tag = "anchor-center-center",
				Size = UDim2.fromOffset(size200, size200),
				Position = var40:map(function(p5) --[[ line: 194 ]]
					return UDim2.fromOffset(p5.X, p5.Y)
				end),
				backgroundStyle = backgroundStyle,
				testId = `{var24.testId}--arrow`
			}) else nil,
			Content = reactModule.createElement(viewModule, {
				ZIndex = 4,
				AnchorPoint = var42,
				Position = var37:map(function(p6) --[[ line: 206 ]]
					return UDim2.fromOffset(p6.X, p6.Y)
				end),
				selection = var23.selection,
				selectionGroup = var23.selectionGroup,
				sizeConstraint = { MaxSize = var41 },
				stateLayer = { affordance = stateLayerAffordanceModule.None },
				onActivated = if var23.onPressedOutside or flagsModule.FoundationCoachmarkInteractionFixes and var23.DO_NOT_USE_hasContentInputSink then dashModule.noop else nil,
				backgroundStyle = backgroundStyle,
				tag = `auto-xy {t_1[var23.radius]}`,
				ref = var33,
				testId = `{var24.testId}--content`
			}, reactModule.createElement(elevationOwnerScope, { owner = var29 }, var23.children))
		})
	else
		var45 = nil
	end
	return if var27 == nil then var45 else reactRobloxModule.createPortal(var45, var27)
end)