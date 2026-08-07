-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:06 2026 Pacific Standard Time.

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

return reactModule.forwardRef(function(p0, p1) --[[ line: 66 | named "PopoverContentPlugin" ]]
	-- upvalues: withDefaultsModule (ref), t (ref), usePanelsContextModule (ref), flagsModule (ref), reactModule (ref), pluginPopoverParentContextModule (ref), popoverContextModule (ref), useStyleSheet (ref), useTokensModule (ref), useElevationModule (ref), elevationLayerModule (ref), elevationModule (ref), useOverlayModule (ref), popoverSideModule (ref), popoverAlignModule (ref), usePluginAnchorModule (ref), getPanelPositionModule (ref), SHADOW_SIZE (ref), loggerModule (ref), usePanelModule (ref), usePanelSizingModule (ref), positioningModule (ref), useArrowPositionModule (ref), reactRobloxModule (ref), viewModule (ref), popoverShadowModule (ref), popoverArrowModule (ref), t_1 (ref), elevationOwnerScope (ref)
	local var29 = withDefaultsModule(p0, t)
	local var30 = usePanelsContextModule()
	local var31 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then reactModule.useContext(pluginPopoverParentContextModule) else nil
	local var32 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then var31.id else reactModule.useContext(pluginPopoverParentContextModule)
	local var33 = reactModule.useContext(popoverContextModule)
	local var34 = useStyleSheet()
	local var35 = useTokensModule()
	local var36 = useElevationModule(elevationLayerModule.Popover, { stackAboveOwner = true })
	local relativeIndex = elevationModule.getRelativeIndex(var36)
	local var38, var39 = reactModule.useState(nil)
	reactModule.useImperativeHandle(p1, function() --[[ line: 88 ]]
		-- upvalues: var38 (ref)
		return var38
	end, { var38 })
	local var40 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then useOverlayModule() else nil
	local var41 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then reactModule.useMemo(function() --[[ line: 98 ]]
		local popoverPluginContainer = Instance.new("Frame")
		popoverPluginContainer.Name = "PopoverPluginContainer"
		popoverPluginContainer.BackgroundTransparency = 1
		popoverPluginContainer.BorderSizePixel = 0
		popoverPluginContainer.ClipsDescendants = false
		popoverPluginContainer.Position = UDim2.fromOffset(-10000, -10000)
		
		return popoverPluginContainer
	end, {}) else nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		reactModule.useEffect(function() --[[ line: 110 ]]
			-- upvalues: var41 (ref)
			return function() --[[ line: 111 ]]
				-- upvalues: var41 (copy)
				var41:Destroy()
			end
		end, { var41 })
	end
	local var42 = nil
	local var43 = nil
	local var44 = nil
	local var45 = nil
	local var46 = nil
	local var47 = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		local var48, var49 = reactModule.useBinding(UDim2.new())
		var42 = var48
		var43 = var49
		local var50, var51 = reactModule.useBinding(UDim2.new())
		var44 = var50
		var45 = var51
		local var52, var53 = reactModule.useState(nil)
		var46 = var52
		var47 = var53
	end
	local size200 = var35.Size.Size_200
	local var54 = size200 * 1.414213562373 / 2
	local backgroundStyle = var29.backgroundStyle or var35.Color.Surface.Surface_100
	local var56 = nil
	local var57 = nil
	local var58 = nil
	local var59 = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		var56 = if var29.side then var29.side else popoverSideModule.Bottom
		var57 = if var29.align then var29.align else popoverAlignModule.Center
		var58 = if type(var56) == "table" then var56.offset else 0
		var59 = if type(var57) == "table" then var57.offset else 0
	end
	local var60, var61
	local _ = nil
	local _ = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		var60 = if type(var56) == "table" then var56.position else var56
		var61 = if type(var57) == "table" then var57.position else var57
	else
		var60 = if type(var29.side) == "table" then var29.side.position else var29.side or popoverSideModule.Bottom
		var61 = if type(var29.align) == "table" then var29.align.position else var29.align or popoverAlignModule.Center
	end
	local var62 = 0
	
	if var61 == popoverAlignModule.Center then
		var62 = 0.5
	elseif var61 == popoverAlignModule.End then
		var62 = 1
	end
	local var63 = usePluginAnchorModule(var33.anchor, if flagsModule.FoundationPopoverPluginUriAnchor then var33.anchorUri else nil)
	local var64 = if var63.isVirtual then false else var29.hasArrow
	local ready = nil
	local var66 = nil
	local var67 = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		ready = var33.isOpen and (var63.isReady and var31.ready)
		var66 = ready and var40 ~= nil
		var67 = var66 and var46 == nil
		reactModule.useEffect(function() --[[ line: 172 ]]
			-- upvalues: ready (write), var47 (write)
			if not ready then
				var47(nil)
			end
		end, { ready })
	end
	local var75, var76
	local var68 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then reactModule.useCallback(function(p2) --[[ line: 180 ]]
		-- upvalues: var67 (write), var47 (write)
		if not var67 then return end
		local absoluteSize = p2.AbsoluteSize
		
		if absoluteSize.X > 0 and absoluteSize.Y > 0 then
			var47(absoluteSize)
		end
	end, { var67 }) else nil
	local var69 = reactModule.useMemo(function() --[[ line: 192 ]]
		-- upvalues: getPanelPositionModule (copy), flagsModule (copy), var56 (write), var29 (ref), popoverSideModule (copy), popoverAlignModule (copy), SHADOW_SIZE (copy), var64 (ref), var54 (ref)
		return getPanelPositionModule(if flagsModule.FoundationPopoverPluginOverlayMeasurement then var56 else var29.side or popoverSideModule.Bottom, var29.align or popoverAlignModule.Start, nil, SHADOW_SIZE, if var64 then var54 else 0)
	end, {
		if flagsModule.FoundationPopoverPluginOverlayMeasurement then var56 else var29.side,
		var29.align,
		var64,
		var54
	})
	local var70 = reactModule.useCallback(function(p3, p4, p5, p6) --[[ line: 210 ]]
		-- upvalues: var32 (ref), var30 (ref)
		return var30.registerPopoverAsync(p3, p4, p5, p6, var32)
	end, { var30.registerPopoverAsync, var32 })
	local var71 = reactModule.useRef(false)
	reactModule.useEffect(function() --[[ line: 218 ]]
		-- upvalues: var29 (ref), var71 (ref), loggerModule (copy)
		if not var29.onPressedOutside and not var71.current then
			var71.current = true
			loggerModule:warning("PopoverContent rendered in a plugin context without onPressedOutside. In Studio, the QWidget popup will close on focus loss, but the parent's isOpen state will not update. Provide onPressedOutside to stay in sync.")
		end
	end, { var29.onPressedOutside })
	local var72 = usePanelModule({
		isOpen = if flagsModule.FoundationPopoverPluginOverlayMeasurement then ready else var33.isOpen and var63.isReady,
		onClose = reactModule.useCallback(function() --[[ line: 229 ]]
			-- upvalues: var29 (ref)
			if var29.onPressedOutside then
				var29.onPressedOutside()
			end
		end, { var29.onPressedOutside }),
		anchorUri = var63.uri,
		registerPanelAsync = var70,
		position = var69,
		depth = if relativeIndex ~= nil then 0 else relativeIndex,
		parentPopoverId = var32
	})
	local _ = nil
	local _ = nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		var75 = var42
		var76 = var44
	else
		local var73, var74 = usePanelSizingModule(var29.side, var29.align, var38, if var64 then var54 else 0, var72)
		var75 = var73
		var76 = var74
	end
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		reactModule.useLayoutEffect(function() --[[ line: 259 ]]
			-- upvalues: var67 (write), var38 (ref), var47 (write)
			if not var67 or var38 == nil then return end
			local absoluteSize = var38.AbsoluteSize
			
			if absoluteSize.X > 0 and absoluteSize.Y > 0 then
				var47(absoluteSize)
			end
		end, { var67, var38 })
	end
	local var77 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then reactModule.useMemo(function() --[[ line: 272 ]]
		-- upvalues: var46 (write), positioningModule (copy), var60 (write), var58 (write), var59 (write), var64 (ref), var54 (ref), SHADOW_SIZE (copy)
		return if var46 then positioningModule.calculatePopoverBounds(var60, var58, var59, if var64 then var54 else 0, var46) + Vector2.new(SHADOW_SIZE * 2, SHADOW_SIZE * 2) else nil
	end, {
		var46, var60, var58, var59, var64, var54
	}) else nil
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		reactModule.useLayoutEffect(function() --[[ line: 290 ]]
			-- upvalues: var46 (write), var77 (ref), var45 (write), var43 (write), var72 (ref)
			if var46 == nil or var77 == nil then
				var45(UDim2.new())
				var43(UDim2.new())
				
				return
			end
			var45(UDim2.fromOffset(var46.X, var46.Y))
			var43(UDim2.fromOffset(var77.X, var77.Y))
			
			if var72 then
				var72.setSizeAsync(var77)
			end
		end, { var46, var77, var72 })
		reactModule.useLayoutEffect(function() --[[ line: 306 ]]
			-- upvalues: var66 (write), var41 (ref), var72 (ref), var77 (ref), var40 (ref)
			if not var66 then
				var41.Parent = nil
				
				return
			elseif var72 and var77 then
				var41.AutomaticSize = Enum.AutomaticSize.None
				var41.Size = UDim2.fromOffset(var77.X, var77.Y)
				var41.Position = UDim2.new()
				var41.Parent = var72.container
				
				return
			end
			var41.AutomaticSize = Enum.AutomaticSize.XY
			var41.Size = UDim2.new()
			var41.Position = UDim2.fromOffset(-10000, -10000)
			var41.Parent = var40
		end, {
			var66,
			var40,
			var72,
			var77,
			var41
		})
	end
	local var79
	local var78 = useArrowPositionModule(var76, var60, var29.radius, var62, var54, if var63.isVirtual or typeof(var33.anchor) ~= "Instance" then nil else var33.anchor)
	
	if flagsModule.FoundationPopoverPluginOverlayMeasurement then
		var79 = false
		
		if var72 ~= nil then
			local _ = var77 ~= nil
		end
	else
		var79 = true
	end
	local var83
	local var80 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then var66 else var72 ~= nil
	local var81 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then var41 elseif var72 then var72.container else nil
	local var82 = if flagsModule.FoundationPopoverPluginOverlayMeasurement then reactModule.useMemo(function() --[[ line: 344 ]]
		-- upvalues: var72 (ref), var79 (ref)
		return {
			id = if var72 then var72.popoverId else nil,
			ready = var79
		}
	end, { var72, var79 }) else nil
	
	if var80 and var81 then
		var83 = reactRobloxModule.createPortal
		var83 = var83(reactModule.createElement(reactModule.Fragment, nil, {
			StyleLink = reactModule.createElement("StyleLink", { StyleSheet = var34 }),
			Container = reactModule.createElement(viewModule, {
				AutomaticSize = if flagsModule.FoundationPopoverPluginOverlayMeasurement and var77 == nil then Enum.AutomaticSize.XY else nil,
				Size = if flagsModule.FoundationPopoverPluginOverlayMeasurement and var77 == nil then nil else var75,
				testId = `{var33.testId}--container`
			}, {
				Shadow = reactModule.createElement(popoverShadowModule, {
					ZIndex = 1,
					contentSize = var76,
					position = UDim2.fromOffset(SHADOW_SIZE / 2, SHADOW_SIZE / 2 + 2),
					testId = `{var33.testId}--shadow`
				}),
				Arrow = if var64 then reactModule.createElement(popoverArrowModule, {
					ZIndex = 2,
					size = size200,
					position = var78,
					backgroundStyle = backgroundStyle,
					testId = `{var33.testId}--arrow`
				}) else nil,
				Content = reactModule.createElement(viewModule, {
					ZIndex = 3,
					tag = `auto-xy {t_1[var29.radius]}`,
					Position = UDim2.fromOffset(SHADOW_SIZE, SHADOW_SIZE),
					ref = var39,
					onAbsoluteSizeChanged = if flagsModule.FoundationPopoverPluginOverlayMeasurement then var68 else nil,
					backgroundStyle = backgroundStyle,
					testId = `{var33.testId}--content`
				}, reactModule.createElement(pluginPopoverParentContextModule.Provider, {
					value = if flagsModule.FoundationPopoverPluginOverlayMeasurement then var82 else var72.popoverId
				}, {
					Nested = reactModule.createElement(elevationOwnerScope, { owner = var36 }, var29.children)
				}))
			})
		}), if flagsModule.FoundationPopoverPluginOverlayMeasurement then var81 else var72.container)
	else
		var83 = nil
	end
	return reactModule.createElement(reactModule.Fragment, nil, { Anchor = var63.element, Panel = var83 })
end)