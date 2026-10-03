local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local chatScrollModule = require(script.Parent.chatScroll)
local fFlagBuildExperienceChatAccordionScrollAnchorModule = require(buildExperience.Flags.FFlagBuildExperienceChatAccordionScrollAnchor)
local fFlagBuildExperienceChatHistoryPrefetchModule = require(buildExperience.Flags.FFlagBuildExperienceChatHistoryPrefetch)

return function(p1)
	-- upvalues: reactModule (ref), fFlagBuildExperienceChatAccordionScrollAnchorModule (ref), fFlagBuildExperienceChatHistoryPrefetchModule (ref), chatScrollModule (ref)
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
	local var13 = if fFlagBuildExperienceChatAccordionScrollAnchorModule then reactModule.useRef(nil) else { current = nil }
	local var14 = reactModule.useCallback(function()
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
	local var15 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), var13 (write), var5 (ref), var9 (ref)
		local current = var2.current
		
		if current then
			current.canvasPosition:Disconnect()
			current.canvasSize:Disconnect()
			current.windowSize:Disconnect()
			var2.current = nil
		end
		var13.current = nil
		var5.current = false
		var9.current = false
	end, {})
	local var16 = reactModule.useCallback(function()
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
	local var17 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), p1 (ref), var10 (ref), var11 (ref), var12 (ref), var13 (write), fFlagBuildExperienceChatAccordionScrollAnchorModule (copy), var16 (ref), var7 (ref), var3 (ref), var14 (ref)
		local current = var1.current
		local var18 = p1 and (current ~= nil and (if current.AbsoluteCanvasSize == var10.current then current.AbsoluteWindowSize ~= var11.current else true))
		local var19 = p1 and (current ~= nil and current.CanvasPosition == var12.current)
		local current_1 = var13.current
		
		if fFlagBuildExperienceChatAccordionScrollAnchorModule and current_1 ~= nil and (current ~= nil and math.abs(current.CanvasPosition.Y - current_1.canvasPositionY) > 0.5) then
			var13.current = nil
		end
		var16()
		
		if var7.current and not var3.current and (not var18 and not var19) then
			var7.current = false
		end
		var14()
	end, { var14, var16, p1 })
	local var18 = reactModule.useCallback(function()
		-- upvalues: var1 (ref)
		local current = var1.current
		
		return current ~= nil and current.AbsoluteCanvasSize.Y <= current.AbsoluteWindowSize.Y
	end, {})
	local var19 = reactModule.useCallback(function(p2)
		-- upvalues: var13 (write), chatScrollModule (copy)
		local current = var13.current
		
		if current == nil then
			return false
		elseif not current.instance:IsDescendantOf(p2) then
			var13.current = nil
			
			return false
		end
		local var20 = chatScrollModule.getOffsetInViewport(p2, current.instance) - current.offsetY
		
		if var20 == 0 then
			return true
		end
		local var21 = p2.CanvasPosition.Y + var20
		local bottomCanvasPosition = chatScrollModule.getBottomCanvasPosition(p2)
		
		if var21 < 0 or bottomCanvasPosition < var21 then
			var13.current = nil
			p2.CanvasPosition = Vector2.new(0, math.clamp(var21, 0, bottomCanvasPosition))
			
			return true
		end
		current.canvasPositionY = var21
		p2.CanvasPosition = Vector2.new(0, var21)
		
		return true
	end, {})
	local var20 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), fFlagBuildExperienceChatAccordionScrollAnchorModule (copy), var19 (ref), chatScrollModule (copy), var6 (ref), var16 (ref)
		local current = var1.current
		
		if current then
			if not fFlagBuildExperienceChatAccordionScrollAnchorModule or not var19(current) then
				chatScrollModule.syncScrollFromBottom(current, var6.current)
			end
			var16()
		end
	end, { var19, var16 })
	local var21 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), p1 (ref), var12 (ref), var16 (ref)
		local current = var1.current
		
		if current then
			current.CanvasPosition = Vector2.new(0, 9007199254740992)
			
			if p1 then
				var12.current = current.CanvasPosition
				var16()
			end
		end
	end, { p1, var16 })
	local var22 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var20 (ref)
		if var3.current then
			var20()
		end
	end, { var20 })
	local var23 = reactModule.useCallback(function()
		-- upvalues: var16 (ref)
		var16()
	end, { var16 })
	local var24 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), var15 (ref), var7 (ref), var21 (ref), var16 (ref), var20 (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var14 (ref), fFlagBuildExperienceChatAccordionScrollAnchorModule (copy), var13 (write), var2 (ref), var17 (ref)
		if var1.current == p2 then return end
		var15()
		var1.current = p2
		
		if not p2 then return end
		if var7.current then
			var21()
		else
			var16()
			var20()
			task.defer(var20)
		end
		local function onScrollViewportChanged()
			-- upvalues: var7 (copy), var21 (copy), var20 (copy), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var14 (copy)
			if var7.current then
				var21()
			else
				var20()
				task.defer(var20)
			end
			if fFlagBuildExperienceChatHistoryPrefetchModule then
				var14()
			end
		end
		
		var2.current = {
			canvasPosition = p2:GetPropertyChangedSignal("CanvasPosition"):Connect(var17),
			canvasSize = p2:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(onScrollViewportChanged),
			windowSize = p2:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(if fFlagBuildExperienceChatAccordionScrollAnchorModule then function()
				-- upvalues: var13 (copy), var7 (copy), var21 (copy), var20 (copy), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var14 (copy)
				var13.current = nil
				
				if var7.current then
					var21()
				else
					var20()
					task.defer(var20)
				end
				if fFlagBuildExperienceChatHistoryPrefetchModule then
					var14()
				end
			end else onScrollViewportChanged)
		}
		
		if fFlagBuildExperienceChatHistoryPrefetchModule then
			var14()
		end
	end, {
		var15, var21, var20, var14, var16, var17
	})
	local var25 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), var7 (ref), chatScrollModule (copy), var13 (write)
		local current = var1.current
		
		if current == nil or p2 == nil or not p2:IsDescendantOf(current) then
			return
		end
		var7.current = false
		local t = {
			instance = p2,
			offsetY = chatScrollModule.getOffsetInViewport(current, p2),
			canvasPositionY = current.CanvasPosition.Y
		}
		var13.current = t
		task.delay(0.25, function()
			-- upvalues: var13 (copy), t (ref)
			if var13.current == t then
				var13.current = nil
			end
		end)
	end, {})
	local var26 = reactModule.useCallback(function()
		-- upvalues: var13 (write), var6 (ref), var3 (ref), var7 (ref), var21 (ref)
		var13.current = nil
		var6.current = 0
		var3.current = true
		var7.current = true
		var21()
	end, { var21 })
	local var27 = reactModule.useCallback(function()
		-- upvalues: var16 (ref)
		var16()
	end, { var16 })
	local var28 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var13 (write), var6 (ref), var20 (ref)
		if var3.current then
			var13.current = nil
			var6.current = 0
			var20()
		end
	end, { var20 })
	local var29 = reactModule.useCallback(function()
		-- upvalues: var13 (write), var6 (ref), var3 (ref), var20 (ref)
		var13.current = nil
		var6.current = 0
		var3.current = true
		var20()
		task.defer(var20)
	end, { var20 })
	local var30 = reactModule.useCallback(function(p2)
		-- upvalues: var8 (ref), fFlagBuildExperienceChatHistoryPrefetchModule (copy), var9 (ref), var14 (ref)
		var8.current = p2
		
		if fFlagBuildExperienceChatHistoryPrefetchModule then
			var9.current = false
		end
		task.defer(var14)
	end, { var14 })
	reactModule.useEffect(function()
		-- upvalues: var15 (ref)
		return var15
	end, { var15 })
	
	return reactModule.useMemo(function()
		-- upvalues: var24 (ref), var25 (ref), var26 (ref), var22 (ref), var23 (ref), var27 (ref), var28 (ref), var29 (ref), var18 (ref), var3 (ref), var4 (ref), var5 (ref), var30 (ref)
		return {
			setScrollingFrame = var24,
			anchorToInstance = var25,
			lockToBottom = var26,
			scrollToBottomIfNeeded = var22,
			captureDistanceFromBottom = var23,
			captureStickToBottomForSend = var27,
			scrollToBottomAfterSend = var28,
			scrollToBottomUnconditionally = var29,
			isViewportUnderfilled = var18,
			isAtBottomRef = var3,
			isAtTopRef = var4,
			isNearTopRef = var5,
			setOnScrolledToTop = var30
		}
	end, {
		var24, var25, var26, var22, var23, var27, var28, var29, var18, var30
	})
end