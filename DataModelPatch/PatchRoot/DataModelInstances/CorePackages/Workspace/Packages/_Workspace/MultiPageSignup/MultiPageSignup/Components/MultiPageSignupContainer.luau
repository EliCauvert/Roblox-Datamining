local MultiPageSignup = script:FindFirstAncestor("MultiPageSignup")
local Parent = MultiPageSignup.Parent
local ReactModule = require(Parent.React)
local RoactAppExperimentModule = require(Parent.RoactAppExperiment)
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local UserActivationFrameworkModule = require(Parent.UserActivationFramework)
local RoactNavigationModule = require(Parent.RoactNavigation)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local GetMultipageSignupRoutesModule = require(MultiPageSignup.Navigation.getMultipageSignupRoutes)
local CreateMultiPageSignupNavigatorModule = require(MultiPageSignup.Navigation.createMultiPageSignupNavigator)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local LaunchContext = require(Parent.AppStartup).Enums.LaunchContext
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local UseNavigationPropsFunction = require(Parent.RobloxAppNavigation).useNavigationProps
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local RoactServiceTagsModule = require(Parent.RoactServiceTags)
local RoactNetworking = RoactServiceTagsModule.RoactNetworking
local RoactAnalytics = RoactServiceTagsModule.RoactAnalytics
local AuthCommonModule = require(Parent.AuthCommon)
local User = AuthCommonModule.Thunks.User
local HandleNewAuthCompletionFunction = require(Parent.AccountSwitching).HandleNewAuthCompletion
local AppStorageUtilities = AuthCommonModule.Utils.AppStorageUtilities
local FullPageActivationFrameworkContextProvider = UserActivationFrameworkModule.Context.FullPageActivationFrameworkContextProvider
local Namespace = UserActivationFrameworkModule.Enums.Namespace
local CreateActivationWorkflowFunction = UserActivationFrameworkModule.Thunks.CreateActivationWorkflow
local PayloadKey = UserActivationFrameworkModule.Enums.PayloadKey
local FStringLuaMultiPageSignupIxpLayer = require(Parent.SharedFlags).FStringLuaMultiPageSignupIxpLayer
local Default = require(Parent.LoggingProtocol).default
local TelemetryConfigs = require(Parent.AuthAnalytics).TelemetryConfigs
local MemoizeResult = require(Parent.AppCommonLib).memoize(function(p1, p2)
	-- upvalues: GetMultipageSignupRoutesModule (copy), CreateMultiPageSignupNavigatorModule (copy), RoactNavigationModule (copy)
	return RoactNavigationModule.createAppContainer((CreateMultiPageSignupNavigatorModule(GetMultipageSignupRoutesModule(), p1, p2)))
end)

