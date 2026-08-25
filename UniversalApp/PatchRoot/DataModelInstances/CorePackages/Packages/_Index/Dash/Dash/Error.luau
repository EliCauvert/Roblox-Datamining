local parent = script.Parent
local _ = require(parent.Types)
local classModule = require(parent.class)
local formatModule = require(parent.format)
local joinModule = require(parent.join)
local var3 = classModule("Error", function(p0, p1, p2)
	return {
		name = p0,
		message = p1 or "An error occurred",
		tags = p2 or {}
	}
end)

function var3.toString(p3)
	-- upvalues: formatModule (ref)
	return formatModule("{}: {}\n{}", p3.name, formatModule(p3.message, p3.tags), p3.stack)
end

function var3.joinTags(p4, p5)
	-- upvalues: var3 (ref), joinModule (ref)
	return var3.new(p4.name, p4.message, joinModule(p4.tags, p5 or {}))
end

function var3.throw(p6, p7)
	local var4 = p6:joinTags(p7)
	var4.stack = debug.traceback()
	error(var4)
end

return var3