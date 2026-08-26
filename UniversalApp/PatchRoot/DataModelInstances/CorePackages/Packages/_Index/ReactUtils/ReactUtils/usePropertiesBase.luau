local parent = script:FindFirstAncestor("ReactUtils").Parent
local reactModule = require(parent.React)
local array = require(parent.LuauPolyfill).Array
local useForwardRefModule = require(script.Parent.useForwardRef)

return function(p1, p2, p3, ...)
	-- upvalues: array (ref), reactModule (ref), useForwardRefModule (ref)
	local var1 = array.concat({}, ...)
	
	return useForwardRefModule(p1, reactModule.useCallback(function(p4)
		-- upvalues: p2 (ref), array (copy), var1 (ref), p3 (ref)
		local function onPropChange()
			-- upvalues: p2 (copy), array (copy), var1 (copy), p4 (ref)
			p2(table.unpack(array.map(var1, function(p5)
				-- upvalues: p4 (copy)
				return p4[p5]
			end)))
		end
		
		local var2 = nil
		
		local var3 = function()
			-- upvalues: var2 (write), p2 (copy), array (copy), var1 (copy), p4 (ref)
			if not var2 then
				var2 = task.defer(function()
					-- upvalues: var2 (copy), p2 (copy), array (copy), var1 (copy), p4 (copy)
					var2 = nil
					p2(table.unpack(array.map(var1, function(p5)
						-- upvalues: p4 (copy)
						return p4[p5]
					end)))
				end)
			end
		end
		
		local var4 = array.map(var1, function(p5)
			-- upvalues: p4 (ref), p3 (copy), var3 (ref), onPropChange (ref)
			return p4:GetPropertyChangedSignal(p5):Connect(if p3 then var3 else onPropChange)
		end)
		p2(table.unpack(array.map(var1, function(p5)
			-- upvalues: p4 (ref)
			return p4[p5]
		end)))
		
		return function()
			-- upvalues: var4 (ref), var2 (write)
			for i, v in var4 do
				v:Disconnect()
			end
			if var2 then
				task.cancel(var2)
			end
		end
	end, { p2, table.concat(var1, ",") }))
end