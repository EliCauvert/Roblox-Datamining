local Parent = script:FindFirstAncestor("RobloxAppNavigationCore").Parent
local _ = require(Parent.AppCommonLib)
local ReactModule = require(Parent.React)
local UseLazyRefFunction = require(Parent.ReactUtils).useLazyRef
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseProcessNavigationStateChangeModule = require(script.Parent.useProcessNavigationStateChange)

return function(p1)
	-- upvalues: UseNavigationFunction (copy), UseLazyRefFunction (copy), ReactModule (copy), UseProcessNavigationStateChangeModule (copy)
	local RnBypassActionSignal = p1.rnBypassActionSignal
	local UseNavigationResult = UseNavigationFunction()
	local UseLazyRefResult = UseLazyRefFunction(function()
		-- upvalues: RnBypassActionSignal (copy), UseNavigationResult (copy)
		return RnBypassActionSignal:connect(function(p2)
			-- upvalues: UseNavigationResult (upval)
			UseNavigationResult.dispatch(p2)
		end)
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseLazyRefResult (copy)
		UseLazyRefResult.current:disconnect()
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: RnBypassActionSignal (copy), UseNavigationResult (copy)
		local Connection = RnBypassActionSignal:connect(function(p2)
			-- upvalues: UseNavigationResult (upval)
			UseNavigationResult.dispatch(p2)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:disconnect()
		end
	end, { UseNavigationResult, RnBypassActionSignal })
	local UseProcessNavigationStateChangeModuleResult = UseProcessNavigationStateChangeModule(p1.ApplyRoactNavigationHistory, p1.updateRoute)
	ReactModule.useEffect(function()
		-- upvalues: UseProcessNavigationStateChangeModuleResult (copy), UseNavigationResult (copy)
		UseProcessNavigationStateChangeModuleResult(nil, UseNavigationResult.state, nil)
	end, { UseNavigationResult.state })
	
	return nil
end