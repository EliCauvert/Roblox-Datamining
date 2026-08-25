local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local _ = game:GetService("GuiService")
local signalsModule = require(corePackagesService.Packages.Signals)
local displayModule = require(corePackagesService.Workspace.Packages.Display)
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagEnableConsoleExpControls = sharedFlagsModule.FFlagEnableConsoleExpControls
local fFlagAddUILessMode = sharedFlagsModule.FFlagAddUILessMode
local fIntAddUILessModeVariant = sharedFlagsModule.FIntAddUILessModeVariant
local roactModule = require(corePackagesService.Packages.Roact)
local reactModule = require(corePackagesService.Packages.React)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local cryoModule = require(corePackagesService.Packages.Cryo)
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local withStyle = UIBloxModule.Core.Style.withStyle
local interactable = UIBloxModule.Core.Control.Interactable
local controlState = UIBloxModule.Core.Control.Enum.ControlState
local images = UIBloxModule.App.ImageSet.Images
local withSelectionCursorProvider = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local _ = UIBloxModule.App.SelectionImage.CursorKind
local reactOtterModule = require(corePackagesService.Packages.ReactOtter)
local foundationModule = require(corePackagesService.Packages.Foundation)
local withCursor = foundationModule.Hooks.withCursor
local skinToneCircle = foundationModule.Enums.CursorType.SkinToneCircle
local _ = script.Parent.Parent.Parent
local flashingDotModule = require(script.Parent.FlashingDot)
local flashingDotV2Module = require(script.Parent.FlashingDotV2)
local getFFlagFlashingDotUseAsyncInitModule = require(coreGuiService.RobloxGui.Modules.Flags.GetFFlagFlashingDotUseAsyncInit)
local var15 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local isNewTiltIconEnabledModule = require(coreGuiService.RobloxGui.Modules.isNewTiltIconEnabled)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local iconButton = roactModule.PureComponent:extend("IconButton")
local circle17 = images["component_assets/circle_17"]
iconButton.validateProps = tModule.strictInterface({
	icon = tModule.union(tModule.string, tModule.table),
	iconSize = tModule.union(tModule.number, tModule.UDim2, tModule.table),
	enableFlashingDot = tModule.optional(tModule.boolean),
	useIconScaleAnimation = tModule.optional(tModule.boolean),
	onActivated = tModule.callback,
	onHover = tModule.optional(tModule.callback),
	onHoverEnd = tModule.optional(tModule.callback),
	backgroundTransparency = tModule.optional(tModule.number),
	backgroundColor3 = tModule.optional(tModule.Color3),
	backgroundCornerRadius = tModule.optional(tModule.UDim),
	forwardRef = tModule.optional(tModule.any),
	onSelectionChanged = if var15 and fFlagEnableConsoleExpControls then tModule.optional(tModule.callback) else nil,
	nextSelectionRightRef = if var15 and fFlagEnableConsoleExpControls then tModule.optional(tModule.any) else nil,
	modal = if fFlagAddUILessMode and fIntAddUILessModeVariant == 2 then tModule.optional(tModule.boolean) else nil,
	[roactModule.Change.AbsoluteSize] = tModule.optional(tModule.callback),
	[roactModule.Change.AbsolutePosition] = tModule.optional(tModule.callback)
})

function AnimatedScaleIcon(p0)
	-- upvalues: reactOtterModule (ref), reactModule (ref), roactModule (ref), imageSetLabel (ref)
	local var19, var20 = reactOtterModule.useAnimatedBinding(p0.iconSize)
	reactModule.useEffect(function()
		-- upvalues: var20 (ref), reactOtterModule (copy), p0 (ref)
		var20(reactOtterModule.spring(p0.iconSize, { dampingRatio = 1, frequency = 2.857142857143 }))
		
		return function() end
	end, { p0.iconSize })
	
	return roactModule.createElement(imageSetLabel, {
		BackgroundTransparency = 1,
		ZIndex = 1,
		Size = var19:map(function(p1)
			return UDim2.fromOffset(p1, p1)
		end),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Image = p0.icon,
		ImageColor3 = p0.style.Theme.IconEmphasis.Color,
		ImageTransparency = p0.style.Theme.IconEmphasis.Transparency
	})
end

function iconButton.init(p2)
	-- upvalues: controlState (ref), signalsModule (ref), displayModule (ref)
	p2:setState({ controlState = controlState.Default })
	
	function p2.controlStateUpdated(p3, p4)
		-- upvalues: p2 (ref), controlState (copy)
		if p2.props.onHover and p4 == controlState.Hover then
			p2.props.onHover()
		elseif p2.props.onHoverEnd and p3 == controlState.Hover and p4 ~= controlState.Hover then
			p2.props.onHoverEnd()
		end
		p2:setState({ controlState = p4 })
	end
	
	p2.disposeUiScaleEffect = signalsModule.createEffect(function(p5)
		-- upvalues: displayModule (copy), p2 (ref)
		p2:setState({
			UiScale = displayModule.GetDisplayStore(p5).getUIScale(p5)
		})
	end)
end

function iconButton.render(p6)
	-- upvalues: var15 (ref), withCursor (ref), withSelectionCursorProvider (ref)
	return if var15 then withCursor(function(p8)
		-- upvalues: p6 (ref)
		return p6:renderWithCursor(p8)
	end) else withSelectionCursorProvider(function(p7)
		-- upvalues: p6 (ref)
		return p6:renderWithCursor(p7)
	end)
end

