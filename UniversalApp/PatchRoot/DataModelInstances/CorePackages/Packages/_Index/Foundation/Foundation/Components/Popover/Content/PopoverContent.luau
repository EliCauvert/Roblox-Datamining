local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local ConstantsModule = require(Foundation.Constants)
local DashModule = require(Parent.Dash)
local FlagsModule = require(Foundation.Utility.Flags)
local ImageModule = require(Foundation.Components.Image)
local PopoverContextModule = require(script.Parent.Parent.PopoverContext)
local ViewModule = require(Foundation.Components.View)
local IsPointInGuiObjectBoundsModule = require(Foundation.Utility.isPointInGuiObjectBounds)
local UseFloatingModule = require(script.Parent.Parent.useFloating)
local UseOverlayModule = require(Foundation.Providers.Overlay.useOverlay)
local UsePointerPositionModule = require(Foundation.Utility.usePointerPosition)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local RadiusModule = require(Foundation.Enums.Radius)
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local StateLayerAffordanceModule = require(Foundation.Enums.StateLayerAffordance)
local ElevationLayerModule = require(Foundation.Enums.ElevationLayer)
local _ = require(Foundation.Components.Types)
local UseElevationModule = require(Foundation.Providers.Elevation.useElevation)
local ElevationOwnerScope = require(Foundation.Providers.Elevation.ElevationProvider).ElevationOwnerScope
local config = {
	hasArrow = true,
	side = require(Foundation.Enums.PopoverSide).Bottom,
	align = require(Foundation.Enums.PopoverAlign).Center,
	selection = ConstantsModule.MODAL.DISABLE_SELECTION,
	selectionGroup = ConstantsModule.MODAL.TRAP_FOCUS,
	radius = RadiusModule.Medium
}
local config1 = {
	[RadiusModule.Small] = "radius-small",
	[RadiusModule.Medium] = "radius-medium",
	[RadiusModule.Circle] = "radius-circle"
}
local SHADOWIMAGE = ConstantsModule.SHADOW_IMAGE
local SHADOWSIZE = ConstantsModule.SHADOW_SIZE

