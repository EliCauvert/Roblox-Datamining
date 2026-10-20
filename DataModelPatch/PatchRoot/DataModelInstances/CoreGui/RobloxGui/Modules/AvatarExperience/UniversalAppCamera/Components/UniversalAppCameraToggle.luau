local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local TModule = require(CorePackages.Packages.t)
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local WithStyleFunction = UIBloxModule.Style.withStyle
local IconSize = UIBloxModule.App.Constant.IconSize
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local UtilsModule = require(Modules.AvatarExperience.Common.Utils)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local AnimationUtilsModule = require(Modules.AvatarExperience.Common.Managers.AnimationUtils)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local SetCameraButtonStatusFunction = require(CorePackages.Workspace.Packages.AvatarExperienceRodux).Actions.SetCameraButtonStatus
local WithAppRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAppRoute)
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local SelectOutfitTryOnEmoteAnimationAssetIdModule = require(Modules.AvatarExperience.Common.Selectors.SelectOutfitTryOnEmoteAnimationAssetId)
local DeviceOrientationMode = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceOrientationMode
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AnalyticsModule = require(Modules.AvatarExperience.Common.Services.Analytics)
local WithNavigationFocusFunction = require(CorePackages.Packages.RoactNavigation).withNavigationFocus
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local GetCameraOptInFunction = require(CorePackages.Workspace.Packages.CameraOptIn).getCameraOptIn
local GetCameraDevicePermissionFunction = require(CorePackages.Workspace.Packages.CameraOptIn).getCameraDevicePermission
local _ = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local IconsControlsVideoOff = Images["icons/controls/videoOff"]
local IconsControlsVideo = Images["icons/controls/video"]
local _Vector2 = Vector2.new(1, 0)
local _UDim2 = UDim2.new(1, -4, 0, 3)
local _UDim2_1 = UDim2.fromOffset(5, 5)
local _Color3 = Color3.new(0, 1, 0)
local UniversalAppCameraToggle = RoactModule.PureComponent:extend("UniversalAppCameraToggle")
local config = {
	toastMessage = "Feature.Avatar.Message.ClassicHeadAndR6CameraWarning",
	isLocalized = false,
	toastType = ToastTypeModule.InformationMessage
}
local config1 = {
	toastMessage = "Feature.Avatar.Message.CameraFacialAnimationPaused",
	isLocalized = false,
	toastType = ToastTypeModule.InformationMessage
}
local config2 = {
	toastMessage = "Feature.FaceChat.Subtitle.UnableToAccessCamera",
	isLocalized = false,
	toastType = ToastTypeModule.InformationMessage
}
local config3 = {
	toastMessage = "Feature.FaceChat.Subtitle.FeatureDisabled",
	isLocalized = false,
	toastType = ToastTypeModule.InformationMessage
}
UniversalAppCameraToggle.validateProps = TModule.strictInterface({
	isUIFullView = TModule.optional(TModule.boolean),
	isSceneFullView = TModule.optional(TModule.boolean),
	layoutOrder = TModule.optional(TModule.number),
	isDebug = TModule.optional(TModule.boolean),
	hasEmoteTryOn = TModule.boolean,
	ableToAnimateHead = TModule.boolean,
	receivedOutfitInfo = TModule.boolean,
	canPlayAnimation = TModule.boolean,
	pageCanAnimateCameraBasedMood = TModule.boolean,
	isPortrait = TModule.boolean,
	topBarHeight = TModule.number,
	buttonEnabled = TModule.boolean,
	errorOccurred = TModule.boolean,
	analytics = TModule.table,
	networking = TModule.callback,
	avatarRoute = TModule.table,
	navigation = TModule.table,
	isFocused = TModule.boolean,
	setCurrentToastMessage = TModule.callback,
	setCameraButtonStatus = TModule.callback
})

function UniversalAppCameraToggle.setCameraButtonStatusWithAnalytics(p1, p2)
	p1.props.setCameraButtonStatus(p2)
	p1.props.analytics.toggleCameraInEditorAndShop(p2, p1.props.avatarRoute.opaque.name)
end

