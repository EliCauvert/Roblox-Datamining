local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local _ = game:GetService("GuiService")
local SignalsModule = require(CorePackages.Packages.Signals)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagEnableConsoleExpControls = SharedFlagsModule.FFlagEnableConsoleExpControls
local FFlagAddUILessMode = SharedFlagsModule.FFlagAddUILessMode
local FIntAddUILessModeVariant = SharedFlagsModule.FIntAddUILessModeVariant
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local CryoModule = require(CorePackages.Packages.Cryo)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local Interactable = UIBloxModule.Core.Control.Interactable
local ControlState = UIBloxModule.Core.Control.Enum.ControlState
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local _ = UIBloxModule.App.SelectionImage.CursorKind
local ReactOtterModule = require(CorePackages.Packages.ReactOtter)
local FoundationModule = require(CorePackages.Packages.Foundation)
local WithCursorFunction = FoundationModule.Hooks.withCursor
local SkinToneCircle = FoundationModule.Enums.CursorType.SkinToneCircle
local _ = script.Parent.Parent.Parent
local FlashingDotModule = require(script.Parent.FlashingDot)
local FlashingDotV2Module = require(script.Parent.FlashingDotV2)
local GetFFlagFlashingDotUseAsyncInitModule = require(CoreGui.RobloxGui.Modules.Flags.GetFFlagFlashingDotUseAsyncInit)
local EnabledResult = require(CorePackages.Workspace.Packages.Chrome).Enabled()
local IsNewTiltIconEnabledModule = require(CoreGui.RobloxGui.Modules.isNewTiltIconEnabled)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local IconButton = RoactModule.PureComponent:extend("IconButton")
local ComponentAssetsCircle17 = UIBloxModule.App.ImageSet.Images["component_assets/circle_17"]
IconButton.validateProps = TModule.strictInterface({
	icon = TModule.union(TModule.string, TModule.table),
	iconSize = TModule.union(TModule.number, TModule.UDim2, TModule.table),
	enableFlashingDot = TModule.optional(TModule.boolean),
	useIconScaleAnimation = TModule.optional(TModule.boolean),
	onActivated = TModule.callback,
	onHover = TModule.optional(TModule.callback),
	onHoverEnd = TModule.optional(TModule.callback),
	backgroundTransparency = TModule.optional(TModule.number),
	backgroundColor3 = TModule.optional(TModule.Color3),
	backgroundCornerRadius = TModule.optional(TModule.UDim),
	forwardRef = TModule.optional(TModule.any),
	onSelectionChanged = if EnabledResult and FFlagEnableConsoleExpControls then TModule.optional(TModule.callback) else nil,
	nextSelectionRightRef = if EnabledResult and FFlagEnableConsoleExpControls then TModule.optional(TModule.any) else nil,
	modal = if FFlagAddUILessMode and FIntAddUILessModeVariant == 2 then TModule.optional(TModule.boolean) else nil,
	[RoactModule.Change.AbsoluteSize] = TModule.optional(TModule.callback),
	[RoactModule.Change.AbsolutePosition] = TModule.optional(TModule.callback)
})

function AnimatedScaleIcon(p1) --[[ Line: 65 ]]
	-- upvalues: ReactOtterModule (copy), ReactModule (copy), RoactModule (copy), ImageSetLabel (copy)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(p1.iconSize)
	ReactModule.useEffect(function() --[[ Line: 68 ]]
		-- upvalues: UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), p1 (copy)
		UseAnimatedBindingResult2(ReactOtterModule.spring(p1.iconSize, { dampingRatio = 1, frequency = 2.857142857142857 }))
		
		return function() --[[ Line: 73 ]] end
	end, { p1.iconSize })
	
	return RoactModule.createElement(ImageSetLabel, {
		BackgroundTransparency = 1,
		ZIndex = 1,
		Size = UseAnimatedBindingResult:map(function(XOffset): UDim2 --[[ Line: 77 ]]
			return UDim2.fromOffset(XOffset, XOffset)
		end),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Image = p1.icon,
		ImageColor3 = p1.style.Theme.IconEmphasis.Color,
		ImageTransparency = p1.style.Theme.IconEmphasis.Transparency
	})
