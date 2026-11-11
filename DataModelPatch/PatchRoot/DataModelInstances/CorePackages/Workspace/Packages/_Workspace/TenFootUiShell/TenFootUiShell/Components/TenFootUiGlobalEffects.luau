local TenFootUiShell = script:FindFirstAncestor("TenFootUiShell")
local Parent = TenFootUiShell.Parent
local ReactModule = require(Parent.React)
local ConstantsModule = require(TenFootUiShell.Constants)
local TenFootUiSceneModule = require(TenFootUiShell.Hooks.TenFootUiScene)
local UseInitializeCrossPlaySettingsFunction = require(Parent.CrossPlay).Hooks.useInitializeCrossPlaySettings
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UsePreviousFunction = RoactUtilsModule.Hooks.usePrevious
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppPage = require(Parent.RobloxAppEnums).AppPage
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local UseHideMouseCursorEffectModule = require(TenFootUiShell.Hooks.useHideMouseCursorEffect)
local UseForceNotificationServiceThemeEffectModule = require(TenFootUiShell.Hooks.useForceNotificationServiceThemeEffect)
local UseGamepadDisconnectOverlayEffectFunction = require(Parent.InputUi).Gamepad.useGamepadDisconnectOverlayEffect
local NavigationModule = require(Parent.Navigation)
local UseNavigationFunction = NavigationModule.useNavigation
local GetRouteIsActiveFunction = NavigationModule.getRouteIsActive
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local FFlagEnableLeftNavOnConsole = require(Parent.SharedFlags).FFlagEnableLeftNavOnConsole
local FFlagDontUseCrossPlayGlobalEffect = require(Parent.SharedFlags).FFlagDontUseCrossPlayGlobalEffect

local function useAppGamepadDisconnectListener()
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), UseRoactServiceFunction (copy), AppEventIngestService (copy), UseGamepadDisconnectOverlayEffectFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	UseGamepadDisconnectOverlayEffectFunction(ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval)
		UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.GamepadDisconnected))
	end, { UseDispatchResult }), ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), SetCentralOverlayFunction (upval)
		UseDispatchResult(SetCentralOverlayFunction())
	end, { UseDispatchResult }), UseRoactServiceFunction(AppEventIngestService), "InApp")
end

local function _(p1)
	-- upvalues: GetRouteIsActiveFunction (copy), AppPage (copy)
	return GetRouteIsActiveFunction(p1, AppPage.AvatarExperienceRoot)
end

local function setSceneTransparency(BackgroundInstance, Transparency)
	if BackgroundInstance then
		for _, Part in ipairs(BackgroundInstance:GetChildren()) do
			if Part:IsA("BasePart") then
				Part.Transparency = Transparency
			end
		end
	end
end

local _ = function(p1, p2)
	-- upvalues: GetRouteIsActiveFunction (copy), AppPage (copy), ConstantsModule (copy)
	local RouteIsActive = GetRouteIsActiveFunction(p1, AppPage.AvatarExperienceRoot)
	local RouteIsActive1 = GetRouteIsActiveFunction(p2, AppPage.AvatarExperienceRoot)
	
	if RouteIsActive and not RouteIsActive1 and workspace.CurrentCamera then
		workspace.CurrentCamera.CFrame = CFrame.new(ConstantsModule.CAMERA_POSITION)
	end
end

local function applySceneSwitch(State)
	-- upvalues: TenFootUiSceneModule (copy), GetRouteIsActiveFunction (copy), AppPage (copy), setSceneTransparency (copy)
	local BackgroundInstance = TenFootUiSceneModule.getBackgroundInstance()
	
	if BackgroundInstance then
		local RouteIsActive = GetRouteIsActiveFunction(State, AppPage.AvatarExperienceRoot)
		local Transparency: number = if RouteIsActive then 1 else 0
		
		if RouteIsActive then
			task.spawn(function()
				-- upvalues: setSceneTransparency (upval), BackgroundInstance (copy), Transparency (copy)
				if workspace:WaitForChild("AvatarSceneNew") then
					setSceneTransparency(BackgroundInstance, Transparency)
				end
			end)
			
			return
		end
		setSceneTransparency(BackgroundInstance, Transparency)
	end
end

local function useAvatarSceneEffects()
	-- upvalues: UseNavigationFunction (copy), UsePreviousFunction (copy), ReactModule (copy), GetRouteIsActiveFunction (copy), AppPage (copy), ConstantsModule (copy), applySceneSwitch (copy)
	local State = UseNavigationFunction().state
	local UsePreviousResult = UsePreviousFunction(State) or State
	ReactModule.useEffect(function()
		-- upvalues: UsePreviousResult (copy), State (copy), GetRouteIsActiveFunction (upval), AppPage (upval), ConstantsModule (upval), applySceneSwitch (upval)
		local RouteIsActive = GetRouteIsActiveFunction(UsePreviousResult, AppPage.AvatarExperienceRoot)
		local RouteIsActive1 = GetRouteIsActiveFunction(State, AppPage.AvatarExperienceRoot)
		
		if RouteIsActive and not RouteIsActive1 and workspace.CurrentCamera then
			workspace.CurrentCamera.CFrame = CFrame.new(ConstantsModule.CAMERA_POSITION)
		end
		applySceneSwitch(State)
	end, { State })
end

local _ = function()
	-- upvalues: ReactModule (copy), TenFootUiSceneModule (copy)
	ReactModule.useLayoutEffect(function()
		-- upvalues: TenFootUiSceneModule (upval)
		TenFootUiSceneModule.initialize()
		
		return function()
			-- upvalues: TenFootUiSceneModule (upval)
			TenFootUiSceneModule.deinitialize()
		end
	end, {})
end

return function(p1)
	-- upvalues: FFlagEnableLeftNavOnConsole (copy), useAvatarSceneEffects (copy), UseForceNotificationServiceThemeEffectModule (copy), UseHideMouseCursorEffectModule (copy), FFlagDontUseCrossPlayGlobalEffect (copy), UseInitializeCrossPlaySettingsFunction (copy), useAppGamepadDisconnectListener (copy), ReactModule (copy), TenFootUiSceneModule (copy)
	if not FFlagEnableLeftNavOnConsole then
		useAvatarSceneEffects()
	end
	UseForceNotificationServiceThemeEffectModule()
	UseHideMouseCursorEffectModule()
	
	if not FFlagDontUseCrossPlayGlobalEffect then
		UseInitializeCrossPlaySettingsFunction()
	end
	useAppGamepadDisconnectListener()
	
	if not FFlagEnableLeftNavOnConsole then
		ReactModule.useLayoutEffect(function()
			-- upvalues: TenFootUiSceneModule (upval)
			TenFootUiSceneModule.initialize()
			
			return function()
				-- upvalues: TenFootUiSceneModule (upval)
				TenFootUiSceneModule.deinitialize()
			end
		end, {})
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, p1.children)
end