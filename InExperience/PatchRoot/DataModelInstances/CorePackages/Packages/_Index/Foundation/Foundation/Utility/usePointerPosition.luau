local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local wrappersModule = require(foundation.Utility.Wrappers)
local signal = wrappersModule.Signal
local connection = wrappersModule.Connection

return function(p1)
	-- upvalues: reactModule (ref), signal (ref), connection (ref)
	local var1, var2 = reactModule.useBinding(Vector2.zero)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), signal (copy), connection (copy)
		if p1 then
			local function setPositionFromInput(a)
				-- upvalues: var2 (copy)
				if a.Position.X > 0 or a.Position.Y > 0 then
					var2(Vector2.new(a.Position.X, a.Position.Y))
				end
			end
			
			local list = {
				signal.Connect(p1.InputBegan, setPositionFromInput),
				signal.Connect(p1.InputChanged, setPositionFromInput),
				signal.Connect(p1.InputEnded, setPositionFromInput)
			}
			
			return function()
				-- upvalues: list (ref), connection (copy)
				for i, v in list do
					connection.Disconnect(v)
				end
			end
		end
	end, { p1 })
	
	return var1
end