end

function IconButton.init(p1) --[[ Line: 90 ]]
	-- upvalues: ControlState (copy), SignalsModule (copy), DisplayModule (copy)
	p1:setState({ controlState = ControlState.Default })
	
	function p1.controlStateUpdated(Hover, ControlState1) --[[ Line: 95 ]]
		-- upvalues: p1 (copy), ControlState (upval)
		if p1.props.onHover and ControlState1 == ControlState.Hover then
			p1.props.onHover()
		elseif p1.props.onHoverEnd and Hover == ControlState.Hover and ControlState1 ~= ControlState.Hover then
			p1.props.onHoverEnd()
		end
		p1:setState({ controlState = ControlState1 })
	end
	
	p1.disposeUiScaleEffect = SignalsModule.createEffect(function(p2) --[[ Line: 109 ]]
		-- upvalues: DisplayModule (upval), p1 (copy)
		p1:setState({
			UiScale = DisplayModule.GetDisplayStore(p2).getUIScale(p2)
		})
	end)
end

function IconButton.render(p1) --[[ Line: 117 ]]
	-- upvalues: EnabledResult (copy), WithCursorFunction (copy), WithSelectionCursorProviderFunction (copy)
	return if EnabledResult then WithCursorFunction(function(p2) --[[ Line: 119 ]]
		-- upvalues: p1 (copy)
		return p1:renderWithCursor(p2)
	end) else WithSelectionCursorProviderFunction(function(p2) --[[ Line: 123 ]]
		-- upvalues: p1 (copy)
		return p1:renderWithCursor(p2)
	end)
end

