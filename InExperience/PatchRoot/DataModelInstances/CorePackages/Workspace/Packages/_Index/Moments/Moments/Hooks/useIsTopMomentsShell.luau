local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getMomentsShellStackStoreModule = require(moments.Stores.GetMomentsShellStackStore)

return function(p1)
	-- upvalues: getMomentsShellStackStoreModule (ref), reactModule (ref), signalsReactModule (ref)
	local var1 = getMomentsShellStackStoreModule(false)
	local var2, var3 = reactModule.useState(nil)
	reactModule.useLayoutEffect(function()
		-- upvalues: var1 (ref), p1 (ref), var3 (ref)
		if var1.getTopShellId(false) ~= nil then
			p1("pushed")
		end
		local var4, var5 = var1.pushShell()
		var3(var4)
		
		return function()
			-- upvalues: var1 (copy), var4 (ref), p1 (copy), var5 (ref)
			if var1.getTopShellId(false) == var4 then
				p1("popped")
			end
			var5()
		end
	end, { var1, p1 })
	
	return var2 ~= nil and var2 == signalsReactModule.useSignalState(var1.getTopShellId)
end