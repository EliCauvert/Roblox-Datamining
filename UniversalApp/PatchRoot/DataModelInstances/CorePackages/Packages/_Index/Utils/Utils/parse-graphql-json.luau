local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local error = luauPolyfillModule.Error
local t = {}
local buildClientSchema = require(parent.GraphQL).buildClientSchema
local _ = require(script.Parent.loaders)
local _ = require(script.Parent.types)
local string = luauPolyfillModule.String
local jsonModule = require(script.Parent.json)

local function _(p1)
	-- upvalues: string (ref)
	p1 = tostring(p1)
	
	if string.charCodeAt(p1, 1) == 65279 then
		p1 = string.slice(p1, 2)
	end
	return p1
end

local _ = function(p1)
	-- upvalues: jsonModule (ref), string (ref)
	local parse = jsonModule.parse
	local var1 = tostring(p1)
	
	if string.charCodeAt(var1, 1) == 65279 then
		var1 = string.slice(var1, 2)
	end
	return parse(var1)
end

function t.parseGraphQLJSON(p1, p2, p3)
	-- upvalues: jsonModule (ref), string (ref), boolean (ref), buildClientSchema (ref), error (ref)
	local parse = jsonModule.parse
	local var1 = tostring(p2)
	
	if string.charCodeAt(var1, 1) == 65279 then
		var1 = string.slice(var1, 2)
	end
	parse = parse(var1)
	
	if boolean.toJSBoolean(parse.data) then
		parse = parse.data
	end
	if parse.kind == "Document" then
		return { location = p1, document = parse }
	elseif boolean.toJSBoolean(parse.__schema) then
		return { location = p1, schema = buildClientSchema(parse, p3) }
	elseif typeof(parse) == "string" then
		return { location = p1, rawSDL = parse }
	end
	error(error.new("Not valid JSON content"))
end

return t