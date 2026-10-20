local UserInputService = game:GetService("UserInputService")
local ReactModule = require(script.Parent.Parent.Parent.React)

return function(Frame)
	-- upvalues: ReactModule (copy), UserInputService (copy)
	local Ref = ReactModule.createRef()
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), UserInputService (upval), Ref (copy), UseStateResult2 (copy), UseStateResult (copy)
		if Frame.swipeEnabled and Frame.swipeCallback then
			local TouchStartedConnection = UserInputService.TouchStarted:Connect(function(Touch)
				-- upvalues: Ref (upval), UseStateResult2 (upval)
				local Current = Ref and Ref.current
				
				if not Current then return end
				local VectorDelta = Vector2.new(Touch.Position.X, Touch.Position.Y) - Current.AbsolutePosition
				
				if VectorDelta.X >= 0 and VectorDelta.Y >= 0 and VectorDelta.X <= Current.AbsoluteSize.X and VectorDelta.Y <= Current.AbsoluteSize.Y then
					UseStateResult2(true)
				end
			end)
			local TouchEndedConnection = UserInputService.TouchEnded:Connect(function()
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(false)
			end)
			local TouchSwipeConnection = if UseStateResult then UserInputService.TouchSwipe:Connect(function(SwipeDirection)
				-- upvalues: UseStateResult (upval), Frame (upval)
				if UseStateResult then
					Frame.swipeCallback(SwipeDirection)
				end
			end) else nil
			
			return function()
				-- upvalues: TouchStartedConnection (copy), TouchEndedConnection (copy), TouchSwipeConnection (copy)
				TouchStartedConnection:Disconnect()
				TouchEndedConnection:Disconnect()
				
				if TouchSwipeConnection then
					TouchSwipeConnection:Disconnect()
				end
			end
		else
			UseStateResult2(false)
			
			return nil
		end
	end, {
		Frame.swipeEnabled,
		Frame.swipeCallback,
		Ref,
		UseStateResult
	})
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Active = true,
		Size = Frame.Size,
		AutomaticSize = Frame.AutomaticSize,
		ref = Ref
	}, Frame.children)
end