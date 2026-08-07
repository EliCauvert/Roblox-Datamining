local reactModule = require(script:FindFirstAncestor("SduiSharedContent").Parent.React)
local luaAppSduiVerticalFeedThresholdRefresh = game:DefineFastFlag("LuaAppSduiVerticalFeedThresholdRefresh", false)

return function(p0, p1, p2) --[[ line: 8 | named "useVerticalScrolledToEndThreshold" ]]
	-- upvalues: reactModule (ref), luaAppSduiVerticalFeedThresholdRefresh (ref)
	local var2 = reactModule.useRef(false)
	local var3 = nil
	
	if luaAppSduiVerticalFeedThresholdRefresh then
		var3 = reactModule.useRef(p2)
		var3.current = p2
		
		if p2 == nil then
			p1 = nil
		end
	end
	reactModule.useEffect(function() --[[ line: 29 ]]
		-- upvalues: luaAppSduiVerticalFeedThresholdRefresh (copy), p2 (ref), p1 (write), p0 (ref), var2 (ref), var3 (write)
		if not luaAppSduiVerticalFeedThresholdRefresh and p2 == nil or (p1 == nil or p0.current == nil) then
			return nil
		end
		local t = {}
		local current = p0.current
		
		local function checkThreshold() --[[ line: 41 ]]
			-- upvalues: current (ref), p1 (copy), var2 (copy), luaAppSduiVerticalFeedThresholdRefresh (copy), var3 (copy), p2 (copy)
			local var7 = current.AbsoluteCanvasSize.Y - current.AbsoluteWindowSize.Y - p1
			local y = current.CanvasPosition.Y
			
			if y < var7 and var2.current then
				var2.current = false
				
				return
			elseif var7 < y and not var2.current then
				var2.current = true
				
				if luaAppSduiVerticalFeedThresholdRefresh then
					if var3.current then
						var3.current()
						
						return
					end
				else
					p2()
				end
			end
		end
		
		table.insert(t, current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(checkThreshold))
		table.insert(t, current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(checkThreshold))
		table.insert(t, current:GetPropertyChangedSignal("CanvasPosition"):Connect(checkThreshold))
		local var6 = nil
		
		if luaAppSduiVerticalFeedThresholdRefresh then
			var6 = false
			task.defer(function() --[[ line: 73 ]]
				-- upvalues: var6 (write), checkThreshold (ref)
				if not var6 then
					checkThreshold()
				end
			end)
		end
		return function() --[[ line: 80 ]]
			-- upvalues: luaAppSduiVerticalFeedThresholdRefresh (copy), var6 (write), t (ref)
			if luaAppSduiVerticalFeedThresholdRefresh then
				var6 = true
			end
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {
		p0,
		p1,
		if luaAppSduiVerticalFeedThresholdRefresh then nil else p2
	})
end