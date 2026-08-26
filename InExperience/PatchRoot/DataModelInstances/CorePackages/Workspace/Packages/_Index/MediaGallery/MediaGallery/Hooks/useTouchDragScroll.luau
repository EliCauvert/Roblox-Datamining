local userInputService = game:GetService("UserInputService")
local mediaGallery = script:FindFirstAncestor("MediaGallery")
local reactModule = require(mediaGallery.Parent.React)
local _ = require(mediaGallery.MediaGalleryTypes)

return function(value, p1)
	-- upvalues: reactModule (ref), userInputService (ref)
	reactModule.useEffect(function()
		-- upvalues: userInputService (copy), value (ref), p1 (ref)
		local var1 = false
		local touchStartedConnection = userInputService.TouchStarted:Connect(function(p2)
			-- upvalues: value (copy), var1 (write)
			local current = value.current
			
			if current then
				local absolutePosition = current.AbsolutePosition
				local absoluteSize = current.AbsoluteSize
				
				if absolutePosition.X <= p2.Position.X and p2.Position.X <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= p2.Position.Y and p2.Position.Y <= absolutePosition.Y + absoluteSize.Y) then
					var1 = true
				end
			end
		end)
		local touchEndedConnection = userInputService.TouchEnded:Connect(function()
			-- upvalues: var1 (write)
			var1 = false
		end)
		local touchDragConnection = userInputService.TouchDrag:Connect(function(p2)
			-- upvalues: var1 (write), p1 (copy)
			if var1 then
				if p2 == Enum.SwipeDirection.Right then
					p1("Left")
					
					return
				elseif p2 == Enum.SwipeDirection.Left then
					p1("Right")
				end
			end
		end)
		
		return function()
			-- upvalues: touchStartedConnection (ref), touchEndedConnection (ref), touchDragConnection (ref)
			touchStartedConnection:Disconnect()
			touchEndedConnection:Disconnect()
			touchDragConnection:Disconnect()
		end
	end, { p1, value })
end