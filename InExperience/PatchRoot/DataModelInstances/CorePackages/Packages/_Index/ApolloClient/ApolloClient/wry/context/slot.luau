local Parent = script.Parent.Parent.Parent
local LuauPolyfillModule = require(Parent.Parent.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local UuidFunction = require(Parent.utilities.common.makeUniqueId).uuid
local t = {}
local Parent1 = nil
local Slot = {}
local Count = 1

local function makeSlotClass()
	-- upvalues: Array (copy), Count (ref), UuidFunction (copy), Parent1 (ref), Slot (copy)
	local Module = {}
	Module.__index = Module
	
	function Module.new()
		-- upvalues: Module (copy), Array (upval), Count (upval), UuidFunction (upval)
		local self = setmetatable({}, Module)
		self.id = Array.join({
			"slot",
			Count,
			DateTime.now().UnixTimestampMillis,
			UuidFunction()
		}, ":")
		Count += 1
		
		return self
	end
	
	function Module:hasValue(): boolean
		-- upvalues: Parent1 (upval), Slot (upval)
		local Parent1 = Parent1
		while Parent1 do
			if not Parent1.slots[self.id] then
				Parent1 = Parent1.parent
				continue
			end
			local Slot1 = Parent1.slots[self.id]
			
			if Slot1 == Slot then break end
			if Parent1 ~= Parent1 then
				Parent1.slots[self.id] = Slot1
			end
			return true
		end
		if Parent1 then
			Parent1.slots[self.id] = Slot
		end
		return false
	end
	
	function Module.getValue(p1)
		-- upvalues: Parent1 (upval)
		return if p1:hasValue() then Parent1.slots[p1.id] else nil
	end
	
	function Module:withValue(p1, Callback, p2, p3)
		-- upvalues: Parent1 (upval)
		local Parent1 = Parent1
		Parent1 = { parent = Parent1, slots = { [self.id] = p1 } }
		local Success, Result, Result3 = pcall(function()
			-- upvalues: Callback (copy), p3 (copy), p2 (copy)
			return Callback(p3, table.unpack(p2 or {})), true
		end)
		Parent1 = Parent1
		
		if Result3 then
			return Result
		end
		if not Success then
			error(Result)
		end
		return nil
	end
	
	function Module.bind(p1)
		-- upvalues: Parent1 (upval)
		local Parent1 = Parent1
		
		return function(p2, ...)
			-- upvalues: Parent1 (upval), Parent1 (copy), p1 (copy)
			local Parent2 = Parent1
			Parent1 = Parent1
			local Success, Result = pcall(p1, p2, table.unpack({ ... }))
			Parent1 = Parent2
			
			if not Success then
				error(Result)
			end
			return Result
		end
	end
	
	function Module.noContext(Callback, p1, p2)
		-- upvalues: Parent1 (upval)
		if not Parent1 then
			return Callback(p2, table.unpack(p1 or {}))
		end
		local Parent1 = Parent1
		local Success, Result, Result3 = pcall(function()
			-- upvalues: Parent1 (upval), Callback (copy), p2 (copy), p1 (copy)
			Parent1 = nil
			
			return Callback(p2, table.unpack(p1 or {})), true
		end)
		Parent1 = Parent1
		
		if Result3 then
			return Result
		end
		if not Success then
			error(Result)
		end
		return nil
	end
	
	return Module
end
local WryContextSlot = nil
repeat
	if LuauPolyfillModule.Boolean.toJSBoolean(Array["@wry/context:Slot"]) then
		WryContextSlot = Array["@wry/context:Slot"]
		
		if WryContextSlot then break end
	end
	local SlotClass = makeSlotClass()
	pcall(function()
		-- upvalues: Array (copy), SlotClass (copy)
		Array["@wry/context:Slot"] = SlotClass
	end)
	WryContextSlot = SlotClass
until true
t.Slot = WryContextSlot

return t