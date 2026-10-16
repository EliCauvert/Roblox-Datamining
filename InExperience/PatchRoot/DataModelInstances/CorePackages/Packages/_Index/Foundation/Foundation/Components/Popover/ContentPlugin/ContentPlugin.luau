local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local ElevationLayerModule = require(Foundation.Enums.ElevationLayer)
local PluginPopoverParentContextModule = require(Foundation.Providers.StudioPanels.PluginPopoverParentContext)
local PopoverAlignModule = require(Foundation.Enums.PopoverAlign)
local PopoverArrowModule = require(script.Parent.Parent.PopoverArrow)
local _ = require(script.Parent.Parent.Content)
local PopoverContextModule = require(script.Parent.Parent.PopoverContext)
local PopoverShadowModule = require(script.Parent.Parent.PopoverShadow)
local PopoverSideModule = require(Foundation.Enums.PopoverSide)
local GetPanelPositionModule = require(script.Parent.getPanelPosition)
local UseOverlayModule = require(Foundation.Providers.Overlay.useOverlay)
local UsePanelModule = require(Foundation.Providers.StudioPanels.usePanel)
local UsePanelsContextModule = require(Foundation.Providers.StudioPanels.usePanelsContext)
local UseStyleSheetFunction = require(Foundation.Providers.Style.StyleSheetContext).useStyleSheet
local ConstantsModule = require(Foundation.Constants)
local FlagsModule = require(Foundation.Utility.Flags)
local LoggerModule = require(Foundation.Utility.Logger)
local RadiusModule = require(Foundation.Enums.Radius)
local _ = require(Foundation.Utility.Plugin.StudioUri)
local ViewModule = require(Foundation.Components.View)
local ElevationModule = require(Foundation.Providers.Elevation.elevation)
local PositioningModule = require(script.Parent.Parent.positioning)
local UseArrowPositionModule = require(script.Parent.useArrowPosition)
local UseElevationModule = require(Foundation.Providers.Elevation.useElevation)
local _ = require(Foundation.Components.Popover.useFloating)
local UsePanelSizingModule = require(script.Parent.usePanelSizing)
local UsePluginAnchorModule = require(script.Parent.usePluginAnchor)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local IsPointInGuiObjectBoundsModule = require(Foundation.Utility.isPointInGuiObjectBounds)
local ElevationOwnerScope = require(Foundation.Providers.Elevation.ElevationProvider).ElevationOwnerScope
local _ = require(Foundation.Providers.StudioPanels.Types)
local PLUGINSHADOWSIZE = if FlagsModule.FoundationPopoverPluginOverlayMeasurement and FlagsModule.FoundationPluginShadowSize then ConstantsModule.PLUGIN_SHADOW_SIZE else ConstantsModule.SHADOW_SIZE
local config = {
	hasArrow = true,
	side = PopoverSideModule.Bottom,
	align = PopoverAlignModule.Center,
	radius = RadiusModule.Medium
}
local config1 = {
	[RadiusModule.Small] = "radius-small",
	[RadiusModule.Medium] = "radius-medium",
	[RadiusModule.Circle] = "radius-circle"
}