function IconButton.renderWithCursor(p1, p2) --[[ Line: 129 ]]
	-- upvalues: IsNewTiltIconEnabledModule (copy), ConstantsModule (copy), WithStyleFunction (copy), ControlState (copy), RoactModule (copy), Interactable (copy), FFlagAddUILessMode (copy), FIntAddUILessModeVariant (copy), SkinToneCircle (copy), EnabledResult (copy), FFlagEnableConsoleExpControls (copy), ImageSetLabel (copy), GetFFlagFlashingDotUseAsyncInitModule (copy), FlashingDotV2Module (copy), FlashingDotModule (copy), ComponentAssetsCircle17 (copy)
	local BackgroundColor3 = not IsNewTiltIconEnabledModule() and p1.props.backgroundColor3
	local ScaledTopBarButtonHeight = ConstantsModule.TopBarButtonHeight * p1.state.UiScale
	
	return WithStyleFunction(function(Style) --[[ Line: 132 ]]
		-- upvalues: p1 (copy), ControlState (upval), RoactModule (upval), Interactable (upval), FFlagAddUILessMode (upval), FIntAddUILessModeVariant (upval), IsNewTiltIconEnabledModule (upval), ScaledTopBarButtonHeight (copy), p2 (copy), SkinToneCircle (upval), EnabledResult (upval), FFlagEnableConsoleExpControls (upval), BackgroundColor3 (copy), ImageSetLabel (upval), GetFFlagFlashingDotUseAsyncInitModule (upval), FlashingDotV2Module (upval), FlashingDotModule (upval), ComponentAssetsCircle17 (upval)
		local BackgroundOnPress = if p1.state.controlState == ControlState.Pressed then Style.Theme.BackgroundOnPress elseif p1.state.controlState == ControlState.Hover then Style.Theme.BackgroundOnHover else { Transparency = 1, Color = Color3.new(1, 1, 1) }
		
		return RoactModule.createElement(Interactable, {
			onStateChanged = p1.controlStateUpdated,
			ZIndex = 1,
			Modal = if FFlagAddUILessMode and FIntAddUILessModeVariant == 2 then p1.props.modal else nil,
			BackgroundTransparency = if IsNewTiltIconEnabledModule() then Style.Theme.BackgroundUIContrast.Transparency * Style.Settings.PreferredTransparency else 1,
			Position = UDim2.fromScale(0, if IsNewTiltIconEnabledModule() then 0.5 else 1),
			AnchorPoint = Vector2.new(0, if IsNewTiltIconEnabledModule() then 0.5 else 1),
			Size = UDim2.fromOffset(ScaledTopBarButtonHeight, ScaledTopBarButtonHeight),
			Image = if IsNewTiltIconEnabledModule() then nil else "rbxasset://textures/ui/TopBar/iconBase.png",
			BackgroundColor3 = Style.Theme.BackgroundUIContrast.Color,
			SelectionImageObject = if IsNewTiltIconEnabledModule() then p2.getCursor(SkinToneCircle) else nil,
			NextSelectionRight = if EnabledResult and FFlagEnableConsoleExpControls then p1.props.nextSelectionRightRef else nil,
			[RoactModule.Event.Activated] = p1.props.onActivated,
			[RoactModule.Event.SelectionChanged] = if EnabledResult and FFlagEnableConsoleExpControls then p1.props.onSelectionChanged else nil,
			[RoactModule.Ref] = p1.props.forwardRef
		}, {
			UICorner = IsNewTiltIconEnabledModule() and RoactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }) or nil,
			BackgroundFrame = if BackgroundColor3 then RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 0,
				Size = p1.props.iconSize,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = p1.props.backgroundTransparency,
				BackgroundColor3 = p1.props.backgroundColor3
			}, {
				UICorner = if p1.props.backgroundCornerRadius then RoactModule.createElement("UICorner", { CornerRadius = p1.props.backgroundCornerRadius }) else nil
			}) else nil,
			Icon = not p1.props.useIconScaleAnimation and RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				ZIndex = 1,
				Size = if typeof(p1.props.iconSize) == "number" then UDim2.fromOffset(p1.props.iconSize, p1.props.iconSize) else p1.props.iconSize,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = p1.props.icon,
				ImageColor3 = Style.Theme.IconEmphasis.Color,
				ImageTransparency = Style.Theme.IconEmphasis.Transparency
			}),
			ScalingIcon = p1.props.useIconScaleAnimation and RoactModule.createElement(AnimatedScaleIcon, {
				icon = p1.props.icon,
				iconSize = p1.props.iconSize,
				style = Style
			}),
			FlashingDot = if p1.props.enableFlashingDot then RoactModule.createElement(if GetFFlagFlashingDotUseAsyncInitModule() then FlashingDotV2Module else FlashingDotModule) else nil,
			StateOverlayRound = IsNewTiltIconEnabledModule() and RoactModule.createElement("Frame", {
				ZIndex = 2,
				BackgroundTransparency = BackgroundOnPress.Transparency,
				BackgroundColor3 = BackgroundOnPress.Color,
				Size = UDim2.fromScale(1, 1)
			}, {
				UICorner = IsNewTiltIconEnabledModule() and RoactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }) or nil
			}) or nil,
			StateOverlay = if IsNewTiltIconEnabledModule() then nil else RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Image = ComponentAssetsCircle17,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(8, 8, 8, 8),
				ImageColor3 = BackgroundOnPress.Color,
				ImageTransparency = BackgroundOnPress.Transparency,
				Size = UDim2.fromScale(1, 1)
			}) or nil
		})
	end)
end

function IconButton.willUnmount(p1) --[[ Line: 236 ]]
	if p1.disposeUiScaleEffect then
		p1.disposeUiScaleEffect()
	end
end

return RoactModule.forwardRef(function(p1, ForwardRef) --[[ Line: 241 ]]
	-- upvalues: RoactModule (copy), IconButton (copy), CryoModule (copy)
	return RoactModule.createElement(IconButton, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)