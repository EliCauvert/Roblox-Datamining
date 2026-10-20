local Parent = script:FindFirstAncestor("UserAgreements").Parent
local ReactModule = require(Parent.React)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local RoactAnalytics = require(Parent.RoactServiceTags).RoactAnalytics
local AppAppLifecycleObserverService = require(Parent.RoactServiceTags).AppAppLifecycleObserverService
local LoginStatus = require(Parent.RobloxAppEnums).LoginStatus
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local FetchUpdatedUserAgreementsModule = require(script.Parent.FetchUpdatedUserAgreements)
local UseAppPolicyFunction = require(Parent.UniversalAppPolicy).useAppPolicy
local GetFFlagUseUpdatedVNGAgreementsWorkflowFunction = require(Parent.SharedFlags).GetFFlagUseUpdatedVNGAgreementsWorkflow

local function selectIsUserLoggedIn(p1): boolean
	-- upvalues: LoginStatus (copy)
	return p1.AuthenticationStatus.status == LoginStatus.LOGGED_IN
end

local function showOverlay(Callback: (any) -> (), VNGUserAgreementsPopup, Agreements, AgreementAccepted)
	-- upvalues: SetCentralOverlayFunction (copy)
	Callback(SetCentralOverlayFunction(VNGUserAgreementsPopup, {
		agreements = Agreements,
		agreementAccepted = AgreementAccepted
	}, { DisableBackButtonClose = true }))
end

local function _(List): boolean
	for _, value in List do
		if value.action == "ConvertToVngUser" then
			return true
		end
	end
	return false
end

local function useFetchAndHandle()
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy), RoactAnalytics (copy), UseDispatchFunction (copy), GetFFlagUseUpdatedVNGAgreementsWorkflowFunction (copy), UseAppPolicyFunction (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy), ReactModule (copy), FetchUpdatedUserAgreementsModule (copy), showOverlay (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactAnalytics)
	local UseDispatchResult = UseDispatchFunction()
	local UseAppPolicyResult = if GetFFlagUseUpdatedVNGAgreementsWorkflowFunction() then UseAppPolicyFunction(function(p1)
		return p1.getVNGFormRequired()
	end) else nil
	local Callback = if GetFFlagUseUpdatedVNGAgreementsWorkflowFunction() and UseAppPolicyResult then function()
		-- upvalues: UseDispatchResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval)
		UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.VngContactInfoFormWebviewPopup, {}, { DisableBackButtonClose = true }))
	end else function() end
	
	return ReactModule.useCallback(function()
		-- upvalues: UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), UseDispatchResult (copy), GetFFlagUseUpdatedVNGAgreementsWorkflowFunction (upval), UseAppPolicyResult (copy), SetCentralOverlayFunction (upval), CentralOverlayType (upval), FetchUpdatedUserAgreementsModule (upval), Callback (ref), showOverlay (upval)
		if not UseRoactServiceResult or not UseRoactServiceResult1 or not UseDispatchResult then return end
		if GetFFlagUseUpdatedVNGAgreementsWorkflowFunction() and UseAppPolicyResult then
			UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.VngComplianceLoadingPopup, {}, { DisableBackButtonClose = true }))
		end
		FetchUpdatedUserAgreementsModule(UseRoactServiceResult, UseRoactServiceResult1):andThen(function(Result)
			-- upvalues: GetFFlagUseUpdatedVNGAgreementsWorkflowFunction (upval), Callback (upval), showOverlay (upval), UseDispatchResult (upval), CentralOverlayType (upval), SetCentralOverlayFunction (upval)
			if Result and #Result ~= 0 then
				local Flag = false
				
				for _, value in Result do
					if value.action == "ConvertToVngUser" then
						Flag = true
						break
					end
				end
				if not Flag then
					showOverlay(UseDispatchResult, CentralOverlayType.UserAgreementsUpdatedPopup, Result, nil)
					
					return
				end
				if GetFFlagUseUpdatedVNGAgreementsWorkflowFunction() then
					showOverlay(UseDispatchResult, CentralOverlayType.VNGUserAgreementsPopup, Result, Callback)
					
					return
				else
					showOverlay(UseDispatchResult, CentralOverlayType.VNGUserAgreementsPopup, Result, function(_)
						-- upvalues: UseDispatchResult (upval), SetCentralOverlayFunction (upval), CentralOverlayType (upval)
						UseDispatchResult(SetCentralOverlayFunction(CentralOverlayType.VngContactInfoFormWebviewPopup, {}))
					end)
					
					return
				end
			elseif GetFFlagUseUpdatedVNGAgreementsWorkflowFunction() then
				Callback()
			end
		end, function(_)
			-- upvalues: GetFFlagUseUpdatedVNGAgreementsWorkflowFunction (upval), Callback (upval)
			if GetFFlagUseUpdatedVNGAgreementsWorkflowFunction() then
				Callback()
			end
		end)
	end, {
		UseRoactServiceResult,
		UseRoactServiceResult1,
		UseDispatchResult
	})
end

local function useFetchOnForegrounded()
	-- upvalues: UseRoactServiceFunction (copy), AppAppLifecycleObserverService (copy), UseSelectorFunction (copy), selectIsUserLoggedIn (copy), useFetchAndHandle (copy), ReactModule (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(AppAppLifecycleObserverService)
	local UseSelectorResult = UseSelectorFunction(selectIsUserLoggedIn)
	local UseFetchAndHandleResult = useFetchAndHandle()
	ReactModule.useEffect(function()
		-- upvalues: UseRoactServiceResult (copy), UseSelectorResult (copy), UseFetchAndHandleResult (copy)
		if not UseRoactServiceResult or not UseSelectorResult then return end
		local OnBecomeActiveConnection = UseRoactServiceResult.OnBecomeActive:Connect(UseFetchAndHandleResult)
		
		return function()
			-- upvalues: OnBecomeActiveConnection (copy)
			OnBecomeActiveConnection:Disconnect()
		end
	end, {
		UseRoactServiceResult,
		UseSelectorResult,
		UseFetchAndHandleResult
	})
end

local function useFetchOnUserChanged()
	-- upvalues: useFetchAndHandle (copy), UseSelectorFunction (copy), selectIsUserLoggedIn (copy), UseAppPolicyFunction (copy), ReactModule (copy)
	local UseFetchAndHandleResult = useFetchAndHandle()
	local UseSelectorResult = UseSelectorFunction(selectIsUserLoggedIn)
	local UseAppPolicyResult = UseAppPolicyFunction(function(p1)
		return p1.getCheckUserAgreementsUpdatedOnLogin()
	end)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), UseStateResult2 (copy), UseAppPolicyResult (copy), UseStateResult (copy), UseFetchAndHandleResult (copy)
		if not UseSelectorResult then
			UseStateResult2(false)
			
			return
		end
		if UseAppPolicyResult and not UseStateResult then
			UseStateResult2(true)
			UseFetchAndHandleResult()
		end
	end, {
		UseFetchAndHandleResult,
		UseSelectorResult,
		UseStateResult,
		UseAppPolicyResult
	})
end

return function()
	-- upvalues: useFetchOnUserChanged (copy), useFetchOnForegrounded (copy)
	useFetchOnUserChanged()
	useFetchOnForegrounded()
end