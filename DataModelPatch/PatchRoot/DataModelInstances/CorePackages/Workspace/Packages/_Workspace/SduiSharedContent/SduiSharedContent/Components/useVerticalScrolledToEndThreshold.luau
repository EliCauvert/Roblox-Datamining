local ReactModule = require(script:FindFirstAncestor("SduiSharedContent").Parent.React)
local LuaAppSduiVerticalFeedThresholdRefresh = game:DefineFastFlag("LuaAppSduiVerticalFeedThresholdRefresh", false)

return function(p1, p2, Callback)
	-- upvalues: ReactModule (copy), LuaAppSduiVerticalFeedThresholdRefresh (copy)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = nil
	
	if LuaAppSduiVerticalFeedThresholdRefresh then
		UseRefResult1 = ReactModule.useRef(Callback)
		UseRefResult1.current = Callback
		
		if Callback == nil then
			p2 = nil
		end
	end
	ReactModule.useEffect(function()
		-- upvalues: LuaAppSduiVerticalFeedThresholdRefresh (upval), Callback (copy), p2 (ref), p1 (copy), UseRefResult (copy), UseRefResult1 (ref)
		if not LuaAppSduiVerticalFeedThresholdRefresh and Callback == nil or (p2 == nil or p1.current == nil) then
			return nil
		end
		local List = {}
		local Current = p1.current
		
		local function checkThreshold()
			-- upvalues: Current (copy), p2 (upval), UseRefResult (upval), LuaAppSduiVerticalFeedThresholdRefresh (upval), UseRefResult1 (upval), Callback (upval)
			local YDelta = Current.AbsoluteCanvasSize.Y - Current.AbsoluteWindowSize.Y - p2
			local Y = Current.CanvasPosition.Y
			
			if Y < YDelta and UseRefResult.current then
				UseRefResult.current = false
				
				return
			end
			if YDelta < Y and not UseRefResult.current then
				UseRefResult.current = true
				
				if not LuaAppSduiVerticalFeedThresholdRefresh then
					Callback()
				elseif UseRefResult1.current then
					UseRefResult1.current()
					
					return
				end
			end
		end
		
		table.insert(List, Current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(checkThreshold))
		table.insert(List, Current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(checkThreshold))
		table.insert(List, Current:GetPropertyChangedSignal("CanvasPosition"):Connect(checkThreshold))
		local Flag: boolean? = nil
		
		if LuaAppSduiVerticalFeedThresholdRefresh then
			Flag = false
			task.defer(function()
				-- upvalues: Flag (ref), checkThreshold (copy)
				if not Flag then
					checkThreshold()
				end
			end)
		end
		return function()
			-- upvalues: LuaAppSduiVerticalFeedThresholdRefresh (upval), Flag (ref), List (copy)
			if LuaAppSduiVerticalFeedThresholdRefresh then
				Flag = true
			end
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, {
		p1,
		p2,
		if LuaAppSduiVerticalFeedThresholdRefresh then nil else Callback
	})
end