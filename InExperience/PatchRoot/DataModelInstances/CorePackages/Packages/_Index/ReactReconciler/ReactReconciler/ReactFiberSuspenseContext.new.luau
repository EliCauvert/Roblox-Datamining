local _ = require(script.Parent.ReactInternalTypes)
local ReactFiberStackNewModule = require(script.Parent["ReactFiberStack.new"])
local PushFunction = ReactFiberStackNewModule.push
local PopFunction = ReactFiberStackNewModule.pop
local Cursor = ReactFiberStackNewModule.createCursor(0)

return {
	InvisibleParentSuspenseContext = 1,
	ForceSuspenseFallback = 2,
	suspenseStackCursor = Cursor,
	hasSuspenseContext = function(Value: number, Mask: number): boolean
		return bit32.band(Value, Mask) ~= 0
	end,
	setDefaultShallowSuspenseContext = function(Value: number): number
		return (bit32.band(Value, 1))
	end,
	setShallowSuspenseContext = function(Value: number, Mask: number): number
		return (bit32.bor(bit32.band(Value, 1), Mask))
	end,
	addSubtreeSuspenseContext = function(Value: number, Mask: number): number
		return (bit32.bor(Value, Mask))
	end,
	pushSuspenseContext = function(p1, p2)
		-- upvalues: PushFunction (copy), Cursor (copy)
		PushFunction(Cursor, p2, p1)
	end,
	popSuspenseContext = function(p1)
		-- upvalues: PopFunction (copy), Cursor (copy)
		PopFunction(Cursor, p1)
	end
}