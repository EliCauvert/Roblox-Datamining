local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local UserInputService = game:GetService("UserInputService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local CryoModule = require(CorePackages.Packages.Cryo)
local ReactModule = require(CorePackages.Packages.React)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Toast = UIBloxModule.App.Dialog.Toast
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local RoactLocalizationModule = require(Modules.LuaApp.Services.RoactLocalization)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local RemoveCurrentToastMessageModule = require(Modules.LuaApp.Actions.RemoveCurrentToastMessage)
local OpenGameDetailsModule = require(Modules.LuaApp.Thunks.OpenGameDetails)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local ScreenGuiWithBlurControlModule = require(Modules.LuaApp.Components.ScreenGuiWithBlurControl)
local ImagesModule = require(Modules.LuaApp.Components.Images)
local Images = UIBloxModule.App.ImageSet.Images
local LuaAppGraphicIcAlert = ImagesModule["LuaApp/graphic/ic_alert"]
local LuaAppGraphicIcLogo = ImagesModule["LuaApp/graphic/ic_logo"]
local IconsCommonNotificationOn = Images["icons/common/notificationOn"]
local IconsCommonNotificationOff = Images["icons/common/notificationOff"]
local GetFFlagLuaAppUseWithLocalizationModule = require(Modules.LuaApp.Flags.GetFFlagLuaAppUseWithLocalization)
local GetNotificationsExperienceDetailsVariant = require(CorePackages.Workspace.Packages.SharedFlags).GetNotificationsExperienceDetailsVariant
local GetFFlagNotificationsForceEnableEDPDiscoverabilityFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagNotificationsForceEnableEDPDiscoverability
local FFlagLuaAppToastV2PerMessageDuration = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppToastV2PerMessageDuration
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagSignalsNavP3dRouteGated = SharedFlagsModule.FFlagSignalsNavP3dRouteGated
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3dRouteGated then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local VrCompatibilityModule = require(CorePackages.Workspace.Packages.VrCompatibility)
local VRReadyWrapper = VrCompatibilityModule.VRReadyWrapper
local VRConstants = VrCompatibilityModule.VRConstants
local config = { frequency = 4, damping = 1 }
local ToastV2 = RoactModule.PureComponent:extend("ToastV2")
ToastV2.defaultProps = {
	duration = 3,
	springOptions = { frequency = 150, damping = 1 }
}
ToastV2.validateProps = TModule.strictInterface({
	duration = TModule.optional(TModule.integer),
	springOptions = TModule.optional(TModule.table),
	displayOrder = TModule.optional(TModule.integer),
	localization = TModule.table,
	currentToastMessage = TModule.optional(TModule.table),
	currentRoute = TModule.table,
	openGameDetails = TModule.callback,
	removeCurrentToastMessage = TModule.callback,
	enableNotificationsDiscoverability = TModule.optional(TModule.boolean)
})

function ToastV2.openLuaGameDetails(p1, UniverseId)
	p1.props.openGameDetails(UniverseId)
end

function ToastV2.init(p1)
	-- upvalues: ToastTypeModule (copy)
	function p1.onDismissed()
		-- upvalues: p1 (copy)
		p1.props.removeCurrentToastMessage()
	end
	
	function p1.onButtonActivated()
		-- upvalues: p1 (copy), ToastTypeModule (upval)
		if p1.props.currentToastMessage then
			local CurrentToastMessage = p1.props.currentToastMessage
			local UniverseId = CurrentToastMessage.universeId
			
			if CurrentToastMessage.toastType == ToastTypeModule.QuickLaunchError and UniverseId then
				p1:openLuaGameDetails(UniverseId)
			end
			p1.props.removeCurrentToastMessage()
		end
	end
end

function ToastV2.onRender(p1)
	-- upvalues: GetFFlagNotificationsForceEnableEDPDiscoverabilityFunction (copy), ToastTypeModule (copy), LuaAppGraphicIcLogo (copy), LuaAppGraphicIcAlert (copy), IconsCommonNotificationOn (copy), IconsCommonNotificationOff (copy), UserInputService (copy), RoactModule (copy), Toast (copy), FFlagLuaAppToastV2PerMessageDuration (copy), config (copy), GetFFlagLuaAppUseWithLocalizationModule (copy), WithLocalizationFunction (copy)
	local Localization = p1.props.localization
	local EnableNotificationsDiscoverability = if GetFFlagNotificationsForceEnableEDPDiscoverabilityFunction() then true else p1.props.enableNotificationsDiscoverability
	local CurrentToastMessage = p1.props.currentToastMessage
	local ToastMessage = CurrentToastMessage.toastMessage
	local ToastSubMessage = CurrentToastMessage.toastSubMessage
	local SequenceNumber = CurrentToastMessage.sequenceNumber
	local IsLocalized = CurrentToastMessage.isLocalized or false
	local ToastIcon = nil
	local OnButtonActivated = nil
	local ToastType = CurrentToastMessage.toastType
	
	if ToastType == ToastTypeModule.QuickLaunchError then
		OnButtonActivated = p1.onButtonActivated
	elseif ToastType == ToastTypeModule.SuccessConfirmation then
		ToastIcon = LuaAppGraphicIcLogo
	elseif ToastType == ToastTypeModule.NetworkingError then
		ToastIcon = LuaAppGraphicIcAlert
	elseif ToastType == ToastTypeModule.InformationMessage then
		ToastIcon = LuaAppGraphicIcLogo
	elseif EnableNotificationsDiscoverability and ToastType == ToastTypeModule.NotificationsTurnedOn then
		ToastIcon = IconsCommonNotificationOn
	elseif EnableNotificationsDiscoverability and ToastType == ToastTypeModule.NotificationsTurnedOff then
		ToastIcon = IconsCommonNotificationOff
	end
	if CurrentToastMessage.toastIcon then
		ToastIcon = CurrentToastMessage.toastIcon
	end
	local _UDim2 = UDim2.new(0.5, 0, 0, (UserInputService.StatusBarSize and UserInputService.StatusBarSize.Y or 0) + 20)
	
	local function v52(p2)
		-- upvalues: RoactModule (upval), Toast (upval), _UDim2 (copy), ToastIcon (ref), CurrentToastMessage (copy), OnButtonActivated (ref), p1 (copy), SequenceNumber (copy), FFlagLuaAppToastV2PerMessageDuration (upval), config (upval)
		return RoactModule.createElement(Toast, {
			show = true,
			position = _UDim2,
			toastContent = {
				iconImage = ToastIcon,
				iconColorStyle = if CurrentToastMessage and CurrentToastMessage.toastIconColorStyle then CurrentToastMessage.toastIconColorStyle else nil,
				onActivated = OnButtonActivated,
				onDismissed = p1.onDismissed,
				toastSubtitle = p2.toastSubMessage,
				sequenceNumber = SequenceNumber,
				toastTitle = p2.toastMessage
			},
			duration = FFlagLuaAppToastV2PerMessageDuration and CurrentToastMessage.duration or p1.props.duration,
			springOptions = if CurrentToastMessage.slideIn then config else p1.props.springOptions
		})
	end
	
	return if GetFFlagLuaAppUseWithLocalizationModule() then if IsLocalized then v52({
		toastMessage = ToastMessage,
		toastSubMessage = ToastSubMessage
	}) else WithLocalizationFunction({
		toastMessage = ToastMessage,
		toastSubMessage = ToastSubMessage
	})(v52) else v52(IsLocalized and {
		toastMessage = ToastMessage,
		toastSubMessage = ToastSubMessage
	} or {
		toastMessage = ToastMessage and Localization:Format(ToastMessage) or nil,
		toastSubMessage = ToastSubMessage and Localization:Format(ToastSubMessage) or nil
	})
end

function ToastV2.render(p1)
	-- upvalues: RoactModule (copy), VRReadyWrapper (copy), ScreenGuiWithBlurControlModule (copy), VRConstants (copy)
	local DisplayOrder = p1.props.displayOrder
	
	return if p1.props.currentToastMessage then RoactModule.createElement(VRReadyWrapper, {
		component = ScreenGuiWithBlurControlModule,
		props = {
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			DisplayOrder = DisplayOrder
		},
		vrProps = {
			panelName = "Toast",
			partSize = VRConstants.ToastSize,
			offset = CFrame.lookAt(VRConstants.ToastPosition, VRConstants.DefaultCameraPosition),
			virtualScreenSize = VRConstants.ToastResolution,
			curvature = VRConstants.ToastCurvature
		}
	}, { Toast = p1:onRender() }) else nil
end

function ToastV2.didUpdate(p1, p2, _)
	-- upvalues: ToastTypeModule (copy)
	local CurrentToastMessage = p1.props.currentToastMessage
	
	if CurrentToastMessage then
		if not next(CurrentToastMessage) or not CurrentToastMessage.toastMessage then
			p1.props.removeCurrentToastMessage()
		end
		if p2.currentRoute ~= p1.props.currentRoute and CurrentToastMessage.toastType == ToastTypeModule.QuickLaunchError then
			p1.props.removeCurrentToastMessage()
		end
	end
end

local v1 = if FFlagSignalsNavP3dRouteGated then function(p1)
	-- upvalues: GetLegacyNavigationStore (copy), UseSignalState (copy), ReactModule (copy), v1 (copy), CryoModule (copy)
	return ReactModule.createElement(v1, CryoModule.Dictionary.union(p1, {
		currentRoute = UseSignalState(GetLegacyNavigationStore(false).getCurrentLegacyRoute)
	}))
end else RoactRoduxModule.connect(function(p1, _)
	-- upvalues: FFlagSignalsNavP3dRouteGated (copy), FFlagUseNavigationSelectors (copy), Selectors (copy)
	return {
		currentToastMessage = p1.CurrentToastMessages.currentToastMessage,
		currentRoute = if FFlagSignalsNavP3dRouteGated then nil elseif FFlagUseNavigationSelectors then Selectors.selectCurrentLegacyRoute(p1) else p1.Navigation.history[#p1.Navigation.history]
	}
end, function(Callback)
	-- upvalues: RemoveCurrentToastMessageModule (copy), OpenGameDetailsModule (copy)
	return {
		removeCurrentToastMessage = function()
			-- upvalues: Callback (copy), RemoveCurrentToastMessageModule (upval)
			return Callback(RemoveCurrentToastMessageModule())
		end,
		openGameDetails = function(p1)
			-- upvalues: Callback (copy), OpenGameDetailsModule (upval)
			Callback(OpenGameDetailsModule(p1))
		end
	}
end)(ToastV2)

if not GetFFlagNotificationsForceEnableEDPDiscoverabilityFunction() then
	v1 = RoactAppExperimentModule.connectUserLayer({ AppUserLayers.ExperienceDetailsPageLayer }, function(p1, _)
		-- upvalues: AppUserLayers (copy), GetNotificationsExperienceDetailsVariant (copy)
		return {
			enableNotificationsDiscoverability = ((p1[AppUserLayers.ExperienceDetailsPageLayer] or {})[GetNotificationsExperienceDetailsVariant.getNotificationsVariantFieldName] or -1) == 2
		}
	end)(v1)
end
return RoactServices.connect({ localization = RoactLocalizationModule })(v1)