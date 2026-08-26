local parent = script.Parent
local parent_1 = parent.Parent
local signalsModule = require(parent_1.Signals)
local _ = require(parent_1.HttpSignals)
local _ = require(parent.HttpStoreTypes)

return function(p1, p2)
	-- upvalues: signalsModule (ref)
	return signalsModule.createComputed(function(p3)
		-- upvalues: p1 (ref), p2 (ref)
		local var1 = p1(p3)
		
		return if var1.status == "success" then { status = "Success", config = p2, response = var1.data } elseif var1.status == "error" then { status = "Failed", config = p2, response = var1.error } else { status = "Fetching", config = p2 }
	end)
end