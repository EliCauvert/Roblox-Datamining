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

function t.dep(p1)
	-- upvalues: parentEntrySlot (ref), set (ref), maybeUnsubscribe (ref), hasOwnProperty (ref), t_1 (ref), array (ref), toArray (ref)
	local t = {}
	local var1 = if p1 ~= nil then p1 else p1.subscribe
	local tbl = setmetatable({}, {
		__call = function(_, p2)
			-- upvalues: parentEntrySlot (copy), t (ref), set (copy), var1 (ref), maybeUnsubscribe (copy)
			local value = parentEntrySlot:getValue()
			
			if value ~= nil then
				local var2 = t[p2]
				
				if not var2 then
					var2 = set.new()
					t[p2] = var2
				end
				value:dependOn(var2)
				
				if type(var1) == "function" then
					maybeUnsubscribe(var2)
					var2.unsubscribe = var1(p2)
				end
			end
		end
	})
	
	function tbl.dirty(_, p2, p3)
		-- upvalues: t (ref), hasOwnProperty (copy), t_1 (copy), array (copy), toArray (copy), maybeUnsubscribe (copy)
		local var2 = t[p2]
		
		if var2 then
			local var3 = if p3 and hasOwnProperty(t_1, p3) then p3 else "setDirty"
			array.forEach(toArray(var2), function(p4)
				-- upvalues: var3 (ref)
				p4[var3](p4)
			end)
			t[p2] = nil
			maybeUnsubscribe(var2)
		end
	end
	
	return tbl
end

return t