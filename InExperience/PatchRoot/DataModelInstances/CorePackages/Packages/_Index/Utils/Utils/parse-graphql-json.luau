local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local Error1 = LuauPolyfillModule.Error
local BuildClientSchemaFunction = require(Parent.GraphQL).buildClientSchema
local _ = require(script.Parent.loaders)
local _ = require(script.Parent.types)
local String = LuauPolyfillModule.String
local JsonModule = require(script.Parent.json)

local function _(p1) --[[ Line: 26 | Named "stripBOM" ]]
	-- upvalues: String (copy)
	local Text = tostring(p1)
	
	if String.charCodeAt(Text, 1) == 65279 then
		Text = String.slice(Text, 2)
	end
	return Text
end

local _ = function(p1) --[[ Line: 41 | Named "parseBOM" ]]
	-- upvalues: JsonModule (copy), String (copy)
	local ParseFunction = JsonModule.parse
	local Text = tostring(p1)
	
	if String.charCodeAt(Text, 1) == 65279 then
		Text = String.slice(Text, 2)
	end
	return ParseFunction(Text)
end

return {
	parseGraphQLJSON = function(Location, p1, p2) --[[ Line: 44 ]]
		-- upvalues: JsonModule (copy), String (copy), Boolean (copy), BuildClientSchemaFunction (copy), Error1 (copy)
		local ParseFunction = JsonModule.parse
		local Text = tostring(p1)
		
		if String.charCodeAt(Text, 1) == 65279 then
			Text = String.slice(Text, 2)
		end
		local ParseResult = ParseFunction(Text)
		
		if Boolean.toJSBoolean(ParseResult.data) then
			ParseResult = ParseResult.data
		end
		if ParseResult.kind == "Document" then
			return { location = Location, document = ParseResult }
		elseif Boolean.toJSBoolean(ParseResult.__schema) then
			return {
				location = Location,
				schema = BuildClientSchemaFunction(ParseResult, p2)
			}
		elseif typeof(ParseResult) == "string" then
			return { location = Location, rawSDL = ParseResult }
		else
			error(Error1.new("Not valid JSON content"))
		end
	end
}