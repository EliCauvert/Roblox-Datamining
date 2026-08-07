-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:36 2026 Pacific Standard Time.

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

function t.hasSuspenseContext(p0, p1) --[[ line: 59 ]]
	return bit32.band(p0, p1) ~= 0
end

function t.setDefaultShallowSuspenseContext(value) --[[ line: 66 ]]
	return bit32.band(value, 1)
end

function t.setShallowSuspenseContext(value, p2) --[[ line: 72 ]]
	return bit32.bor(bit32.band(value, 1), p2)
end

function t.addSubtreeSuspenseContext(p3, p4) --[[ line: 82 ]]
	return bit32.bor(p3, p4)
end

function t.pushSuspenseContext(p5, p6) --[[ line: 89 ]]
	-- upvalues: push (ref), var2 (ref)
	push(var2, p6, p5)
end

function t.popSuspenseContext(p7) --[[ line: 93 ]]
	-- upvalues: pop (ref), var2 (ref)
	pop(var2, p7)
end

return t