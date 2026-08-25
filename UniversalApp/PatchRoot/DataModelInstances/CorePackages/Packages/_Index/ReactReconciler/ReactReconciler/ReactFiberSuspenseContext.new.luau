local _ = require(script.Parent.ReactInternalTypes)
local unknownModule = require(script.Parent["ReactFiberStack.new"])
local createCursor = unknownModule.createCursor
local push = unknownModule.push
local pop = unknownModule.pop
local t = {
	InvisibleParentSuspenseContext = 1,
	ForceSuspenseFallback = 2
}
local var2 = createCursor(0)
t.suspenseStackCursor = var2

function t.hasSuspenseContext(p0, p1)
	return bit32.band(p0, p1) ~= 0
end

function t.setDefaultShallowSuspenseContext(value)
	return bit32.band(value, 1)
end

function t.setShallowSuspenseContext(value, p2)
	return bit32.bor(bit32.band(value, 1), p2)
end

function t.addSubtreeSuspenseContext(p3, p4)
	return bit32.bor(p3, p4)
end

function t.pushSuspenseContext(p5, p6)
	-- upvalues: push (ref), var2 (ref)
	push(var2, p6, p5)
end

function t.popSuspenseContext(p7)
	-- upvalues: pop (ref), var2 (ref)
	pop(var2, p7)
end

return t