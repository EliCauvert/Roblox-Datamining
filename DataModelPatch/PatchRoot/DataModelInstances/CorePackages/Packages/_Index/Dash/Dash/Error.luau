local Parent = script.Parent
local _ = require(Parent.Types)
local FormatModule = require(Parent.format)
local JoinModule = require(Parent.join)
local Error1 = require(Parent.class)("Error", function(Name, p1, p2)
	return {
		name = Name,
		message = p1 or "An error occurred",
		tags = p2 or {}
	}
end)

function Error1.toString(p1)
	-- upvalues: FormatModule (copy)
	return FormatModule("{}: {}\n{}", p1.name, FormatModule(p1.message, p1.tags), p1.stack)
end

function Error1.joinTags(p1, p2)
	-- upvalues: Error1 (copy), JoinModule (copy)
	return Error1.new(p1.name, p1.message, JoinModule(p1.tags, p2 or {}))
end

function Error1.throw(p1, p2)
	local JoinTagsResult = p1:joinTags(p2)
	JoinTagsResult.stack = debug.traceback()
	error(JoinTagsResult)
end

return Error1