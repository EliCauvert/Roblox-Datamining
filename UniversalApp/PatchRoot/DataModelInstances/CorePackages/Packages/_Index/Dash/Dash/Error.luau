local parent = script.Parent
local _ = require(parent.Types)
local classModule = require(parent.class)
local formatModule = require(parent.format)
local joinModule = require(parent.join)
local var1 = classModule("Error", function(p1, p2, p3)
	return {
		name = p1,
		message = p2 or "An error occurred",
		tags = p3 or {}
	}
end)

function var3.toString(p1)
	-- upvalues: formatModule (ref)
	return formatModule("{}: {}\n{}", p1.name, formatModule(p1.message, p1.tags), p1.stack)
end

function var3.joinTags(p1, p2)
	-- upvalues: var1 (ref), joinModule (ref)
	return var1.new(p1.name, p1.message, joinModule(p1.tags, p2 or {}))
end

function var3.throw(p1, p2)
	local var2 = p1:joinTags(p2)
	var2.stack = debug.traceback()
	error(var2)
end

return var1