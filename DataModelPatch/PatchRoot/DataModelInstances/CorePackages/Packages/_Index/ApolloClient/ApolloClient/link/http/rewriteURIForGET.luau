local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local EncodeURIComponentModule = require(Parent.luaUtils.encodeURIComponent)
local SerializeFetchParameterFunction = require(script.Parent.serializeFetchParameter).serializeFetchParameter
local _ = require(script.Parent.selectHttpOptionsAndBody)

return {
	rewriteURIForGET = function(Text: string, p1)
		-- upvalues: EncodeURIComponentModule (copy), Array (copy), Object (copy), Boolean (copy), SerializeFetchParameterFunction (copy)
		local List = {}
		
		local function _(p2, p3)
			-- upvalues: List (copy), EncodeURIComponentModule (upval)
			table.insert(List, ("%s=%s"):format(p2, EncodeURIComponentModule(p3)))
		end
		
		if Array.indexOf(Object.keys(p1), "query") ~= -1 then
			table.insert(List, ("%s=%s"):format("query", EncodeURIComponentModule(p1.query)))
		end
		if Boolean.toJSBoolean(p1.operationName) then
			table.insert(List, ("%s=%s"):format("operationName", EncodeURIComponentModule(p1.operationName)))
		end
		if Boolean.toJSBoolean(p1.variables) then
			local VariablesMap = nil
			local Success, Result = pcall(function()
				-- upvalues: VariablesMap (ref), SerializeFetchParameterFunction (upval), p1 (copy)
				VariablesMap = SerializeFetchParameterFunction(p1.variables, "Variables map", true)
			end)
			
			if not Success then
				return { parseError = Result }
			end
			table.insert(List, ("%s=%s"):format("variables", EncodeURIComponentModule(VariablesMap)))
		end
		if Boolean.toJSBoolean(p1.extensions) then
			local ExtensionsMap = nil
			local Success1, Result1 = pcall(function()
				-- upvalues: ExtensionsMap (ref), SerializeFetchParameterFunction (upval), p1 (copy)
				ExtensionsMap = SerializeFetchParameterFunction(p1.extensions, "Extensions map")
			end)
			
			if not Success1 then
				return { parseError = Result1 }
			end
			table.insert(List, ("%s=%s"):format("extensions", EncodeURIComponentModule(ExtensionsMap)))
		end
		local Segment = ""
		local Text1: string = Text
		local FoundAt: number? = string.find(Text, "#")
		
		if FoundAt ~= nil then
			Segment = string.sub(Text, FoundAt)
			Text1 = string.sub(Text, 1, FoundAt - 1)
		end
		return {
			newURI = Text1 .. (if string.find(Text1, "?") == nil then "?" else "&") .. Array.join(List, "&") .. Segment
		}
	end
}