function iconButton.renderWithCursor(p9, p10)
	-- upvalues: isNewTiltIconEnabledModule (ref), constantsModule (ref), withStyle (ref), controlState (ref), roactModule (ref), interactable (ref), fFlagAddUILessMode (ref), fIntAddUILessModeVariant (ref), skinToneCircle (ref), var15 (ref), fFlagEnableConsoleExpControls (ref), imageSetLabel (ref), getFFlagFlashingDotUseAsyncInitModule (ref), flashingDotV2Module (ref), flashingDotModule (ref), circle17 (ref)
	local backgroundColor3 = not isNewTiltIconEnabledModule() and p9.props.backgroundColor3
	local var22 = constantsModule.TopBarButtonHeight * p9.state.UiScale
	
	return withStyle(function(p11)
		-- upvalues: p9 (ref), controlState (copy), roactModule (copy), interactable (copy), fFlagAddUILessMode (copy), fIntAddUILessModeVariant (copy), isNewTiltIconEnabledModule (copy), var22 (ref), p10 (ref), skinToneCircle (copy), var15 (copy), fFlagEnableConsoleExpControls (copy), backgroundColor3 (ref), imageSetLabel (copy), getFFlagFlashingDotUseAsyncInitModule (copy), flashingDotV2Module (copy), flashingDotModule (copy), circle17 (copy)
		local t = { Transparency = 1, Color = Color3.new(1, 1, 1) }
		
		if p9.state.controlState == controlState.Pressed then
			t = p11.Theme.BackgroundOnPress
		elseif p9.state.controlState == controlState.Hover then
			t = p11.Theme.BackgroundOnHover
		end
		return roactModule.createElement(interactable, {
			onStateChanged = p9.controlStateUpdated,
			ZIndex = 1,
			Modal = if fFlagAddUILessMode and fIntAddUILessModeVariant == 2 then p9.props.modal else nil,
			BackgroundTransparency = if isNewTiltIconEnabledModule() then p11.Theme.BackgroundUIContrast.Transparency * p11.Settings.PreferredTransparency else 1,
			Position = UDim2.fromScale(0, if isNewTiltIconEnabledModule() then 0.5 else 1),
			AnchorPoint = Vector2.new(0, if isNewTiltIconEnabledModule() then 0.5 else 1),
			Size = UDim2.fromOffset(var22, var22),
			Image = if not isNewTiltIconEnabledModule() then "rbxasset://textures/ui/TopBar/iconBase.png" else nil,
			BackgroundColor3 = p11.Theme.BackgroundUIContrast.Color,
			SelectionImageObject = if isNewTiltIconEnabledModule() then p10.getCursor(skinToneCircle) else nil,
			NextSelectionRight = if var15 and fFlagEnableConsoleExpControls then p9.props.nextSelectionRightRef else nil,
			[roactModule.Event.Activated] = p9.props.onActivated,
			[roactModule.Event.SelectionChanged] = if var15 and fFlagEnableConsoleExpControls then p9.props.onSelectionChanged else nil,
			[roactModule.Ref] = p9.props.forwardRef
		}, {
			UICorner = isNewTiltIconEnabledModule() and roactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }) or nil,
			BackgroundFrame = if backgroundColor3 then roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 0,
				Size = p9.props.iconSize,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = p9.props.backgroundTransparency,
				BackgroundColor3 = p9.props.backgroundColor3
			}, {
				UICorner = if p9.props.backgroundCornerRadius then roactModule.createElement("UICorner", { CornerRadius = p9.props.backgroundCornerRadius }) else nil
			}) else nil,
			Icon = not p9.props.useIconScaleAnimation and roactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				ZIndex = 1,
				Size = if typeof(p9.props.iconSize) ~= "number" then UDim2.fromOffset(p9.props.iconSize, p9.props.iconSize) else p9.props.iconSize,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = p9.props.icon,
				ImageColor3 = p11.Theme.IconEmphasis.Color,
				ImageTransparency = p11.Theme.IconEmphasis.Transparency
			}),
			ScalingIcon = p9.props.useIconScaleAnimation and roactModule.createElement(AnimatedScaleIcon, {
				icon = p9.props.icon,
				iconSize = p9.props.iconSize,
				style = p11
			}),
			FlashingDot = if p9.props.enableFlashingDot then roactModule.createElement(if getFFlagFlashingDotUseAsyncInitModule() then flashingDotV2Module else flashingDotModule) else nil,
			StateOverlayRound = isNewTiltIconEnabledModule() and roactModule.createElement("Frame", {
				ZIndex = 2,
				BackgroundTransparency = t.Transparency,
				BackgroundColor3 = t.Color,
				Size = UDim2.fromScale(1, 1)
			}, {
				UICorner = isNewTiltIconEnabledModule() and roactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }) or nil
			}) or nil,
			StateOverlay = not isNewTiltIconEnabledModule() and roactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				ZIndex = 2,
				Image = circle17,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = Rect.new(8, 8, 8, 8),
				ImageColor3 = t.Color,
				ImageTransparency = t.Transparency,
				Size = UDim2.fromScale(1, 1)
			}) or nil
		})
	end)
end

function iconButton.willUnmount(p12)
	if p12.disposeUiScaleEffect then
		p12.disposeUiScaleEffect()
	end
end

return roactModule.forwardRef(function(p13, p14)
	-- upvalues: roactModule (ref), iconButton (ref), cryoModule (ref)
	return roactModule.createElement(iconButton, cryoModule.Dictionary.join(p13, { forwardRef = p14 }))
end)