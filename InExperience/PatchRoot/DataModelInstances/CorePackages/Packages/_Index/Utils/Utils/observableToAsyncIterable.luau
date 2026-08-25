local boolean = require((nil).LuauPolyfill).Boolean

return {
	observableToAsyncIterable = function(p0)
		-- upvalues: boolean (ref)
		local t = {}
		local t_1 = {}
		local var2 = true
		
		local function pushValue(p1)
			-- upvalues: t (ref), t_1 (ref)
			if t.length == 0 then
				table.insert(t_1, { done = false, value = p1 })
				
				return
			end
			table.remove(t, 1)({ done = false, value = p1 })
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
			return Promise.new(function(p3)
				-- upvalues: t_1 (copy), t (copy)
				if t_1.length == 0 then
					table.insert(t, p3)
					
					return
				end
				p3(table.remove(t_1, 1))
			end)
		end
		
		local var6 = p0:subscribe({
			next = function(_, p4)
				-- upvalues: pushValue (ref)
				pushValue(p4)
			end,
			error = function(_, p5)
				-- upvalues: pushError (ref)
				pushError(p5)
			end,
			complete = function(_)
				-- upvalues: pushDone (ref)
				pushDone()
			end
		})
		
		local function emptyQueue()
			-- upvalues: boolean (copy), var2 (write), var6 (ref), t (ref), t_1 (ref)
			if boolean.toJSBoolean(var2) then
				var2 = false
				var6:unsubscribe()
				
				for i, v in t do
					v({ value = nil, done = true })
				end
				t.length = 0
				t_1.length = 0
			end
		end
		
		return {
			next = function(p6)
				-- upvalues: boolean (copy), var2 (write), t_1 (ref), t (ref)
				return if boolean.toJSBoolean(var2) then Promise.new(function(p7)
					-- upvalues: t_1 (copy), t (copy)
					if t_1.length == 0 then
						table.insert(t, p7)
						
						return
					end
					p7(table.remove(t_1, 1))
				end) else p6["return"]()
			end,
			["return"] = function(_)
				-- upvalues: emptyQueue (ref)
				emptyQueue()
				
				return Promise.resolve({ value = nil, done = true })
			end,
			throw = function(_, p8)
				-- upvalues: emptyQueue (ref)
				emptyQueue()
				
				return Promise.reject(p8)
			end,
			[tostring(Symbol.asyncIterator)] = function(p9)
				return p9
			end
		}
	end
}