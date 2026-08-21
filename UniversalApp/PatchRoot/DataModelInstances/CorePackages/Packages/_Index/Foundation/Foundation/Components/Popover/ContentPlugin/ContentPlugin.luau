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

return reactModule.forwardRef(function(p0, p1) --[[ line: 68 | named "PopoverContentPlugin" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), usePanelsContextModule (ref), flagsModule (ref), reactModule (ref), pluginPopoverParentContextModule (ref), popoverContextModule (ref), useStyleSheet (ref), useTokensModule (ref), useElevationModule (ref), elevationLayerModule (ref), elevationModule (ref), useOverlayModule (ref), popoverSideModule (ref), popoverAlignModule (ref), usePluginAnchorModule (ref), getPanelPositionModule (ref), SHADOW_SIZE (ref), loggerModule (ref), usePanelModule (ref), usePanelSizingModule (ref), isPointInGuiObjectBoundsModule (ref), positioningModule (ref), useArrowPositionModule (ref), reactRobloxModule (ref), viewModule (ref), popoverShadowModule (ref), popoverArrowModule (ref), t_1 (ref), elevationOwnerScope (ref)
	local var30 = withDefaultsModule(p0, t)
	local var31 = usePanelsContextModule()
	local var32 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then reactModule.useContext(pluginPopoverParentContextModule) else nil
	local var33 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then var32.id else reactModule.useContext(pluginPopoverParentContextModule)
	local var34 = reactModule.useContext(popoverContextModule)
	local var35 = useStyleSheet()
	local var36 = useTokensModule()
	local var37 = useElevationModule(elevationLayerModule.Popover, { stackAboveOwner = true })
	local relativeIndex = elevationModule.getRelativeIndex(var37)
	local var39, var40 = reactModule.useState(nil)
	reactModule.useImperativeHandle(p1, function() --[[ line: 90 ]]
		-- upvalues: var39 (ref)
		return var39
	end, { var39 })
	local var41 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then useOverlayModule() else nil
	local var42 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then reactModule.useMemo(function() --[[ line: 100 ]]
		local popoverPluginContainer = Instance.new("Frame")
		popoverPluginContainer.Name = "PopoverPluginContainer"
		popoverPluginContainer.BackgroundTransparency = 1
		popoverPluginContainer.BorderSizePixel = 0
		popoverPluginContainer.ClipsDescendants = false
		popoverPluginContainer.Position = UDim2.fromOffset(-10000, -10000)
		
		return popoverPluginContainer
	end, {}) else nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		reactModule.useEffect(function() --[[ line: 112 ]]
			-- upvalues: var42 (ref)
			return function() --[[ line: 113 ]]
				-- upvalues: var42 (copy)
				var42:Destroy()
			end
		end, { var42 })
	end
	local var43 = nil
	local var44 = nil
	local var45 = nil
	local var46 = nil
	local var47 = nil
	local var48 = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		local var49, var50 = reactModule.useBinding(UDim2.new())
		var43 = var49
		var44 = var50
		local var51, var52 = reactModule.useBinding(UDim2.new())
		var45 = var51
		var46 = var52
		local var53, var54 = reactModule.useState(nil)
		var47 = var53
		var48 = var54
	end
	local size200 = var36.Size.Size_200
	local var55 = size200 * 1.414213562373 / 2
	local backgroundStyle = var30.backgroundStyle or var36.Color.Surface.Surface_100
	local var57 = nil
	local var58 = nil
	local var59 = nil
	local var60 = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		var57 = if var30.side then var30.side else popoverSideModule.Bottom
		var58 = if var30.align then var30.align else popoverAlignModule.Center
		var59 = if type(var57) == "table" then var57.offset else 0
		var60 = if type(var58) == "table" then var58.offset else 0
	end
	local var61, var62
	local _ = nil
	local _ = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		var61 = if type(var57) == "table" then var57.position else var57
		var62 = if type(var58) == "table" then var58.position else var58
	else
		var61 = if type(var30.side) == "table" then var30.side.position else var30.side or popoverSideModule.Bottom
		var62 = if type(var30.align) == "table" then var30.align.position else var30.align or popoverAlignModule.Center
	end
	local var63 = 0
	
	if var62 == popoverAlignModule.Center then
		var63 = 0.5
	elseif var62 == popoverAlignModule.End then
		var63 = 1
	end
	local var64 = usePluginAnchorModule(var34.anchor, var34.anchorUri)
	local var65 = if var64.isVirtual then false else var30.hasArrow
	local ready = nil
	local var67 = nil
	local var68 = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		ready = var34.isOpen and (var64.isReady and var32.ready)
		var67 = ready and var41 ~= nil
		var68 = var67 and var47 == nil
		reactModule.useEffect(function() --[[ line: 173 ]]
			-- upvalues: ready (write), var48 (write)
			if not ready then
				var48(nil)
			end
		end, { ready })
	end
	local var76, var77
	local var69 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then reactModule.useCallback(function(p2) --[[ line: 181 ]]
		-- upvalues: flagsModule (copy), var68 (write), var48 (write)
		if not flagsModule.FoundationPopoverRecomputeContentSize and not var68 then return end
		local absoluteSize = p2.AbsoluteSize
		
		if absoluteSize.X > 0 and absoluteSize.Y > 0 then
			var48(absoluteSize)
		end
	end, {
		if flagsModule.FoundationPopoverRecomputeContentSize then nil else var68
	}) else nil
	local var70 = reactModule.useMemo(function() --[[ line: 193 ]]
		-- upvalues: getPanelPositionModule (copy), flagsModule (copy), var57 (write), var30 (ref), popoverSideModule (copy), popoverAlignModule (copy), SHADOW_SIZE (copy), var65 (ref), var55 (ref)
		return getPanelPositionModule(if flagsModule.FoundationPopoverPluginOverlayMeasurement then var57 else var30.side or popoverSideModule.Bottom, var30.align or popoverAlignModule.Start, nil, SHADOW_SIZE, if var65 then var55 else 0)
	end, {
		if flagsModule.FoundationPopoverPluginOverlayMeasurement then var57 else var30.side,
		var30.align,
		var65,
		var55
	})
	local var71 = reactModule.useCallback(function(p3, p4, p5, p6, p7, p8) --[[ line: 211 ]]
		-- upvalues: var31 (ref), flagsModule (copy)
		return var31.registerPopoverAsync(p3, p4, p5, p6, p7, if flagsModule.FoundationPopoverPluginFocusable then p8 else nil)
	end, { var31.registerPopoverAsync })
	local var72 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 232 ]]
		-- upvalues: var30 (ref), var72 (ref), loggerModule (copy)
		if not var30.onPressedOutside and not var72.current then
			var72.current = true
			loggerModule:warning("PopoverContent rendered in a plugin context without onPressedOutside. In Studio, the QWidget popup will close on focus loss, but the parent's isOpen state will not update. Provide onPressedOutside to stay in sync.")
		end
	end, { var30.onPressedOutside })
	local var73 = usePanelModule({
		isOpen = if flagsModule.FoundationPopoverPluginOverlayMeasurement then ready else var34.isOpen and var64.isReady,
		onClose = reactModule.useCallback(function() --[[ line: 243 ]]
			-- upvalues: var30 (ref), flagsModule (copy), var34 (ref)
			if var30.onPressedOutside then
				if flagsModule.FoundationPopoverClickOutsideInGuiShadow and typeof(var34.anchor) == "Instance" and var34.anchor.GuiState ~= Enum.GuiState.Idle then return end
				var30.onPressedOutside()
			end
		end, { var30.onPressedOutside, var34.anchor }),
		anchorUri = var64.uri,
		registerPanelAsync = var71,
		position = var70,
		depth = if relativeIndex ~= nil then 0 else relativeIndex,
		parentPopoverId = var33,
		isFocusable = if flagsModule.FoundationPopoverPluginFocusable then var30.isFocusable else nil
	})
	local _ = nil
	local _ = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		var76 = var43
		var77 = var45
	else
		local var74, var75 = usePanelSizingModule(var30.side, var30.align, var39, if var65 then var55 else 0, var73)
		var76 = var74
		var77 = var75
	end
	reactModule.useEffect(function() --[[ line: 283 ]]
		-- upvalues: flagsModule (copy), var73 (ref), var30 (ref), var39 (ref), isPointInGuiObjectBoundsModule (copy)
		if not flagsModule.FoundationPopoverClickOutsideInGuiShadow then return end
		if var73 and var73.container and var30.onPressedOutside then
			local inputBeganConnection = var73.container.InputBegan:Connect(function(p9) --[[ line: 292 ]]
				-- upvalues: var39 (copy), isPointInGuiObjectBoundsModule (copy), var30 (copy)
				if p9.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
				if not var39 then return end
				if not isPointInGuiObjectBoundsModule(var39, Vector2.new(p9.Position.X, p9.Position.Y)) then
					var30.onPressedOutside()
				end
			end)
			
			return function() --[[ line: 304 ]]
				-- upvalues: inputBeganConnection (ref)
				inputBeganConnection:Disconnect()
			end
		end
	end, { var73, var39, var30.onPressedOutside })
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		reactModule.useLayoutEffect(function() --[[ line: 311 ]]
			-- upvalues: var68 (write), var39 (ref), var48 (write)
			if not var68 or var39 == nil then return end
			local absoluteSize = var39.AbsoluteSize
			
			if absoluteSize.X > 0 and absoluteSize.Y > 0 then
				var48(absoluteSize)
			end
		end, { var68, var39 })
	end
	local var78 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then reactModule.useMemo(function() --[[ line: 324 ]]
		-- upvalues: var47 (write), positioningModule (copy), var61 (write), var59 (write), var60 (write), var65 (ref), var55 (ref), SHADOW_SIZE (copy)
		return if var47 then positioningModule.calculatePopoverBounds(var61, var59, var60, if var65 then var55 else 0, var47) + Vector2.new(SHADOW_SIZE * 2, SHADOW_SIZE * 2) else nil
	end, {
		var47, var61, var59, var60, var65, var55
	}) else nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		reactModule.useLayoutEffect(function() --[[ line: 342 ]]
			-- upvalues: var47 (write), var78 (ref), var46 (write), var44 (write), var73 (ref)
			if var47 == nil or var78 == nil then
				var46(UDim2.new())
				var44(UDim2.new())
				
				return
			end
			var46(UDim2.fromOffset(var47.X, var47.Y))
			var44(UDim2.fromOffset(var78.X, var78.Y))
			
			if var73 then
				var73.setSizeAsync(var78)
			end
		end, { var47, var78, var73 })
		reactModule.useLayoutEffect(function() --[[ line: 358 ]]
			-- upvalues: var67 (write), var42 (ref), var73 (ref), var78 (ref), var41 (ref)
			if not var67 then
				var42.Parent = nil
				
				return
			elseif var73 and var78 then
				var42.AutomaticSize = Enum.AutomaticSize.None
				var42.Size = UDim2.fromOffset(var78.X, var78.Y)
				var42.Position = UDim2.new()
				var42.Parent = var73.container
				
				return
			end
			var42.AutomaticSize = Enum.AutomaticSize.XY
			var42.Size = UDim2.new()
			var42.Position = UDim2.fromOffset(-10000, -10000)
			var42.Parent = var41
		end, {
			var67,
			var41,
			var73,
			var78,
			var42
		})
	end
	local var80
	local var79 = useArrowPositionModule(var77, var61, var30.radius, var63, var55, if var64.isVirtual or typeof(var34.anchor) ~= "Instance" then nil else var34.anchor)
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		var80 = false
		
		if var73 ~= nil then
			local _ = var78 ~= nil
		end
	else
		var80 = true
	end
	local var84
	local var81 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then var67 else var73 ~= nil
	local var82 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then var42 elseif var73 then var73.container else nil
	local var83 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then reactModule.useMemo(function() --[[ line: 396 ]]
		-- upvalues: var73 (ref), var80 (ref)
		return {
			id = if var73 then var73.popoverId else nil,
			ready = var80
		}
	end, { var73, var80 }) else nil
	
	if var81 and var82 then
		var84 = reactRobloxModule.createPortal
		var84 = var84(reactModule.createElement(reactModule.Fragment, nil, {
			StyleLink = reactModule.createElement("StyleLink", { StyleSheet = var35 }),
			Container = reactModule.createElement(viewModule, {
				AutomaticSize = if flagsModule.FoundationPopoverPluginOverlayMeasurement and var78 == nil then Enum.AutomaticSize.XY else nil,
				Size = if flagsModule.FoundationPopoverPluginOverlayMeasurement and var78 == nil then nil else var76,
				testId = `{var34.testId}--container`
			}, {
				Shadow = reactModule.createElement(popoverShadowModule, {
					ZIndex = 1,
					contentSize = var77,
					position = UDim2.fromOffset(SHADOW_SIZE / 2, SHADOW_SIZE / 2 + 2),
					testId = `{var34.testId}--shadow`
				}),
				Arrow = if var65 then reactModule.createElement(popoverArrowModule, {
					ZIndex = 2,
					size = size200,
					position = var79,
					backgroundStyle = backgroundStyle,
					testId = `{var34.testId}--arrow`
				}) else nil,
				Content = reactModule.createElement(viewModule, {
					ZIndex = 3,
					tag = `auto-xy {t_1[var30.radius]}`,
					Position = UDim2.fromOffset(SHADOW_SIZE, SHADOW_SIZE),
					ref = var40,
					onAbsoluteSizeChanged = if flagsModule.FoundationPopoverPluginOverlayMeasurement then var69 else nil,
					backgroundStyle = backgroundStyle,
					testId = `{var34.testId}--content`
				}, reactModule.createElement(pluginPopoverParentContextModule.Provider, {
					value = if flagsModule.FoundationPopoverPluginOverlayMeasurement then var83 else var73.popoverId
				}, {
					Nested = reactModule.createElement(elevationOwnerScope, { owner = var37 }, var30.children)
				}))
			})
		}), if flagsModule.FoundationPopoverPluginOverlayMeasurement then var82 else var73.container)
	else
		var84 = nil
	end
	return reactModule.createElement(reactModule.Fragment, nil, { Anchor = var64.element, Panel = var84 })
end)