-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:48 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local kind = require(parent.GraphQL).Kind
local mergeDirectives = require(script.Parent.directives).mergeDirectives
local mergeEnumValues = require(script.Parent["enum-values"]).mergeEnumValues
local _ = require(script.Parent["merge-typedefs_types"])

function t.mergeEnum(p0, p1, p2) --[[ line: 26 ]]
	-- upvalues: boolean (ref), mergeDirectives (ref), mergeEnumValues (ref), object (ref), kind (ref)
	return if boolean.toJSBoolean(p1) then {
		name = p0.name,
		description = if boolean.toJSBoolean(p0.description) then p0.description else p1.description,
		kind = if p2 and boolean.toJSBoolean(p2.convertExtensions) or (p0.kind == "EnumTypeDefinition" or p1.kind == "EnumTypeDefinition") then "EnumTypeDefinition" else "EnumTypeExtension",
		loc = p0.loc,
		directives = mergeDirectives(p0.directives, p1.directives, p2),
		values = mergeEnumValues(p0.values, p1.values, p2)
	} elseif p2 and boolean.toJSBoolean(p2.convertExtensions) then object.assign({}, p0, { kind = kind.ENUM_TYPE_DEFINITION }) else p0
end

return t