return ReactModule.forwardRef(function(p1, p2) --[[ Line: 70 | Named "PopoverContentPlugin" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), UsePanelsContextModule (copy), FlagsModule (copy), ReactModule (copy), PluginPopoverParentContextModule (copy), PopoverContextModule (copy), UseStyleSheetFunction (copy), UseTokensModule (copy), UseElevationModule (copy), ElevationLayerModule (copy), ElevationModule (copy), UseOverlayModule (copy), PopoverSideModule (copy), PopoverAlignModule (copy), UsePluginAnchorModule (copy), GetPanelPositionModule (copy), PLUGINSHADOWSIZE (copy), LoggerModule (copy), UsePanelModule (copy), UsePanelSizingModule (copy), IsPointInGuiObjectBoundsModule (copy), PositioningModule (copy), UseArrowPositionModule (copy), ReactRobloxModule (copy), ViewModule (copy), PopoverShadowModule (copy), config1 (copy), PopoverArrowModule (copy), ElevationOwnerScope (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UsePanelsContextModuleResult = UsePanelsContextModule()
	local UseContextResult = if FlagsModule.FoundationPopoverPluginOverlayMeasurement then ReactModule.useContext(PluginPopoverParentContextModule) else nil
	local Id = if FlagsModule.FoundationPopoverPluginOverlayMeasurement then UseContextResult.id else ReactModule.useContext(PluginPopoverParentContextModule)
	local UseContextResult1 = ReactModule.useContext(PopoverContextModule)
	local UseStyleSheetResult = UseStyleSheetFunction()
	local UseTokensModuleResult = UseTokensModule()
	local UseElevationModuleResult = UseElevationModule(ElevationLayerModule.Popover, { stackAboveOwner = true })
	local RelativeIndex = ElevationModule.getRelativeIndex(UseElevationModuleResult)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useImperativeHandle(p2, function() --[[ Line: 92 ]]
		-- upvalues: UseStateResult (copy)
		return UseStateResult
	end, { UseStateResult })
	local UseOverlayModuleResult = if FlagsModule.FoundationPopoverPluginOverlayMeasurement then UseOverlayModule() else nil
	local UseMemoResult = if FlagsModule.FoundationPopoverPluginOverlayMeasurement then ReactModule.useMemo(function() --[[ Line: 102 ]]
		local PopoverPluginContainer = Instance.new("Frame")
		PopoverPluginContainer.Name = "PopoverPluginContainer"
		PopoverPluginContainer.BackgroundTransparency = 1
		PopoverPluginContainer.BorderSizePixel = 0
		PopoverPluginContainer.ClipsDescendants = false
		PopoverPluginContainer.Position = UDim2.fromOffset(-10000, -10000)
		
		return PopoverPluginContainer
	end, {}) else nil
	
	if FlagsModule.FoundationPopoverPluginOverlayMeasurement then
		ReactModule.useEffect(function() --[[ Line: 114 ]]
			-- upvalues: UseMemoResult (copy)
			return function() --[[ Line: 115 ]]
				-- upvalues: UseMemoResult (upval)
				UseMemoResult:Destroy()
			end
		end, { UseMemoResult })
	end
	local v1 = nil
	local Callback2 = nil
	local v2 = nil
	local Callback1 = nil
	local Vector = nil
	local Callback = nil
	
	if FlagsModule.FoundationPopoverPluginOverlayMeasurement then
		v1, Callback2 = ReactModule.useBinding(UDim2.new())
		v2, Callback1 = ReactModule.useBinding(UDim2.new())
		Vector, Callback = ReactModule.useState(nil)
	end
	local Size200: number = UseTokensModuleResult.Size.Size_200
	local SizeRatio = Size200 * 1.4142135623730951 / 2
	local BackgroundStyle = WithDefaultsModuleResult.backgroundStyle or UseTokensModuleResult.Color.Surface.Surface_100
	local Side = nil
	local Align = nil
	local Offset = nil
	local Offset1 = nil
	
	if FlagsModule.FoundationPopoverPluginOverlayMeasurement then
		Side = if WithDefaultsModuleResult.side then WithDefaultsModuleResult.side else PopoverSideModule.Bottom
		Align = if WithDefaultsModuleResult.align then WithDefaultsModuleResult.align else PopoverAlignModule.Center
		Offset = if type(Side) == "table" then Side.offset else 0
		Offset1 = if type(Align) == "table" then Align.offset else 0
	end
	local Position = nil
	local Position1 = nil
	
	if FlagsModule.FoundationPopoverPluginOverlayMeasurement then
		Position = if type(Side) == "table" then Side.position else Side
		Position1 = if type(Align) == "table" then Align.position else Align
	else
		Position = if type(WithDefaultsModuleResult.side) == "table" then WithDefaultsModuleResult.side.position else WithDefaultsModuleResult.side or PopoverSideModule.Bottom
		Position1 = if type(WithDefaultsModuleResult.align) == "table" then WithDefaultsModuleResult.align.position else WithDefaultsModuleResult.align or PopoverAlignModule.Center
	end
	local v3: number = if Position1 == PopoverAlignModule.Center then 0.5 elseif Position1 == PopoverAlignModule.End then 1 else 0
	local UsePluginAnchorModuleResult = UsePluginAnchorModule(UseContextResult1.anchor, UseContextResult1.anchorUri)
	local HasArrow = not UsePluginAnchorModuleResult.isVirtual and WithDefaultsModuleResult.hasArrow
	local Ready = nil
	local v4: boolean? = nil
	local v5: boolean? = nil
	
	if FlagsModule.FoundationPopoverPluginOverlayMeasurement then
		Ready = UseContextResult1.isOpen and (UsePluginAnchorModuleResult.isReady and UseContextResult.ready)
		v4 = Ready and UseOverlayModuleResult ~= nil
		v5 = v4 and Vector == nil
		ReactModule.useEffect(function() --[[ Line: 175 ]]
			-- upvalues: Ready (ref), Callback (ref)
			if not Ready then
				Callback(nil)
			end
		end, { Ready })
	end
	local UseResult = if FlagsModule.FoundationPopoverPluginOverlayMeasurement then ReactModule.useCallback(function(Frame) --[[ Line: 183 ]]
		-- upvalues: FlagsModule (upval), v5 (ref), Callback (ref)
		if not FlagsModule.FoundationPopoverRecomputeContentSize and not v5 then return end
		local AbsoluteSize = Frame.AbsoluteSize
		
		if AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 then
			Callback(AbsoluteSize)
		end
	end, {
		if FlagsModule.FoundationPopoverRecomputeContentSize then nil else v5
	}) else nil
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 195 ]]
		-- upvalues: GetPanelPositionModule (upval), FlagsModule (upval), Side (ref), WithDefaultsModuleResult (copy), PopoverSideModule (upval), PopoverAlignModule (upval), PLUGINSHADOWSIZE (upval), HasArrow (copy), SizeRatio (copy)
		return GetPanelPositionModule(if FlagsModule.FoundationPopoverPluginOverlayMeasurement then Side else WithDefaultsModuleResult.side or PopoverSideModule.Bottom, WithDefaultsModuleResult.align or PopoverAlignModule.Start, nil, PLUGINSHADOWSIZE, if HasArrow then SizeRatio else 0)
	end, {
		if FlagsModule.FoundationPopoverPluginOverlayMeasurement then Side else WithDefaultsModuleResult.side,
		WithDefaultsModuleResult.align,
		HasArrow,
		SizeRatio
	})
	local UseResult1 = ReactModule.useCallback(function(p3, p4, p5, p6, p7, p8) --[[ Line: 213 ]]
		-- upvalues: UsePanelsContextModuleResult (copy), FlagsModule (upval)
		return UsePanelsContextModuleResult.registerPopoverAsync(p3, p4, p5, p6, p7, if FlagsModule.FoundationPopoverPluginFocusable then p8 else nil)
	end, { UsePanelsContextModuleResult.registerPopoverAsync })
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function() --[[ Line: 234 ]]
		-- upvalues: WithDefaultsModuleResult (copy), UseRefResult (copy), LoggerModule (upval)
		if not WithDefaultsModuleResult.onPressedOutside and not UseRefResult.current then
			UseRefResult.current = true
			LoggerModule:warning("PopoverContent rendered in a plugin context without onPressedOutside. In Studio, the QWidget popup will close on focus loss, but the parent's isOpen state will not update. Provide onPressedOutside to stay in sync.")
		end
	end, { WithDefaultsModuleResult.onPressedOutside })
	local UsePanelModuleResult = UsePanelModule({
		isOpen = if FlagsModule.FoundationPopoverPluginOverlayMeasurement then Ready else UseContextResult1.isOpen and UsePluginAnchorModuleResult.isReady,
		onClose = ReactModule.useCallback(function() --[[ Line: 245 ]]
			-- upvalues: WithDefaultsModuleResult (copy), FlagsModule (upval), UseContextResult1 (copy)
			if WithDefaultsModuleResult.onPressedOutside then
				if FlagsModule.FoundationPopoverClickOutsideInGuiShadow and typeof(UseContextResult1.anchor) == "Instance" and UseContextResult1.anchor.GuiState ~= Enum.GuiState.Idle then return end
				WithDefaultsModuleResult.onPressedOutside()
			end
		end, {
			WithDefaultsModuleResult.onPressedOutside,
			UseContextResult1.anchor
		}),
		anchorUri = UsePluginAnchorModuleResult.uri,
		registerPanelAsync = UseResult1,
		position = UseMemoResult1,
		depth = if RelativeIndex == nil then 0 else RelativeIndex,
		parentPopoverId = Id,
		isFocusable = if FlagsModule.FoundationPopoverPluginFocusable then WithDefaultsModuleResult.isFocusable else nil
	})
	local v6 = nil
	local ContentSize = nil
	
	if FlagsModule.FoundationPopoverPluginOverlayMeasurement then
		v6 = v1
		ContentSize = v2
	else
		v6, ContentSize = UsePanelSizingModule(WithDefaultsModuleResult.side, WithDefaultsModuleResult.align, UseStateResult, if HasArrow then SizeRatio else 0, UsePanelModuleResult)
	end
	ReactModule.useEffect(function() --[[ Line: 285 ]]
		-- upvalues: FlagsModule (upval), UsePanelModuleResult (copy), WithDefaultsModuleResult (copy), UseStateResult (copy), IsPointInGuiObjectBoundsModule (upval)
		if not FlagsModule.FoundationPopoverClickOutsideInGuiShadow then return end
		if not UsePanelModuleResult or not UsePanelModuleResult.container or not WithDefaultsModuleResult.onPressedOutside then return end
		local InputBeganConnection = UsePanelModuleResult.container.InputBegan:Connect(function(Input) --[[ Line: 294 ]]
			-- upvalues: UseStateResult (upval), IsPointInGuiObjectBoundsModule (upval), WithDefaultsModuleResult (upval)
			if Input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
			if not UseStateResult then return end
			if not IsPointInGuiObjectBoundsModule(UseStateResult, (Vector2.new(Input.Position.X, Input.Position.Y))) then
				WithDefaultsModuleResult.onPressedOutside()
			end
		end)
		
		return function() --[[ Line: 306 ]]
			-- upvalues: InputBeganConnection (copy)
			InputBeganConnection:Disconnect()
		end
	end, {
		UsePanelModuleResult,
		UseStateResult,
		WithDefaultsModuleResult.onPressedOutside
	})
	
	if FlagsModule.FoundationPopoverPluginOverlayMeasurement then
		ReactModule.useLayoutEffect(function() --[[ Line: 313 ]]
			-- upvalues: v5 (ref), UseStateResult (copy), Callback (ref)
			if not v5 or UseStateResult == nil then return end
			local AbsoluteSize = UseStateResult.AbsoluteSize
			
			if AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 then
				Callback(AbsoluteSize)
			end
		end, { v5, UseStateResult })
	end
	local UseMemoResult2 = if FlagsModule.FoundationPopoverPluginOverlayMeasurement then ReactModule.useMemo(function() --[[ Line: 326 ]]
		-- upvalues: Vector (ref), PositioningModule (upval), Position (ref), Offset (ref), Offset1 (ref), HasArrow (copy), SizeRatio (copy), PLUGINSHADOWSIZE (upval)
		return if Vector then PositioningModule.calculatePopoverBounds(Position, Offset, Offset1, if HasArrow then SizeRatio else 0, Vector) + Vector2.new(PLUGINSHADOWSIZE * 2, PLUGINSHADOWSIZE * 2) else nil
	end, {
		Vector, Position, Offset, Offset1, HasArrow, SizeRatio
	}) else nil
	
	if FlagsModule.FoundationPopoverPluginOverlayMeasurement then
		ReactModule.useLayoutEffect(function() --[[ Line: 344 ]]
			-- upvalues: Vector (ref), UseMemoResult2 (copy), Callback1 (ref), Callback2 (ref), UsePanelModuleResult (copy)
			if Vector == nil or UseMemoResult2 == nil then
				Callback1(UDim2.new())
				Callback2(UDim2.new())
				
				return
			end
			Callback1(UDim2.fromOffset(Vector.X, Vector.Y))
			Callback2(UDim2.fromOffset(UseMemoResult2.X, UseMemoResult2.Y))
			
			if UsePanelModuleResult then
				UsePanelModuleResult.setSizeAsync(UseMemoResult2)
			end
		end, { Vector, UseMemoResult2, UsePanelModuleResult })
		ReactModule.useLayoutEffect(function() --[[ Line: 360 ]]
			-- upvalues: v4 (ref), UseMemoResult (copy), UsePanelModuleResult (copy), UseMemoResult2 (copy), UseOverlayModuleResult (copy)
			if not v4 then
				UseMemoResult.Parent = nil
				
				return
			end
			if UsePanelModuleResult and UseMemoResult2 then
				UseMemoResult.AutomaticSize = Enum.AutomaticSize.None
				UseMemoResult.Size = UDim2.fromOffset(UseMemoResult2.X, UseMemoResult2.Y)
				UseMemoResult.Position = UDim2.new()
				UseMemoResult.Parent = UsePanelModuleResult.container
				
				return
			else
				UseMemoResult.AutomaticSize = Enum.AutomaticSize.XY
				UseMemoResult.Size = UDim2.new()
				UseMemoResult.Position = UDim2.fromOffset(-10000, -10000)
				UseMemoResult.Parent = UseOverlayModuleResult
			end
		end, {
			v4,
			UseOverlayModuleResult,
			UsePanelModuleResult,
			UseMemoResult2,
			UseMemoResult
		})
	end
	local UseArrowPositionModuleResult = UseArrowPositionModule(ContentSize, Position, WithDefaultsModuleResult.radius, v3, SizeRatio, if UsePluginAnchorModuleResult.isVirtual or typeof(UseContextResult1.anchor) ~= "Instance" then nil else UseContextResult1.anchor)
	local NoFoundationPopoverPluginOverlayMeasurement: boolean = not FlagsModule.FoundationPopoverPluginOverlayMeasurement or UsePanelModuleResult ~= nil and UseMemoResult2 ~= nil
	local UseMemoResult3 = if FlagsModule.FoundationPopoverPluginOverlayMeasurement then UseMemoResult elseif UsePanelModuleResult then UsePanelModuleResult.container else nil
	local UseMemoResult4 = if FlagsModule.FoundationPopoverPluginOverlayMeasurement then ReactModule.useMemo(function() --[[ Line: 398 ]]
		-- upvalues: UsePanelModuleResult (copy), NoFoundationPopoverPluginOverlayMeasurement (copy)
		return {
			id = if UsePanelModuleResult then UsePanelModuleResult.popoverId else nil,
			ready = NoFoundationPopoverPluginOverlayMeasurement
		}
	end, {
		UsePanelModuleResult,
		NoFoundationPopoverPluginOverlayMeasurement
	}) else nil
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Anchor = UsePluginAnchorModuleResult.element,
		Panel = if (if FlagsModule.FoundationPopoverPluginOverlayMeasurement then v4 else UsePanelModuleResult ~= nil) and UseMemoResult3 then ReactRobloxModule.createPortal(ReactModule.createElement(ReactModule.Fragment, nil, {
			StyleLink = ReactModule.createElement("StyleLink", { StyleSheet = UseStyleSheetResult }),
			Container = ReactModule.createElement(ViewModule, {
				AutomaticSize = if FlagsModule.FoundationPopoverPluginOverlayMeasurement and UseMemoResult2 == nil then Enum.AutomaticSize.XY else nil,
				Size = if FlagsModule.FoundationPopoverPluginOverlayMeasurement and UseMemoResult2 == nil then nil else v6,
				testId = `{UseContextResult1.testId}--container`
			}, {
				Shadow = ReactModule.createElement(PopoverShadowModule, {
					ZIndex = 1,
					contentSize = ContentSize,
					position = UDim2.fromOffset(PLUGINSHADOWSIZE / 2, PLUGINSHADOWSIZE / 2 + (if FlagsModule.FoundationPopoverPluginOverlayMeasurement and FlagsModule.FoundationPluginShadowSize then 0 else 2)),
					radiusTag = config1[WithDefaultsModuleResult.radius],
					testId = `{UseContextResult1.testId}--shadow`
				}),
				Arrow = if HasArrow then ReactModule.createElement(PopoverArrowModule, {
					ZIndex = 2,
					size = Size200,
					position = UseArrowPositionModuleResult,
					backgroundStyle = BackgroundStyle,
					testId = `{UseContextResult1.testId}--arrow`
				}) else nil,
				Content = ReactModule.createElement(ViewModule, {
					ZIndex = 3,
					tag = `auto-xy {config1[WithDefaultsModuleResult.radius]}`,
					Position = UDim2.fromOffset(PLUGINSHADOWSIZE, PLUGINSHADOWSIZE),
					ref = UseStateResult2,
					onAbsoluteSizeChanged = if FlagsModule.FoundationPopoverPluginOverlayMeasurement then UseResult else nil,
					backgroundStyle = BackgroundStyle,
					testId = `{UseContextResult1.testId}--content`
				}, ReactModule.createElement(PluginPopoverParentContextModule.Provider, {
					value = if FlagsModule.FoundationPopoverPluginOverlayMeasurement then UseMemoResult4 else UsePanelModuleResult.popoverId
				}, {
					Nested = ReactModule.createElement(ElevationOwnerScope, { owner = UseElevationModuleResult }, WithDefaultsModuleResult.children)
				}))
			})
		}), if FlagsModule.FoundationPopoverPluginOverlayMeasurement then UseMemoResult3 else UsePanelModuleResult.container) else nil
	})
end)