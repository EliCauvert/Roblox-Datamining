-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:39 2026 Pacific Standard Time.

local parent = script:FindFirstAncestor("ReactUtils").Parent
local reactModule = require(parent.React)
local array = require(parent.LuauPolyfill).Array
local useForwardRefModule = require(script.Parent.useForwardRef)

return function(p0, p1, p2, ...) --[[ line: 15 | named "usePropertiesBase" ]]
	-- upvalues: array (ref), reactModule (ref), useForwardRefModule (ref)
	local var2 = array.concat({}, ...)
	
	return useForwardRefModule(p0, reactModule.useCallback(function(p3) --[[ line: 23 ]]
		-- upvalues: p1 (ref), array (copy), var2 (ref), p2 (ref)
		local function onPropChange() --[[ line: 24 ]]
			-- upvalues: p1 (copy), array (copy), var2 (copy), p3 (ref)
			p1(table.unpack(array.map(var2, function(p4) --[[ line: 25 ]]
				-- upvalues: p3 (copy)
				return p3[p4]
			end)))
		end
		
		local var4 = nil
		
		local var5 = function() --[[ line: 31 ]]
			-- upvalues: var4 (write), p1 (copy), array (copy), var2 (copy), p3 (ref)
			if not var4 then
				var4 = task.defer(function() --[[ line: 33 ]]
					-- upvalues: var4 (copy), p1 (copy), array (copy), var2 (copy), p3 (copy)
					var4 = nil
					p1(table.unpack(array.map(var2, function(p5) --[[ line: 25 ]]
						-- upvalues: p3 (copy)
						return p3[p5]
					end)))
				end)
			end
		end
		
		local var6 = array.map(var2, function(p6) --[[ line: 39 ]]
			-- upvalues: p3 (ref), p2 (copy), var5 (ref), onPropChange (ref)
			return p3:GetPropertyChangedSignal(p6):Connect(if p2 then var5 else onPropChange)
		end)
		p1(table.unpack(array.map(var2, function(p7) --[[ line: 25 ]]
			-- upvalues: p3 (ref)
			return p3[p7]
		end)))
		
		return function() --[[ line: 45 ]]
			-- upvalues: var6 (ref), var4 (write)
			for i, v in var6 do
				v:Disconnect()
			end
			if var4 then
				task.cancel(var4)
			end
		end
	end, { p1, table.concat(var2, ",") }))
end