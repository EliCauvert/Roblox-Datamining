local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local DEPRECATEDImageSetButtonModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetButton)
local DEPRECATEDImageSetLabelModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
local ShimmerAnimationModule = require(Modules.LuaApp.Components.ShimmerAnimation)
local WithStyleFunction = require(game:GetService("CorePackages").Packages.UIBlox).Style.withStyle
local WithThemeDEPRECATEDModule = require(Modules.LuaApp.withTheme_DEPRECATED)
local _Rect = Rect.new(8, 8, 9, 9)
local _Rect1 = Rect.new(8, 8, 9, 9)
local GenericIconButton = RoactModule.PureComponent:extend("GenericIconButton")
GenericIconButton.defaultProps = {
	LayoutOrder = 1,
	isDisabled = false,
	isChecked = false,
	isLoading = false,
	AnchorPoint = Vector2.new(0, 0),
	Position = UDim2.new(0, 0, 0, 0),
	Size = UDim2.new(1, 0, 1, 0),
	iconComponent = DEPRECATEDImageSetLabelModule
}

function GenericIconButton.init(p1)
	p1.state = { isButtonPressed = false }
	
	function p1.onInputBegan()
		-- upvalues: p1 (copy)
		p1:setState({ isButtonPressed = true })
	end
	
	function p1.onInputEnded()
		-- upvalues: p1 (copy)
		p1:setState({ isButtonPressed = false })
	end
end

function GenericIconButton.render(p1)
	-- upvalues: WithStyleFunction (copy), DEPRECATEDImageSetLabelModule (copy), RoactModule (copy), DEPRECATEDImageSetButtonModule (copy), _Rect1 (copy), _Rect (copy), ShimmerAnimationModule (copy)
	local IconButton = p1.props.appTheme.IconButton
	local AnchorPoint = p1.props.AnchorPoint
	local Size = p1.props.Size
	local ButtonRef = p1.props.buttonRef
	local Position = p1.props.Position
	local LayoutOrder = p1.props.LayoutOrder
	local IconImage = p1.props.iconImage
	local IconSize = p1.props.iconSize
	local OnActivated = p1.props.onActivated
	local IsDisabled = p1.props.isDisabled
	local IsChecked = p1.props.isChecked
	local IsLoading = p1.props.isLoading
	local NoIsLoading = not IsLoading
	local IsButtonPressed = p1.state.isButtonPressed
	local Off = IconButton.Border.Off
	local Off1 = IconButton.Fill.Off
	local Off2 = IconButton.Icon.Off
	local WithNewThemeProvider = p1.props.withNewThemeProvider
	
	return WithStyleFunction(function(p2)
		-- upvalues: IsDisabled (copy), Off (ref), IconButton (copy), Off1 (ref), Off2 (ref), IsButtonPressed (ref), IsChecked (ref), IsLoading (ref), NoIsLoading (copy), WithNewThemeProvider (copy), DEPRECATEDImageSetLabelModule (upval), p1 (copy), RoactModule (upval), DEPRECATEDImageSetButtonModule (upval), AnchorPoint (copy), Size (copy), Position (copy), _Rect1 (upval), LayoutOrder (copy), OnActivated (copy), ButtonRef (copy), _Rect (upval), IconSize (copy), IconImage (copy), ShimmerAnimationModule (upval)
		if IsDisabled then
			Off = IconButton.Border.Disabled
			Off1 = IconButton.Fill.Disabled
			Off2 = IconButton.Icon.Disabled
			IsButtonPressed = false
			IsChecked = false
			IsLoading = false
		end
		if IsChecked then
			Off = IconButton.Border.On
			Off1 = IconButton.Fill.On
			Off2 = IconButton.Icon.On
		end
		if IsLoading then
			Off = IconButton.Border.Loading
			Off1 = IconButton.Fill.Loading
			Off2 = IconButton.Icon.Loading
		end
		if IsButtonPressed and NoIsLoading then
			Off = IconButton.Border.OnPress
			Off1 = IconButton.Fill.OnPress
			Off2 = IconButton.Icon.OnPress
		end
		if WithNewThemeProvider then
			Off1.Transparency = 1
			Off.Color = p2.Theme.SecondaryDefault.Color
			Off2.Color = p2.Theme.SecondaryDefault.Color
			
			if IsChecked then
				Off2.Color = p2.Theme.ContextualPrimaryDefault.Color
			end
			if IsButtonPressed and NoIsLoading then
				Off2.Color = p2.Theme.ContextualPrimaryDefault.Color
			end
		end
		return RoactModule.createElement(DEPRECATEDImageSetButtonModule, {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			AnchorPoint = AnchorPoint,
			Size = Size,
			Position = Position,
			Image = "LuaApp/buttons/buttonFill",
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = _Rect1,
			ImageTransparency = Off1.Transparency,
			ImageColor3 = Off1.Color,
			LayoutOrder = LayoutOrder,
			ClipsDescendants = false,
			[RoactModule.Event.Activated] = NoIsLoading and OnActivated or nil,
			[RoactModule.Event.InputBegan] = p1.onInputBegan,
			[RoactModule.Event.InputEnded] = p1.onInputEnded,
			[RoactModule.Ref] = ButtonRef
		}, {
			Border = RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Image = "LuaApp/buttons/buttonStroke",
				Size = UDim2.new(1, 0, 1, 0),
				ImageTransparency = Off.Transparency,
				ImageColor3 = Off.Color,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = _Rect
			}, {
				Icon = RoactModule.createElement(if p1.props.iconComponent then p1.props.iconComponent else DEPRECATEDImageSetLabelModule, {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					Size = IconSize,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0.5, 0, 0.5, 0),
					Image = IconImage,
					ImageTransparency = Off2.Transparency,
					ImageColor3 = Off2.Color
				})
			}),
			ShimmerAnimation = IsLoading and RoactModule.createElement(ShimmerAnimationModule, {
				shimmerSpeed = 1.5,
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0)
			})
		})
	end)
end

return (WithThemeDEPRECATEDModule(GenericIconButton))