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
local var1 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
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
	onSelectionChanged = if var1 and fFlagEnableConsoleExpControls then tModule.optional(tModule.callback) else nil,
	nextSelectionRightRef = if var1 and fFlagEnableConsoleExpControls then tModule.optional(tModule.any) else nil,
	modal = if fFlagAddUILessMode and fIntAddUILessModeVariant == 2 then tModule.optional(tModule.boolean) else nil,
	[roactModule.Change.AbsoluteSize] = tModule.optional(tModule.callback),
	[roactModule.Change.AbsolutePosition] = tModule.optional(tModule.callback)
})

function AnimatedScaleIcon(p1)
	-- upvalues: reactOtterModule (ref), reactModule (ref), roactModule (ref), imageSetLabel (ref)
	local var2, var3 = reactOtterModule.useAnimatedBinding(p1.iconSize)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), reactOtterModule (copy), p1 (ref)
		var3(reactOtterModule.spring(p1.iconSize, { dampingRatio = 1, frequency = 2.857142857143 }))
		
		return function() end
	end, { p1.iconSize })
	
	return roactModule.createElement(imageSetLabel, {
		BackgroundTransparency = 1,
		ZIndex = 1,
		Size = var2:map(function(p2)
			return UDim2.fromOffset(p2, p2)
		end),
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Image = p1.icon,
		ImageColor3 = p1.style.Theme.IconEmphasis.Color,
		ImageTransparency = p1.style.Theme.IconEmphasis.Transparency
	})
end

function iconButton.init(p1)
	-- upvalues: controlState (ref), signalsModule (ref), displayModule (ref)
	p1:setState({ controlState = controlState.Default })
	
	function p2.controlStateUpdated(p2, p3)
		-- upvalues: p1 (ref), controlState (copy)
		if p1.props.onHover and p3 == controlState.Hover then
			p1.props.onHover()
		elseif p1.props.onHoverEnd and p2 == controlState.Hover and p3 ~= controlState.Hover then
			p1.props.onHoverEnd()
		end
		p1:setState({ controlState = p3 })
	end
	
	p1.disposeUiScaleEffect = signalsModule.createEffect(function(p2)
		-- upvalues: displayModule (copy), p1 (ref)
		p1:setState({
			UiScale = displayModule.GetDisplayStore(p2).getUIScale(p2)
		})
	end)
end

function iconButton.render(p1)
	-- upvalues: var1 (ref), withCursor (ref), withSelectionCursorProvider (ref)
	return if var1 then withCursor(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithCursor(p2)
	end) else withSelectionCursorProvider(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithCursor(p2)
	end)
end

function iconButton.renderWithCursor(p1, p2)
	-- upvalues: isNewTiltIconEnabledModule (ref), constantsModule (ref), withStyle (ref), controlState (ref), roactModule (ref), interactable (ref), fFlagAddUILessMode (ref), fIntAddUILessModeVariant (ref), skinToneCircle (ref), var1 (ref), fFlagEnableConsoleExpControls (ref), imageSetLabel (ref), getFFlagFlashingDotUseAsyncInitModule (ref), flashingDotV2Module (ref), flashingDotModule (ref), circle17 (ref)
	local backgroundColor3 = not isNewTiltIconEnabledModule() and p1.props.backgroundColor3
	local var2 = constantsModule.TopBarButtonHeight * p1.state.UiScale
	
	return withStyle(function(p3)
		-- upvalues: p1 (ref), controlState (copy), roactModule (copy), interactable (copy), fFlagAddUILessMode (copy), fIntAddUILessModeVariant (copy), isNewTiltIconEnabledModule (copy), var2 (ref), p2 (ref), skinToneCircle (copy), var1 (copy), fFlagEnableConsoleExpControls (copy), backgroundColor3 (ref), imageSetLabel (copy), getFFlagFlashingDotUseAsyncInitModule (copy), flashingDotV2Module (copy), flashingDotModule (copy), circle17 (copy)
		local t = { Transparency = 1, Color = Color3.new(1, 1, 1) }
		
		if p1.state.controlState == controlState.Pressed then
			t = p3.Theme.BackgroundOnPress
		elseif p1.state.controlState == controlState.Hover then
			t = p3.Theme.BackgroundOnHover
		end
		return roactModule.createElement(interactable, {
			onStateChanged = p1.controlStateUpdated,
			ZIndex = 1,
			Modal = if fFlagAddUILessMode and fIntAddUILessModeVariant == 2 then p1.props.modal else nil,
			BackgroundTransparency = if isNewTiltIconEnabledModule() then p3.Theme.BackgroundUIContrast.Transparency * p3.Settings.PreferredTransparency else 1,
			Position = UDim2.fromScale(0, if isNewTiltIconEnabledModule() then 0.5 else 1),
			AnchorPoint = Vector2.new(0, if isNewTiltIconEnabledModule() then 0.5 else 1),
			Size = UDim2.fromOffset(var2, var2),
			Image = if not isNewTiltIconEnabledModule() then "rbxasset://textures/ui/TopBar/iconBase.png" else nil,
			BackgroundColor3 = p3.Theme.BackgroundUIContrast.Color,
			SelectionImageObject = if isNewTiltIconEnabledModule() then p2.getCursor(skinToneCircle) else nil,
			NextSelectionRight = if var1 and fFlagEnableConsoleExpControls then p1.props.nextSelectionRightRef else nil,
			[roactModule.Event.Activated] = p1.props.onActivated,
			[roactModule.Event.SelectionChanged] = if var1 and fFlagEnableConsoleExpControls then p1.props.onSelectionChanged else nil,
			[roactModule.Ref] = p1.props.forwardRef
		}, {
			UICorner = isNewTiltIconEnabledModule() and roactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }) or nil,
			BackgroundFrame = if backgroundColor3 then roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 0,
				Size = p1.props.iconSize,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				BackgroundTransparency = p1.props.backgroundTransparency,
				BackgroundColor3 = p1.props.backgroundColor3
			}, {
				UICorner = if p1.props.backgroundCornerRadius then roactModule.createElement("UICorner", { CornerRadius = p1.props.backgroundCornerRadius }) else nil
			}) else nil,
			Icon = not p1.props.useIconScaleAnimation and roactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				ZIndex = 1,
				Size = if typeof(p1.props.iconSize) ~= "number" then UDim2.fromOffset(p1.props.iconSize, p1.props.iconSize) else p1.props.iconSize,
				Position = UDim2.fromScale(0.5, 0.5),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Image = p1.props.icon,
				ImageColor3 = p3.Theme.IconEmphasis.Color,
				ImageTransparency = p3.Theme.IconEmphasis.Transparency
			}),
			ScalingIcon = p1.props.useIconScaleAnimation and roactModule.createElement(AnimatedScaleIcon, {
				icon = p1.props.icon,
				iconSize = p1.props.iconSize,
				style = p3
			}),
			FlashingDot = if p1.props.enableFlashingDot then roactModule.createElement(if getFFlagFlashingDotUseAsyncInitModule() then flashingDotV2Module else flashingDotModule) else nil,
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

function iconButton.willUnmount(p1)
	if p1.disposeUiScaleEffect then
		p1.disposeUiScaleEffect()
	end
end

return roactModule.forwardRef(function(p1, p2)
	-- upvalues: roactModule (ref), iconButton (ref), cryoModule (ref)
	return roactModule.createElement(iconButton, cryoModule.Dictionary.join(p1, { forwardRef = p2 }))
end)