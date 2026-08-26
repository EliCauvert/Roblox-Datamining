local _ = require(script.Parent.ReactInternalTypes)
local unknownModule = require(script.Parent["ReactFiberStack.new"])
local createCursor = unknownModule.createCursor
local push = unknownModule.push
local pop = unknownModule.pop
local t = {
	InvisibleParentSuspenseContext = 1,
	ForceSuspenseFallback = 2
}
local var1 = createCursor(0)
t.suspenseStackCursor = var1

function t.hasSuspenseContext(p1, p2)
	return bit32.band(p1, p2) ~= 0
end

function t.setDefaultShallowSuspenseContext(value)
	return bit32.band(value, 1)
end

function t.setShallowSuspenseContext(value, p1)
	return bit32.bor(bit32.band(value, 1), p1)
end

function t.addSubtreeSuspenseContext(p1, p2)
	return bit32.bor(p1, p2)
end

function t.pushSuspenseContext(p1, p2)
	-- upvalues: push (ref), var1 (ref)
	push(var1, p2, p1)
end

function t.popSuspenseContext(p1)
	-- upvalues: pop (ref), var1 (ref)
	pop(var1, p1)
end

return t