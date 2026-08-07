-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:15 2026 Pacific Standard Time.

local luauPolyfillModule = require(script.Parent.Parent.Parent.LuauPolyfill)
local set = luauPolyfillModule.Set
local array = luauPolyfillModule.Array
local t = {}
local _ = require(script.Parent.anyEntryTypes)
local _ = require(script.Parent.initTypes)
local parentEntrySlot = require(script.Parent.context).parentEntrySlot
local helpersModule = require(script.Parent.helpers)
local hasOwnProperty = helpersModule.hasOwnProperty
local maybeUnsubscribe = helpersModule.maybeUnsubscribe
local toArray = helpersModule.toArray
local t_1 = { setDirty = true, dispose = true, forget = true }
local _ = require(script.Parent.depTypes)

function t.dep(p0) --[[ line: 66 ]]
	-- upvalues: parentEntrySlot (ref), set (ref), maybeUnsubscribe (ref), hasOwnProperty (ref), t_1 (ref), array (ref), toArray (ref)
	local t = {}
	local var5 = if p0 ~= nil then p0 else p0.subscribe
	local tbl = setmetatable({}, {
		__call = function(_, p1) --[[ line: 74 ]]
			-- upvalues: parentEntrySlot (copy), t (ref), set (copy), var5 (ref), maybeUnsubscribe (copy)
			local value = parentEntrySlot:getValue()
			
			if value ~= nil then
				local var8 = t[p1]
				
				if not var8 then
					var8 = set.new()
					t[p1] = var8
				end
				value:dependOn(var8)
				
				if type(var5) == "function" then
					maybeUnsubscribe(var8)
					var8.unsubscribe = var5(p1)
				end
			end
		end
	})
	
	function tbl.dirty(_, p2, p3) --[[ line: 101 ]]
		-- upvalues: t (ref), hasOwnProperty (copy), t_1 (copy), array (copy), toArray (copy), maybeUnsubscribe (copy)
		local var9 = t[p2]
		
		if var9 then
			local var10 = if p3 and hasOwnProperty(t_1, p3) then p3 else "setDirty"
			array.forEach(toArray(var9), function(p4) --[[ line: 112 ]]
				-- upvalues: var10 (ref)
				p4[var10](p4)
			end)
			t[p2] = nil
			maybeUnsubscribe(var9)
		end
	end
	
	return tbl
end

return t