local ReactModule = require(script:FindFirstAncestor("CollectionViews").Parent.React)

return function(p1, p2, Callback, p3)
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: p3 (copy), p1 (copy), Callback (copy), p2 (copy), UseRefResult (copy)
		if not p3 then
			return nil
		end
		local List = {}
		
		if p1.current ~= nil and (Callback ~= nil and p2 ~= nil) then
			local Current = p1.current
			
			local function _()
				-- upvalues: Current (copy), p2 (upval), UseRefResult (upval), Callback (upval)
				local XDelta = Current.AbsoluteCanvasSize.X - Current.AbsoluteWindowSize.X - p2
				local X = Current.CanvasPosition.X
				
				if X < XDelta and UseRefResult.current then
					UseRefResult.current = false
					
					return
				end
				if XDelta < X and not UseRefResult.current then
					UseRefResult.current = true
					Callback()
				end
			end
			
			table.insert(List, Current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
				-- upvalues: Current (copy), p2 (upval), UseRefResult (upval), Callback (upval)
				local XDelta = Current.AbsoluteCanvasSize.X - Current.AbsoluteWindowSize.X - p2
				local X = Current.CanvasPosition.X
				
				if X < XDelta and UseRefResult.current then
					UseRefResult.current = false
					
					return
				end
				if XDelta < X and not UseRefResult.current then
					UseRefResult.current = true
					Callback()
				end
			end))
			table.insert(List, Current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function()
				-- upvalues: Current (copy), p2 (upval), UseRefResult (upval), Callback (upval)
				local XDelta = Current.AbsoluteCanvasSize.X - Current.AbsoluteWindowSize.X - p2
				local X = Current.CanvasPosition.X
				
				if X < XDelta and UseRefResult.current then
					UseRefResult.current = false
					
					return
				end
				if XDelta < X and not UseRefResult.current then
					UseRefResult.current = true
					Callback()
				end
			end))
			table.insert(List, Current:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				-- upvalues: Current (copy), p2 (upval), UseRefResult (upval), Callback (upval)
				local XDelta = Current.AbsoluteCanvasSize.X - Current.AbsoluteWindowSize.X - p2
				local X = Current.CanvasPosition.X
				
				if X < XDelta and UseRefResult.current then
					UseRefResult.current = false
					
					return
				end
				if XDelta < X and not UseRefResult.current then
					UseRefResult.current = true
					Callback()
				end
			end))
			local XDelta = Current.AbsoluteCanvasSize.X - Current.AbsoluteWindowSize.X - p2
			local X = Current.CanvasPosition.X
			
			if X < XDelta and UseRefResult.current then
				UseRefResult.current = false
			elseif XDelta < X and not UseRefResult.current then
				UseRefResult.current = true
				Callback()
			end
		end
		return function()
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, { p1, p3, p2, Callback })
end