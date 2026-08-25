local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local encodeURIComponentModule = require(parent.luaUtils.encodeURIComponent)
local t = {}
local serializeFetchParameter = require(script.Parent.serializeFetchParameter).serializeFetchParameter
local _ = require(script.Parent.selectHttpOptionsAndBody)

function t.rewriteURIForGET(p0, p1)
	-- upvalues: encodeURIComponentModule (ref), array (ref), object (ref), boolean (ref), serializeFetchParameter (ref)
	local substring
	local t = {}
	
	local function _(p2, p3)
		-- upvalues: t (ref), encodeURIComponentModule (copy)
		table.insert(t, ("%s=%s"):format(p2, encodeURIComponentModule(p3)))
	end
	
	if array.indexOf(object.keys(p1), "query") ~= -1 then
		table.insert(t, ("%s=%s"):format("query", encodeURIComponentModule(p1.query)))
	end
	if boolean.toJSBoolean(p1.operationName) then
		table.insert(t, ("%s=%s"):format("operationName", encodeURIComponentModule(p1.operationName)))
	end
	if boolean.toJSBoolean(p1.variables) then
		substring = nil
		local ok, status = pcall(function()
			-- upvalues: substring (write), serializeFetchParameter (copy), p1 (ref)
			substring = serializeFetchParameter(p1.variables, "Variables map", true)
		end)
		
		if not ok then
			return { parseError = status }
		end
		table.insert(t, ("%s=%s"):format("variables", encodeURIComponentModule(substring)))
	end
	if boolean.toJSBoolean(p1.extensions) then
		substring = nil
		local ok, status = pcall(function()
			-- upvalues: substring (write), serializeFetchParameter (copy), p1 (ref)
			substring = serializeFetchParameter(p1.extensions, "Extensions map")
		end)
		
		if not ok then
			return { parseError = status }
		end
		table.insert(t, ("%s=%s"):format("extensions", encodeURIComponentModule(substring)))
	end
	substring = ""
	local var5 = p0
	local matchIndex = string.find(p0, "#")
	
	if matchIndex ~= nil then
		substring = string.sub(p0, matchIndex)
		var5 = string.sub(p0, 1, matchIndex - 1)
	end
	return {
		newURI = var5 .. (if string.find(var5, "?") == nil then "?" else "&") .. array.join(t, "&") .. substring
	}
end

return t