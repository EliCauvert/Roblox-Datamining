local userInputService = game:GetService("UserInputService")
local reactModule = require(script.Parent.Parent.Parent.React)

return function(p1)
	-- upvalues: reactModule (ref), userInputService (ref)
	local var1 = reactModule.createRef()
	local var2, var3 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), userInputService (copy), var1 (ref), var3 (ref), var2 (ref)
		if p1.swipeEnabled and p1.swipeCallback then
			local touchStartedConnection = userInputService.TouchStarted:Connect(function(p2)
				-- upvalues: var1 (copy), var3 (copy)
				local current = var1 and var1.current
				
				if not current then return end
				local var4 = Vector2.new(p2.Position.X, p2.Position.Y) - current.AbsolutePosition
				
				if var4.X >= 0 and var4.Y >= 0 and (var4.X <= current.AbsoluteSize.X and var4.Y <= current.AbsoluteSize.Y) then
					var3(true)
				end
			end)
			local touchEndedConnection = userInputService.TouchEnded:Connect(function()
				-- upvalues: var3 (copy)
				var3(false)
			end)
			local var4 = if var2 then userInputService.TouchSwipe:Connect(function(p2)
				-- upvalues: var2 (copy), p1 (copy)
				if var2 then
					p1.swipeCallback(p2)
				end
			end) else nil
			
			return function()
				-- upvalues: touchStartedConnection (ref), touchEndedConnection (ref), var4 (ref)
				touchStartedConnection:Disconnect()
				touchEndedConnection:Disconnect()
				
				if var4 then
					var4:Disconnect()
				end
			end
		end
		var3(false)
		
		return nil
	end, { p1.swipeEnabled, p1.swipeCallback, var1, var2 })
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Active = true,
		Size = p1.Size,
		AutomaticSize = p1.AutomaticSize,
		ref = var1
	}, p1.children)
end