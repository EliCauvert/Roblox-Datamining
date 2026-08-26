local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local elevationLayerModule = require(foundation.Enums.ElevationLayer)
local pluginPopoverParentContextModule = require(foundation.Providers.StudioPanels.PluginPopoverParentContext)
local popoverAlignModule = require(foundation.Enums.PopoverAlign)
local popoverArrowModule = require(script.Parent.Parent.PopoverArrow)
local _ = require(script.Parent.Parent.Content)
local popoverContextModule = require(script.Parent.Parent.PopoverContext)
local popoverShadowModule = require(script.Parent.Parent.PopoverShadow)
local popoverSideModule = require(foundation.Enums.PopoverSide)
local getPanelPositionModule = require(script.Parent.getPanelPosition)
local useOverlayModule = require(foundation.Providers.Overlay.useOverlay)
local usePanelModule = require(foundation.Providers.StudioPanels.usePanel)
local usePanelsContextModule = require(foundation.Providers.StudioPanels.usePanelsContext)
local useStyleSheet = require(foundation.Providers.Style.StyleSheetContext).useStyleSheet
local constantsModule = require(foundation.Constants)
local flagsModule = require(foundation.Utility.Flags)
local loggerModule = require(foundation.Utility.Logger)
local radiusModule = require(foundation.Enums.Radius)
local _ = require(foundation.Utility.Plugin.StudioUri)
local viewModule = require(foundation.Components.View)
local elevationModule = require(foundation.Providers.Elevation.elevation)
local positioningModule = require(script.Parent.Parent.positioning)
local useArrowPositionModule = require(script.Parent.useArrowPosition)
local useElevationModule = require(foundation.Providers.Elevation.useElevation)
local _ = require(foundation.Components.Popover.useFloating)
local usePanelSizingModule = require(script.Parent.usePanelSizing)
local usePluginAnchorModule = require(script.Parent.usePluginAnchor)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local withDefaultsModule = require(foundation.Utility.withDefaults)
local isPointInGuiObjectBoundsModule = require(foundation.Utility.isPointInGuiObjectBounds)
local elevationOwnerScope = require(foundation.Providers.Elevation.ElevationProvider).ElevationOwnerScope
local _ = require(foundation.Providers.StudioPanels.Types)
local SHADOW_SIZE = constantsModule.SHADOW_SIZE
local t = {
	hasArrow = true,
	side = popoverSideModule.Bottom,
	align = popoverAlignModule.Center,
	radius = radiusModule.Medium
}
local t_1 = {
	[radiusModule.Small] = "radius-small",
	[radiusModule.Medium] = "radius-medium",
	[radiusModule.Circle] = "radius-circle"
}

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: withDefaultsModule (ref), t (ref), usePanelsContextModule (ref), flagsModule (ref), reactModule (ref), pluginPopoverParentContextModule (ref), popoverContextModule (ref), useStyleSheet (ref), useTokensModule (ref), useElevationModule (ref), elevationLayerModule (ref), elevationModule (ref), useOverlayModule (ref), popoverSideModule (ref), popoverAlignModule (ref), usePluginAnchorModule (ref), getPanelPositionModule (ref), SHADOW_SIZE (ref), loggerModule (ref), usePanelModule (ref), usePanelSizingModule (ref), isPointInGuiObjectBoundsModule (ref), positioningModule (ref), useArrowPositionModule (ref), reactRobloxModule (ref), viewModule (ref), popoverShadowModule (ref), popoverArrowModule (ref), t_1 (ref), elevationOwnerScope (ref)
	local var1 = withDefaultsModule(p1, t)
	local var2 = usePanelsContextModule()
	local var3 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then reactModule.useContext(pluginPopoverParentContextModule) else nil
	local var4 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then var3.id else reactModule.useContext(pluginPopoverParentContextModule)
	local var5 = reactModule.useContext(popoverContextModule)
	local var6 = useStyleSheet()
	local var7 = useTokensModule()
	local var8 = useElevationModule(elevationLayerModule.Popover, { stackAboveOwner = true })
	local relativeIndex = elevationModule.getRelativeIndex(var8)
	local var9, var10 = reactModule.useState(nil)
	reactModule.useImperativeHandle(p2, function()
		-- upvalues: var9 (ref)
		return var9
	end, { var9 })
	local var11 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then useOverlayModule() else nil
	local var12 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then reactModule.useMemo(function()
		local popoverPluginContainer = Instance.new("Frame")
		popoverPluginContainer.Name = "PopoverPluginContainer"
		popoverPluginContainer.BackgroundTransparency = 1
		popoverPluginContainer.BorderSizePixel = 0
		popoverPluginContainer.ClipsDescendants = false
		popoverPluginContainer.Position = UDim2.fromOffset(-10000, -10000)
		
		return popoverPluginContainer
	end, {}) else nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		reactModule.useEffect(function()
			-- upvalues: var12 (ref)
			return function()
				-- upvalues: var12 (copy)
				var12:Destroy()
			end
		end, { var12 })
	end
	local var13 = nil
	local var14 = nil
	local var15 = nil
	local var16 = nil
	local var17 = nil
	local var18 = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		local var19, var20 = reactModule.useBinding(UDim2.new())
		var13 = var19
		var14 = var20
		local var21, var22 = reactModule.useBinding(UDim2.new())
		var15 = var21
		var16 = var22
		local var23, var24 = reactModule.useState(nil)
		var17 = var23
		var18 = var24
	end
	local size200 = var7.Size.Size_200
	local var25 = size200 * 1.414213562373 / 2
	local backgroundStyle = var1.backgroundStyle or var7.Color.Surface.Surface_100
	local var26 = nil
	local var27 = nil
	local var28 = nil
	local var29 = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		var26 = if var1.side then var1.side else popoverSideModule.Bottom
		var27 = if var1.align then var1.align else popoverAlignModule.Center
		var28 = if type(var26) == "table" then var26.offset else 0
		var29 = if type(var27) == "table" then var27.offset else 0
	end
	local var30, var31
	local _ = nil
	local _ = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		var30 = if type(var26) == "table" then var26.position else var26
		var31 = if type(var27) == "table" then var27.position else var27
	else
		var30 = if type(var1.side) == "table" then var1.side.position else var1.side or popoverSideModule.Bottom
		var31 = if type(var1.align) == "table" then var1.align.position else var1.align or popoverAlignModule.Center
	end
	local var32 = 0
	
	if var31 == popoverAlignModule.Center then
		var32 = 0.5
	elseif var31 == popoverAlignModule.End then
		var32 = 1
	end
	local var33 = usePluginAnchorModule(var5.anchor, var5.anchorUri)
	local var34 = if var33.isVirtual then false else var1.hasArrow
	local ready = nil
	local var35 = nil
	local var36 = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		ready = var5.isOpen and (var33.isReady and var3.ready)
		var35 = ready and var11 ~= nil
		var36 = var35 and var17 == nil
		reactModule.useEffect(function()
			-- upvalues: ready (write), var18 (write)
			if not ready then
				var18(nil)
			end
		end, { ready })
	end
	local var37, var38
	local var39 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then reactModule.useCallback(function(p3)
		-- upvalues: flagsModule (copy), var36 (write), var18 (write)
		if not flagsModule.FoundationPopoverRecomputeContentSize and not var36 then return end
		local absoluteSize = p3.AbsoluteSize
		
		if absoluteSize.X > 0 and absoluteSize.Y > 0 then
			var18(absoluteSize)
		end
	end, {
		if flagsModule.FoundationPopoverRecomputeContentSize then nil else var36
	}) else nil
	local var40 = reactModule.useMemo(function()
		-- upvalues: getPanelPositionModule (copy), flagsModule (copy), var26 (write), var1 (ref), popoverSideModule (copy), popoverAlignModule (copy), SHADOW_SIZE (copy), var34 (ref), var25 (ref)
		return getPanelPositionModule(if flagsModule.FoundationPopoverPluginOverlayMeasurement then var26 else var1.side or popoverSideModule.Bottom, var1.align or popoverAlignModule.Start, nil, SHADOW_SIZE, if var34 then var25 else 0)
	end, {
		if flagsModule.FoundationPopoverPluginOverlayMeasurement then var26 else var1.side,
		var1.align,
		var34,
		var25
	})
	local var41 = reactModule.useCallback(function(p3, p4, p5, p6, p7, p8)
		-- upvalues: var2 (ref), flagsModule (copy)
		return var2.registerPopoverAsync(p3, p4, p5, p6, p7, if flagsModule.FoundationPopoverPluginFocusable then p8 else nil)
	end, { var2.registerPopoverAsync })
	local var42 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var42 (ref), loggerModule (copy)
		if not var1.onPressedOutside and not var42.current then
			var42.current = true
			loggerModule:warning("PopoverContent rendered in a plugin context without onPressedOutside. In Studio, the QWidget popup will close on focus loss, but the parent's isOpen state will not update. Provide onPressedOutside to stay in sync.")
		end
	end, { var1.onPressedOutside })
	local var43 = usePanelModule({
		isOpen = if flagsModule.FoundationPopoverPluginOverlayMeasurement then ready else var5.isOpen and var33.isReady,
		onClose = reactModule.useCallback(function()
			-- upvalues: var1 (ref), flagsModule (copy), var5 (ref)
			if var1.onPressedOutside then
				if flagsModule.FoundationPopoverClickOutsideInGuiShadow and typeof(var5.anchor) == "Instance" and var5.anchor.GuiState ~= Enum.GuiState.Idle then return end
				var1.onPressedOutside()
			end
		end, { var1.onPressedOutside, var5.anchor }),
		anchorUri = var33.uri,
		registerPanelAsync = var41,
		position = var40,
		depth = if relativeIndex ~= nil then 0 else relativeIndex,
		parentPopoverId = var4,
		isFocusable = if flagsModule.FoundationPopoverPluginFocusable then var1.isFocusable else nil
	})
	local _ = nil
	local _ = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		var37 = var13
		var38 = var15
	else
		local var44, var45 = usePanelSizingModule(var1.side, var1.align, var9, if var34 then var25 else 0, var43)
		var37 = var44
		var38 = var45
	end
	reactModule.useEffect(function()
		-- upvalues: flagsModule (copy), var43 (ref), var1 (ref), var9 (ref), isPointInGuiObjectBoundsModule (copy)
		if not flagsModule.FoundationPopoverClickOutsideInGuiShadow then return end
		if var43 and var43.container and var1.onPressedOutside then
			local inputBeganConnection = var43.container.InputBegan:Connect(function(p3)
				-- upvalues: var9 (copy), isPointInGuiObjectBoundsModule (copy), var1 (copy)
				if p3.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
				if not var9 then return end
				if not isPointInGuiObjectBoundsModule(var9, Vector2.new(p3.Position.X, p3.Position.Y)) then
					var1.onPressedOutside()
				end
			end)
			
			return function()
				-- upvalues: inputBeganConnection (ref)
				inputBeganConnection:Disconnect()
			end
		end
	end, { var43, var9, var1.onPressedOutside })
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		reactModule.useLayoutEffect(function()
			-- upvalues: var36 (write), var9 (ref), var18 (write)
			if not var36 or var9 == nil then return end
			local absoluteSize = var9.AbsoluteSize
			
			if absoluteSize.X > 0 and absoluteSize.Y > 0 then
				var18(absoluteSize)
			end
		end, { var36, var9 })
	end
	local var46 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then reactModule.useMemo(function()
		-- upvalues: var17 (write), positioningModule (copy), var30 (write), var28 (write), var29 (write), var34 (ref), var25 (ref), SHADOW_SIZE (copy)
		return if var17 then positioningModule.calculatePopoverBounds(var30, var28, var29, if var34 then var25 else 0, var17) + Vector2.new(SHADOW_SIZE * 2, SHADOW_SIZE * 2) else nil
	end, {
		var17, var30, var28, var29, var34, var25
	}) else nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		reactModule.useLayoutEffect(function()
			-- upvalues: var17 (write), var46 (ref), var16 (write), var14 (write), var43 (ref)
			if var17 == nil or var46 == nil then
				var16(UDim2.new())
				var14(UDim2.new())
				
				return
			end
			var16(UDim2.fromOffset(var17.X, var17.Y))
			var14(UDim2.fromOffset(var46.X, var46.Y))
			
			if var43 then
				var43.setSizeAsync(var46)
			end
		end, { var17, var46, var43 })
		reactModule.useLayoutEffect(function()
			-- upvalues: var35 (write), var12 (ref), var43 (ref), var46 (ref), var11 (ref)
			if not var35 then
				var12.Parent = nil
				
				return
			elseif var43 and var46 then
				var12.AutomaticSize = Enum.AutomaticSize.None
				var12.Size = UDim2.fromOffset(var46.X, var46.Y)
				var12.Position = UDim2.new()
				var12.Parent = var43.container
				
				return
			end
			var12.AutomaticSize = Enum.AutomaticSize.XY
			var12.Size = UDim2.new()
			var12.Position = UDim2.fromOffset(-10000, -10000)
			var12.Parent = var11
		end, {
			var35,
			var11,
			var43,
			var46,
			var12
		})
	end
	local var47
	local var48 = useArrowPositionModule(var38, var30, var1.radius, var32, var25, if var33.isVirtual or typeof(var5.anchor) ~= "Instance" then nil else var5.anchor)
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		var47 = false
		
		if var43 ~= nil then
			local _ = var46 ~= nil
		end
	else
		var47 = true
	end
	local var49
	local var50 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then var35 else var43 ~= nil
	local var51 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then var12 elseif var43 then var43.container else nil
	local var52 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then reactModule.useMemo(function()
		-- upvalues: var43 (ref), var47 (ref)
		return {
			id = if var43 then var43.popoverId else nil,
			ready = var47
		}
	end, { var43, var47 }) else nil
	
	if var50 and var51 then
		var49 = reactRobloxModule.createPortal
		var49 = var49(reactModule.createElement(reactModule.Fragment, nil, {
			StyleLink = reactModule.createElement("StyleLink", { StyleSheet = var6 }),
			Container = reactModule.createElement(viewModule, {
				AutomaticSize = if flagsModule.FoundationPopoverPluginOverlayMeasurement and var46 == nil then Enum.AutomaticSize.XY else nil,
				Size = if flagsModule.FoundationPopoverPluginOverlayMeasurement and var46 == nil then nil else var37,
				testId = `{var5.testId}--container`
			}, {
				Shadow = reactModule.createElement(popoverShadowModule, {
					ZIndex = 1,
					contentSize = var38,
					position = UDim2.fromOffset(SHADOW_SIZE / 2, SHADOW_SIZE / 2 + 2),
					testId = `{var5.testId}--shadow`
				}),
				Arrow = if var34 then reactModule.createElement(popoverArrowModule, {
					ZIndex = 2,
					size = size200,
					position = var48,
					backgroundStyle = backgroundStyle,
					testId = `{var5.testId}--arrow`
				}) else nil,
				Content = reactModule.createElement(viewModule, {
					ZIndex = 3,
					tag = `auto-xy {t_1[var1.radius]}`,
					Position = UDim2.fromOffset(SHADOW_SIZE, SHADOW_SIZE),
					ref = var10,
					onAbsoluteSizeChanged = if flagsModule.FoundationPopoverPluginOverlayMeasurement then var39 else nil,
					backgroundStyle = backgroundStyle,
					testId = `{var5.testId}--content`
				}, reactModule.createElement(pluginPopoverParentContextModule.Provider, {
					value = if flagsModule.FoundationPopoverPluginOverlayMeasurement then var52 else var43.popoverId
				}, {
					Nested = reactModule.createElement(elevationOwnerScope, { owner = var8 }, var1.children)
				}))
			})
		}), if flagsModule.FoundationPopoverPluginOverlayMeasurement then var51 else var43.container)
	else
		var49 = nil
	end
	return reactModule.createElement(reactModule.Fragment, nil, { Anchor = var33.element, Panel = var49 })
end)