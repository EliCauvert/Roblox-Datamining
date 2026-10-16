local Parent = script.Parent
local Parent1 = Parent.Parent
local SignalsModule = require(Parent1.Signals)
local _ = require(Parent1.HttpSignals)
local _ = require(Parent.HttpStoreTypes)

return function(Callback, Config) --[[ Line: 13 | Named "createParsedResponse" ]]
	-- upvalues: SignalsModule (copy)
	return SignalsModule.createComputed(function(p1) --[[ Line: 17 ]]
		-- upvalues: Callback (copy), Config (copy)
		local CallbackResult = Callback(p1)
		
		return if CallbackResult.status == "success" then {
			status = "Success",
			config = Config,
			response = CallbackResult.data
		} elseif CallbackResult.status == "error" then {
			status = "Failed",
			config = Config,
			response = CallbackResult.error
		} else { status = "Fetching", config = Config }
	end)
end