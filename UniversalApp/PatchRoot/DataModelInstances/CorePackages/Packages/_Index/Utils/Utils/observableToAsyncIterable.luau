local Boolean = require((nil).LuauPolyfill).Boolean

return {
	observableToAsyncIterable = function(p1) --[[ Line: 15 ]]
		-- upvalues: Boolean (copy)
		local List = {}
		local List1 = {}
		local Flag = true
		
		local function pushValue(Value) --[[ Line: 19 ]]
			-- upvalues: List (copy), List1 (copy)
			if List.length == 0 then
				table.insert(List1, { done = false, value = Value })
				
				return
			else
				table.remove(List, 1)({ done = false, value = Value })
			end
		end
		
		local function pushError(p2) --[[ Line: 30 ]]
			-- upvalues: List (copy), List1 (copy)
			if List.length == 0 then
				table.insert(List1, { done = false, value = { errors = { p2 } } })
				
				return
			else
				table.remove(List, 1)({ done = false, value = { errors = { p2 } } })
			end
		end
		
		local function pushDone() --[[ Line: 41 ]]
			-- upvalues: List (copy), List1 (copy)
			if List.length == 0 then
				table.insert(List1, { done = true })
				
				return
			else
				table.remove(List, 1)({ done = true })
			end
		end
		
		local function _() --[[ Line: 49 | Named "pullValue" ]]
			-- upvalues: List1 (copy), List (copy)
			return Promise.new(function(Callback: (any) -> ()) --[[ Line: 50 ]]
				-- upvalues: List1 (upval), List (upval)
				if List1.length == 0 then
					table.insert(List, Callback)
					
					return
				else
					Callback((table.remove(List1, 1)))
				end
			end)
		end
		
		local SubscribeResult = p1:subscribe({
			next = function(_, p2) --[[ Line: 60 ]]
				-- upvalues: pushValue (copy)
				pushValue(p2)
			end,
			error = function(_, p2) --[[ Line: 63 ]]
				-- upvalues: pushError (copy)
				pushError(p2)
			end,
			complete = function(_) --[[ Line: 66 ]]
				-- upvalues: pushDone (copy)
				pushDone()
			end
		})
		
		local function emptyQueue() --[[ Line: 70 ]]
			-- upvalues: Boolean (upval), Flag (ref), SubscribeResult (copy), List (copy), List1 (copy)
			if Boolean.toJSBoolean(Flag) then
				Flag = false
				SubscribeResult:unsubscribe()
				
				for _, value in List do
					value({ value = nil, done = true })
				end
				List.length = 0
				List1.length = 0
			end
		end
		
		return {
			next = function(p2) --[[ Line: 82 ]]
				-- upvalues: Boolean (upval), Flag (ref), List1 (copy), List (copy)
				return if Boolean.toJSBoolean(Flag) then Promise.new(function(Callback: (any) -> ()) --[[ Line: 50 ]]
					-- upvalues: List1 (upval), List (upval)
					if List1.length == 0 then
						table.insert(List, Callback)
						
						return
					else
						Callback((table.remove(List1, 1)))
					end
				end) else p2["return"]()
			end,
			["return"] = function(_) --[[ Line: 86 ]]
				-- upvalues: emptyQueue (copy)
				emptyQueue()
				
				return Promise.resolve({ value = nil, done = true })
			end,
			throw = function(_, p2) --[[ Line: 90 ]]
				-- upvalues: emptyQueue (copy)
				emptyQueue()
				
				return Promise.reject(p2)
			end,
			[tostring(Symbol.asyncIterator)] = function(p2) --[[ Line: 94 ]]
				return p2
			end
		}
	end
}