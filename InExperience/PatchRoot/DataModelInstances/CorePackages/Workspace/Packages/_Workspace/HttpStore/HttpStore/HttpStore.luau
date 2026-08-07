local parent = script.Parent.Parent
local signalsModule = require(parent.Signals)
local _ = require(parent.InternalHttpStore)
local createHttpStoreModule = require(script.Parent.createHttpStore)
local var2 = nil
local _ = nil
local _ = nil
local var3, var4 = signalsModule.createSignal(nil)
local var5 = var3
local var6 = var4

return {
	_create = function(p0) --[[ line: 24 ]]
		-- upvalues: var2 (write), createHttpStoreModule (ref), var6 (write)
		var2 = createHttpStoreModule(p0)
		var6(var2)
		
		return var2
	end,
	_dispose = function() --[[ line: 30 ]]
		-- upvalues: var5 (write), var6 (write)
		local var7 = var5()
		
		if var7 ~= nil then
			var7.cancelAll()
		end
		var6(nil)
	end,
	get = function(p1) --[[ line: 38 ]]
		-- upvalues: var5 (write)
		return var5(p1)
	end
}