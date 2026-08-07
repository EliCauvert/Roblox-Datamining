local userInputService = game:GetService("UserInputService")
local mediaGallery = script:FindFirstAncestor("MediaGallery")
local reactModule = require(mediaGallery.Parent.React)
local _ = require(mediaGallery.MediaGalleryTypes)

return function(value, p0) --[[ line: 15 | named "useTouchDragScroll" ]]
	-- upvalues: reactModule (ref), userInputService (ref)
	reactModule.useEffect(function() --[[ line: 19 ]]
		-- upvalues: userInputService (copy), value (ref), p0 (ref)
		local var3 = false
		local touchStartedConnection = userInputService.TouchStarted:Connect(function(p1) --[[ line: 22 ]]
			-- upvalues: value (copy), var3 (write)
			local current = value.current
			
			if current then
				local absolutePosition = current.AbsolutePosition
				local absoluteSize = current.AbsoluteSize
				
				if absolutePosition.X <= p1.Position.X and p1.Position.X <= absolutePosition.X + absoluteSize.X and (absolutePosition.Y <= p1.Position.Y and p1.Position.Y <= absolutePosition.Y + absoluteSize.Y) then
					var3 = true
				end
			end
		end)
		local touchEndedConnection = userInputService.TouchEnded:Connect(function() --[[ line: 38 ]]
			-- upvalues: var3 (write)
			var3 = false
		end)
		local touchDragConnection = userInputService.TouchDrag:Connect(function(p2) --[[ line: 42 ]]
			-- upvalues: var3 (write), p0 (copy)
			if var3 then
				if p2 == Enum.SwipeDirection.Right then
					p0("Left")
					
					return
				elseif p2 == Enum.SwipeDirection.Left then
					p0("Right")
				end
			end
		end)
		
		return function() --[[ line: 52 ]]
			-- upvalues: touchStartedConnection (ref), touchEndedConnection (ref), touchDragConnection (ref)
			touchStartedConnection:Disconnect()
			touchEndedConnection:Disconnect()
			touchDragConnection:Disconnect()
		end
	end, { p0, value })
end