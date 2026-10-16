local Parent = script:FindFirstAncestor("BuildExperience").Parent
local AmpUpsellModule = require(Parent.AmpUpsell)
local ReactModule = require(Parent.React)
local SharedFlagsModule = require(Parent.SharedFlags)
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local AccessResponseEnum = AmpUpsellModule.AmpEnums.AccessResponseEnum
local ActionStatusEnum = AmpUpsellModule.AmpEnums.ActionStatusEnum
local OpenAmpWizardContainerFunction = AmpUpsellModule.OpenAmpWizardContainer
local NavigateBackFunction = require(Parent.NavigationRodux).Thunks.NavigateBack
local NavigationCommands = require(Parent.RobloxAppNavigation).NavigationCommands
local FFlagSignalsNavP3Dispatch = SharedFlagsModule.FFlagSignalsNavP3Dispatch
local FStringTriggerAgeCheckUpsellIncludingVPCAmpFeature = SharedFlagsModule.FStringTriggerAgeCheckUpsellIncludingVPCAmpFeature
local FStringCoreContentAmpNameSpace = SharedFlagsModule.FStringCoreContentAmpNameSpace
local BuildPolicyRefreshTimeoutMs = game:DefineFastInt("BuildPolicyRefreshTimeoutMs", 4000)
local Frozen = table.freeze({
	Prompting = "Prompting",
	Refreshing = "Refreshing",
	Ineligible = "Ineligible",
	Error = "Error",
	Leaving = "Leaving"
})

local function _(List): boolean --[[ Line: 44 | Named "wasCancelled" ]]
	-- upvalues: ActionStatusEnum (copy)
	if List == nil then
		return false
	end
	for _, value in List do
		if value == ActionStatusEnum.Cancelled then
			return true
		end
	end
	return false
end

