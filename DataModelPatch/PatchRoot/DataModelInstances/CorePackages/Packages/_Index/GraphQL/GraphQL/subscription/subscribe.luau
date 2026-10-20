local Parent = script.Parent.Parent
local _ = require(Parent.Parent.LuauPolyfill)
local _ = require(Parent.language.ast)
local _ = require(Parent.execution.execute)
local _ = require(Parent.type.schema)
local _ = require(Parent.type.definition)

return {
	subscribe = function(_)
		error("graphql-lua does not currently implement subscriptions")
	end,
	createSourceEventStream = function(_, _, _, _, _, _, _)
		error("graphql-lua does not currently implement subscriptions")
	end
}