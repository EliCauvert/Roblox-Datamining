local _ = require(script.Parent.ReactInternalTypes)
local ReactFiberStackNewModule = require(script.Parent["ReactFiberStack.new"])
local ReactFiberHostConfigModule = require(script.Parent.ReactFiberHostConfig)
local GetChildHostContextFunction = ReactFiberHostConfigModule.getChildHostContext
local GetRootHostContextFunction = ReactFiberHostConfigModule.getRootHostContext
local CreateCursorFunction = ReactFiberStackNewModule.createCursor
local PushFunction = ReactFiberStackNewModule.push
local PopFunction = ReactFiberStackNewModule.pop
local t = {}
local Cursor = CreateCursorFunction(t)
local Cursor1 = CreateCursorFunction(t)
local Cursor2 = CreateCursorFunction(t)

function requiredContext(p1) --[[ Line: 42 ]]
	return p1
end

function getRootHostContainer() --[[ Line: 52 ]]
	-- upvalues: Cursor2 (copy)
	return Cursor2.current
end

function pushHostContainer(p1, p2) --[[ Line: 59 ]]
	-- upvalues: PushFunction (copy), Cursor2 (copy), Cursor1 (copy), Cursor (copy), t (copy), GetRootHostContextFunction (copy), PopFunction (copy)
	PushFunction(Cursor2, p2, p1)
	PushFunction(Cursor1, p1, p1)
	PushFunction(Cursor, t, p1)
	local RootHostContext = GetRootHostContextFunction(p2)
	PopFunction(Cursor, p1)
	PushFunction(Cursor, RootHostContext, p1)
end

function popHostContainer(p1) --[[ Line: 79 ]]
	-- upvalues: PopFunction (copy), Cursor (copy), Cursor1 (copy), Cursor2 (copy)
	PopFunction(Cursor, p1)
	PopFunction(Cursor1, p1)
	PopFunction(Cursor2, p1)
end

function getHostContext() --[[ Line: 85 ]]
	-- upvalues: Cursor (copy)
	return Cursor.current
end

function pushHostContext(p1) --[[ Line: 92 ]]
	-- upvalues: Cursor2 (copy), Cursor (copy), GetChildHostContextFunction (copy), PushFunction (copy), Cursor1 (copy)
	local RequiredContextResult = requiredContext(Cursor.current)
	local ChildHostContext = GetChildHostContextFunction(RequiredContextResult, p1.type, (requiredContext(Cursor2.current)))
	
	if RequiredContextResult ~= ChildHostContext then
		PushFunction(Cursor1, p1, p1)
		PushFunction(Cursor, ChildHostContext, p1)
		
		return
	end
end

function popHostContext(Current) --[[ Line: 108 ]]
	-- upvalues: Cursor1 (copy), PopFunction (copy), Cursor (copy)
	if Cursor1.current == Current then
		PopFunction(Cursor, Current)
		PopFunction(Cursor1, Current)
		
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