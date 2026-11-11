local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local ConstantsModule = require(Modules.LuaApp.Constants)
local VrCompatibilityModule = require(CorePackages.Workspace.Packages.VrCompatibility)
local VRConstants = VrCompatibilityModule.VRConstants
local VRPanelWidthIXP = VrCompatibilityModule.VRPanelWidthIXP
local IxpUtilsModule = require(CorePackages.Workspace.Packages.IxpUtils)
local ContextualMenuModule = require(Modules.LuaApp.Components.ContextualMenu)
local DEPRECATEDImageSetLabelModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetLabel)
local DEPRECATEDImageSetButtonModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetButton)
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local GetFFlagVRPanelWidthIXPEnabledFunction = SharedFlagsModule.GetFFlagVRPanelWidthIXPEnabled
local FFlagLuaAppForceVrAppPanelWidthRollout = SharedFlagsModule.FFlagLuaAppForceVrAppPanelWidthRollout
local config = {
	Image = "LuaApp/buttons/buttonFill",
	SliceCenter = Rect.new(8, 8, 9, 9)
}
local config1 = {
	Image = "LuaApp/buttons/buttonStroke",
	SliceCenter = Rect.new(8, 8, 9, 9)
}
local DropDownList = RoactModule.Component:extend("DropDownList")
DropDownList.defaultProps = {
	height = 38,
	itemHeight = 54,
	itemTextSize = 23,
	textSize = 18,
	itemTextColor = ConstantsModule.Color.GRAY1,
	itemFont = Enum.Font.SourceSans,
	size = UDim2.new(1, 0, 0, 38),
	textColor = ConstantsModule.Color.GRAY1,
	font = Enum.Font.SourceSans
}

function DropDownList.init(p1)
	-- upvalues: IsVRAppBuildFunction (copy), FFlagLuaAppForceVrAppPanelWidthRollout (copy), VRConstants (copy)
	p1.state = { isOpen = false }
	
	function p1.onActivated(Frame: Frame)
		-- upvalues: p1 (copy), IsVRAppBuildFunction (upval), FFlagLuaAppForceVrAppPanelWidthRollout (upval), VRConstants (upval)
		local X = 0
		local Y = 0
		local ScreenGui = Frame:FindFirstAncestorOfClass("ScreenGui")
		
		if ScreenGui ~= nil then
			X = ScreenGui.AbsoluteSize.x
			Y = ScreenGui.AbsoluteSize.y
		end
		p1:setState({
			isOpen = true,
			screenShape = {
				x = Frame.AbsolutePosition.x,
				y = Frame.AbsolutePosition.y,
				width = Frame.AbsoluteSize.x,
				height = Frame.AbsoluteSize.y,
				parentWidth = if IsVRAppBuildFunction() then if FFlagLuaAppForceVrAppPanelWidthRollout or not p1.props.vrPanelWidthMultiplier then VRConstants.MainScreenResolution.x else VRConstants.MainScreenResolution.x * p1.props.vrPanelWidthMultiplier else X,
				parentHeight = if IsVRAppBuildFunction() then VRConstants.MainScreenResolution.y else Y
			}
		})
	end
	
	function p1.callbackCancel()
		-- upvalues: p1 (copy)
		p1:setState({ isOpen = false })
	end
	
	function p1.callbackSelect(p2, p3)
		-- upvalues: p1 (copy)
		p1:setState({ isOpen = false })
		
		if p1.props.onSelected then
			p1.props.onSelected(p2, p3)
		end
	end
end

function DropDownList.render(p1)
	-- upvalues: RoactModule (copy), ContextualMenuModule (copy), WithStyleFunction (copy), DEPRECATEDImageSetButtonModule (copy), config (copy), DEPRECATEDImageSetLabelModule (copy), config1 (copy), ConstantsModule (copy)
	local Position = p1.props.position
	local AnchorPoint = p1.props.anchorPoint
	local Height = p1.props.height
	local Items = p1.props.items
	local ItemSelected = p1.props.itemSelected
	local LayoutOrder = p1.props.layoutOrder
	local ScreenShape = p1.state.screenShape
	local Size = p1.props.size
	local Element = if p1.state.isOpen then RoactModule.createElement(ContextualMenuModule, {
		menuItems = Items,
		screenShape = ScreenShape,
		callbackCancel = p1.callbackCancel,
		callbackSelect = p1.callbackSelect
	}) else nil
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), DEPRECATEDImageSetButtonModule (upval), Size (copy), Position (copy), AnchorPoint (copy), LayoutOrder (copy), config (upval), p1 (copy), DEPRECATEDImageSetLabelModule (upval), config1 (upval), ConstantsModule (upval), Height (copy), ItemSelected (copy), Element (ref)
		return RoactModule.createElement(DEPRECATEDImageSetButtonModule, {
			Size = Size,
			Position = Position,
			AnchorPoint = AnchorPoint,
			LayoutOrder = LayoutOrder,
			AutoButtonColor = false,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClipsDescendants = false,
			Image = config.Image,
			ImageColor3 = p2.Theme.BackgroundDefault.Color,
			ImageTransparency = p2.Theme.BackgroundDefault.Transparency,
			ScaleType = Enum.ScaleType.Slice,
			SliceCenter = config.SliceCenter,
			[RoactModule.Event.Activated] = p1.onActivated
		}, {
			Border = RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Image = config1.Image,
				ImageColor3 = p2.Theme.SecondaryDefault.Color,
				ImageTransparency = p2.Theme.SecondaryDefault.Transparency,
				LayoutOrder = LayoutOrder,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = config1.SliceCenter
			}),
			Text = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ClipsDescendants = true,
				BackgroundColor3 = ConstantsModule.Color.WHITE,
				Size = UDim2.new(1, -47, 0, Height),
				Text = ItemSelected.displayName,
				Font = p2.Font.Body.Font,
				TextSize = p2.Font.BaseSize * p2.Font.Body.RelativeSize,
				TextColor3 = p2.Theme.TextDefault.Color,
				TextTransparency = p2.Theme.TextDefault.Transparency,
				Position = UDim2.new(0, 10, 0, 0),
				TextXAlignment = Enum.TextXAlignment.Left,
				TextYAlignment = Enum.TextYAlignment.Center,
				TextTruncate = Enum.TextTruncate.AtEnd
			}),
			Arrow = RoactModule.createElement(DEPRECATEDImageSetLabelModule, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Image = "LuaApp/icons/dropdown_arrowDown",
				AnchorPoint = Vector2.new(1, 0.5),
				ImageColor3 = p2.Theme.IconDefault.Color,
				ImageTransparency = p2.Theme.IconDefault.Transparency,
				Position = UDim2.new(1, -7, 0.5, 0),
				Size = UDim2.new(0, 20, 0, 20)
			}),
			Items = Element
		})
	end)
end

if not FFlagLuaAppForceVrAppPanelWidthRollout and GetFFlagVRPanelWidthIXPEnabledFunction() then
	DropDownList = IxpUtilsModule.connectTestVariables({
		vrPanelWidthMultiplier = VRPanelWidthIXP.VrAppPanelWidthMultiplier
	})(DropDownList)
end
return DropDownList