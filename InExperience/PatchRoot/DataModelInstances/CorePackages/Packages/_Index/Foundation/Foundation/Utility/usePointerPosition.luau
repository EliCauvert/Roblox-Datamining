local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local WrappersModule = require(Foundation.Utility.Wrappers)
local Signal = WrappersModule.Signal
local Connection = WrappersModule.Connection

return function(p1) --[[ Line: 10 | Named "usePointerPosition" ]]
	-- upvalues: ReactModule (copy), Signal (copy), Connection (copy)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.zero)
	ReactModule.useEffect(function() --[[ Line: 13 ]]
		-- upvalues: p1 (copy), UseBindingResult2 (copy), Signal (upval), Connection (upval)
		if not p1 then return end
		local function setPositionFromInput(p2) --[[ Line: 18 ]]
			-- upvalues: UseBindingResult2 (upval)
			if p2.Position.X > 0 or p2.Position.Y > 0 then
				UseBindingResult2(Vector2.new(p2.Position.X, p2.Position.Y))
			end
		end
		
		local list = {
			Signal.Connect(p1.InputBegan, setPositionFromInput),
			Signal.Connect(p1.InputChanged, setPositionFromInput),
			Signal.Connect(p1.InputEnded, setPositionFromInput)
		}
		
		return function() --[[ Line: 30 ]]
			-- upvalues: list (copy), Connection (upval)
			for _, value in list do
				Connection.Disconnect(value)
			end
		end
	end, { p1 })
	
	return UseBindingResult
end