local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local chatScrollModule = require(script.Parent.chatScroll)
local fFlagBuildExperienceChatHistoryPrefetchModule = require(buildExperience.Flags.FFlagBuildExperienceChatHistoryPrefetch)

return function()
	-- upvalues: reactModule (ref), fFlagBuildExperienceChatHistoryPrefetchModule (ref), chatScrollModule (ref)
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(true)
	local var7 = reactModule.useRef(true)
	local var8 = reactModule.useRef(false)
	local var9 = reactModule.useRef(0)
	local var10 = reactModule.useRef(false)
	local var11 = reactModule.useRef(nil)
	local var12 = reactModule.useRef(false)
	local var13 = reactModule.useCallback(function()
		-- upvalues: fFlagBuildExperienceChatHistoryPrefetchModule (copy), var7 (ref), var11 (ref), var8 (ref), var12 (ref)
		if fFlagBuildExperienceChatHistoryPrefetchModule then
			local current = var8.current
			
			if current and not var12.current and var11.current ~= nil then
				var11.current()
			end
			var12.current = current
			
			return
		elseif var7.current and var11.current ~= nil then
			var11.current()
		end
	end, {})
	local var14 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var8 (ref), var12 (ref)
		local current = var5.current
		
		if current then
			current.canvasPosition:Disconnect()
			current.canvasSize:Disconnect()
			current.windowSize:Disconnect()
			var5.current = nil
		end
		var8.current = false
		var12.current = false
	end, {})
	local var15 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), var9 (ref), chatScrollModule (copy), var6 (ref), var7 (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var8 (ref)
		local current = var4.current
		
		if current then
			var9.current = chatScrollModule.getDistanceFromBottom(current)
			var6.current = chatScrollModule.isScrolledToBottom(current)
			var7.current = chatScrollModule.isScrolledToTop(current)
			
			if fFlagBuildExperienceChatHistoryPrefetchModule then
				var8.current = chatScrollModule.isScrolledNearTop(current)
			end
		end
	end, {})
	local var16 = reactModule.useCallback(function()
		-- upvalues: var15 (ref), var10 (ref), var6 (ref), var13 (ref)
		var15()
		
		if var10.current and not var6.current then
			var10.current = false
		end
		var13()
	end, { var13, var15 })
	local var17 = reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		local current = var4.current
		
		return current ~= nil and current.AbsoluteCanvasSize.Y <= current.AbsoluteWindowSize.Y
	end, {})
	local var18 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), chatScrollModule (copy), var9 (ref), var15 (ref)
		local current = var4.current
		
		if current then
			chatScrollModule.syncScrollFromBottom(current, var9.current)
			var15()
		end
	end, { var15 })
	local var19 = reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		local current = var4.current
		
		if current then
			current.CanvasPosition = Vector2.new(0, 9007199254740992)
		end
	end, {})
	local var20 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), var18 (ref)
		if var6.current then
			var18()
		end
	end, { var18 })
	local var21 = reactModule.useCallback(function()
		-- upvalues: var15 (ref)
		var15()
	end, { var15 })
	local var22 = reactModule.useCallback(function(p0)
		-- upvalues: var4 (ref), var14 (ref), var10 (ref), var19 (ref), var15 (ref), var18 (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var13 (ref), var5 (ref), var16 (ref)
		if var4.current == p0 then return end
		var14()
		var4.current = p0
		
		if not p0 then return end
		if var10.current then
			var19()
		else
			var15()
			var18()
			task.defer(var18)
		end
		local function onScrollViewportChanged()
			-- upvalues: var10 (copy), var19 (copy), var18 (copy), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var13 (copy)
			if var10.current then
				var19()
			else
				var18()
				task.defer(var18)
			end
			if fFlagBuildExperienceChatHistoryPrefetchModule then
				var13()
			end
		end
		
		var5.current = {
			canvasPosition = p0:GetPropertyChangedSignal("CanvasPosition"):Connect(var16),
			canvasSize = p0:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(onScrollViewportChanged),
			windowSize = p0:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(onScrollViewportChanged)
		}
		
		if fFlagBuildExperienceChatHistoryPrefetchModule then
			var13()
		end
	end, {
		var14, var19, var18, var13, var15, var16
	})
	local var23 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), var6 (ref), var10 (ref), var19 (ref)
		var9.current = 0
		var6.current = true
		var10.current = true
		var19()
	end, { var19 })
	local var24 = reactModule.useCallback(function()
		-- upvalues: var15 (ref)
		var15()
	end, { var15 })
	local var25 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), var9 (ref), var18 (ref)
		if var6.current then
			var9.current = 0
			var18()
		end
	end, { var18 })
	local var26 = reactModule.useCallback(function()
		-- upvalues: var9 (ref), var6 (ref), var18 (ref)
		var9.current = 0
		var6.current = true
		var18()
		task.defer(var18)
	end, { var18 })
	local var27 = reactModule.useCallback(function(p1)
		-- upvalues: var11 (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var12 (ref), var13 (ref)
		var11.current = p1
		
		if fFlagBuildExperienceChatHistoryPrefetchModule then
			var12.current = false
		end
		task.defer(var13)
	end, { var13 })
	reactModule.useEffect(function()
		-- upvalues: var14 (ref)
		return var14
	end, { var14 })
	
	return reactModule.useMemo(function()
		-- upvalues: var22 (ref), var23 (ref), var20 (ref), var21 (ref), var24 (ref), var25 (ref), var26 (ref), var17 (ref), var6 (ref), var7 (ref), var27 (ref)
		return {
			setScrollingFrame = var22,
			lockToBottom = var23,
			scrollToBottomIfNeeded = var20,
			captureDistanceFromBottom = var21,
			captureStickToBottomForSend = var24,
			scrollToBottomAfterSend = var25,
			scrollToBottomUnconditionally = var26,
			isViewportUnderfilled = var17,
			isAtBottomRef = var6,
			isAtTopRef = var7,
			setOnScrolledToTop = var27
		}
	end, {
		var22, var23, var20, var21, var24, var25, var26, var17, var27
	})
end