return function(p1)
	-- upvalues: UseNavigationPropsFunction (copy), ReactModule (copy), PayloadKey (copy), User (copy), CreateActivationWorkflowFunction (copy), Namespace (copy), RoactAppExperimentModule (copy), FStringLuaMultiPageSignupIxpLayer (copy), MemoizeResult (copy), UseStyleFunction (copy), UseDispatchFunction (copy), UseNavigationFunction (copy), UseRoactServiceFunction (copy), RoactAnalytics (copy), RoactNetworking (copy), UseAppPolicyFunction (copy), LaunchContext (copy), AppStorageUtilities (copy), HandleNewAuthCompletionFunction (copy), Default (copy), TelemetryConfigs (copy), FullPageActivationFrameworkContextProvider (copy), FullscreenPageWithSafeArea (copy)
	local UseNavigationPropsResult = UseNavigationPropsFunction(function(_, p2)
		return {
			enforceResetState = p2.enforceResetState or false,
			credProtocolIsAvailableResponse = p2.credProtocolIsAvailableResponse
		}
	end)
	
	local function _(p2)
		local IsAvailable = false
		local Flag = false
		local SupportsDeviceBoundOnly = nil
		
		if p2.FIDO2 == nil then
			SupportsDeviceBoundOnly = p2.isAvailable and p2.supportsDeviceBoundOnly or false
		else
			SupportsDeviceBoundOnly = p2.FIDO2.isAvailable and p2.FIDO2.supportsDeviceBoundOnly
			Flag = true
		end
		if p2.password ~= nil then
			IsAvailable = p2.password.isAvailable
		end
		return SupportsDeviceBoundOnly, IsAvailable, Flag
	end
	
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseNavigationPropsResult (copy), PayloadKey (upval), User (upval), CreateActivationWorkflowFunction (upval), Namespace (upval)
		local t = {}
		
		if UseNavigationPropsResult.credProtocolIsAvailableResponse and UseNavigationPropsResult.credProtocolIsAvailableResponse.isAvailable ~= nil then
			local CredProtocolIsAvailableResponse = UseNavigationPropsResult.credProtocolIsAvailableResponse
			local IsAvailable = false
			local Flag = false
			local SupportsDeviceBoundOnly = nil
			
			if CredProtocolIsAvailableResponse.FIDO2 == nil then
				SupportsDeviceBoundOnly = CredProtocolIsAvailableResponse.isAvailable and CredProtocolIsAvailableResponse.supportsDeviceBoundOnly or false
			else
				SupportsDeviceBoundOnly = CredProtocolIsAvailableResponse.FIDO2.isAvailable and CredProtocolIsAvailableResponse.FIDO2.supportsDeviceBoundOnly
				Flag = true
			end
			if CredProtocolIsAvailableResponse.password ~= nil then
				IsAvailable = CredProtocolIsAvailableResponse.password.isAvailable
			end
			t = {
				[PayloadKey.CredentialsProtocolPasskeyRegistrationAvailable] = tostring(SupportsDeviceBoundOnly),
				[PayloadKey.CredentialsProtocolPasswordRegistrationAvailable] = tostring(IsAvailable),
				[PayloadKey.CredentialsProtocolV2InterfaceAvailable] = tostring(Flag)
			}
		end
		local FromLocalStorageResult = User.fromLocalStorage()
		
		if FromLocalStorageResult and FromLocalStorageResult.userId ~= -1 then
			t[PayloadKey.PreviousUserId] = tostring(FromLocalStorageResult.userId)
		end
		return CreateActivationWorkflowFunction(Namespace.MultiPageSignup, t, UseNavigationPropsResult.enforceResetState)
	end, {})
	local MemoizeResultResult = MemoizeResult(UseMemoResult.state, RoactAppExperimentModule.useBrowserTrackerExperiment({ FStringLuaMultiPageSignupIxpLayer }, function(p2)
		-- upvalues: FStringLuaMultiPageSignupIxpLayer (upval)
		return {
			shouldMultipageSignupEnableLeftRightAnimations = (p2[FStringLuaMultiPageSignupIxpLayer] or {}).shouldMultipageSignupEnableLeftRightAnimations or false
		}
	end).shouldMultipageSignupEnableLeftRightAnimations)
	local UseStyleResult = UseStyleFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseNavigationResult = UseNavigationFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactAnalytics)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactNetworking)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p2)
		return p2
	end)
	
	local function OnClose()
		-- upvalues: UseNavigationResult (copy)
		UseNavigationResult.goBack()
	end
	
	local function v34()
		-- upvalues: UseDispatchResult (copy), p1 (copy), UseRoactServiceResult1 (copy), UseRoactServiceResult (copy), UseAppPolicyResult (copy), LaunchContext (upval)
		return UseDispatchResult(p1.monoDeps.LaunchApp(UseRoactServiceResult1, nil, UseRoactServiceResult, UseAppPolicyResult, LaunchContext.SignUp))
	end
	
	local function v35()
		-- upvalues: UseDispatchResult (copy), p1 (copy)
		return UseDispatchResult(p1.monoDeps.ResetAppState())
	end
	
	local function OnWorkflowComplete(p2)
		-- upvalues: PayloadKey (upval), AppStorageUtilities (upval), HandleNewAuthCompletionFunction (upval), v35 (copy), v34 (copy)
		local IncompleteSignupUserId = p2[PayloadKey.PreviousUserId]
		local IncompleteSignupUserId1 = AppStorageUtilities.getIncompleteSignupUserId()
		HandleNewAuthCompletionFunction(IncompleteSignupUserId ~= nil and (IncompleteSignupUserId ~= "-1" and IncompleteSignupUserId ~= IncompleteSignupUserId1), v35, v34, true)
	end
	
	ReactModule.useEffect(function()
		-- upvalues: Default (upval), TelemetryConfigs (upval)
		Default:logRobloxTelemetryCounter(TelemetryConfigs.SignupPageMountTelemetryConfig, 1, { version = 2 })
	end, {})
	
	return ReactModule.createElement(FullPageActivationFrameworkContextProvider, {
		onClose = OnClose,
		onWorkflowComplete = OnWorkflowComplete,
		initialActivationWorkflowState = UseMemoResult,
		monoDeps = p1.monoDeps
	}, {
		ReactModule.createElement(FullscreenPageWithSafeArea, {
			includeStatusBar = true,
			BorderSizePixel = 0,
			BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color
		}, {
			ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 1, 0),
				Position = UDim2.new(0, 0, 0, 0)
			}, { ReactModule.createElement(MemoizeResultResult) })
		})
	})
end