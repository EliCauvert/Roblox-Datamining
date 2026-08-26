local _ = require(script.Parent.ReactInternalTypes)
local unknownModule = require(script.Parent["ReactFiberStack.new"])
local reactFiberHostConfigModule = require(script.Parent.ReactFiberHostConfig)
local getChildHostContext = reactFiberHostConfigModule.getChildHostContext
local getRootHostContext = reactFiberHostConfigModule.getRootHostContext
local createCursor = unknownModule.createCursor
local push = unknownModule.push
local pop = unknownModule.pop
local t = {}
local var1 = createCursor(t)
local var2 = createCursor(t)
local var3 = createCursor(t)

function requiredContext(p1)
	return p1
end

function getRootHostContainer()
	-- upvalues: var3 (ref)
	return var3.current
end

function pushHostContainer(p1, p2)
	-- upvalues: push (ref), var3 (ref), var2 (ref), var1 (ref), t (ref), getRootHostContext (ref), pop (ref)
	push(var3, p2, p1)
	push(var2, p1, p1)
	push(var1, t, p1)
	local var4 = getRootHostContext(p2)
	pop(var1, p1)
	push(var1, var4, p1)
end

function popHostContainer(p1)
	-- upvalues: pop (ref), var1 (ref), var2 (ref), var3 (ref)
	pop(var1, p1)
	pop(var2, p1)
	pop(var3, p1)
end

function getHostContext()
	-- upvalues: var1 (ref)
	return var1.current
end

function pushHostContext(p1)
	-- upvalues: var3 (ref), var1 (ref), getChildHostContext (ref), push (ref), var2 (ref)
	local var4 = requiredContext(var1.current)
	local var5 = getChildHostContext(var4, p1.type, requiredContext(var3.current))
	
	if var4 == var5 then
		return
	end
	push(var2, p1, p1)
	push(var1, var5, p1)
end

function popHostContext(p1)
	-- upvalues: var2 (ref), pop (ref), var1 (ref)
	if var2.current == p1 then
		pop(var1, p1)
		pop(var2, p1)
		
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