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

local function _(p1)
	-- upvalues: actionStatusEnum (ref)
	if p1 == nil then
		return false
	end
	for i, v in p1 do
		if v == actionStatusEnum.Cancelled then
			return true
		end
	end
	return false
end

return {
	Status = frozen,
	useBuildPageEligibility = function(p2)
		-- upvalues: universalAppPolicyModule (ref), useDispatch (ref), useNavigationFocus (ref), reactModule (ref), frozen (ref), fFlagSignalsNavP3Dispatch (ref), navigationCommands (ref), navigateBack (ref), buildPolicyRefreshTimeoutMs (ref), accessResponseEnum (ref), actionStatusEnum (ref), openAmpWizardContainer (ref), fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature (ref), fStringCoreContentAmpNameSpace (ref)
		local var1, var2 = universalAppPolicyModule.useAppPolicy(function(p3)
			-- upvalues: p2 (ref)
			if p2 then
				return p3.getCanViewBuild(), p3.getCanUseBuild()
			end
			return true, true
		end)
		local var3 = useDispatch()
		local var4 = useNavigationFocus()
		local var5 = reactModule.useRef(false)
		local var6 = reactModule.useRef(var4)
		local var7 = reactModule.useRef(0)
		local var8, var9 = reactModule.useState(false)
		local var10, var11 = reactModule.useState(frozen.Prompting)
		local var12 = reactModule.useCallback(function()
			-- upvalues: var5 (ref), var7 (ref), var9 (ref), var11 (ref), frozen (copy), fFlagSignalsNavP3Dispatch (copy), navigationCommands (copy), var3 (ref), navigateBack (copy)
			var5.current = false
			var7.current += 1
			var9(false)
			var11(frozen.Leaving)
			
			if fFlagSignalsNavP3Dispatch then
				navigationCommands.back(true)
				
				return
			end
			var3(navigateBack(true))
		end, { var3 })
		local var13 = reactModule.useCallback(function()
			-- upvalues: var9 (ref), var11 (ref), frozen (copy), var7 (ref), buildPolicyRefreshTimeoutMs (copy), universalAppPolicyModule (copy)
			var9(false)
			var11(frozen.Refreshing)
			var7.current += 1
			local current = var7.current
			task.delay(buildPolicyRefreshTimeoutMs / 1000, function()
				-- upvalues: var7 (copy), current (ref), universalAppPolicyModule (copy), var9 (copy), var11 (copy), frozen (copy)
				if var7.current ~= current then return end
				local appFeaturePolicies = universalAppPolicyModule.getAppFeaturePolicies()
				local canViewBuild = appFeaturePolicies.getCanViewBuild()
				
				if appFeaturePolicies.getCanUseBuild() then
					var9(true)
					
					return
				elseif canViewBuild then
					var11(frozen.Error)
					
					return
				end
				var11(frozen.Ineligible)
			end)
		end, {})
		local var14 = reactModule.useCallback(function(p3, p4)
			-- upvalues: accessResponseEnum (copy), var13 (ref), actionStatusEnum (copy), var12 (ref), var11 (ref), frozen (copy)
			local var15
			if p3 == accessResponseEnum.Granted then
				var13()
				
				return
			elseif p4 == nil then
				var15 = false
			else
				for i, v in p4 do
					if v == actionStatusEnum.Cancelled then
						var15 = true
					end
				end
				var15 = false
			end
			if var15 then
				var12()
				
				return
			end
			var11(frozen.Error)
		end, { var13, var12 })
		reactModule.useEffect(function()
			-- upvalues: var6 (ref), var4 (ref), var10 (ref), frozen (copy), var5 (ref), var11 (ref)
			local current = var6.current
			var6.current = var4
			
			if var4 and not current and var10 == frozen.Prompting then
				var5.current = false
				
				return
			elseif var4 and not current and var10 == frozen.Leaving then
				var5.current = false
				var11(frozen.Prompting)
			end
		end, { var4, var10 })
		reactModule.useEffect(function()
			-- upvalues: p2 (ref), var2 (ref), var7 (ref), var5 (ref), var9 (ref), var11 (ref), frozen (copy), var1 (ref)
			if not p2 then return end
			if var2 then
				var7.current += 1
				var5.current = false
				var9(false)
				var11(frozen.Prompting)
				
				return
			elseif not var1 then
				var7.current += 1
				var9(false)
				var11(frozen.Ineligible)
			end
		end, { var1, var2, p2 })
		reactModule.useEffect(function()
			-- upvalues: p2 (ref), var4 (ref), var10 (ref), frozen (copy), var2 (ref), var1 (ref), var5 (ref), var3 (ref), openAmpWizardContainer (copy), fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature (copy), var14 (ref), fStringCoreContentAmpNameSpace (copy)
			if p2 and var4 and (var10 == frozen.Prompting and not var2) and (var1 and not var5.current) then
				var5.current = true
				var3(openAmpWizardContainer(fStringTriggerAgeCheckUpsellIncludingVPCAmpFeature, var14, nil, "BuildPage", nil, fStringCoreContentAmpNameSpace))
				
				return
			end
		end, {
			var1, var2, var3, p2, var14, var4, var10
		})
		reactModule.useEffect(function()
			-- upvalues: var7 (ref)
			return function()
				-- upvalues: var7 (copy)
				var7.current += 1
			end
		end, {})
		local var16 = not p2 or (var2 or var8)
		
		return {
			canEnterBuild = var16,
			status = if var16 or var1 then var10 else frozen.Ineligible,
			onDialogDismiss = var12
		}
	end
}