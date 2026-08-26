local var1
local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local uuid = require(parent.utilities.common.makeUniqueId).uuid
local t = {}
local var2 = nil
local t_1 = {}
local var3 = 1

local function makeSlotClass()
	-- upvalues: array (ref), var3 (write), uuid (ref), var2 (write), t_1 (ref)
	local t = {}
	t.__index = t
	
	function t.new()
		-- upvalues: t (ref), array (copy), var3 (copy), uuid (copy)
		local tbl = setmetatable({}, t)
		tbl.id = array.join({ "slot", var3, DateTime.now().UnixTimestampMillis, uuid() }, ":")
		var3 += 1
		
		return tbl
	end
	
	function t:hasValue()
		-- upvalues: var2 (copy), t_1 (copy)
		local var4 = var2
		while var4 do
			if not var4.slots[self.id] then
				var4 = var4.parent
				continue
			end
			local id = var4.slots[self.id]
			
			if id == t_1 then break end
			if var4 ~= var2 then
				var2.slots[self.id] = id
			end
			return true
		end
		if var2 then
			var2.slots[self.id] = t_1
		end
		return false
	end
	
	function t:getValue()
		-- upvalues: var2 (copy)
		return if self:hasValue() then var2.slots[self.id] else nil
	end
	
	function t:withValue(p1, p2, p3, p4)
		-- upvalues: var2 (copy)
		var2 = { parent = var2, slots = { [self.id] = p1 } }
		local ok, status, var5 = pcall(function()
			-- upvalues: p2 (ref), p4 (ref), p3 (ref)
			return p2(p4, table.unpack(p3 or {})), true
		end)
		var2 = var2
		
		if var5 then
			return status
		elseif not ok then
			error(status)
		end
		return nil
	end
	
	function t.bind(p1)
		-- upvalues: var2 (copy)
		return function(p2, ...)
			-- upvalues: var2 (copy), var2 (ref), p1 (ref)
			var2 = var2
			local ok, status = pcall(p1, p2, table.unpack({ ... }))
			var2 = var2
			
			if not ok then
				error(status)
			end
			return status
		end
	end
	
	function t.noContext(p1, p2, p3)
		-- upvalues: var2 (copy)
		if not var2 then
			return p1(p3, table.unpack(p2 or {}))
		end
		local var5 = var2
		local ok, status, var6 = pcall(function()
			-- upvalues: var2 (copy), p1 (ref), p3 (ref), p2 (ref)
			var2 = nil
			
			return p1(p3, table.unpack(p2 or {})), true
		end)
		var2 = var5
		
		if var6 then
			return status
		elseif not ok then
			error(status)
		end
		return nil
	end
	
	return t
end

if boolean.toJSBoolean(array["@wry/context:Slot"]) then
	var1 = array["@wry/context:Slot"]
	
	if not var1 then
		local var4 = makeSlotClass()
		pcall(function()
			-- upvalues: array (ref), var4 (ref)
			array["@wry/context:Slot"] = var4
		end)
		var1 = var4
	end
	t.Slot = var1
	
	return t
end