local parent = script:FindFirstAncestor("BuildExperience").Parent
local ampUpsellModule = require(parent.AmpUpsell)
local navigationModule = require(parent.Navigation)
local navigationRoduxModule = require(parent.NavigationRodux)
local reactModule = require(parent.React)
local robloxAppNavigationModule = require(parent.RobloxAppNavigation)
local sharedFlagsModule = require(parent.SharedFlags)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useNavigationFocus = navigationModule.useNavigationFocus
local accessResponseEnum = ampUpsellModule.AmpEnums.AccessResponseEnum
local actionStatusEnum = ampUpsellModule.AmpEnums.ActionStatusEnum
local openAmpWizardContainer = ampUpsellModule.OpenAmpWizardContainer
local navigateBack = navigationRoduxModule.Thunks.NavigateBack
local navigationCommands = robloxAppNavigationModule.NavigationCommands
local fFlagSignalsNavP3Dispatch = sharedFlagsModule.FFlagSignalsNavP3Dispatch
local fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature = sharedFlagsModule.FStringTriggerAgeCheckUpsellIncludingVPCAmpFeature
local fStringCoreContentAmpNameSpace = sharedFlagsModule.FStringCoreContentAmpNameSpace
local buildPolicyRefreshTimeoutMs = game:DefineFastInt("BuildPolicyRefreshTimeoutMs", 4000)
local frozen = table.freeze({
	Prompting = "Prompting",
	Refreshing = "Refreshing",
	Ineligible = "Ineligible",
	Error = "Error",
	Leaving = "Leaving"
})

local function _(p0) --[[ line: 44 | named "wasCancelled" ]]
	-- upvalues: actionStatusEnum (ref)
	if p0 == nil then
		return false
	end
	for i, v in p0 do
		if v == actionStatusEnum.Cancelled then
			return true
		end
	end
	return false
end

return {
	Status = frozen,
	useBuildPageEligibility = function(p1) --[[ line: 58 ]]
		-- upvalues: universalAppPolicyModule (ref), useDispatch (ref), useNavigationFocus (ref), reactModule (ref), frozen (ref), fFlagSignalsNavP3Dispatch (ref), navigationCommands (ref), navigateBack (ref), buildPolicyRefreshTimeoutMs (ref), accessResponseEnum (ref), actionStatusEnum (ref), openAmpWizardContainer (ref), fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature (ref), fStringCoreContentAmpNameSpace (ref)
		local var9, var10 = universalAppPolicyModule.useAppPolicy(function(p2) --[[ line: 59 ]]
			-- upvalues: p1 (ref)
			if p1 then
				return p2.getCanViewBuild(), p2.getCanUseBuild()
			end
			return true, true
		end)
		local var11 = useDispatch()
		local var12 = useNavigationFocus()
		local var13 = reactModule.useRef(false)
		local var14 = reactModule.useRef(var12)
		local var15 = reactModule.useRef(0)
		local var16, var17 = reactModule.useState(false)
		local var18, var19 = reactModule.useState(frozen.Prompting)
		local var20 = reactModule.useCallback(function() --[[ line: 73 ]]
			-- upvalues: var13 (ref), var15 (ref), var17 (ref), var19 (ref), frozen (copy), fFlagSignalsNavP3Dispatch (copy), navigationCommands (copy), var11 (ref), navigateBack (copy)
			var13.current = false
			var15.current += 1
			var17(false)
			var19(frozen.Leaving)
			
			if fFlagSignalsNavP3Dispatch then
				navigationCommands.back(true)
				
				return
			end
			var11(navigateBack(true))
		end, { var11 })
		local var21 = reactModule.useCallback(function() --[[ line: 85 ]]
			-- upvalues: var17 (ref), var19 (ref), frozen (copy), var15 (ref), buildPolicyRefreshTimeoutMs (copy), universalAppPolicyModule (copy)
			var17(false)
			var19(frozen.Refreshing)
			var15.current += 1
			local current = var15.current
			task.delay(buildPolicyRefreshTimeoutMs / 1000, function() --[[ line: 91 ]]
				-- upvalues: var15 (copy), current (ref), universalAppPolicyModule (copy), var17 (copy), var19 (copy), frozen (copy)
				if var15.current ~= current then return end
				local appFeaturePolicies = universalAppPolicyModule.getAppFeaturePolicies()
				local canViewBuild = appFeaturePolicies.getCanViewBuild()
				
				if appFeaturePolicies.getCanUseBuild() then
					var17(true)
					
					return
				elseif canViewBuild then
					var19(frozen.Error)
					
					return
				end
				var19(frozen.Ineligible)
			end)
		end, {})
		local var22 = reactModule.useCallback(function(p3, p4) --[[ line: 110 ]]
			-- upvalues: accessResponseEnum (copy), var21 (ref), actionStatusEnum (copy), var20 (ref), var19 (ref), frozen (copy)
			local var26
			if p3 == accessResponseEnum.Granted then
				var21()
				
				return
			elseif p4 == nil then
				var26 = false
			else
				for i, v in p4 do
					if v == actionStatusEnum.Cancelled then
						var26 = true
					end
				end
				var26 = false
			end
			if var26 then
				var20()
				
				return
			end
			var19(frozen.Error)
		end, { var21, var20 })
		reactModule.useEffect(function() --[[ line: 120 ]]
			-- upvalues: var14 (ref), var12 (ref), var18 (ref), frozen (copy), var13 (ref), var19 (ref)
			local current = var14.current
			var14.current = var12
			
			if var12 and not current and var18 == frozen.Prompting then
				var13.current = false
				
				return
			elseif var12 and not current and var18 == frozen.Leaving then
				var13.current = false
				var19(frozen.Prompting)
			end
		end, { var12, var18 })
		reactModule.useEffect(function() --[[ line: 132 ]]
			-- upvalues: p1 (ref), var10 (ref), var15 (ref), var13 (ref), var17 (ref), var19 (ref), frozen (copy), var9 (ref)
			if not p1 then return end
			if var10 then
				var15.current += 1
				var13.current = false
				var17(false)
				var19(frozen.Prompting)
				
				return
			elseif not var9 then
				var15.current += 1
				var17(false)
				var19(frozen.Ineligible)
			end
		end, { var9, var10, p1 })
		reactModule.useEffect(function() --[[ line: 150 ]]
			-- upvalues: p1 (ref), var12 (ref), var18 (ref), frozen (copy), var10 (ref), var9 (ref), var13 (ref), var11 (ref), openAmpWizardContainer (copy), fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature (copy), var22 (ref), fStringCoreContentAmpNameSpace (copy)
			if p1 and var12 and (var18 == frozen.Prompting and not var10) and (var9 and not var13.current) then
				var13.current = true
				var11(openAmpWizardContainer(fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature, var22, nil, "BuildPage", nil, fStringCoreContentAmpNameSpace))
				
				return
			end
		end, {
			var9, var10, var11, p1, var22, var12, var18
		})
		reactModule.useEffect(function() --[[ line: 185 ]]
			-- upvalues: var15 (ref)
			return function() --[[ line: 186 ]]
				-- upvalues: var15 (copy)
				var15.current += 1
			end
		end, {})
		local var23 = not p1 or (var10 or var16)
		
		return {
			canEnterBuild = var23,
			status = if var23 or var9 then var18 else frozen.Ineligible,
			onDialogDismiss = var20
		}
	end
}