local parent = script.Parent.Parent
local _ = require(parent.Parent.LuauPolyfill)
local _ = require(parent.language.ast)
local _ = require(parent.execution.execute)
local _ = require(parent.type.schema)
local _ = require(parent.type.definition)

return {
	subscribe = function(_) --[[ line: 35 ]]
		error("graphql-lua does not currently implement subscriptions")
	end,
	createSourceEventStream = function(_, _, _, _, _, _, _) --[[ line: 39 ]]
		error("graphql-lua does not currently implement subscriptions")
	end
}