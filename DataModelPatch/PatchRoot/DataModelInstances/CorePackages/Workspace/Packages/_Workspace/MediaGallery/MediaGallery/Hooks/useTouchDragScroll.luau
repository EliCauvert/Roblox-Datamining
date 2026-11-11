local UserInputService = game:GetService("UserInputService")
local MediaGallery = script:FindFirstAncestor("MediaGallery")
local ReactModule = require(MediaGallery.Parent.React)
local _ = require(MediaGallery.MediaGalleryTypes)

return function(p1, Callback)
	-- upvalues: ReactModule (copy), UserInputService (copy)
	ReactModule.useEffect(function()
		-- upvalues: UserInputService (upval), p1 (copy), Callback (copy)
		local Flag = false
		local TouchStartedConnection = UserInputService.TouchStarted:Connect(function(Touch)
			-- upvalues: p1 (upval), Flag (ref)
			local Current = p1.current
			
			if Current then
				local AbsolutePosition = Current.AbsolutePosition
				local AbsoluteSize = Current.AbsoluteSize
				
				if AbsolutePosition.X <= Touch.Position.X and Touch.Position.X <= AbsolutePosition.X + AbsoluteSize.X and AbsolutePosition.Y <= Touch.Position.Y and Touch.Position.Y <= AbsolutePosition.Y + AbsoluteSize.Y then
					Flag = true
				end
			end
		end)
		local TouchEndedConnection = UserInputService.TouchEnded:Connect(function()
			-- upvalues: Flag (ref)
			Flag = false
		end)
		local TouchDragConnection = UserInputService.TouchDrag:Connect(function(SwipeDirection)
			-- upvalues: Flag (ref), Callback (upval)
			if Flag then
				if SwipeDirection == Enum.SwipeDirection.Right then
					Callback("Left")
					
					return
				end
				if SwipeDirection == Enum.SwipeDirection.Left then
					Callback("Right")
				end
			end
		end)
		
		return function()
			-- upvalues: TouchStartedConnection (copy), TouchEndedConnection (copy), TouchDragConnection (copy)
			TouchStartedConnection:Disconnect()
			TouchEndedConnection:Disconnect()
			TouchDragConnection:Disconnect()
		end
	end, { Callback, p1 })
end