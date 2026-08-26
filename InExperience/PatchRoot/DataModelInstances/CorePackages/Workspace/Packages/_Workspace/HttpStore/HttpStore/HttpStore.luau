local parent = script.Parent.Parent
local signalsModule = require(parent.Signals)
local _ = require(parent.InternalHttpStore)
local createHttpStoreModule = require(script.Parent.createHttpStore)
local var1 = nil
local _ = nil
local _ = nil
local var2, var3 = signalsModule.createSignal(nil)
local var4 = var2
local var5 = var3

return {
	_create = function(p1)
		-- upvalues: var1 (write), createHttpStoreModule (ref), var5 (write)
		var1 = createHttpStoreModule(p1)
		var5(var1)
		
		return var1
	end,
	_dispose = function()
		-- upvalues: var4 (write), var5 (write)
		local var6 = var4()
		
		if var6 ~= nil then
			var6.cancelAll()
		end
		var5(nil)
	end,
	get = function(p1)
		-- upvalues: var4 (write)
		return var4(p1)
	end
}