return {
	Status = Frozen,
	useBuildPageEligibility = function(p1) --[[ Line: 58 ]]
		-- upvalues: UniversalAppPolicyModule (copy), UseDispatchFunction (copy), UseNavigationFocusFunction (copy), ReactModule (copy), Frozen (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackFunction (copy), BuildPolicyRefreshTimeoutMs (copy), AccessResponseEnum (copy), ActionStatusEnum (copy), OpenAmpWizardContainerFunction (copy), FStringTriggerAgeCheckUpsellIncludingVPCAmpFeature (copy), FStringCoreContentAmpNameSpace (copy)
		local UseAppPolicyResult, UseAppPolicyResult2 = UniversalAppPolicyModule.useAppPolicy(function(p2) --[[ Line: 59 ]]
			-- upvalues: p1 (copy)
			if p1 then
				return p2.getCanViewBuild(), p2.getCanUseBuild()
			else
				return true, true
			end
		end)
		local UseDispatchResult = UseDispatchFunction()
		local UseNavigationFocusResult = UseNavigationFocusFunction()
		local UseRefResult = ReactModule.useRef(false)
		local UseRefResult1 = ReactModule.useRef(UseNavigationFocusResult)
		local UseRefResult2 = ReactModule.useRef(0)
		local UseStateResult, UseStateResult2 = ReactModule.useState(false)
		local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Frozen.Prompting)
		local UseResult = ReactModule.useCallback(function() --[[ Line: 73 ]]
			-- upvalues: UseRefResult (copy), UseRefResult2 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), Frozen (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), UseDispatchResult (copy), NavigateBackFunction (upval)
			UseRefResult.current = false
			UseRefResult2.current += 1
			UseStateResult2(false)
			UseStateResult2_1(Frozen.Leaving)
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.back(true)
				
				return
			else
				UseDispatchResult(NavigateBackFunction(true))
			end
		end, { UseDispatchResult })
		local UseResult1 = ReactModule.useCallback(function() --[[ Line: 85 ]]
			-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy), Frozen (upval), UseRefResult2 (copy), BuildPolicyRefreshTimeoutMs (upval), UniversalAppPolicyModule (upval)
			UseStateResult2(false)
			UseStateResult2_1(Frozen.Refreshing)
			UseRefResult2.current += 1
			local Current = UseRefResult2.current
			task.delay(BuildPolicyRefreshTimeoutMs / 1000, function() --[[ Line: 91 ]]
				-- upvalues: UseRefResult2 (upval), Current (copy), UniversalAppPolicyModule (upval), UseStateResult2 (upval), UseStateResult2_1 (upval), Frozen (upval)
				if UseRefResult2.current ~= Current then return end
				local AppFeaturePolicies = UniversalAppPolicyModule.getAppFeaturePolicies()
				local CanViewBuild = AppFeaturePolicies.getCanViewBuild()
				
				if AppFeaturePolicies.getCanUseBuild() then
					UseStateResult2(true)
					
					return
				end
				if CanViewBuild then
					UseStateResult2_1(Frozen.Error)
					
					return
				else
					UseStateResult2_1(Frozen.Ineligible)
				end
			end)
		end, {})
		local UseResult2 = ReactModule.useCallback(function(Granted, List) --[[ Line: 110 ]]
			-- upvalues: AccessResponseEnum (upval), UseResult1 (copy), ActionStatusEnum (upval), UseResult (copy), UseStateResult2_1 (copy), Frozen (upval)
			if Granted == AccessResponseEnum.Granted then
				UseResult1()
				
				return
			end
			local Flag = nil
			if List == nil then
				Flag = false
			else
				Flag = false
				
				for _, value in List do
					if value == ActionStatusEnum.Cancelled then
						Flag = true
						break
					end
				end
			end
			if Flag then
				UseResult()
				
				return
			else
				UseStateResult2_1(Frozen.Error)
			end
		end, { UseResult1, UseResult })
		ReactModule.useEffect(function() --[[ Line: 120 ]]
			-- upvalues: UseRefResult1 (copy), UseNavigationFocusResult (copy), UseStateResult1 (copy), Frozen (upval), UseRefResult (copy), UseStateResult2_1 (copy)
			local Current = UseRefResult1.current
			UseRefResult1.current = UseNavigationFocusResult
			
			if UseNavigationFocusResult and not Current and UseStateResult1 == Frozen.Prompting then
				UseRefResult.current = false
				
				return
			end
			if UseNavigationFocusResult and not Current and UseStateResult1 == Frozen.Leaving then
				UseRefResult.current = false
				UseStateResult2_1(Frozen.Prompting)
			end
		end, { UseNavigationFocusResult, UseStateResult1 })
		ReactModule.useEffect(function() --[[ Line: 132 ]]
			-- upvalues: p1 (copy), UseAppPolicyResult2 (copy), UseRefResult2 (copy), UseRefResult (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), Frozen (upval), UseAppPolicyResult (copy)
			if not p1 then return end
			if UseAppPolicyResult2 then
				UseRefResult2.current += 1
				UseRefResult.current = false
				UseStateResult2(false)
				UseStateResult2_1(Frozen.Prompting)
				
				return
			end
			if not UseAppPolicyResult then
				UseRefResult2.current += 1
				UseStateResult2(false)
				UseStateResult2_1(Frozen.Ineligible)
			end
		end, { UseAppPolicyResult, UseAppPolicyResult2, p1 })
		ReactModule.useEffect(function() --[[ Line: 150 ]]
			-- upvalues: p1 (copy), UseNavigationFocusResult (copy), UseStateResult1 (copy), Frozen (upval), UseAppPolicyResult2 (copy), UseAppPolicyResult (copy), UseRefResult (copy), UseDispatchResult (copy), OpenAmpWizardContainerFunction (upval), FStringTriggerAgeCheckUpsellIncludingVPCAmpFeature (upval), UseResult2 (copy), FStringCoreContentAmpNameSpace (upval)
			if p1 and UseNavigationFocusResult and UseStateResult1 == Frozen.Prompting and not UseAppPolicyResult2 and UseAppPolicyResult and not UseRefResult.current then
				UseRefResult.current = true
				UseDispatchResult(OpenAmpWizardContainerFunction(FStringTriggerAgeCheckUpsellIncludingVPCAmpFeature, UseResult2, nil, "BuildPage", nil, FStringCoreContentAmpNameSpace))
				
				return
			end
		end, {
			UseAppPolicyResult, UseAppPolicyResult2, UseDispatchResult, p1, UseResult2,
			UseNavigationFocusResult, UseStateResult1
		})
		ReactModule.useEffect(function() --[[ Line: 185 ]]
			-- upvalues: UseRefResult2 (copy)
			return function() --[[ Line: 186 ]]
				-- upvalues: UseRefResult2 (upval)
				UseRefResult2.current += 1
			end
		end, {})
		local NoP1 = not p1 or (UseAppPolicyResult2 or UseStateResult)
		
		return {
			canEnterBuild = NoP1,
			status = if NoP1 or UseAppPolicyResult then UseStateResult1 else Frozen.Ineligible,
			onDialogDismiss = UseResult
		}
	end
}