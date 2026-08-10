local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local chatScrollModule = require(script.Parent.chatScroll)

return function() --[[ line: 30 | named "useChatScroll" ]]
	-- upvalues: reactModule (ref), chatScrollModule (ref)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(true)
	local var5 = reactModule.useRef(true)
	local var6 = reactModule.useRef(0)
	local var7 = reactModule.useRef(false)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useCallback(function() --[[ line: 39 ]]
		-- upvalues: var5 (ref), var8 (ref)
		if var5.current and var8.current ~= nil then
			var8.current()
		end
	end, {})
	local var10 = reactModule.useCallback(function() --[[ line: 45 ]]
		-- upvalues: var3 (ref)
		local current = var3.current
		
		if current then
			current.canvasPosition:Disconnect()
			current.canvasSize:Disconnect()
			current.windowSize:Disconnect()
			var3.current = nil
		end
	end, {})
	local var11 = reactModule.useCallback(function() --[[ line: 55 ]]
		-- upvalues: var2 (ref), var6 (ref), chatScrollModule (copy), var4 (ref), var5 (ref)
		local current = var2.current
		
		if current then
			var6.current = chatScrollModule.getDistanceFromBottom(current)
			var4.current = chatScrollModule.isScrolledToBottom(current)
			var5.current = chatScrollModule.isScrolledToTop(current)
		end
	end, {})
	local var12 = reactModule.useCallback(function() --[[ line: 64 ]]
		-- upvalues: var11 (ref), var7 (ref), var4 (ref), var9 (ref)
		var11()
		
		if var7.current and not var4.current then
			var7.current = false
		end
		var9()
	end, { var9, var11 })
	local var13 = reactModule.useCallback(function() --[[ line: 72 ]]
		-- upvalues: var2 (ref)
		local current = var2.current
		
		return current ~= nil and current.AbsoluteCanvasSize.Y <= current.AbsoluteWindowSize.Y
	end, {})
	local var14 = reactModule.useCallback(function() --[[ line: 77 ]]
		-- upvalues: var2 (ref), chatScrollModule (copy), var6 (ref), var11 (ref)
		local current = var2.current
		
		if current then
			chatScrollModule.syncScrollFromBottom(current, var6.current)
			var11()
		end
	end, { var11 })
	local var15 = reactModule.useCallback(function() --[[ line: 85 ]]
		-- upvalues: var2 (ref)
		local current = var2.current
		
		if current then
			current.CanvasPosition = Vector2.new(0, 9007199254740992)
		end
	end, {})
	local var16 = reactModule.useCallback(function() --[[ line: 92 ]]
		-- upvalues: var4 (ref), var14 (ref)
		if var4.current then
			var14()
		end
	end, { var14 })
	local var17 = reactModule.useCallback(function() --[[ line: 98 ]]
		-- upvalues: var11 (ref)
		var11()
	end, { var11 })
	local var18 = reactModule.useCallback(function(p0) --[[ line: 103 ]]
		-- upvalues: var2 (ref), var10 (ref), var7 (ref), var15 (ref), var11 (ref), var14 (ref), var3 (ref), var12 (ref)
		if var2.current == p0 then return end
		var10()
		var2.current = p0
		
		if not p0 then return end
		if var7.current then
			var15()
		else
			var11()
			var14()
			task.defer(var14)
		end
		local function onScrollViewportChanged() --[[ line: 123 ]]
			-- upvalues: var7 (copy), var15 (copy), var14 (copy)
			if var7.current then
				var15()
				
				return
			end
			var14()
			task.defer(var14)
		end
		
		var3.current = {
			canvasPosition = p0:GetPropertyChangedSignal("CanvasPosition"):Connect(var12),
			canvasSize = p0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(onScrollViewportChanged),
			windowSize = p0:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(onScrollViewportChanged)
		}
	end, {
		var10,
		var15,
		var14,
		var11,
		var12
	})
	local var19 = reactModule.useCallback(function() --[[ line: 153 ]]
		-- upvalues: var6 (ref), var4 (ref), var7 (ref), var15 (ref)
		var6.current = 0
		var4.current = true
		var7.current = true
		var15()
	end, { var15 })
	local var20 = reactModule.useCallback(function() --[[ line: 160 ]]
		-- upvalues: var11 (ref)
		var11()
	end, { var11 })
	local var21 = reactModule.useCallback(function() --[[ line: 164 ]]
		-- upvalues: var4 (ref), var6 (ref), var14 (ref)
		if var4.current then
			var6.current = 0
			var14()
		end
	end, { var14 })
	local var22 = reactModule.useCallback(function() --[[ line: 171 ]]
		-- upvalues: var6 (ref), var4 (ref), var14 (ref)
		var6.current = 0
		var4.current = true
		var14()
		task.defer(var14)
	end, { var14 })
	local var23 = reactModule.useCallback(function(p1) --[[ line: 178 ]]
		-- upvalues: var8 (ref), var9 (ref)
		var8.current = p1
		task.defer(var9)
	end, { var9 })
	reactModule.useEffect(function() --[[ line: 183 ]]
		-- upvalues: var10 (ref)
		return var10
	end, { var10 })
	
	return reactModule.useMemo(function() --[[ line: 188 ]]
		-- upvalues: var18 (ref), var19 (ref), var16 (ref), var17 (ref), var20 (ref), var21 (ref), var22 (ref), var13 (ref), var4 (ref), var5 (ref), var23 (ref)
		return {
			setScrollingFrame = var18,
			lockToBottom = var19,
			scrollToBottomIfNeeded = var16,
			captureDistanceFromBottom = var17,
			captureStickToBottomForSend = var20,
			scrollToBottomAfterSend = var21,
			scrollToBottomUnconditionally = var22,
			isViewportUnderfilled = var13,
			isAtBottomRef = var4,
			isAtTopRef = var5,
			setOnScrolledToTop = var23
		}
	end, {
		var18, var19, var16, var17, var20, var21, var22, var13, var23
	})
end