function UniversalAppCameraToggle.init(p1)
	-- upvalues: config (copy), config3 (copy), config1 (copy), GetCameraDevicePermissionFunction (copy), config2 (copy), MutedErrorModule (copy)
	p1.isMounted = false
	p1:setState({
		isCameraOptIn = false,
		hasDeviceCameraPermissions = false
	})
	
	function p1.toggleCamera()
		-- upvalues: p1 (copy), config (upval), config3 (upval), config1 (upval), GetCameraDevicePermissionFunction (upval), config2 (upval), MutedErrorModule (upval)
		if not p1.props.ableToAnimateHead and p1.props.receivedOutfitInfo then
			p1.props.setCurrentToastMessage(config)
			
			return
		end
		local ButtonEnabled = p1.props.buttonEnabled
		
		if p1.props.errorOccurred then
			p1.props.setCameraButtonStatus(false)
			p1.props.setCurrentToastMessage(config3)
			
			return
		end
		if not p1.state.hasDeviceCameraPermissions then
			GetCameraDevicePermissionFunction():andThen(function(Result)
				-- upvalues: p1 (upval), config2 (upval)
				if not Result then
					p1.props.setCurrentToastMessage(config2)
					
					return
				end
				if p1.isMounted then
					p1:setState({ hasDeviceCameraPermissions = true })
				end
				p1:setCameraButtonStatusWithAnalytics(true)
			end):catch(function(Err)
				-- upvalues: MutedErrorModule (upval), p1 (upval)
				MutedErrorModule(string.format("Universal App Camera Hardware Check error: %s", (tostring(Err))))
				p1.props.setCameraButtonStatus(false)
			end)
			
			return
		end
		if not ButtonEnabled and not p1.props.pageCanAnimateCameraBasedMood then
			p1.props.setCurrentToastMessage(config1)
		end
		p1:setCameraButtonStatusWithAnalytics(not ButtonEnabled)
	end
end

function UniversalAppCameraToggle.render(p1)
	-- upvalues: WithStyleFunction (copy), WithSelectionCursorProviderFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: WithSelectionCursorProviderFunction (upval), p1 (copy)
		return WithSelectionCursorProviderFunction(function(p3)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderWithProviders(p2, p3)
		end)
	end)
end

function UniversalAppCameraToggle.isVisible(p1)
	-- upvalues: UtilsModule (copy)
	if p1.props.isDebug then
		return true
	else
		local IsAvatarSceneButtonsVisible = UtilsModule.isAvatarSceneButtonsVisible(p1.props.avatarRoute, p1.props.isFocused, p1.props.isUIFullView, p1.props.isSceneFullView, p1.props.navigation)
		
		return UtilsModule.isUserCameraEligible() and p1.state.isCameraOptIn and IsAvatarSceneButtonsVisible
	end
end

function UniversalAppCameraToggle.getIcon(p1)
	-- upvalues: IconsControlsVideo (copy), IconsControlsVideoOff (copy)
	return if p1.props.buttonEnabled then IconsControlsVideo else IconsControlsVideoOff
end

function UniversalAppCameraToggle.setCameraOptIn(p1)
	-- upvalues: GetCameraOptInFunction (copy)
	GetCameraOptInFunction(p1.props.networking, false):andThen(function(Result)
		-- upvalues: p1 (copy)
		if not p1.isMounted then return end
		if Result ~= p1.state.isCameraOptIn then
			p1:setState({ isCameraOptIn = Result })
		end
	end)
end

function UniversalAppCameraToggle.didMount(p1)
	p1.isMounted = true
	p1:setCameraOptIn()
end

function UniversalAppCameraToggle.willUnmount(p1)
	p1.isMounted = false
end

function UniversalAppCameraToggle.didUpdate(p1, p2)
	-- upvalues: AvatarScreen (copy), config1 (copy)
	local Name = p1.props.avatarRoute.opaque.name
	p1:setCameraOptIn()
	
	if p1.props.buttonEnabled and Name ~= AvatarScreen.CatalogSearch and Name ~= AvatarScreen.Catalog and Name ~= AvatarScreen.AvatarEditor then
		p1.props.setCameraButtonStatus(false)
		
		return
	end
	if not p1:isVisible() then return end
	if p1.props.buttonEnabled and not p1.props.ableToAnimateHead and p1.props.receivedOutfitInfo then
		p1.props.setCameraButtonStatus(false)
	end
	local PageCanAnimateCameraBasedMood = p1.props.pageCanAnimateCameraBasedMood
	local NoPageCanAnimateCameraBasedMood: boolean = p2.pageCanAnimateCameraBasedMood and not PageCanAnimateCameraBasedMood
	local HasEmoteTryOn = not p2.hasEmoteTryOn and p1.props.hasEmoteTryOn
	
	if p1.props.buttonEnabled and (NoPageCanAnimateCameraBasedMood or HasEmoteTryOn) then
		p1.props.setCurrentToastMessage(config1)
	end
