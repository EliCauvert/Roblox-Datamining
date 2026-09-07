local reactModule = require(script:FindFirstAncestor("SduiSharedContent").Parent.React)
local luaAppSduiVerticalFeedThresholdRefresh = game:DefineFastFlag("LuaAppSduiVerticalFeedThresholdRefresh", false)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), luaAppSduiVerticalFeedThresholdRefresh (ref)
	local var1 = reactModule.useRef(false)
	local var2 = nil
	
	if luaAppSduiVerticalFeedThresholdRefresh then
		var2 = reactModule.useRef(p3)
		var2.current = p3
		
		if p3 == nil then
			p2 = nil
		end
	end
	reactModule.useEffect(function()
		-- upvalues: luaAppSduiVerticalFeedThresholdRefresh (copy), p3 (ref), p2 (write), p1 (ref), var1 (ref), var2 (write)
		if not luaAppSduiVerticalFeedThresholdRefresh and p3 == nil or (p2 == nil or p1.current == nil) then
			return nil
		end
		local t = {}
		local current = p1.current
		
		local function checkThreshold()
			-- upvalues: current (ref), p2 (copy), var1 (copy), luaAppSduiVerticalFeedThresholdRefresh (copy), var2 (copy), p3 (copy)
			local var3 = current.AbsoluteCanvasSize.Y - current.AbsoluteWindowSize.Y - p2
			local y = current.CanvasPosition.Y
			
			if y < var3 and var1.current then
				var1.current = false
				
				return
			elseif var3 < y and not var1.current then
				var1.current = true
				
				if luaAppSduiVerticalFeedThresholdRefresh then
					if var2.current then
						var2.current()
						
						return
					end
				else
					p3()
				end
			end
		end
		
		table.insert(t, current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(checkThreshold))
		table.insert(t, current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(checkThreshold))
		table.insert(t, current:GetPropertyChangedSignal("CanvasPosition"):Connect(checkThreshold))
		local var3 = nil
		
		if luaAppSduiVerticalFeedThresholdRefresh then
			var3 = false
			task.defer(function()
				-- upvalues: var3 (write), checkThreshold (ref)
				if not var3 then
					checkThreshold()
				end
			end)
		end
		return function()
			-- upvalues: luaAppSduiVerticalFeedThresholdRefresh (copy), var3 (write), t (ref)
			if luaAppSduiVerticalFeedThresholdRefresh then
				var3 = true
			end
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {
		p1,
		p2,
		if luaAppSduiVerticalFeedThresholdRefresh then nil else p3
	})
end