local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Error1 = LuauPolyfillModule.Error
local Array = LuauPolyfillModule.Array
local HttpService = game:GetService("HttpService")
local InvariantError = require(Parent.jsutils.invariant).InvariantError

return {
	serializeFetchParameter = function(Input, p1, p2) --[[ Line: 27 ]]
		-- upvalues: Array (copy), HttpService (copy), InvariantError (copy), Error1 (copy)
		local Json = nil
		local Success, Result = pcall(function() --[[ Line: 29 ]]
			-- upvalues: Array (upval), Input (copy), p2 (copy), Json (ref), HttpService (upval)
			if Array.isArray(Input) and #Input == 0 and p2 then
				Json = "{}"
				
				return
			else
				Json = HttpService:JSONEncode(Input)
			end
		end)
		
		if not Success then
			local NewInvariantError = InvariantError.new(("Network request failed. %s is not serializable: %s"):format(p1, Result))
			NewInvariantError.parseError = Error1.new(Result)
			error(NewInvariantError)
		end
		return Json
	end
}