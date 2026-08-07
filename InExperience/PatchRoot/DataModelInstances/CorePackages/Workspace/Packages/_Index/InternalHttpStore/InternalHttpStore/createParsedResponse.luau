local parent = script.Parent
local parent_1 = parent.Parent
local signalsModule = require(parent_1.Signals)
local _ = require(parent_1.HttpSignals)
local _ = require(parent.HttpStoreTypes)

return function(p0, p1) --[[ line: 13 | named "createParsedResponse" ]]
	-- upvalues: signalsModule (ref)
	return signalsModule.createComputed(function(p2) --[[ line: 17 ]]
		-- upvalues: p0 (ref), p1 (ref)
		local var1 = p0(p2)
		
		return if var1.status == "success" then { status = "Success", config = p1, response = var1.data } elseif var1.status == "error" then { status = "Failed", config = p1, response = var1.error } else { status = "Fetching", config = p1 }
	end)
end