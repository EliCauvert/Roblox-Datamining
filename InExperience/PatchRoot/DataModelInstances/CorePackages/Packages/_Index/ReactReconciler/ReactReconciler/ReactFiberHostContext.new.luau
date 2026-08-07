local _ = require(script.Parent.ReactInternalTypes)
local unknownModule = require(script.Parent["ReactFiberStack.new"])
local reactFiberHostConfigModule = require(script.Parent.ReactFiberHostConfig)
local getChildHostContext = reactFiberHostConfigModule.getChildHostContext
local getRootHostContext = reactFiberHostConfigModule.getRootHostContext
local createCursor = unknownModule.createCursor
local push = unknownModule.push
local pop = unknownModule.pop
local t = {}
local var3 = createCursor(t)
local var4 = createCursor(t)
local var5 = createCursor(t)

function requiredContext(p0) --[[ line: 42 ]]
	return p0
end

function getRootHostContainer() --[[ line: 52 ]]
	-- upvalues: var5 (ref)
	return var5.current
end

function pushHostContainer(p1, p2) --[[ line: 59 ]]
	-- upvalues: push (ref), var5 (ref), var4 (ref), var3 (ref), t (ref), getRootHostContext (ref), pop (ref)
	push(var5, p2, p1)
	push(var4, p1, p1)
	push(var3, t, p1)
	local var6 = getRootHostContext(p2)
	pop(var3, p1)
	push(var3, var6, p1)
end

function popHostContainer(p3) --[[ line: 79 ]]
	-- upvalues: pop (ref), var3 (ref), var4 (ref), var5 (ref)
	pop(var3, p3)
	pop(var4, p3)
	pop(var5, p3)
end

function getHostContext() --[[ line: 85 ]]
	-- upvalues: var3 (ref)
	return var3.current
end

function pushHostContext(p4) --[[ line: 92 ]]
	-- upvalues: var5 (ref), var3 (ref), getChildHostContext (ref), push (ref), var4 (ref)
	local var7 = requiredContext(var3.current)
	local var8 = getChildHostContext(var7, p4.type, requiredContext(var5.current))
	
	if var7 == var8 then
		return
	end
	push(var4, p4, p4)
	push(var3, var8, p4)
end

function popHostContext(p5) --[[ line: 108 ]]
	-- upvalues: var4 (ref), pop (ref), var3 (ref)
	if var4.current == p5 then
		pop(var3, p5)
		pop(var4, p5)
		
		return
	end
end

return {
	getHostContext = getHostContext,
	getRootHostContainer = getRootHostContainer,
	popHostContainer = popHostContainer,
	popHostContext = popHostContext,
	pushHostContainer = pushHostContainer,
	pushHostContext = pushHostContext
}