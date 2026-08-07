-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:09 2026 Pacific Standard Time.

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

local function _(p0) --[[ line: 26 | named "stripBOM" ]]
	-- upvalues: string (ref)
	p0 = tostring(p0)
	
	if string.charCodeAt(p0, 1) == 65279 then
		p0 = string.slice(p0, 2)
	end
	return p0
end

local _ = function(p1) --[[ line: 41 | named "parseBOM" ]]
	-- upvalues: jsonModule (ref), string (ref)
	local parse = jsonModule.parse
	local var3 = tostring(p1)
	
	if string.charCodeAt(var3, 1) == 65279 then
		var3 = string.slice(var3, 2)
	end
	return parse(var3)
end

function t.parseGraphQLJSON(p2, p3, p4) --[[ line: 44 ]]
	-- upvalues: jsonModule (ref), string (ref), boolean (ref), buildClientSchema (ref), error (ref)
	local parse = jsonModule.parse
	local var4 = tostring(p3)
	
	if string.charCodeAt(var4, 1) == 65279 then
		var4 = string.slice(var4, 2)
	end
	parse = parse(var4)
	
	if boolean.toJSBoolean(parse.data) then
		parse = parse.data
	end
	if parse.kind == "Document" then
		return { location = p2, document = parse }
	elseif boolean.toJSBoolean(parse.__schema) then
		return { location = p2, schema = buildClientSchema(parse, p4) }
	elseif typeof(parse) == "string" then
		return { location = p2, rawSDL = parse }
	end
	error(error.new("Not valid JSON content"))
end

return t