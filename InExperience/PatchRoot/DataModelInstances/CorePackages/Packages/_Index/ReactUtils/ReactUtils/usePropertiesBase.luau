local Parent = script:FindFirstAncestor("ReactUtils").Parent
local ReactModule = require(Parent.React)
local Array = require(Parent.LuauPolyfill).Array
local UseForwardRefModule = require(script.Parent.useForwardRef)

return function(p1, Callback, p2, ...) --[[ Line: 15 | Named "usePropertiesBase" ]]
	-- upvalues: Array (copy), ReactModule (copy), UseForwardRefModule (copy)
	local ConcatResult = Array.concat({}, ...)
	
	return UseForwardRefModule(p1, (ReactModule.useCallback(function(Object) --[[ Line: 23 ]]
		-- upvalues: Callback (copy), Array (upval), ConcatResult (copy), p2 (copy)
		local function onPropChange() --[[ Line: 24 ]]
			-- upvalues: Callback (upval), Array (upval), ConcatResult (upval), Object (copy)
			Callback(table.unpack(Array.map(ConcatResult, function(p3) --[[ Line: 25 ]]
				-- upvalues: Object (upval)
				return Object[p3]
			end)))
		end
		
		local DeferredThread = nil
		
		local function v7() --[[ Line: 31 ]]
			-- upvalues: DeferredThread (ref), Callback (upval), Array (upval), ConcatResult (upval), Object (copy)
			if not DeferredThread then
				DeferredThread = task.defer(function() --[[ Line: 33 ]]
					-- upvalues: DeferredThread (upval), Callback (upval), Array (upval), ConcatResult (upval), Object (upval)
					DeferredThread = nil
					Callback(table.unpack(Array.map(ConcatResult, function(p3) --[[ Line: 25 ]]
						-- upvalues: Object (upval)
						return Object[p3]
					end)))
				end)
			end
		end
		
		local MapResult = Array.map(ConcatResult, function(PropertyName) --[[ Line: 39 ]]
			-- upvalues: Object (copy), p2 (upval), v7 (copy), onPropChange (copy)
			return Object:GetPropertyChangedSignal(PropertyName):Connect(if p2 then v7 else onPropChange)
		end)
		Callback(table.unpack(Array.map(ConcatResult, function(p3) --[[ Line: 25 ]]
			-- upvalues: Object (copy)
			return Object[p3]
		end)))
		
		return function() --[[ Line: 45 ]]
			-- upvalues: MapResult (copy), DeferredThread (ref)
			for _, Connection in MapResult do
				Connection:Disconnect()
			end
			if DeferredThread then
				task.cancel(DeferredThread)
			end
		end
	end, { Callback, table.concat(ConcatResult, ",") })))
end