local AmpUpsell = script:FindFirstAncestor("AmpUpsell")
local Parent = AmpUpsell.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local AppAmpWizardLaunchBridgeModule = require(AmpUpsell.Common.AppAmpWizardLaunchBridge)
local OpenAmpWizardContainerModule = require(AmpUpsell.Common.OpenAmpWizardContainer)

return function()
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), AppAmpWizardLaunchBridgeModule (copy), OpenAmpWizardContainerModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	ReactModule.useEffect(function()
		-- upvalues: AppAmpWizardLaunchBridgeModule (upval), UseDispatchResult (copy), OpenAmpWizardContainerModule (upval)
		local SubscribeResult = AppAmpWizardLaunchBridgeModule.subscribe(function(p1)
			-- upvalues: UseDispatchResult (upval), OpenAmpWizardContainerModule (upval)
			UseDispatchResult(OpenAmpWizardContainerModule(p1.featureName, p1.completionCallback or function() end, p1.recourseData, p1.entryPointEventCtx, p1.extraParameters, p1.nameSpace, nil, nil, nil, p1.usePrologue, p1.prologueOptions))
		end)
		
		return function()
			-- upvalues: SubscribeResult (copy)
			SubscribeResult:disconnect()
		end
	end, { UseDispatchResult })
	
	return nil
end