local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local chatCardEmphasisContextModule = require(script.Parent.ChatCardEmphasisContext)

return function(p1, p2)
	-- upvalues: reactModule (ref), chatCardEmphasisContextModule (ref), signalsModule (ref), signalsReactModule (ref)
	local var1 = reactModule.useContext(chatCardEmphasisContextModule)
	local var2 = reactModule.useMemo(function()
		return {}
	end, {})
	reactModule.useLayoutEffect(function()
		-- upvalues: var1 (ref), p1 (ref), var2 (ref), p2 (ref)
		if var1 == nil or p1 == nil then
			return nil
		end
		var1.register(var2, p1, p2 or 0)
		
		return function()
			-- upvalues: var1 (copy), var2 (copy)
			var1.unregister(var2)
		end
	end, { var1, var2, p1, p2 })
	
	return if var1 == nil then nil else signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var1 (ref), var2 (ref)
		return signalsModule.createComputed(function(p3)
			-- upvalues: var1 (copy), var2 (copy)
			return var1 ~= nil and var1.getEmphasizedKey(p3) == var2
		end)
	end, { var1, var2 }))
end