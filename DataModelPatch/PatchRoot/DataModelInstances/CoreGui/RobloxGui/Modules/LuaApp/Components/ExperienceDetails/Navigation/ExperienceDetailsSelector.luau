local IXPService = game:GetService("IXPService")
local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local DashModule = require(CorePackages.Packages.Dash)
local UseDeviceTypeFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useDeviceType
local DeviceType = require(CorePackages.Workspace.Packages.RobloxAppEnums).DeviceType
local SignalsModule = require(CorePackages.Packages.Signals)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local GameDetailsPeekViewModule = require(Modules.LuaApp.Components.GameDetails.GameDetailsPeekView)
local ExperienceDetailsContainerModule = require(Modules.LuaApp.Components.ExperienceDetails.ExperienceDetailsContainer)
local UseNavigationPropsFunction = require(CorePackages.Workspace.Packages.RobloxAppNavigation).useNavigationProps
local _ = require(CorePackages.Workspace.Packages.Navigation)
local FFlagLuaAppSduiEdpEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppSduiEdpEnabled
local FFlagLuaAppSduiEdpLogExposure = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppSduiEdpLogExposure
local FStringLuaAppSduiEdpIxpLayer = require(CorePackages.Workspace.Packages.SharedFlags).FStringLuaAppSduiEdpIxpLayer
local FFlagLuaAppEdpKeepFullPageOnPortraitRotation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpKeepFullPageOnPortraitRotation
local FFlagEnableExperienceDetailsBottomSheet = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableExperienceDetailsBottomSheet
local FFlagLuaAppSduiEdpPassPageTimerThroughNav = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppSduiEdpPassPageTimerThroughNav
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local _ = require(CorePackages.Workspace.Packages.SduiSharedUtilities)
local Computed = if FFlagLuaAppEdpKeepFullPageOnPortraitRotation then SignalsModule.createComputed(function(p1)
	-- upvalues: DisplayModule (copy), ResponsiveModule (copy)
	return ResponsiveModule.getIsCompactTouch(DisplayModule.GetDisplayStore(p1).getViewportSize(p1), (ResponsiveModule.GetInputModeStore(p1).getPreferredInputType(p1)))
end) else nil

local function renderGameDetailsPeekView(JoinResult)
	-- upvalues: ReactModule (copy), GameDetailsPeekViewModule (copy)
	return ReactModule.createElement(GameDetailsPeekViewModule, JoinResult)
end

local function renderExperienceDetailsPage(JoinResult)
	-- upvalues: ReactModule (copy), ExperienceDetailsContainerModule (copy)
	return ReactModule.createElement(ExperienceDetailsContainerModule, JoinResult)
end

return function(p1)
	-- upvalues: UseNavigationPropsFunction (copy), FFlagLuaAppSduiEdpPassPageTimerThroughNav (copy), DashModule (copy), FFlagLuaAppSduiEdpLogExposure (copy), ReactModule (copy), IXPService (copy), FStringLuaAppSduiEdpIxpLayer (copy), UseDeviceTypeFunction (copy), FFlagLuaAppEdpKeepFullPageOnPortraitRotation (copy), SignalsReactModule (copy), Computed (copy), DeviceType (copy), FFlagLuaAppSduiEdpEnabled (copy), CorePackages (copy), FFlagEnableExperienceDetailsBottomSheet (copy), renderGameDetailsPeekView (copy), renderExperienceDetailsPage (copy)
	local JoinResult = DashModule.join(p1, (UseNavigationPropsFunction(function(UniverseId, p2)
		-- upvalues: FFlagLuaAppSduiEdpPassPageTimerThroughNav (upval)
		return if UniverseId == nil then nil else {
			universeId = UniverseId,
			source = p2.source,
			index = p2.index,
			onClose = p2.onClose,
			mountAsFullView = p2.mountAsFullView,
			mountAnimation = p2.mountAnimation,
			referralSource = p2.referralSource,
			onPeekViewClosed = p2.onPeekViewClosed,
			showBackButton = p2.showBackButton,
			experienceJoinData = p2.experienceJoinData,
			placeIdOverride = p2.placeIdOverride,
			pageTimer = if FFlagLuaAppSduiEdpPassPageTimerThroughNav then p2.pageTimer else nil
		}
	end)))
	
	if FFlagLuaAppSduiEdpLogExposure then
		ReactModule.useEffect(function()
			-- upvalues: IXPService (upval), FStringLuaAppSduiEdpIxpLayer (upval)
			IXPService:LogFlagLinkedUserLayerExposure(FStringLuaAppSduiEdpIxpLayer)
		end, {})
	end
	local DeviceType1 = if JoinResult.deviceType then JoinResult.deviceType else UseDeviceTypeFunction()
	local UseSignalStateResult = nil
	
	if FFlagLuaAppEdpKeepFullPageOnPortraitRotation then
		UseSignalStateResult = SignalsReactModule.useSignalState(Computed)
		
		if not UseSignalStateResult and DeviceType1 == DeviceType.Phone then
			DeviceType1 = DeviceType.Tablet
		end
	else
		UseSignalStateResult = DeviceType1 == DeviceType.Phone
	end
	if not UseSignalStateResult then
		local JoinResult1 = DashModule.join(JoinResult, { deviceType = DeviceType1 })
		
		return if FFlagLuaAppSduiEdpEnabled then ReactModule.createElement(require(CorePackages.Workspace.Packages.GameDetail).ExperienceDetailsFullPage, JoinResult1) else renderExperienceDetailsPage(JoinResult1)
	elseif FFlagLuaAppSduiEdpEnabled then
		local GameDetailModule = require(CorePackages.Workspace.Packages.GameDetail)
		
		return if FFlagEnableExperienceDetailsBottomSheet then ReactModule.createElement(GameDetailModule.ExperienceDetailsBottomSheet, JoinResult) else ReactModule.createElement(GameDetailModule.ExperienceDetailsPeekView, JoinResult)
	else
		return renderGameDetailsPeekView(JoinResult)
	end
end