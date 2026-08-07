local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local wrappersModule = require(foundation.Utility.Wrappers)
local signal = wrappersModule.Signal
local connection = wrappersModule.Connection

return function(p0) --[[ line: 10 | named "usePointerPosition" ]]
	-- upvalues: reactModule (ref), signal (ref), connection (ref)
	local var3, var4 = reactModule.useBinding(Vector2.zero)
	reactModule.useEffect(function() --[[ line: 13 ]]
		-- upvalues: p0 (ref), var4 (ref), signal (copy), connection (copy)
		if p0 then
			local function setPositionFromInput(a) --[[ line: 18 ]]
				-- upvalues: var4 (copy)
				if a.Position.X > 0 or a.Position.Y > 0 then
					var4(Vector2.new(a.Position.X, a.Position.Y))
				end
			end
			
			local list = {
				signal.Connect(p0.InputBegan, setPositionFromInput),
				signal.Connect(p0.InputChanged, setPositionFromInput),
				signal.Connect(p0.InputEnded, setPositionFromInput)
			}
			
			return function() --[[ line: 30 ]]
				-- upvalues: list (ref), connection (copy)
				for i, v in list do
					connection.Disconnect(v)
				end
			end
		end
	end, { p0 })
	
	return var3
end