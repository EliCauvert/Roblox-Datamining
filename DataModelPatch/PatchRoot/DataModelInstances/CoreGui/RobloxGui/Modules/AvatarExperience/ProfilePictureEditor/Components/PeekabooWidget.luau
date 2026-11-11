local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local CryoModule = require(CorePackages.Packages.Cryo)
local TModule = require(CorePackages.Packages.t)
local GetSafeAreaSizeFunction = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local SetPeekabooLayoutDetailsModule = require(Modules.AvatarExperience.ProfilePictureEditor.Actions.SetPeekabooLayoutDetails)
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local SharedInteractionFrameModule = require(Modules.AvatarExperience.Common.Components.SharedInteractionFrame)
local FFlagAXF10ftFixPeekabooWidgetModule = require(Modules.AvatarExperience.Flags.FFlagAXF10ftFixPeekabooWidget)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local PeekabooWidget = RoactModule.PureComponent:extend("PeekabooWidget")
PeekabooWidget.validateProps = TModule.strictInterface({
	viewportYScale = TModule.number,
	viewportXScale = TModule.number,
	topMarginYScale = TModule.number,
	renderBottomContents = TModule.callback,
	renderMiddleContents = TModule.callback,
	panByPixels = TModule.optional(TModule.callback),
	rotateByPixels = TModule.optional(TModule.callback),
	setAngularVelocityByPixels = TModule.optional(TModule.callback),
	zoomToPoint = TModule.optional(TModule.callback),
	globalGuiInset = if FFlagAXF10ftFixPeekabooWidgetModule then nil else TModule.strictInterface({
		left = TModule.integer,
		top = TModule.integer,
		right = TModule.integer,
		bottom = TModule.integer
	}),
	screenSize = if FFlagAXF10ftFixPeekabooWidgetModule then nil else TModule.Vector2,
	containerSize = if FFlagAXF10ftFixPeekabooWidgetModule then TModule.Vector2 else nil,
	setPeekabooLayoutDetails = TModule.callback,
	navigation = TModule.table
})

function PeekabooWidget.init(p1)
	p1:deriveDetailsFromProps(p1.props)
	
	function p1.panByPixels(p2)
		-- upvalues: p1 (copy)
		if p1.props.panByPixels then
			p1.props.panByPixels(p2)
		end
	end
	
	function p1.rotateByPixels(p2)
		-- upvalues: p1 (copy)
		if p1.props.rotateByPixels then
			p1.props.rotateByPixels(p2)
		end
	end
	
	function p1.setAngularVelocityByPixels(p2)
		-- upvalues: p1 (copy)
		if p1.props.setAngularVelocityByPixels then
			p1.props.setAngularVelocityByPixels(p2)
		end
	end
	
	function p1.zoomToPoint(p2, p3)
		-- upvalues: p1 (copy)
		if p1.props.zoomToPoint then
			p1.props.zoomToPoint(p2, p3)
		end
	end
end

function PeekabooWidget.postToRodux(p1)
	p1.props.setPeekabooLayoutDetails(p1.props.navigation.state.routeName, p1.safeAreaSize.Y.Offset, p1.topYPix, p1.viewportSizePix)
end

function PeekabooWidget.getFrameDetails(p1, p2)
	local ScaledOffset = p1.safeAreaSize.X.Offset * p2.viewportXScale
	local ScaledOffset1 = p1.safeAreaSize.Y.Offset * p2.viewportYScale
	
	if ScaledOffset < ScaledOffset1 then
		p1.viewportSizePix = math.floor(ScaledOffset + 0.5)
	else
		p1.viewportSizePix = math.floor(ScaledOffset1 + 0.5)
	end
	p1.topYPix = math.floor(p1.safeAreaSize.Y.Offset * p2.topMarginYScale + 0.5)
	p1.sideXPix = math.floor((p1.safeAreaSize.X.Offset - p1.viewportSizePix) / 2 + 0.5)
end

