local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local encodeURIComponentModule = require(parent.luaUtils.encodeURIComponent)
local t = {}
local serializeFetchParameter = require(script.Parent.serializeFetchParameter).serializeFetchParameter
local _ = require(script.Parent.selectHttpOptionsAndBody)

function t.rewriteURIForGET(p1, p2)
	-- upvalues: encodeURIComponentModule (ref), array (ref), object (ref), boolean (ref), serializeFetchParameter (ref)
	local substring
	local t = {}
	
	local function _(p3, p4)
		-- upvalues: t (ref), encodeURIComponentModule (copy)
		table.insert(t, ("%s=%s"):format(p3, encodeURIComponentModule(p4)))
	end
	
	if array.indexOf(object.keys(p2), "query") ~= -1 then
		table.insert(t, ("%s=%s"):format("query", encodeURIComponentModule(p2.query)))
	end
	if boolean.toJSBoolean(p2.operationName) then
		table.insert(t, ("%s=%s"):format("operationName", encodeURIComponentModule(p2.operationName)))
	end
	if boolean.toJSBoolean(p2.variables) then
		substring = nil
		local ok, status = pcall(function()
			-- upvalues: substring (write), serializeFetchParameter (copy), p2 (ref)
			substring = serializeFetchParameter(p2.variables, "Variables map", true)
		end)
		
		if not ok then
			return { parseError = status }
		end
		table.insert(t, ("%s=%s"):format("variables", encodeURIComponentModule(substring)))
	end
	if boolean.toJSBoolean(p2.extensions) then
		substring = nil
		local ok, status = pcall(function()
			-- upvalues: substring (write), serializeFetchParameter (copy), p2 (ref)
			substring = serializeFetchParameter(p2.extensions, "Extensions map")
		end)
		
		if not ok then
			return { parseError = status }
		end
		table.insert(t, ("%s=%s"):format("extensions", encodeURIComponentModule(substring)))
	end
	substring = ""
	local var1 = p1
	local matchIndex = string.find(p1, "#")
	
	if matchIndex ~= nil then
		substring = string.sub(p1, matchIndex)
		var1 = string.sub(p1, 1, matchIndex - 1)
	end
	return {
		newURI = var1 .. (if string.find(var1, "?") == nil then "?" else "&") .. array.join(t, "&") .. substring
	}
end

return t