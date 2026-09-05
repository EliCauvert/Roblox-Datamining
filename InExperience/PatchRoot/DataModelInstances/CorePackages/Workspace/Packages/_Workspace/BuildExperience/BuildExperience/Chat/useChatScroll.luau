local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local chatScrollModule = require(script.Parent.chatScroll)
local fFlagBuildExperienceChatHistoryPrefetchModule = require(buildExperience.Flags.FFlagBuildExperienceChatHistoryPrefetch)

return function()
	-- upvalues: reactModule (ref), fFlagBuildExperienceChatHistoryPrefetchModule (ref), chatScrollModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(true)
	local var4 = reactModule.useRef(true)
	local var5 = reactModule.useRef(false)
	local var6 = reactModule.useRef(0)
	local var7 = reactModule.useRef(false)
	local var8 = reactModule.useRef(nil)
	local var9 = reactModule.useRef(false)
	local var10 = reactModule.useCallback(function()
		-- upvalues: fFlagBuildExperienceChatHistoryPrefetchModule (copy), var4 (ref), var8 (ref), var5 (ref), var9 (ref)
		if fFlagBuildExperienceChatHistoryPrefetchModule then
			local current = var5.current
			
			if current and not var9.current and var8.current ~= nil then
				var8.current()
			end
			var9.current = current
			
			return
		elseif var4.current and var8.current ~= nil then
			var8.current()
		end
	end, {})
	local var11 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), var5 (ref), var9 (ref)
		local current = var2.current
		
		if current then
			current.canvasPosition:Disconnect()
			current.canvasSize:Disconnect()
			current.windowSize:Disconnect()
			var2.current = nil
		end
		var5.current = false
		var9.current = false
	end, {})
	local var12 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), var6 (ref), chatScrollModule (copy), var3 (ref), var4 (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var5 (ref)
		local current = var1.current
		
		if current then
			var6.current = chatScrollModule.getDistanceFromBottom(current)
			var3.current = chatScrollModule.isScrolledToBottom(current)
			var4.current = chatScrollModule.isScrolledToTop(current)
			
			if fFlagBuildExperienceChatHistoryPrefetchModule then
				var5.current = chatScrollModule.isScrolledNearTop(current)
			end
		end
	end, {})
	local var13 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), var7 (ref), var3 (ref), var10 (ref)
		var12()
		
		if var7.current and not var3.current then
			var7.current = false
		end
		var10()
	end, { var10, var12 })
	local var14 = reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		local current = var1.current
		
		return current ~= nil and current.AbsoluteCanvasSize.Y <= current.AbsoluteWindowSize.Y
	end, {})
	local var15 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), chatScrollModule (copy), var6 (ref), var12 (ref)
		local current = var1.current
		
		if current then
			chatScrollModule.syncScrollFromBottom(current, var6.current)
			var12()
		end
	end, { var12 })
	local var16 = reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		local current = var1.current
		
		if current then
			current.CanvasPosition = Vector2.new(0, 9007199254740992)
		end
	end, {})
	local var17 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var15 (ref)
		if var3.current then
			var15()
		end
	end, { var15 })
	local var18 = reactModule.useCallback(function()
		-- upvalues: var12 (ref)
		var12()
	end, { var12 })
	local var19 = reactModule.useCallback(function(p1)
		-- upvalues: var1 (ref), var11 (ref), var7 (ref), var16 (ref), var12 (ref), var15 (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var10 (ref), var2 (ref), var13 (ref)
		if var1.current == p1 then return end
		var11()
		var1.current = p1
		
		if not p1 then return end
		if var7.current then
			var16()
		else
			var12()
			var15()
			task.defer(var15)
		end
		local function onScrollViewportChanged()
			-- upvalues: var7 (copy), var16 (copy), var15 (copy), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var10 (copy)
			if var7.current then
				var16()
			else
				var15()
				task.defer(var15)
			end
			if fFlagBuildExperienceChatHistoryPrefetchModule then
				var10()
			end
		end
		
		var2.current = {
			canvasPosition = p1:GetPropertyChangedSignal("CanvasPosition"):Connect(var13),
			canvasSize = p1:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(onScrollViewportChanged),
			windowSize = p1:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(onScrollViewportChanged)
		}
		
		if fFlagBuildExperienceChatHistoryPrefetchModule then
			var10()
		end
	end, {
		var11, var16, var15, var10, var12, var13
	})
	local var20 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), var3 (ref), var7 (ref), var16 (ref)
		var6.current = 0
		var3.current = true
		var7.current = true
		var16()
	end, { var16 })
	local var21 = reactModule.useCallback(function()
		-- upvalues: var12 (ref)
		var12()
	end, { var12 })
	local var22 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var6 (ref), var15 (ref)
		if var3.current then
			var6.current = 0
			var15()
		end
	end, { var15 })
	local var23 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), var3 (ref), var15 (ref)
		var6.current = 0
		var3.current = true
		var15()
		task.defer(var15)
	end, { var15 })
	local var24 = reactModule.useCallback(function(p1)
		-- upvalues: var8 (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var9 (ref), var10 (ref)
		var8.current = p1
		
		if fFlagBuildExperienceChatHistoryPrefetchModule then
			var9.current = false
		end
		task.defer(var10)
	end, { var10 })
	reactModule.useEffect(function()
		-- upvalues: var11 (ref)
		return var11
	end, { var11 })
	
	return reactModule.useMemo(function()
		-- upvalues: var19 (ref), var20 (ref), var17 (ref), var18 (ref), var21 (ref), var22 (ref), var23 (ref), var14 (ref), var3 (ref), var4 (ref), var5 (ref), var24 (ref)
		return {
			setScrollingFrame = var19,
			lockToBottom = var20,
			scrollToBottomIfNeeded = var17,
			captureDistanceFromBottom = var18,
			captureStickToBottomForSend = var21,
			scrollToBottomAfterSend = var22,
			scrollToBottomUnconditionally = var23,
			isViewportUnderfilled = var14,
			isAtBottomRef = var3,
			isAtTopRef = var4,
			isNearTopRef = var5,
			setOnScrolledToTop = var24
		}
	end, {
		var19, var20, var17, var18, var21, var22, var23, var14, var24
	})
end