function PeekabooWidget.deriveDetailsFromProps(p1, Props)
	-- upvalues: FFlagAXF10ftFixPeekabooWidgetModule (copy), GetSafeAreaSizeFunction (copy)
	local ScreenSize = Props.screenSize
	local GlobalGuiInset = Props.globalGuiInset
	local ContainerSize = Props.containerSize
	p1.safeAreaSize = if FFlagAXF10ftFixPeekabooWidgetModule then UDim2.fromOffset(ContainerSize.X, ContainerSize.Y) else GetSafeAreaSizeFunction(ScreenSize, GlobalGuiInset)
	p1:getFrameDetails(Props)
	p1:postToRodux()
end

function PeekabooWidget.willUpdate(p1, p2, _)
	p1:deriveDetailsFromProps(p2)
end

function PeekabooWidget.renderWithProviders(p1, p2)
	-- upvalues: RoactModule (copy), SharedInteractionFrameModule (copy)
	local Theme = p2.Theme
	
	return RoactModule.createFragment({
		TopFrame = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 0,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency,
			Size = UDim2.new(1, 0, 0, p1.topYPix),
			Position = UDim2.fromOffset(0, 0)
		}),
		LeftMiddleFrame = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 0,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency,
			Size = UDim2.new(0, p1.sideXPix, 0, p1.viewportSizePix),
			Position = UDim2.fromOffset(0, p1.topYPix)
		}),
		MiddleFrame = RoactModule.createElement(SharedInteractionFrameModule, {
			ZIndex = -1,
			Size = UDim2.new(0, p1.viewportSizePix, 0, p1.viewportSizePix),
			Position = UDim2.fromOffset(p1.sideXPix, p1.topYPix),
			panByPixels = p1.panByPixels,
			rotateByPixels = p1.rotateByPixels,
			setAngularVelocityByPixels = p1.setAngularVelocityByPixels,
			zoomToPoint = p1.zoomToPoint
		}, { Contents = p1.props.renderMiddleContents() }),
		RightMiddleFrame = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = 0,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency,
			AnchorPoint = Vector2.new(1, 0),
			Size = UDim2.new(0, p1.safeAreaSize.X.Offset - p1.sideXPix - p1.viewportSizePix, 0, p1.viewportSizePix),
			Position = UDim2.new(1, 0, 0, p1.topYPix)
		}),
		BottomFrame = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = Theme.BackgroundDefault.Color,
			BackgroundTransparency = Theme.BackgroundDefault.Transparency,
			AnchorPoint = Vector2.new(0, 1),
			Size = UDim2.new(1, 0, 0, p1.safeAreaSize.Y.Offset - p1.topYPix - p1.viewportSizePix),
			Position = UDim2.fromScale(0, 1)
		}, { Contents = p1.props.renderBottomContents() })
	})
end

function PeekabooWidget.render(p1)
	-- upvalues: WithStyleFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithProviders(p2)
	end)
end

local WithNavigationResult = WithNavigationFunction(RoactRoduxModule.connect(if FFlagAXF10ftFixPeekabooWidgetModule then nil else function(p1, _)
	return {
		globalGuiInset = p1.GlobalGuiInset,
		screenSize = p1.ScreenSize
	}
end, function(Callback)
	-- upvalues: SetPeekabooLayoutDetailsModule (copy)
	return {
		setPeekabooLayoutDetails = function(p1, p2, p3, p4)
			-- upvalues: Callback (copy), SetPeekabooLayoutDetailsModule (upval)
			Callback(SetPeekabooLayoutDetailsModule(p1, p2, p3, p4))
		end
	}
end)(PeekabooWidget), nil)

local function PeekabooWidgetWrapper(p1)
	-- upvalues: ReactModule (copy), WithNavigationResult (ref), CryoModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.zero)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize)
	end, {})
	ReactModule.useLayoutEffect(function()
		-- upvalues: UseResult (copy), UseRefResult (copy)
		UseResult(UseRefResult.current)
	end, { UseResult })
	
	return ReactModule.createElement("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		ref = UseRefResult,
		[ReactModule.Change.AbsoluteSize] = UseResult
	}, {
		PeekabooWidget = ReactModule.createElement(WithNavigationResult, CryoModule.Dictionary.join(p1, { containerSize = UseStateResult }))
	})
end

return if FFlagAXF10ftFixPeekabooWidgetModule then PeekabooWidgetWrapper else WithNavigationResult