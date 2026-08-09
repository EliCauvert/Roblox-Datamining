local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local chatScrollModule = require(script.Parent.chatScroll)

return function() --[[ line: 29 | named "useChatScroll" ]]
	-- upvalues: reactModule (ref), chatScrollModule (ref)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(true)
	local var5 = reactModule.useRef(true)
	local var6 = reactModule.useRef(0)
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useCallback(function() --[[ line: 37 ]]
		-- upvalues: var5 (ref), var7 (ref)
		if var5.current and var7.current ~= nil then
			var7.current()
		end
	end, {})
	local var9 = reactModule.useCallback(function() --[[ line: 43 ]]
		-- upvalues: var3 (ref)
		local current = var3.current
		
		if current then
			current.canvasPosition:Disconnect()
			current.canvasSize:Disconnect()
			current.windowSize:Disconnect()
			var3.current = nil
		end
	end, {})
	local var10 = reactModule.useCallback(function() --[[ line: 53 ]]
		-- upvalues: var2 (ref), var6 (ref), chatScrollModule (copy), var4 (ref), var5 (ref)
		local current = var2.current
		
		if current then
			var6.current = chatScrollModule.getDistanceFromBottom(current)
			var4.current = chatScrollModule.isScrolledToBottom(current)
			var5.current = chatScrollModule.isScrolledToTop(current)
		end
	end, {})
	local var11 = reactModule.useCallback(function() --[[ line: 62 ]]
		-- upvalues: var10 (ref), var8 (ref)
		var10()
		var8()
	end, { var8, var10 })
	local var12 = reactModule.useCallback(function() --[[ line: 67 ]]
		-- upvalues: var2 (ref)
		local current = var2.current
		
		return current ~= nil and current.AbsoluteCanvasSize.Y <= current.AbsoluteWindowSize.Y
	end, {})
	local var13 = reactModule.useCallback(function() --[[ line: 72 ]]
		-- upvalues: var2 (ref), chatScrollModule (copy), var6 (ref), var10 (ref)
		local current = var2.current
		
		if current then
			chatScrollModule.syncScrollFromBottom(current, var6.current)
			var10()
		end
	end, { var10 })
	local var14 = reactModule.useCallback(function() --[[ line: 80 ]]
		-- upvalues: var4 (ref), var13 (ref)
		if var4.current then
			var13()
		end
	end, { var13 })
	local var15 = reactModule.useCallback(function() --[[ line: 86 ]]
		-- upvalues: var10 (ref)
		var10()
	end, { var10 })
	local var16 = reactModule.useCallback(function(p0) --[[ line: 91 ]]
		-- upvalues: var2 (ref), var9 (ref), var10 (ref), var13 (ref), var3 (ref), var11 (ref)
		if var2.current == p0 then return end
		var9()
		var2.current = p0
		
		if p0 then
			var10()
			var13()
			task.defer(var13)
			
			local function onScrollViewportChanged() --[[ line: 107 ]]
				-- upvalues: var13 (copy)
				var13()
				task.defer(var13)
			end
			
			var3.current = {
				canvasPosition = p0:GetPropertyChangedSignal("CanvasPosition"):Connect(var11),
				canvasSize = p0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(onScrollViewportChanged),
				windowSize = p0:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(onScrollViewportChanged)
			}
			
			return
		end
	end, { var9, var13, var10, var11 })
	local var17 = reactModule.useCallback(function() --[[ line: 127 ]]
		-- upvalues: var10 (ref)
		var10()
	end, { var10 })
	local var18 = reactModule.useCallback(function() --[[ line: 131 ]]
		-- upvalues: var4 (ref), var6 (ref), var13 (ref)
		if var4.current then
			var6.current = 0
			var13()
		end
	end, { var13 })
	local var19 = reactModule.useCallback(function() --[[ line: 138 ]]
		-- upvalues: var6 (ref), var4 (ref), var13 (ref)
		var6.current = 0
		var4.current = true
		var13()
		task.defer(var13)
	end, { var13 })
	local var20 = reactModule.useCallback(function(p1) --[[ line: 145 ]]
		-- upvalues: var7 (ref), var8 (ref)
		var7.current = p1
		task.defer(var8)
	end, { var8 })
	reactModule.useEffect(function() --[[ line: 150 ]]
		-- upvalues: var9 (ref)
		return var9
	end, { var9 })
	
	return reactModule.useMemo(function() --[[ line: 155 ]]
		-- upvalues: var16 (ref), var14 (ref), var15 (ref), var17 (ref), var18 (ref), var19 (ref), var12 (ref), var4 (ref), var5 (ref), var20 (ref)
		return {
			setScrollingFrame = var16,
			scrollToBottomIfNeeded = var14,
			captureDistanceFromBottom = var15,
			captureStickToBottomForSend = var17,
			scrollToBottomAfterSend = var18,
			scrollToBottomUnconditionally = var19,
			isViewportUnderfilled = var12,
			isAtBottomRef = var4,
			isAtTopRef = var5,
			setOnScrolledToTop = var20
		}
	end, {
		var16, var14, var15, var17, var18, var19, var12, var20
	})
end