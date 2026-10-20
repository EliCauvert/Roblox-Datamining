local Parent = script:FindFirstAncestor("CollectionViews").Parent
local ReactModule = require(Parent.React)
local FFlagCollectionViewMathChanges = require(Parent.SharedFlags).FFlagCollectionViewMathChanges

return function(p1, p2, Callback, p3)
	-- upvalues: ReactModule (copy), FFlagCollectionViewMathChanges (copy)
	local UseRefResult = ReactModule.useRef(false)
	ReactModule.useEffect(function()
		-- upvalues: p3 (copy), p1 (copy), FFlagCollectionViewMathChanges (upval), Callback (copy), p2 (copy), UseRefResult (copy)
		if not p3 then
			return nil
		end
		local List = {}
		
		if p1.current ~= nil and (FFlagCollectionViewMathChanges or Callback ~= nil and p2 ~= nil) then
			local Current = p1.current
			
			local function checkThreshold()
				-- upvalues: Current (copy), FFlagCollectionViewMathChanges (upval), p2 (upval), UseRefResult (upval), Callback (upval)
				local XDelta = Current.AbsoluteCanvasSize.X - Current.AbsoluteWindowSize.X - (if FFlagCollectionViewMathChanges then p2 or 0 else p2)
				local X = Current.CanvasPosition.X
				
				if X < XDelta and UseRefResult.current then
					UseRefResult.current = false
					
					return
				end
				if XDelta < X and not UseRefResult.current then
					UseRefResult.current = true
					
					if not FFlagCollectionViewMathChanges then
						Callback()
					elseif Callback then
						Callback()
						
						return
					end
				end
			end
			
			table.insert(List, Current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(function()
				-- upvalues: checkThreshold (copy)
				checkThreshold()
			end))
			table.insert(List, Current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(function()
				-- upvalues: checkThreshold (copy)
				checkThreshold()
			end))
			table.insert(List, Current:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
				-- upvalues: checkThreshold (copy)
				checkThreshold()
			end))
			checkThreshold()
		end
		return function()
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, { p1, p3, p2, Callback })
end