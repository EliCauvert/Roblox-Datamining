local boolean = require((nil).LuauPolyfill).Boolean

return {
	observableToAsyncIterable = function(p1)
		-- upvalues: boolean (ref)
		local t = {}
		local t_1 = {}
		local var1 = true
		
		local function pushValue(p2)
			-- upvalues: t (ref), t_1 (ref)
			if t.length == 0 then
				table.insert(t_1, { done = false, value = p2 })
				
				return
			end
			table.remove(t, 1)({ done = false, value = p2 })
		end
		
		local function pushError(p2)
			-- upvalues: t (ref), t_1 (ref)
			if t.length == 0 then
				table.insert(t_1, { done = false, value = { errors = { p2 } } })
				
				return
			end
			table.remove(t, 1)({ done = false, value = { errors = { p2 } } })
		end
		
		local function pushDone()
			-- upvalues: t (ref), t_1 (ref)
			if t.length == 0 then
				table.insert(t_1, { done = true })
				
				return
			end
			table.remove(t, 1)({ done = true })
		end
		
		local function _()
			-- upvalues: t_1 (ref), t (ref)
			return Promise.new(function(p2)
				-- upvalues: t_1 (copy), t (copy)
				if t_1.length == 0 then
					table.insert(t, p2)
					
					return
				end
				p2(table.remove(t_1, 1))
			end)
		end
		
		local var2 = p1:subscribe({
			next = function(_, p2)
				-- upvalues: pushValue (ref)
				pushValue(p2)
			end,
			error = function(_, p2)
				-- upvalues: pushError (ref)
				pushError(p2)
			end,
			complete = function(_)
				-- upvalues: pushDone (ref)
				pushDone()
			end
		})
		
		local function emptyQueue()
			-- upvalues: boolean (copy), var1 (write), var2 (ref), t (ref), t_1 (ref)
			if boolean.toJSBoolean(var1) then
				var1 = false
				var2:unsubscribe()
				
				for i, v in t do
					v({ value = nil, done = true })
				end
				t.length = 0
				t_1.length = 0
			end
		end
		
		return {
			next = function(p2)
				-- upvalues: boolean (copy), var1 (write), t_1 (ref), t (ref)
				return if boolean.toJSBoolean(var1) then Promise.new(function(p3)
					-- upvalues: t_1 (copy), t (copy)
					if t_1.length == 0 then
						table.insert(t, p3)
						
						return
					end
					p3(table.remove(t_1, 1))
				end) else p2["return"]()
			end,
			["return"] = function(_)
				-- upvalues: emptyQueue (ref)
				emptyQueue()
				
				return Promise.resolve({ value = nil, done = true })
			end,
			throw = function(_, p2)
				-- upvalues: emptyQueue (ref)
				emptyQueue()
				
				return Promise.reject(p2)
			end,
			[tostring(Symbol.asyncIterator)] = function(p2)
				return p2
			end
		}
	end
}