return ReactModule.forwardRef(function(p1, p2)
	-- upvalues: WithDefaultsModule (copy), config (copy), ReactModule (copy), PopoverContextModule (copy), UseOverlayModule (copy), UseTokensModule (copy), UseElevationModule (copy), ElevationLayerModule (copy), UsePointerPositionModule (copy), UseFloatingModule (copy), IsPointInGuiObjectBoundsModule (copy), FlagsModule (copy), ViewModule (copy), StateLayerAffordanceModule (copy), ImageModule (copy), SHADOWIMAGE (copy), SHADOWSIZE (copy), DashModule (copy), config1 (copy), ElevationOwnerScope (copy), ReactRobloxModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	local UseContextResult = ReactModule.useContext(PopoverContextModule)
	local IsInstance = typeof(UseContextResult.anchor) == "Instance"
	local HasArrow = if IsInstance then WithDefaultsModuleResult.hasArrow else false
	local UseOverlayModuleResult = UseOverlayModule()
	local UseTokensModuleResult = UseTokensModule()
	local UseElevationModuleResult = UseElevationModule(ElevationLayerModule.Popover, { stackAboveOwner = true })
	local Size200: number = UseTokensModuleResult.Size.Size_200
	local SizeRatio = Size200 * 1.4142135623730951 / 2
	local BackgroundStyle = WithDefaultsModuleResult.backgroundStyle or UseTokensModuleResult.Color.Surface.Surface_100
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UsePointerPositionModuleResult = UsePointerPositionModule(UseStateResult1)
	ReactModule.useImperativeHandle(p2, function()
		-- upvalues: UseStateResult (copy)
		return UseStateResult
	end, { UseStateResult })
	local UseFloatingModuleResult, UseFloatingModuleResult2, UseFloatingModuleResult3, UseFloatingModuleResult4, UseFloatingModuleResult5, UseFloatingModuleResult6 = UseFloatingModule(UseContextResult.isOpen, UseContextResult.anchor, UseStateResult, UseOverlayModuleResult, WithDefaultsModuleResult.side, WithDefaultsModuleResult.align, if HasArrow then SizeRatio else 0)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(Object)
		-- upvalues: UseRefResult (copy), UseStateResult2_1 (copy), WithDefaultsModuleResult (copy), UseContextResult (copy), IsInstance (copy), UsePointerPositionModuleResult (copy), IsPointInGuiObjectBoundsModule (upval)
		if UseRefResult.current then
			UseRefResult.current:Disconnect()
		end
		UseStateResult2_1(Object)
		
		if Object ~= nil and WithDefaultsModuleResult.onPressedOutside then
			UseRefResult.current = Object:GetPropertyChangedSignal("GuiState"):Connect(function()
				-- upvalues: Object (copy), UseContextResult (upval), IsInstance (upval), UsePointerPositionModuleResult (upval), IsPointInGuiObjectBoundsModule (upval), WithDefaultsModuleResult (upval)
				if Object.GuiState == Enum.GuiState.Press then
					if UseContextResult.anchor and IsInstance then
						local Anchor = UseContextResult.anchor
						
						if IsPointInGuiObjectBoundsModule(Anchor, (UsePointerPositionModuleResult:getValue())) then return end
						if Anchor.GuiState ~= Enum.GuiState.Idle then return end
					end
					WithDefaultsModuleResult.onPressedOutside()
				end
			end)
		end
	end, {
		WithDefaultsModuleResult.onPressedOutside,
		UseContextResult.anchor
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current then
				UseRefResult.current:Disconnect()
			end
		end
	end, {})
	local MapResult = if FlagsModule.FoundationPopoverContentAnchorFix then ReactModule.joinBindings({
		UseFloatingModuleResult,
		UseFloatingModuleResult6,
		UseFloatingModuleResult3
	}):map(function(Entry): UDim2
		local Entry1 = Entry[1]
		local Entry2 = Entry[2]
		local Entry3 = Entry[3]
		
		return UDim2.fromOffset(Entry1.X - Entry2.X * Entry3.X.Offset, Entry1.Y - Entry2.Y * Entry3.Y.Offset)
	end) else nil
	local Element = if UseContextResult.isOpen then ReactModule.createElement(ViewModule, {
		tag = "size-full",
		ZIndex = UseElevationModuleResult.zIndex,
		Visible = UseFloatingModuleResult2,
		testId = `{UseContextResult.testId}--container`
	}, {
		Backdrop = if WithDefaultsModuleResult.onPressedOutside and UseContextResult.isOpen then ReactModule.createElement(ViewModule, {
			ZIndex = 1,
			tag = "position-center-center anchor-center-center",
			stateLayer = { affordance = StateLayerAffordanceModule.None },
			Size = UDim2.fromScale(2, 2),
			ref = UseResult,
			testId = `{UseContextResult.testId}--backdrop`
		}) else nil,
		Shadow = ReactModule.createElement(ImageModule, {
			ZIndex = 2,
			AnchorPoint = UseFloatingModuleResult6,
			Image = SHADOWIMAGE,
			Size = UseFloatingModuleResult3:map(function(p3): UDim2
				-- upvalues: SHADOWSIZE (upval)
				return p3 + UDim2.fromOffset(SHADOWSIZE, SHADOWSIZE)
			end),
			Position = ReactModule.joinBindings({ UseFloatingModuleResult, UseFloatingModuleResult6 }):map(function(Entry): UDim2
				-- upvalues: SHADOWSIZE (upval)
				return UDim2.fromOffset(Entry[1].X + SHADOWSIZE / 2 * (if Entry[2].X == 0 then -1 else 1), Entry[1].Y + SHADOWSIZE / 2 * (if Entry[2].Y == 0 then -1 else 1) + 2)
			end),
			slice = {
				center = Rect.new(SHADOWSIZE, SHADOWSIZE, SHADOWSIZE + 1, SHADOWSIZE + 1)
			},
			imageStyle = UseTokensModuleResult.Color.Extended.Black.Black_20,
			testId = `{UseContextResult.testId}--shadow`
		}),
		Arrow = if HasArrow then ReactModule.createElement(ViewModule, {
			Rotation = 45,
			ZIndex = 3,
			tag = "anchor-center-center",
			Size = UDim2.fromOffset(Size200, Size200),
			Position = UseFloatingModuleResult4:map(function(Vector): UDim2
				return UDim2.fromOffset(Vector.X, Vector.Y)
			end),
			backgroundStyle = BackgroundStyle,
			testId = `{UseContextResult.testId}--arrow`
		}) else nil,
		Content = ReactModule.createElement(ViewModule, {
			ZIndex = 4,
			AnchorPoint = if FlagsModule.FoundationPopoverContentAnchorFix then Vector2.zero else UseFloatingModuleResult6,
			Position = if FlagsModule.FoundationPopoverContentAnchorFix then MapResult else UseFloatingModuleResult:map(function(Vector): UDim2
				return UDim2.fromOffset(Vector.X, Vector.Y)
			end),
			selection = WithDefaultsModuleResult.selection,
			selectionGroup = WithDefaultsModuleResult.selectionGroup,
			sizeConstraint = { MaxSize = UseFloatingModuleResult5 },
			stateLayer = { affordance = StateLayerAffordanceModule.None },
			onActivated = if WithDefaultsModuleResult.onPressedOutside or WithDefaultsModuleResult.DO_NOT_USE_hasContentInputSink then DashModule.noop else nil,
			backgroundStyle = BackgroundStyle,
			tag = `auto-xy {config1[WithDefaultsModuleResult.radius]}`,
			ref = UseStateResult2,
			testId = `{UseContextResult.testId}--content`
		}, ReactModule.createElement(ElevationOwnerScope, { owner = UseElevationModuleResult }, WithDefaultsModuleResult.children))
	}) else nil
	
	return if UseOverlayModuleResult == nil then Element else ReactRobloxModule.createPortal(Element, UseOverlayModuleResult)
end)