local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local chatScrollModule = require(script.Parent.chatScroll)
local fFlagBuildExperienceChatHistoryPrefetchModule = require(buildExperience.Flags.FFlagBuildExperienceChatHistoryPrefetch)

return function(p1)
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
	local var10 = reactModule.useRef(Vector2.zero)
	local var11 = reactModule.useRef(Vector2.zero)
	local var12 = reactModule.useRef(nil)
	local var13 = reactModule.useCallback(function()
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
	local var14 = reactModule.useCallback(function()
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
	local var15 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), p1 (ref), var10 (ref), var11 (ref), var6 (ref), chatScrollModule (copy), var3 (ref), var4 (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var5 (ref)
		local current = var1.current
		
		if current then
			if p1 then
				var10.current = current.AbsoluteCanvasSize
				var11.current = current.AbsoluteWindowSize
			end
			var6.current = chatScrollModule.getDistanceFromBottom(current)
			var3.current = chatScrollModule.isScrolledToBottom(current)
			var4.current = chatScrollModule.isScrolledToTop(current)
			
			if fFlagBuildExperienceChatHistoryPrefetchModule then
				var5.current = chatScrollModule.isScrolledNearTop(current)
			end
		end
	end, { p1 })
	local var16 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), p1 (ref), var10 (ref), var11 (ref), var12 (ref), var15 (ref), var7 (ref), var3 (ref), var13 (ref)
		local current = var1.current
		local var17 = p1 and (current ~= nil and (if current.AbsoluteCanvasSize == var10.current then current.AbsoluteWindowSize ~= var11.current else true))
		local var18 = p1 and (current ~= nil and current.CanvasPosition == var12.current)
		var15()
		
		if var7.current and not var3.current and (not var17 and not var18) then
			var7.current = false
		end
		var13()
	end, { var13, var15, p1 })
	local var17 = reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		local current = var1.current
		
		return current ~= nil and current.AbsoluteCanvasSize.Y <= current.AbsoluteWindowSize.Y
	end, {})
	local var18 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), chatScrollModule (copy), var6 (ref), var15 (ref)
		local current = var1.current
		
		if current then
			chatScrollModule.syncScrollFromBottom(current, var6.current)
			var15()
		end
	end, { var15 })
	local var19 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), p1 (ref), var12 (ref), var15 (ref)
		local current = var1.current
		
		if current then
			current.CanvasPosition = Vector2.new(0, 9007199254740992)
			
			if p1 then
				var12.current = current.CanvasPosition
				var15()
			end
		end
	end, { p1, var15 })
	local var20 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var18 (ref)
		if var3.current then
			var18()
		end
	end, { var18 })
	local var21 = reactModule.useCallback(function()
		-- upvalues: var15 (ref)
		var15()
	end, { var15 })
	local var22 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), var14 (ref), var7 (ref), var19 (ref), var15 (ref), var18 (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var13 (ref), var2 (ref), var16 (ref)
		if var1.current == p2 then return end
		var14()
		var1.current = p2
		
		if not p2 then return end
		if var7.current then
			var19()
		else
			var15()
			var18()
			task.defer(var18)
		end
		local function onScrollViewportChanged()
			-- upvalues: var7 (copy), var19 (copy), var18 (copy), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var13 (copy)
			if var7.current then
				var19()
			else
				var18()
				task.defer(var18)
			end
			if fFlagBuildExperienceChatHistoryPrefetchModule then
				var13()
			end
		end
		
		var2.current = {
			canvasPosition = p2:GetPropertyChangedSignal("CanvasPosition"):Connect(var16),
			canvasSize = p2:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(onScrollViewportChanged),
			windowSize = p2:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(onScrollViewportChanged)
		}
		
		if fFlagBuildExperienceChatHistoryPrefetchModule then
			var13()
		end
	end, {
		var14, var19, var18, var13, var15, var16
	})
	local var23 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), var3 (ref), var7 (ref), var19 (ref)
		var6.current = 0
		var3.current = true
		var7.current = true
		var19()
	end, { var19 })
	local var24 = reactModule.useCallback(function()
		-- upvalues: var15 (ref)
		var15()
	end, { var15 })
	local var25 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var6 (ref), var18 (ref)
		if var3.current then
			var6.current = 0
			var18()
		end
	end, { var18 })
	local var26 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), var3 (ref), var18 (ref)
		var6.current = 0
		var3.current = true
		var18()
		task.defer(var18)
	end, { var18 })
	local var27 = reactModule.useCallback(function(p2)
		-- upvalues: var8 (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var9 (ref), var13 (ref)
		var8.current = p2
		
		if fFlagBuildExperienceChatHistoryPrefetchModule then
			var9.current = false
		end
		task.defer(var13)
	end, { var13 })
	reactModule.useEffect(function()
		-- upvalues: var14 (ref)
		return var14
	end, { var14 })
	
	return reactModule.useMemo(function()
		-- upvalues: var22 (ref), var23 (ref), var20 (ref), var21 (ref), var24 (ref), var25 (ref), var26 (ref), var17 (ref), var3 (ref), var4 (ref), var5 (ref), var27 (ref)
		return {
			setScrollingFrame = var22,
			lockToBottom = var23,
			scrollToBottomIfNeeded = var20,
			captureDistanceFromBottom = var21,
			captureStickToBottomForSend = var24,
			scrollToBottomAfterSend = var25,
			scrollToBottomUnconditionally = var26,
			isViewportUnderfilled = var17,
			isAtBottomRef = var3,
			isAtTopRef = var4,
			isNearTopRef = var5,
			setOnScrolledToTop = var27
		}
	end, {
		var22, var23, var20, var21, var24, var25, var26, var17, var27
	})
end