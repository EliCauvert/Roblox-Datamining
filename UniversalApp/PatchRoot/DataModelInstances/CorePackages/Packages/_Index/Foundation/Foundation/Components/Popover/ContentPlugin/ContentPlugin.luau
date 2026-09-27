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
local var1 = if flagsModule.FoundationPopoverPluginOverlayMeasurement and flagsModule.FoundationPluginShadowSize then constantsModule.PLUGIN_SHADOW_SIZE else constantsModule.SHADOW_SIZE
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
	-- upvalues: withDefaultsModule (ref), t (ref), usePanelsContextModule (ref), flagsModule (ref), reactModule (ref), pluginPopoverParentContextModule (ref), popoverContextModule (ref), useStyleSheet (ref), useTokensModule (ref), useElevationModule (ref), elevationLayerModule (ref), elevationModule (ref), useOverlayModule (ref), popoverSideModule (ref), popoverAlignModule (ref), usePluginAnchorModule (ref), getPanelPositionModule (ref), var1 (ref), loggerModule (ref), usePanelModule (ref), usePanelSizingModule (ref), isPointInGuiObjectBoundsModule (ref), positioningModule (ref), useArrowPositionModule (ref), reactRobloxModule (ref), viewModule (ref), popoverShadowModule (ref), t_1 (ref), popoverArrowModule (ref), elevationOwnerScope (ref)
	local var2 = withDefaultsModule(p1, t)
	local var3 = usePanelsContextModule()
	local var4 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then reactModule.useContext(pluginPopoverParentContextModule) else nil
	local var5 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then var4.id else reactModule.useContext(pluginPopoverParentContextModule)
	local var6 = reactModule.useContext(popoverContextModule)
	local var7 = useStyleSheet()
	local var8 = useTokensModule()
	local var9 = useElevationModule(elevationLayerModule.Popover, { stackAboveOwner = true })
	local relativeIndex = elevationModule.getRelativeIndex(var9)
	local var10, var11 = reactModule.useState(nil)
	reactModule.useImperativeHandle(p2, function()
		-- upvalues: var10 (ref)
		return var10
	end, { var10 })
	local var12 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then useOverlayModule() else nil
	local var13 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then reactModule.useMemo(function()
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
			-- upvalues: var13 (ref)
			return function()
				-- upvalues: var13 (copy)
				var13:Destroy()
			end
		end, { var13 })
	end
	local var14 = nil
	local var15 = nil
	local var16 = nil
	local var17 = nil
	local var18 = nil
	local var19 = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		local var20, var21 = reactModule.useBinding(UDim2.new())
		var14 = var20
		var15 = var21
		local var22, var23 = reactModule.useBinding(UDim2.new())
		var16 = var22
		var17 = var23
		local var24, var25 = reactModule.useState(nil)
		var18 = var24
		var19 = var25
	end
	local size200 = var8.Size.Size_200
	local var26 = size200 * 1.414213562373 / 2
	local backgroundStyle = var2.backgroundStyle or var8.Color.Surface.Surface_100
	local var27 = nil
	local var28 = nil
	local var29 = nil
	local var30 = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		var27 = if var2.side then var2.side else popoverSideModule.Bottom
		var28 = if var2.align then var2.align else popoverAlignModule.Center
		var29 = if type(var27) == "table" then var27.offset else 0
		var30 = if type(var28) == "table" then var28.offset else 0
	end
	local var31, var32
	local _ = nil
	local _ = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		var31 = if type(var27) == "table" then var27.position else var27
		var32 = if type(var28) == "table" then var28.position else var28
	else
		var31 = if type(var2.side) == "table" then var2.side.position else var2.side or popoverSideModule.Bottom
		var32 = if type(var2.align) == "table" then var2.align.position else var2.align or popoverAlignModule.Center
	end
	local var33 = 0
	
	if var32 == popoverAlignModule.Center then
		var33 = 0.5
	elseif var32 == popoverAlignModule.End then
		var33 = 1
	end
	local var34 = usePluginAnchorModule(var6.anchor, var6.anchorUri)
	local var35 = if var34.isVirtual then false else var2.hasArrow
	local ready = nil
	local var36 = nil
	local var37 = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		ready = var6.isOpen and (var34.isReady and var4.ready)
		var36 = ready and var12 ~= nil
		var37 = var36 and var18 == nil
		reactModule.useEffect(function()
			-- upvalues: ready (write), var19 (write)
			if not ready then
				var19(nil)
			end
		end, { ready })
	end
	local var38, var39
	local var40 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then reactModule.useCallback(function(p3)
		-- upvalues: flagsModule (copy), var37 (write), var19 (write)
		if not flagsModule.FoundationPopoverRecomputeContentSize and not var37 then return end
		local absoluteSize = p3.AbsoluteSize
		
		if absoluteSize.X > 0 and absoluteSize.Y > 0 then
			var19(absoluteSize)
		end
	end, {
		if flagsModule.FoundationPopoverRecomputeContentSize then nil else var37
	}) else nil
	local var41 = reactModule.useMemo(function()
		-- upvalues: getPanelPositionModule (copy), flagsModule (copy), var27 (write), var2 (ref), popoverSideModule (copy), popoverAlignModule (copy), var1 (copy), var35 (ref), var26 (ref)
		return getPanelPositionModule(if flagsModule.FoundationPopoverPluginOverlayMeasurement then var27 else var2.side or popoverSideModule.Bottom, var2.align or popoverAlignModule.Start, nil, var1, if var35 then var26 else 0)
	end, {
		if flagsModule.FoundationPopoverPluginOverlayMeasurement then var27 else var2.side,
		var2.align,
		var35,
		var26
	})
	local var42 = reactModule.useCallback(function(p3, p4, p5, p6, p7, p8)
		-- upvalues: var3 (ref), flagsModule (copy)
		return var3.registerPopoverAsync(p3, p4, p5, p6, p7, if flagsModule.FoundationPopoverPluginFocusable then p8 else nil)
	end, { var3.registerPopoverAsync })
	local var43 = reactModule.useRef(false)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var43 (ref), loggerModule (copy)
		if not var2.onPressedOutside and not var43.current then
			var43.current = true
			loggerModule:warning("PopoverContent rendered in a plugin context without onPressedOutside. In Studio, the QWidget popup will close on focus loss, but the parent's isOpen state will not update. Provide onPressedOutside to stay in sync.")
		end
	end, { var2.onPressedOutside })
	local var44 = usePanelModule({
		isOpen = if flagsModule.FoundationPopoverPluginOverlayMeasurement then ready else var6.isOpen and var34.isReady,
		onClose = reactModule.useCallback(function()
			-- upvalues: var2 (ref), flagsModule (copy), var6 (ref)
			if var2.onPressedOutside then
				if flagsModule.FoundationPopoverClickOutsideInGuiShadow and typeof(var6.anchor) == "Instance" and var6.anchor.GuiState ~= Enum.GuiState.Idle then return end
				var2.onPressedOutside()
			end
		end, { var2.onPressedOutside, var6.anchor }),
		anchorUri = var34.uri,
		registerPanelAsync = var42,
		position = var41,
		depth = if relativeIndex ~= nil then 0 else relativeIndex,
		parentPopoverId = var5,
		isFocusable = if flagsModule.FoundationPopoverPluginFocusable then var2.isFocusable else nil
	})
	local _ = nil
	local _ = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		var38 = var14
		var39 = var16
	else
		local var45, var46 = usePanelSizingModule(var2.side, var2.align, var10, if var35 then var26 else 0, var44)
		var38 = var45
		var39 = var46
	end
	reactModule.useEffect(function()
		-- upvalues: flagsModule (copy), var44 (ref), var2 (ref), var10 (ref), isPointInGuiObjectBoundsModule (copy)
		if not flagsModule.FoundationPopoverClickOutsideInGuiShadow then return end
		if var44 and var44.container and var2.onPressedOutside then
			local inputBeganConnection = var44.container.InputBegan:Connect(function(p3)
				-- upvalues: var10 (copy), isPointInGuiObjectBoundsModule (copy), var2 (copy)
				if p3.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
				if not var10 then return end
				if not isPointInGuiObjectBoundsModule(var10, Vector2.new(p3.Position.X, p3.Position.Y)) then
					var2.onPressedOutside()
				end
			end)
			
			return function()
				-- upvalues: inputBeganConnection (ref)
				inputBeganConnection:Disconnect()
			end
		end
	end, { var44, var10, var2.onPressedOutside })
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		reactModule.useLayoutEffect(function()
			-- upvalues: var37 (write), var10 (ref), var19 (write)
			if not var37 or var10 == nil then return end
			local absoluteSize = var10.AbsoluteSize
			
			if absoluteSize.X > 0 and absoluteSize.Y > 0 then
				var19(absoluteSize)
			end
		end, { var37, var10 })
	end
	local var47 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then reactModule.useMemo(function()
		-- upvalues: var18 (write), positioningModule (copy), var31 (write), var29 (write), var30 (write), var35 (ref), var26 (ref), var1 (copy)
		return if var18 then positioningModule.calculatePopoverBounds(var31, var29, var30, if var35 then var26 else 0, var18) + Vector2.new(var1 * 2, var1 * 2) else nil
	end, {
		var18, var31, var29, var30, var35, var26
	}) else nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		reactModule.useLayoutEffect(function()
			-- upvalues: var18 (write), var47 (ref), var17 (write), var15 (write), var44 (ref)
			if var18 == nil or var47 == nil then
				var17(UDim2.new())
				var15(UDim2.new())
				
				return
			end
			var17(UDim2.fromOffset(var18.X, var18.Y))
			var15(UDim2.fromOffset(var47.X, var47.Y))
			
			if var44 then
				var44.setSizeAsync(var47)
			end
		end, { var18, var47, var44 })
		reactModule.useLayoutEffect(function()
			-- upvalues: var36 (write), var13 (ref), var44 (ref), var47 (ref), var12 (ref)
			if not var36 then
				var13.Parent = nil
				
				return
			elseif var44 and var47 then
				var13.AutomaticSize = Enum.AutomaticSize.None
				var13.Size = UDim2.fromOffset(var47.X, var47.Y)
				var13.Position = UDim2.new()
				var13.Parent = var44.container
				
				return
			end
			var13.AutomaticSize = Enum.AutomaticSize.XY
			var13.Size = UDim2.new()
			var13.Position = UDim2.fromOffset(-10000, -10000)
			var13.Parent = var12
		end, {
			var36,
			var12,
			var44,
			var47,
			var13
		})
	end
	local var48
	local var49 = useArrowPositionModule(var39, var31, var2.radius, var33, var26, if var34.isVirtual or typeof(var6.anchor) ~= "Instance" then nil else var6.anchor)
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		var48 = false
		
		if var44 ~= nil then
			local _ = var47 ~= nil
		end
	else
		var48 = true
	end
	local var50
	local var51 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then var36 else var44 ~= nil
	local var52 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then var13 elseif var44 then var44.container else nil
	local var53 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then reactModule.useMemo(function()
		-- upvalues: var44 (ref), var48 (ref)
		return {
			id = if var44 then var44.popoverId else nil,
			ready = var48
		}
	end, { var44, var48 }) else nil
	
	if var51 and var52 then
		var50 = reactRobloxModule.createPortal
		var50 = var50(reactModule.createElement(reactModule.Fragment, nil, {
			StyleLink = reactModule.createElement("StyleLink", { StyleSheet = var7 }),
			Container = reactModule.createElement(viewModule, {
				AutomaticSize = if flagsModule.FoundationPopoverPluginOverlayMeasurement and var47 == nil then Enum.AutomaticSize.XY else nil,
				Size = if flagsModule.FoundationPopoverPluginOverlayMeasurement and var47 == nil then nil else var38,
				testId = `{var6.testId}--container`
			}, {
				Shadow = reactModule.createElement(popoverShadowModule, {
					ZIndex = 1,
					contentSize = var39,
					position = UDim2.fromOffset(var1 / 2, var1 / 2 + (if flagsModule.FoundationPopoverPluginOverlayMeasurement and flagsModule.FoundationPluginShadowSize then 0 else 2)),
					radiusTag = t_1[var2.radius],
					testId = `{var6.testId}--shadow`
				}),
				Arrow = if var35 then reactModule.createElement(popoverArrowModule, {
					ZIndex = 2,
					size = size200,
					position = var49,
					backgroundStyle = backgroundStyle,
					testId = `{var6.testId}--arrow`
				}) else nil,
				Content = reactModule.createElement(viewModule, {
					ZIndex = 3,
					tag = `auto-xy {t_1[var2.radius]}`,
					Position = UDim2.fromOffset(var1, var1),
					ref = var11,
					onAbsoluteSizeChanged = if flagsModule.FoundationPopoverPluginOverlayMeasurement then var40 else nil,
					backgroundStyle = backgroundStyle,
					testId = `{var6.testId}--content`
				}, reactModule.createElement(pluginPopoverParentContextModule.Provider, {
					value = if flagsModule.FoundationPopoverPluginOverlayMeasurement then var53 else var44.popoverId
				}, {
					Nested = reactModule.createElement(elevationOwnerScope, { owner = var9 }, var2.children)
				}))
			})
		}), if flagsModule.FoundationPopoverPluginOverlayMeasurement then var52 else var44.container)
	else
		var50 = nil
	end
	return reactModule.createElement(reactModule.Fragment, nil, { Anchor = var34.element, Panel = var50 })
end)