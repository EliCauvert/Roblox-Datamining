-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:09 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local _ = require(parent.LuauPolyfill)
local _ = require(parent.GraphQL).visit

return {
	DirectiveLocation = {
		QUERY = "QUERY",
		MUTATION = "MUTATION",
		SUBSCRIPTION = "SUBSCRIPTION",
		FIELD = "FIELD",
		FRAGMENT_DEFINITION = "FRAGMENT_DEFINITION",
		FRAGMENT_SPREAD = "FRAGMENT_SPREAD",
		INLINE_FRAGMENT = "INLINE_FRAGMENT",
		VARIABLE_DEFINITION = "VARIABLE_DEFINITION",
		SCHEMA = "SCHEMA",
		SCALAR = "SCALAR",
		OBJECT = "OBJECT",
		FIELD_DEFINITION = "FIELD_DEFINITION",
		ARGUMENT_DEFINITION = "ARGUMENT_DEFINITION",
		INTERFACE = "INTERFACE",
		UNION = "UNION",
		ENUM = "ENUM",
		ENUM_VALUE = "ENUM_VALUE",
		INPUT_OBJECT = "INPUT_OBJECT",
		INPUT_FIELD_DEFINITION = "INPUT_FIELD_DEFINITION"
	}
}