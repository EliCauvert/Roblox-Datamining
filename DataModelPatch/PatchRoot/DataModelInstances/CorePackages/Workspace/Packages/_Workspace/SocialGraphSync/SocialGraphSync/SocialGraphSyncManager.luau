local AppLifecycleObserverService = nil
pcall(function()
	-- upvalues: AppLifecycleObserverService (ref)
	AppLifecycleObserverService = game:GetService("AppLifecycleObserverService")
end)
local SocialGraphSync = script:FindFirstAncestor("SocialGraphSync")
local Parent = SocialGraphSync.Parent
local SyncPlatformSocialGraphModule = require(SocialGraphSync.syncPlatformSocialGraph)
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local LoginStatus = require(Parent.RobloxAppEnums).LoginStatus
local _ = require(Parent.AppCommonLib)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local RoactNetworking = RoactServiceTagsModule.RoactNetworking
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local FFlagChangeSocialGraphLifecycleEvent = require(Parent.SharedFlags).FFlagChangeSocialGraphLifecycleEvent

local function registerPlatformSocialGraphSync(p1, p2, p3)
	-- upvalues: SyncPlatformSocialGraphModule (copy), AppLifecycleObserverService (ref), FFlagChangeSocialGraphLifecycleEvent (copy)
	local function Callback()
		-- upvalues: SyncPlatformSocialGraphModule (upval), p1 (copy), p2 (copy), p3 (copy)
		SyncPlatformSocialGraphModule(p1, p2, p3)
	end
	
	if AppLifecycleObserverService then
		SyncPlatformSocialGraphModule(p1, p2, p3)
		
		return if FFlagChangeSocialGraphLifecycleEvent then AppLifecycleObserverService.OnUnhide:Connect(Callback) else AppLifecycleObserverService.OnBecomeActive:Connect(Callback)
	else
		return nil
	end
end

local function useRegisterPlatformSocialGraphSync()
	-- upvalues: UseRoactServiceFunction (copy), RoactAnalytics (copy), RoactNetworking (copy), UseDispatchFunction (copy), UseSelectorFunction (copy), LoginStatus (copy), ReactModule (copy), registerPlatformSocialGraphSync (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactAnalytics)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactNetworking)
	local UseDispatchResult = UseDispatchFunction()
	local IsAuthenticationStatusMatch = UseSelectorFunction(function(p1)
		return { authenticationStatus = p1.AuthenticationStatus.status }
	end).authenticationStatus == LoginStatus.LOGGED_IN
	ReactModule.useEffect(function()
		-- upvalues: IsAuthenticationStatusMatch (copy), registerPlatformSocialGraphSync (upval), UseDispatchResult (copy), UseRoactServiceResult1 (copy), UseRoactServiceResult (copy)
		local RegisterPlatformSocialGraphSyncResult = if IsAuthenticationStatusMatch then registerPlatformSocialGraphSync(UseDispatchResult, UseRoactServiceResult1, UseRoactServiceResult) else nil
		
		return function()
			-- upvalues: RegisterPlatformSocialGraphSyncResult (ref)
			if RegisterPlatformSocialGraphSyncResult then
				RegisterPlatformSocialGraphSyncResult:disconnect()
				RegisterPlatformSocialGraphSyncResult = nil
			end
		end
	end, {
		IsAuthenticationStatusMatch,
		UseRoactServiceResult1,
		UseRoactServiceResult
	})
end

local function SocialGraphSynchronizer()
	-- upvalues: useRegisterPlatformSocialGraphSync (copy)
	useRegisterPlatformSocialGraphSync()
	
	return nil
end

return function()
	-- upvalues: UseAppPolicyFunction (copy), ReactModule (copy), SocialGraphSynchronizer (copy)
	return if UseAppPolicyFunction(function(p1)
		return p1.getSocialGraphSyncEnabled()
	end) then ReactModule.createElement(SocialGraphSynchronizer) else nil
end