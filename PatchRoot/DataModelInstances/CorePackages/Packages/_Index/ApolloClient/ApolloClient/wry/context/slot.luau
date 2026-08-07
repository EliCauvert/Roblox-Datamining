-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:17 2026 Pacific Standard Time.

local var6
local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local boolean = luauPolyfillModule.Boolean
local uuid = require(parent.utilities.common.makeUniqueId).uuid
local t = {}
local var2 = nil
local t_1 = {}
local var4 = 1

local function makeSlotClass() --[[ line: 62 ]]
	-- upvalues: array (ref), var4 (write), uuid (ref), var2 (write), t_1 (ref)
	local t = {}
	t.__index = t
	
	function t.new() --[[ line: 66 ]]
		-- upvalues: t (ref), array (copy), var4 (copy), uuid (copy)
		local tbl = setmetatable({}, t)
		tbl.id = array.join({ "slot", var4, DateTime.now().UnixTimestampMillis, uuid() }, ":")
		var4 += 1
		
		return tbl
	end
	
	function t:hasValue() --[[ line: 84 ]]
		-- upvalues: var2 (copy), t_1 (copy)
		local var10 = var2
		while var10 do
			if not var10.slots[self.id] then
				var10 = var10.parent
				continue
			end
			local id = var10.slots[self.id]
			
			if id == t_1 then break end
			if var10 ~= var2 then
				var2.slots[self.id] = id
			end
			return true
		end
		if var2 then
			var2.slots[self.id] = t_1
		end
		return false
	end
	
	function t:getValue() --[[ line: 120 ]]
		-- upvalues: var2 (copy)
		return if self:hasValue() then var2.slots[self.id] else nil
	end
	
	function t:withValue(p0, p1, p2, p3) --[[ line: 127 ]]
		-- upvalues: var2 (copy)
		var2 = { parent = var2, slots = { [self.id] = p0 } }
		local ok, status, var11 = pcall(function() --[[ line: 144 ]]
			-- upvalues: p1 (ref), p3 (ref), p2 (ref)
			return p1(p3, table.unpack(p2 or {})), true
		end)
		var2 = var2
		
		if var11 then
			return status
		elseif not ok then
			error(status)
		end
		return nil
	end
	
	function t.bind(p4) --[[ line: 162 ]]
		-- upvalues: var2 (copy)
		return function(p5, ...) --[[ line: 164 ]]
			-- upvalues: var2 (copy), var2 (ref), p4 (ref)
			var2 = var2
			local ok, status = pcall(p4, p5, table.unpack({ ... }))
			var2 = var2
			
			if not ok then
				error(status)
			end
			return status
		end
	end
	
	function t.noContext(p6, p7, p8) --[[ line: 178 ]]
		-- upvalues: var2 (copy)
		if not var2 then
			return p6(p8, table.unpack(p7 or {}))
		end
		local var12 = var2
		local ok, status, var13 = pcall(function() --[[ line: 189 ]]
			-- upvalues: var2 (copy), p6 (ref), p8 (ref), p7 (ref)
			var2 = nil
			
			return p6(p8, table.unpack(p7 or {})), true
		end)
		var2 = var12
		
		if var13 then
			return status
		elseif not ok then
			error(status)
		end
		return nil
	end
	
	return t
end

if boolean.toJSBoolean(array["@wry/context:Slot"]) then
	var6 = array["@wry/context:Slot"]
	
	if not var6 then
		local var7 = makeSlotClass()
		pcall(function() --[[ line: 227 ]]
			-- upvalues: array (ref), var7 (ref)
			array["@wry/context:Slot"] = var7
		end)
		var6 = var7
	end
	t.Slot = var6
	
	return t
end