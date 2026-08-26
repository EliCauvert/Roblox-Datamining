local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local error = luauPolyfillModule.Error
local array = luauPolyfillModule.Array
local httpService = game:GetService("HttpService")
local t = {}
local invariantError = require(parent.jsutils.invariant).InvariantError

function t.serializeFetchParameter(p1, p2, p3)
	-- upvalues: array (ref), httpService (ref), invariantError (ref), error (ref)
	local var1 = nil
	local ok, status = pcall(function()
		-- upvalues: array (copy), p1 (ref), p3 (ref), var1 (write), httpService (copy)
		if array.isArray(p1) and #p1 == 0 and p3 then
			var1 = "{}"
			
			return
		end
		var1 = httpService:JSONEncode(p1)
	end)
	
	if not ok then
		local var2 = invariantError.new(("Network request failed. %s is not serializable: %s"):format(p2, status))
		var2.parseError = error.new(status)
		error(var2)
	end
	return var1
end

return t