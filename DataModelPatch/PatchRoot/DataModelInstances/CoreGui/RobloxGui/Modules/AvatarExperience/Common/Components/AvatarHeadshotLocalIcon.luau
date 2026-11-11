local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Radius = FoundationModule.Enums.Radius
local Skeleton = FoundationModule.Skeleton
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local WithStyleFunction = UIBloxModule.Style.withStyle
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local FFlagEnableAvatarHeadshotLocalIconBackgroundFixModule = require(Modules.AvatarExperience.Flags.FFlagEnableAvatarHeadshotLocalIconBackgroundFix)
local WithNavigationFunction = require(CorePackages.Packages.RoactNavigation).withNavigation
local UserLibModule = require(CorePackages.Workspace.Packages.UserLib)
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local LoadingStrategy = UIBloxModule.App.Loading.Enum.LoadingStrategy
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local AvatarHeadShot = UserLibModule.Utils.Constants.RbxthumbTypes.AvatarHeadShot
local AvatarHeadshotLocalIcon = RoactModule.PureComponent:extend("AvatarHeadshotLocalIcon")
AvatarHeadshotLocalIcon.defaultProps = { Size = 36, LayoutOrder = 1 }
AvatarHeadshotLocalIcon.validateProps = TModule.strictInterface({
	Size = TModule.optional(TModule.number),
	ZIndex = TModule.number,
	LayoutOrder = TModule.optional(TModule.integer),
	BackgroundColor3 = TModule.optional(TModule.Color3),
	BackgroundTransparency = TModule.optional(TModule.number),
	navigation = TModule.table,
	localUserId = TModule.string
})

function AvatarHeadshotLocalIcon.getCurrentRouteName(p1)
	-- upvalues: NavigationUtilsModule (copy)
	if not p1.props.navigation or not p1.props.navigation.state or not p1.props.navigation.state.routes or not p1.props.navigation.state.routes[1] or not NavigationUtilsModule.getActiveScreenNavigationState(p1.props.navigation.state.routes[1]) or not NavigationUtilsModule.getActiveScreenNavigationState(p1.props.navigation.state.routes[1]).routeName then return end
	return NavigationUtilsModule.getActiveScreenNavigationState(p1.props.navigation.state.routes[1]).routeName
end

function AvatarHeadshotLocalIcon.init(p1)
	-- upvalues: GetRbxthumbWithTypeSizeAndOptionsFunction (copy), AvatarHeadShot (copy), RoactModule (copy), Skeleton (copy), Radius (copy)
	p1:setState({
		currentRouteName = p1:getCurrentRouteName(),
		imageUri = GetRbxthumbWithTypeSizeAndOptionsFunction(p1.props.localUserId, AvatarHeadShot, 48, true, true)
	})
	
	function p1.getLoadingImage()
		-- upvalues: RoactModule (upval), Skeleton (upval), Radius (upval)
		return RoactModule.createElement(Skeleton, {
			radius = Radius.Circle,
			Size = UDim2.fromScale(1, 1),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		})
	end
end

function AvatarHeadshotLocalIcon.render(p1)
	-- upvalues: WithStyleFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithProviders(p2)
	end)
end

function AvatarHeadshotLocalIcon.didUpdate(p1, p2, p3)
	-- upvalues: GetRbxthumbWithTypeSizeAndOptionsFunction (copy), AvatarHeadShot (copy)
	local CurrentRouteName = p1:getCurrentRouteName()
	
	if CurrentRouteName and CurrentRouteName ~= p3.currentRouteName or p1.props and p2 and p1.props.localUserId ~= p2.localUserId then
		p1:setState({
			currentRouteName = CurrentRouteName,
			imageUri = GetRbxthumbWithTypeSizeAndOptionsFunction(p1.props.localUserId, AvatarHeadShot, 48, true, true)
		})
	end
end

function AvatarHeadshotLocalIcon.makeLoadableImage(p1)
	-- upvalues: RoactModule (copy), LoadableImage (copy), LoadingStrategy (copy)
	return if p1.props.localUserId == nil or p1.props.localUserId == "" then nil else RoactModule.createElement(LoadableImage, {
		BackgroundTransparency = 1,
		useShimmerAnimationWhileLoading = true,
		shouldHandleReloads = true,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UDim2.fromScale(0.5, 0.5),
		Size = UDim2.fromScale(1, 1),
		Image = p1.state.imageUri,
		cornerRadius = UDim.new(0.5, 0),
		loadingStrategy = LoadingStrategy.Eager
	})
end

function AvatarHeadshotLocalIcon.renderWithProviders(p1, p2)
	-- upvalues: RoactModule (copy), FFlagEnableAvatarHeadshotLocalIconBackgroundFixModule (copy)
	local Theme = p2.Theme
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Position = UDim2.new(0.5, 0, 0.5, 0),
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.fromOffset(p1.props.Size, p1.props.Size),
		ZIndex = p1.props.ZIndex,
		LayoutOrder = p1.props.LayoutOrder
	}, {
		Background = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			ZIndex = p1.props.ZIndex,
			BackgroundColor3 = p1.props.BackgroundColor3 or Theme.PlaceHolder.Color,
			BackgroundTransparency = p1.props.BackgroundTransparency or (if FFlagEnableAvatarHeadshotLocalIconBackgroundFixModule then Theme.PlaceHolder.Transparency else nil),
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}, {
			UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0.5, 0) }),
			LoadableImage = p1:makeLoadableImage()
		})
	})
end

return RoactRoduxModule.connect(function(p1)
	return { localUserId = p1.LocalUserId }
end)((WithNavigationFunction(AvatarHeadshotLocalIcon, nil)))