end

function UniversalAppCameraToggle.renderWithProviders(p1, p2)
	-- upvalues: ConstantsModule (copy), RoactModule (copy), ImageSetButton (copy), IconSize (copy), _Vector2 (copy), _UDim2 (copy), _Color3 (copy), _UDim2_1 (copy)
	local Theme = p2.Theme
	local SceneButtonSize = ConstantsModule.SceneButtonSize
	local NoCanPlayAnimation = not p1.props.canPlayAnimation
	
	return RoactModule.createElement("Frame", {
		Size = UDim2.fromOffset(SceneButtonSize, SceneButtonSize),
		Visible = p1:isVisible(),
		BackgroundColor3 = Theme.BackgroundMuted.Color,
		BackgroundTransparency = Theme.BackgroundMuted.Transparency,
		LayoutOrder = p1.props.layoutOrder
	}, {
		Corner = RoactModule.createElement("UICorner", { CornerRadius = ConstantsModule.SceneButtonCornerRadius }),
		RoactModule.createElement(ImageSetButton, {
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.fromOffset(IconSize.Regular, IconSize.Regular),
			BackgroundTransparency = 1,
			Image = p1:getIcon(),
			ImageColor3 = Theme.IconEmphasis.Color,
			ImageTransparency = if NoCanPlayAnimation and not p1.props.buttonEnabled then 0.5 else 0,
			ZIndex = 2,
			[RoactModule.Event.Activated] = p1.toggleCamera
		}, {
			Dot = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				ZIndex = 2,
				LayoutOrder = 2,
				AnchorPoint = _Vector2,
				Position = _UDim2,
				BackgroundColor3 = _Color3,
				Size = _UDim2_1,
				Visible = not NoCanPlayAnimation and p1.props.buttonEnabled
			}, {
				Corner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
			})
		})
	})
end

return (RoactServices.connect({
	analytics = AnalyticsModule,
	networking = RoactNetworkingModule
})((WithNavigationFocusFunction((WithAppRouteModule((RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: UtilsModule (copy), AnimationUtilsModule (copy), SelectOutfitTryOnEmoteAnimationAssetIdModule (copy), DeviceOrientationMode (copy)
	local TopBarHeight = p1.TopBar.topBarHeight
	local IsCanAnimateCameraBasedMood = UtilsModule.getCategoryInfoFromState(p1, p2.avatarRoute).CanAnimateCameraBasedMood == true
	local AllowsTryingEmotesOrAnimations, _ = AnimationUtilsModule.getAllowsTryingEmotesOrAnimations(p1, p2.avatarRoute)
	local CanPlayCameraBasedMoodAnimation = AnimationUtilsModule.canPlayCameraBasedMoodAnimation(p1, IsCanAnimateCameraBasedMood, AllowsTryingEmotesOrAnimations)
	local HasSelectOutfitTryOnEmoteAnimationAssetIdModuleResult = SelectOutfitTryOnEmoteAnimationAssetIdModule(p1) ~= nil
	local AbleToAnimateHeadResult, AbleToAnimateHeadResult2 = AnimationUtilsModule.ableToAnimateHead(p1)
	
	return {
		hasEmoteTryOn = HasSelectOutfitTryOnEmoteAnimationAssetIdModuleResult,
		pageCanAnimateCameraBasedMood = IsCanAnimateCameraBasedMood,
		ableToAnimateHead = AbleToAnimateHeadResult,
		receivedOutfitInfo = AbleToAnimateHeadResult2,
		canPlayAnimation = CanPlayCameraBasedMoodAnimation,
		isPortrait = p1.DeviceOrientation == DeviceOrientationMode.Portrait,
		topBarHeight = TopBarHeight,
		buttonEnabled = p1.AvatarExperience.CameraButton.enabled,
		errorOccurred = p1.AvatarExperience.CameraButton.errorOccurred
	}
end, function(Callback)
	-- upvalues: SetCurrentToastMessageModule (copy), SetCameraButtonStatusFunction (copy)
	return {
		setCurrentToastMessage = function(p1)
			-- upvalues: Callback (copy), SetCurrentToastMessageModule (upval)
			Callback(SetCurrentToastMessageModule(p1))
		end,
		setCameraButtonStatus = function(p1)
			-- upvalues: Callback (copy), SetCameraButtonStatusFunction (upval)
			Callback(SetCameraButtonStatusFunction(p1))
		end
	}
end)(UniversalAppCameraToggle))))))))