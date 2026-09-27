local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local appAmpWizardLaunchBridgeModule = require(ampUpsell.Common.AppAmpWizardLaunchBridge)
local openAmpWizardContainerModule = require(ampUpsell.Common.OpenAmpWizardContainer)

return function()
	-- upvalues: useDispatch (ref), reactModule (ref), appAmpWizardLaunchBridgeModule (ref), openAmpWizardContainerModule (ref)
	local var1 = useDispatch()
	reactModule.useEffect(function()
		-- upvalues: appAmpWizardLaunchBridgeModule (copy), var1 (ref), openAmpWizardContainerModule (copy)
		local var2 = appAmpWizardLaunchBridgeModule.subscribe(function(p1)
			-- upvalues: var1 (copy), openAmpWizardContainerModule (copy)
			var1(openAmpWizardContainerModule(p1.featureName, p1.completionCallback or function() end, p1.recourseData, p1.entryPointEventCtx, p1.extraParameters, p1.nameSpace, nil, nil, nil, p1.usePrologue, p1.prologueOptions))
		end)
		
		return function()
			-- upvalues: var2 (ref)
			var2:disconnect()
		end
	end, { var1 })
	
	return nil
end