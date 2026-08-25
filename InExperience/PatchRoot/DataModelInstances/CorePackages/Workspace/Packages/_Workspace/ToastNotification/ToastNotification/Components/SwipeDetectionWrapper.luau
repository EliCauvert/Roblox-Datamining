local userInputService = game:GetService("UserInputService")
local reactModule = require(script.Parent.Parent.Parent.React)

return function(p0)
	-- upvalues: reactModule (ref), userInputService (ref)
	local var2 = reactModule.createRef()
	local var3, var4 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), userInputService (copy), var2 (ref), var4 (ref), var3 (ref)
		if p0.swipeEnabled and p0.swipeCallback then
			local touchStartedConnection = userInputService.TouchStarted:Connect(function(p1)
				-- upvalues: var2 (copy), var4 (copy)
				local current = var2 and var2.current
				
				if not current then return end
				local var9 = Vector2.new(p1.Position.X, p1.Position.Y) - current.AbsolutePosition
				
				if var9.X >= 0 and var9.Y >= 0 and (var9.X <= current.AbsoluteSize.X and var9.Y <= current.AbsoluteSize.Y) then
					var4(true)
				end
			end)
			local touchEndedConnection = userInputService.TouchEnded:Connect(function()
				-- upvalues: var4 (copy)
				var4(false)
			end)
			local var7 = if var3 then userInputService.TouchSwipe:Connect(function(p2)
				-- upvalues: var3 (copy), p0 (copy)
				if var3 then
					p0.swipeCallback(p2)
				end
			end) else nil
			
			return function()
				-- upvalues: touchStartedConnection (ref), touchEndedConnection (ref), var7 (ref)
				touchStartedConnection:Disconnect()
				touchEndedConnection:Disconnect()
				
				if var7 then
					var7:Disconnect()
				end
			end
		end
		var4(false)
		
		return nil
	end, { p0.swipeEnabled, p0.swipeCallback, var2, var3 })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Active = true,
		Size = p0.Size,
		AutomaticSize = p0.AutomaticSize,
		ref = var2
	}, p0.children)
end