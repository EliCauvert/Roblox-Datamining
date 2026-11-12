local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)
local GestureInputModule = require(script.Parent.gestureInput)

return function(Current, Callback, p1, p2)
	-- upvalues: ReactModule (copy), GestureInputModule (copy)
	local UseRefResult = ReactModule.useRef(Current)
	UseRefResult.current = Current
	local UseStateResult = ReactModule.useState(function()
		-- upvalues: Callback (copy), UseRefResult (copy)
		return Callback(UseRefResult)
	end)
	ReactModule.useEffect(function()
		-- upvalues: p2 (copy), GestureInputModule (upval), p1 (copy), UseStateResult (copy)
		if not p2 then return end
		local ConnectPointerResult = GestureInputModule.connectPointer({
			onBegan = function(p3)
				-- upvalues: p1 (upval), UseStateResult (upval)
				return p1.onInputBegan(UseStateResult, p3)
			end,
			onChanged = function(p3)
				-- upvalues: p1 (upval), UseStateResult (upval)
				p1.onInputChanged(UseStateResult, p3)
			end,
			onEnded = function(p3)
				-- upvalues: p1 (upval), UseStateResult (upval)
				return p1.onInputEnded(UseStateResult, p3)
			end
		})
		
		return function()
			-- upvalues: ConnectPointerResult (copy), p1 (upval), UseStateResult (upval)
			ConnectPointerResult()
			p1.reset(UseStateResult)
		end
	end, { p2 })
end