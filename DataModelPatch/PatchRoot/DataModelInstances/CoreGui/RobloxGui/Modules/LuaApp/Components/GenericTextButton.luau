local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(Modules.Common.Roact)
local DEPRECATEDImageSetButtonModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetButton)
local DEPRECATEDImageSetLabelModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
local ShimmerAnimationModule = require(Modules.LuaApp.Components.ShimmerAnimation)
local GenericTextButton = RoactModule.PureComponent:extend("GenericTextButton")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local GetFFlagLuaAppFixSelectionCursorFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuaAppFixSelectionCursor

function GenericTextButton.init(p1)
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

local function _(p1: number, p2: number): number
	return 1 - (1 - p1) * (1 - p2)
end

function GenericTextButton.render(p1)
	-- upvalues: GetFFlagLuaAppFixSelectionCursorFunction (copy), WithSelectionCursorProviderFunction (copy)
	return if GetFFlagLuaAppFixSelectionCursorFunction() then WithSelectionCursorProviderFunction(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithSelectionCursor(p2)
	end) else p1:renderWithSelectionCursor(nil)
end

function GenericTextButton.renderWithSelectionCursor(p1, Callback)
	-- upvalues: GetFFlagLuaAppFixSelectionCursorFunction (copy), CursorKind (copy), RoactModule (copy), DEPRECATEDImageSetButtonModule (copy), DEPRECATEDImageSetLabelModule (copy), ShimmerAnimationModule (copy)
	local ThemeSettings = p1.props.themeSettings
	local Size = p1.props.Size
	local Position = p1.props.Position
	local AnchorPoint = p1.props.AnchorPoint
	local LayoutOrder = p1.props.LayoutOrder
	local Text = p1.props.Text
	local PropsFont = p1.props.Font
	local TextSize = p1.props.TextSize
	local OnActivated = p1.props.onActivated
	local IsLoading = p1.props.isLoading
	local IsDisabled = p1.props.isDisabled
	local IsButtonPressed = p1.state.isButtonPressed
	local IsNotHidden = ThemeSettings.Border.Hidden == false
	local NextSelectionDown = p1.props.NextSelectionDown
	local NextSelectionLeft = p1.props.NextSelectionLeft
	local NextSelectionRight = p1.props.NextSelectionRight
	local NextSelectionUp = p1.props.NextSelectionUp
	local Color = ThemeSettings.Color
	local DisabledTransparency = 0
	
	if IsLoading or IsDisabled then
		Color = ThemeSettings.DisabledColor
		DisabledTransparency = ThemeSettings.DisabledTransparency
	elseif IsButtonPressed then
		Color = ThemeSettings.OnPressColor
		DisabledTransparency = ThemeSettings.OnPressTransparency
	end
	local ImageTransparency: number = IsNotHidden and 1 - (1 - DisabledTransparency) * (1 - ThemeSettings.Border.Transparency) or 0
	
	return RoactModule.createElement(DEPRECATEDImageSetButtonModule, {
		Size = Size,
		Position = Position,
		AnchorPoint = AnchorPoint,
		LayoutOrder = LayoutOrder,
		BackgroundTransparency = 1,
		Image = "LuaApp/buttons/buttonFill",
		ImageColor3 = Color,
		ImageTransparency = 1 - (1 - DisabledTransparency) * (1 - ThemeSettings.Transparency),
		BorderSizePixel = 0,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = Rect.new(8, 8, 9, 9),
		NextSelectionDown = NextSelectionDown,
		NextSelectionLeft = NextSelectionLeft,
		NextSelectionRight = NextSelectionRight,
		NextSelectionUp = NextSelectionUp,
		SelectionImageObject = if GetFFlagLuaAppFixSelectionCursorFunction() then Callback(CursorKind.InputButton) else nil,
		[RoactModule.Ref] = p1.props.forwardRef,
		[RoactModule.Event.InputBegan] = p1.onInputBegan,
		[RoactModule.Event.InputEnded] = p1.onInputEnded,
		[RoactModule.Event.Activated] = OnActivated
	}, {
		Border = IsNotHidden and RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
			BackgroundTransparency = 1,
			Image = "LuaApp/buttons/buttonStroke",
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 1, 0),
			ImageColor3 = ThemeSettings.Border.Color,
			ImageTransparency = ImageTransparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = Rect.new(8, 8, 9, 9)
		}),
		Text = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, TextSize),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Text = Text,
			Font = PropsFont,
			TextSize = TextSize,
			TextColor3 = ThemeSettings.Text.Color,
			TextTransparency = 1 - (1 - DisabledTransparency) * (1 - ThemeSettings.Text.Transparency),
			TextXAlignment = Enum.TextXAlignment.Center,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		ShimmerAnimation = IsLoading and RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = UDim2.new(1, 0, 1, 0)
		}, {
			Shimmer = RoactModule.createElement(ShimmerAnimationModule, {
				shimmerSpeed = 1.5,
				Size = UDim2.new(1, 0, 2, 0),
				Position = UDim2.new(0, 0, 0, 0)
			})
		})
	})
end

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), GenericTextButton (copy), CryoModule (copy)
	return RoactModule.createElement(GenericTextButton, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)