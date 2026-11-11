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
local UsePluginAnchorModule = require(script.Parent.usePluginAnchor)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local IsPointInGuiObjectBoundsModule = require(Foundation.Utility.isPointInGuiObjectBounds)
local ElevationOwnerScope = require(Foundation.Providers.Elevation.ElevationProvider).ElevationOwnerScope
local _ = require(Foundation.Providers.StudioPanels.Types)
local PLUGINSHADOWSIZE = if FlagsModule.FoundationPluginShadowSize then ConstantsModule.PLUGIN_SHADOW_SIZE else ConstantsModule.SHADOW_SIZE
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

return ReactModule.forwardRef(function(p1, p2)
	-- upvalues: WithDefaultsModule (copy), config (copy), UsePanelsContextModule (copy), ReactModule (copy), PluginPopoverParentContextModule (copy), PopoverContextModule (copy), UseStyleSheetFunction (copy), UseTokensModule (copy), UseElevationModule (copy), ElevationLayerModule (copy), ElevationModule (copy), UseOverlayModule (copy), PopoverSideModule (copy), PopoverAlignModule (copy), UsePluginAnchorModule (copy), FlagsModule (copy), GetPanelPositionModule (copy), PLUGINSHADOWSIZE (copy), LoggerModule (copy), PositioningModule (copy), UsePanelModule (copy), IsPointInGuiObjectBoundsModule (copy), UseArrowPositionModule (copy), ReactRobloxModule (copy), ViewModule (copy), PopoverShadowModule (copy), config1 (copy), PopoverArrowModule (copy), ElevationOwnerScope (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UsePanelsContextModuleResult = UsePanelsContextModule()
	local UseContextResult = ReactModule.useContext(PluginPopoverParentContextModule)
	local Id = UseContextResult.id
	local UseContextResult1 = ReactModule.useContext(PopoverContextModule)
	local UseStyleSheetResult = UseStyleSheetFunction()
	local UseTokensModuleResult = UseTokensModule()
	local UseElevationModuleResult = UseElevationModule(ElevationLayerModule.Popover, { stackAboveOwner = true })
	local RelativeIndex = ElevationModule.getRelativeIndex(UseElevationModuleResult)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	ReactModule.useImperativeHandle(p2, function()
		-- upvalues: UseStateResult (copy)
		return UseStateResult
	end, { UseStateResult })
	local UseOverlayModuleResult = UseOverlayModule()
	local UseMemoResult = ReactModule.useMemo(function()
		local PopoverPluginContainer = Instance.new("Frame")
		PopoverPluginContainer.Name = "PopoverPluginContainer"
		PopoverPluginContainer.BackgroundTransparency = 1
		PopoverPluginContainer.BorderSizePixel = 0
		PopoverPluginContainer.ClipsDescendants = false
		PopoverPluginContainer.Position = UDim2.fromOffset(-10000, -10000)
		
		return PopoverPluginContainer
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseMemoResult (copy)
		return function()
			-- upvalues: UseMemoResult (upval)
			UseMemoResult:Destroy()
		end
	end, { UseMemoResult })
	local UseBindingResult2 = nil
	local UseBindingResult2_1 = nil
	local UseStateResult1 = nil
	local UseStateResult2_1 = nil
	local UseBindingResult
	UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UDim2.new())
	local UseBindingResult1
	UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(UDim2.new())
	UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local Size200: number = UseTokensModuleResult.Size.Size_200
	local SizeRatio = Size200 * 1.4142135623730951 / 2
	local BackgroundStyle = WithDefaultsModuleResult.backgroundStyle or UseTokensModuleResult.Color.Surface.Surface_100
	local Side = nil
	local Offset = nil
	local Offset1 = nil
	Side = if WithDefaultsModuleResult.side then WithDefaultsModuleResult.side else PopoverSideModule.Bottom
	local Align = if WithDefaultsModuleResult.align then WithDefaultsModuleResult.align else PopoverAlignModule.Center
	Offset = if type(Side) == "table" then Side.offset else 0
	Offset1 = if type(Align) == "table" then Align.offset else 0
	local Position = nil
	Position = if type(Side) == "table" then Side.position else Side
	local Position1 = if type(Align) == "table" then Align.position else Align
	local v1: number = if Position1 == PopoverAlignModule.Center then 0.5 elseif Position1 == PopoverAlignModule.End then 1 else 0
	local UsePluginAnchorModuleResult = UsePluginAnchorModule(UseContextResult1.anchor, UseContextResult1.anchorUri)
	local HasArrow = not UsePluginAnchorModuleResult.isVirtual and WithDefaultsModuleResult.hasArrow
	local Ready = nil
	local HasUseOverlayModuleResult = nil
	local NoUseStateResult = nil
	Ready = UseContextResult1.isOpen and (UsePluginAnchorModuleResult.isReady and UseContextResult.ready)
	HasUseOverlayModuleResult = Ready and UseOverlayModuleResult ~= nil
	NoUseStateResult = HasUseOverlayModuleResult and UseStateResult1 == nil
	ReactModule.useEffect(function()
		-- upvalues: Ready (ref), UseStateResult2_1 (ref)
		if not Ready then
			UseStateResult2_1(nil)
		end
	end, { Ready })
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: FlagsModule (upval), NoUseStateResult (ref), UseStateResult2_1 (ref)
		if not FlagsModule.FoundationPopoverRecomputeContentSize and not NoUseStateResult then return end
		local AbsoluteSize = Frame.AbsoluteSize
		
		if AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 then
			UseStateResult2_1(AbsoluteSize)
		end
	end, {
		if FlagsModule.FoundationPopoverRecomputeContentSize then nil else NoUseStateResult
	})
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: GetPanelPositionModule (upval), Side (ref), WithDefaultsModuleResult (copy), PopoverAlignModule (upval), PLUGINSHADOWSIZE (upval), HasArrow (copy), SizeRatio (copy)
		return GetPanelPositionModule(Side, WithDefaultsModuleResult.align or PopoverAlignModule.Start, nil, PLUGINSHADOWSIZE, if HasArrow then SizeRatio else 0)
	end, {
		Side,
		WithDefaultsModuleResult.align,
		HasArrow,
		SizeRatio
	})
	local UseResult1 = ReactModule.useCallback(function(p3, p4, p5, p6, p7, p8, p9)
		-- upvalues: UsePanelsContextModuleResult (copy), FlagsModule (upval)
		return UsePanelsContextModuleResult.registerPopoverAsync(p3, p4, p5, p6, p7, if FlagsModule.FoundationPopoverPluginFocusable then p8 else nil, if FlagsModule.FoundationPopoverPluginPoolReclaim then p9 else nil)
	end, { UsePanelsContextModuleResult.registerPopoverAsync })
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: WithDefaultsModuleResult (copy), UseRefResult (copy), LoggerModule (upval)
		if not WithDefaultsModuleResult.onPressedOutside and not UseRefResult.current then
			UseRefResult.current = true
			LoggerModule:warning("PopoverContent rendered in a plugin context without onPressedOutside. In Studio, the QWidget popup will close on focus loss, but the parent's isOpen state will not update. Provide onPressedOutside to stay in sync.")
		end
	end, { WithDefaultsModuleResult.onPressedOutside })
	local NewPopoverBounds = if FlagsModule.FoundationPopoverPluginPoolReclaim and UseStateResult1 then PositioningModule.calculatePopoverBounds(Position, Offset, Offset1, if HasArrow then SizeRatio else 0, UseStateResult1) + Vector2.new(PLUGINSHADOWSIZE * 2, PLUGINSHADOWSIZE * 2) else nil
	local UsePanelModuleResult = UsePanelModule({
		isOpen = if FlagsModule.FoundationPopoverPluginPoolReclaim then Ready and NewPopoverBounds ~= nil else Ready,
		onClose = ReactModule.useCallback(function()
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
		isFocusable = if FlagsModule.FoundationPopoverPluginFocusable then WithDefaultsModuleResult.isFocusable else nil,
		initialSize = if FlagsModule.FoundationPopoverPluginPoolReclaim then NewPopoverBounds else nil
	})
	ReactModule.useEffect(function()
		-- upvalues: FlagsModule (upval), UsePanelModuleResult (copy), WithDefaultsModuleResult (copy), UseStateResult (copy), IsPointInGuiObjectBoundsModule (upval)
		if not FlagsModule.FoundationPopoverClickOutsideInGuiShadow then return end
		if not UsePanelModuleResult or not UsePanelModuleResult.container or not WithDefaultsModuleResult.onPressedOutside then return end
		local InputBeganConnection = UsePanelModuleResult.container.InputBegan:Connect(function(Input)
			-- upvalues: UseStateResult (upval), IsPointInGuiObjectBoundsModule (upval), WithDefaultsModuleResult (upval)
			if Input.UserInputType ~= Enum.UserInputType.MouseButton1 then return end
			if not UseStateResult then return end
			if not IsPointInGuiObjectBoundsModule(UseStateResult, (Vector2.new(Input.Position.X, Input.Position.Y))) then
				WithDefaultsModuleResult.onPressedOutside()
			end
		end)
		
		return function()
			-- upvalues: InputBeganConnection (copy)
			InputBeganConnection:Disconnect()
		end
	end, {
		UsePanelModuleResult,
		UseStateResult,
		WithDefaultsModuleResult.onPressedOutside
	})
	ReactModule.useLayoutEffect(function()
		-- upvalues: NoUseStateResult (ref), UseStateResult (copy), UseStateResult2_1 (ref)
		if not NoUseStateResult or UseStateResult == nil then return end
		local AbsoluteSize = UseStateResult.AbsoluteSize
		
		if AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 then
			UseStateResult2_1(AbsoluteSize)
		end
	end, { NoUseStateResult, UseStateResult })
	local UseMemoResult2 = if FlagsModule.FoundationPopoverPluginPoolReclaim then nil else ReactModule.useMemo(function()
		-- upvalues: UseStateResult1 (ref), PositioningModule (upval), Position (ref), Offset (ref), Offset1 (ref), HasArrow (copy), SizeRatio (copy), PLUGINSHADOWSIZE (upval)
		return if UseStateResult1 then PositioningModule.calculatePopoverBounds(Position, Offset, Offset1, if HasArrow then SizeRatio else 0, UseStateResult1) + Vector2.new(PLUGINSHADOWSIZE * 2, PLUGINSHADOWSIZE * 2) else nil
	end, {
		UseStateResult1, Position, Offset, Offset1, HasArrow, SizeRatio
	})
	ReactModule.useLayoutEffect(function()
		-- upvalues: FlagsModule (upval), NewPopoverBounds (ref), UseMemoResult2 (copy), UseStateResult1 (ref), UseBindingResult2_1 (ref), UseBindingResult2 (ref), UsePanelModuleResult (copy)
		local NewPopoverBounds1 = if FlagsModule.FoundationPopoverPluginPoolReclaim then NewPopoverBounds else UseMemoResult2
		
		if UseStateResult1 == nil or NewPopoverBounds1 == nil then
			UseBindingResult2_1(UDim2.new())
			UseBindingResult2(UDim2.new())
			
			return
		end
		UseBindingResult2_1(UDim2.fromOffset(UseStateResult1.X, UseStateResult1.Y))
		UseBindingResult2(UDim2.fromOffset(NewPopoverBounds1.X, NewPopoverBounds1.Y))
		
		if UsePanelModuleResult then
			UsePanelModuleResult.setSizeAsync(NewPopoverBounds1)
		end
	end, {
		UseStateResult1,
		if FlagsModule.FoundationPopoverPluginPoolReclaim then NewPopoverBounds else UseMemoResult2,
		UsePanelModuleResult
	})
	ReactModule.useLayoutEffect(function()
		-- upvalues: HasUseOverlayModuleResult (ref), UseMemoResult (copy), FlagsModule (upval), NewPopoverBounds (ref), UseMemoResult2 (copy), UsePanelModuleResult (copy), UseOverlayModuleResult (copy)
		if not HasUseOverlayModuleResult then
			UseMemoResult.Parent = nil
			
			return
		end
		local NewPopoverBounds1 = if FlagsModule.FoundationPopoverPluginPoolReclaim then NewPopoverBounds else UseMemoResult2
		
		if UsePanelModuleResult and NewPopoverBounds1 then
			UseMemoResult.AutomaticSize = Enum.AutomaticSize.None
			UseMemoResult.Size = UDim2.fromOffset(NewPopoverBounds1.X, NewPopoverBounds1.Y)
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
		HasUseOverlayModuleResult,
		UseOverlayModuleResult,
		UsePanelModuleResult,
		if FlagsModule.FoundationPopoverPluginPoolReclaim then NewPopoverBounds else UseMemoResult2,
		UseMemoResult
	})
	local UseArrowPositionModuleResult = UseArrowPositionModule(UseBindingResult1, Position, WithDefaultsModuleResult.radius, v1, SizeRatio, if UsePluginAnchorModuleResult.isVirtual or typeof(UseContextResult1.anchor) ~= "Instance" then nil else UseContextResult1.anchor)
	local Ready1: boolean = UsePanelModuleResult ~= nil and (if FlagsModule.FoundationPopoverPluginPoolReclaim then NewPopoverBounds else UseMemoResult2) ~= nil
	local UseMemoResult3 = ReactModule.useMemo(function()
		-- upvalues: UsePanelModuleResult (copy), Ready1 (copy)
		return {
			id = if UsePanelModuleResult then UsePanelModuleResult.popoverId else nil,
			ready = Ready1
		}
	end, { UsePanelModuleResult, Ready1 })
	local Portal = nil
	
	if HasUseOverlayModuleResult and UseMemoResult then
		local NewPopoverBounds1 = if FlagsModule.FoundationPopoverPluginPoolReclaim then NewPopoverBounds else UseMemoResult2
		local XY = if NewPopoverBounds1 == nil then Enum.AutomaticSize.XY else nil
		local NewPopoverBounds2 = if FlagsModule.FoundationPopoverPluginPoolReclaim then NewPopoverBounds else UseMemoResult2
		Portal = ReactRobloxModule.createPortal(ReactModule.createElement(ReactModule.Fragment, nil, {
			StyleLink = ReactModule.createElement("StyleLink", { StyleSheet = UseStyleSheetResult }),
			Container = ReactModule.createElement(ViewModule, {
				AutomaticSize = XY,
				Size = if NewPopoverBounds2 == nil then nil else UseBindingResult,
				testId = `{UseContextResult1.testId}--container`
			}, {
				Shadow = ReactModule.createElement(PopoverShadowModule, {
					ZIndex = 1,
					contentSize = UseBindingResult1,
					position = UDim2.fromOffset(PLUGINSHADOWSIZE / 2, PLUGINSHADOWSIZE / 2 + (if FlagsModule.FoundationPluginShadowSize then 0 else 2)),
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
					onAbsoluteSizeChanged = UseResult,
					backgroundStyle = BackgroundStyle,
					testId = `{UseContextResult1.testId}--content`
				}, ReactModule.createElement(PluginPopoverParentContextModule.Provider, { value = UseMemoResult3 }, {
					Nested = ReactModule.createElement(ElevationOwnerScope, { owner = UseElevationModuleResult }, WithDefaultsModuleResult.children)
				}))
			})
		}), UseMemoResult)
	else
		Portal = nil
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Anchor = UsePluginAnchorModuleResult.element,
		Panel = Portal
	})
end)