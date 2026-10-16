local ReactModule = require(script:FindFirstAncestor("SduiSharedContent").Parent.React)
local SduiFeedCacheScrollExtents = game:DefineFastFlag("SduiFeedCacheScrollExtents", false)

return function(p1, p2, Current) --[[ Line: 8 | Named "useVerticalScrolledToEndThreshold" ]]
	-- upvalues: ReactModule (copy), SduiFeedCacheScrollExtents (copy)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(Current)
	UseRefResult1.current = Current
	
	if Current == nil then
		p2 = nil
	end
	ReactModule.useEffect(function() --[[ Line: 26 ]]
		-- upvalues: p2 (ref), p1 (copy), SduiFeedCacheScrollExtents (upval), UseRefResult (copy), UseRefResult1 (copy)
		if p2 == nil or p1.current == nil then
			return nil
		end
		local List = {}
		local Current = p1.current
		local Callback = nil
		
		if SduiFeedCacheScrollExtents then
			local Y = Current.AbsoluteCanvasSize.Y
			local Y1 = Current.AbsoluteWindowSize.Y
			
			local function _() --[[ Line: 45 | Named "refreshSizes" ]]
				-- upvalues: Y (ref), Current (copy), Y1 (ref)
				Y = Current.AbsoluteCanvasSize.Y
				Y1 = Current.AbsoluteWindowSize.Y
			end
			
			local function evaluateThreshold() --[[ Line: 51 ]]
				-- upvalues: Y (ref), Y1 (ref), p2 (upval), Current (copy), UseRefResult (upval), UseRefResult1 (upval)
				local YDelta = Y - Y1 - p2
				local Y2 = Current.CanvasPosition.Y
				
				if Y2 < YDelta and UseRefResult.current then
					UseRefResult.current = false
					
					return
				end
				if YDelta < Y2 and not UseRefResult.current then
					UseRefResult.current = true
					
					if UseRefResult1.current then
						UseRefResult1.current()
					end
				end
			end
			
			local function refreshSizesAndEvaluate() --[[ Line: 65 ]]
				-- upvalues: Y (ref), Current (copy), Y1 (ref), p2 (upval), UseRefResult (upval), UseRefResult1 (upval)
				Y = Current.AbsoluteCanvasSize.Y
				Y1 = Current.AbsoluteWindowSize.Y
				local YDelta = Y - Y1 - p2
				local Y2 = Current.CanvasPosition.Y
				
				if Y2 < YDelta and UseRefResult.current then
					UseRefResult.current = false
					
					return
				end
				if YDelta < Y2 and not UseRefResult.current then
					UseRefResult.current = true
					
					if UseRefResult1.current then
						UseRefResult1.current()
					end
				end
			end
			
			table.insert(List, Current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(refreshSizesAndEvaluate))
			table.insert(List, Current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(refreshSizesAndEvaluate))
			table.insert(List, Current:GetPropertyChangedSignal("CanvasPosition"):Connect(evaluateThreshold))
			Callback = refreshSizesAndEvaluate
		else
			local function checkThreshold() --[[ Line: 85 ]]
				-- upvalues: Current (copy), p2 (upval), UseRefResult (upval), UseRefResult1 (upval)
				local YDelta = Current.AbsoluteCanvasSize.Y - Current.AbsoluteWindowSize.Y - p2
				local Y = Current.CanvasPosition.Y
				
				if Y < YDelta and UseRefResult.current then
					UseRefResult.current = false
					
					return
				end
				if YDelta < Y and not UseRefResult.current then
					UseRefResult.current = true
					
					if UseRefResult1.current then
						UseRefResult1.current()
					end
				end
			end
			
			table.insert(List, Current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(checkThreshold))
			table.insert(List, Current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(checkThreshold))
			table.insert(List, Current:GetPropertyChangedSignal("CanvasPosition"):Connect(checkThreshold))
			Callback = checkThreshold
		end
		local Flag = false
		task.defer(function() --[[ Line: 117 ]]
			-- upvalues: Flag (ref), Callback (ref)
			if not Flag then
				Callback()
			end
		end)
		
		return function() --[[ Line: 123 ]]
			-- upvalues: Flag (ref), List (copy)
			Flag = true
			
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, { p1, p2 })
end