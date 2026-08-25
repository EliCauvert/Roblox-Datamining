local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local error = luauPolyfillModule.Error
local array = luauPolyfillModule.Array
local httpService = game:GetService("HttpService")
local t = {}
local invariantError = require(parent.jsutils.invariant).InvariantError

function t.serializeFetchParameter(p0, p1, p2)
	-- upvalues: array (ref), httpService (ref), invariantError (ref), error (ref)
	local var3 = nil
	local ok, status = pcall(function()
		-- upvalues: array (copy), p0 (ref), p2 (ref), var3 (write), httpService (copy)
		if array.isArray(p0) and #p0 == 0 and p2 then
			var3 = "{}"
			
			return
		end
		var3 = httpService:JSONEncode(p0)
	end)
	
	if not ok then
		local var4 = invariantError.new(("Network request failed. %s is not serializable: %s"):format(p1, status))
		var4.parseError = error.new(status)
		error(var4)
	end
	return var3
end

return t