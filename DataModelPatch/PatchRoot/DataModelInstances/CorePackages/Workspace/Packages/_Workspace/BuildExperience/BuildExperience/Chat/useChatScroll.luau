local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local ChatScrollModule = require(script.Parent.chatScroll)

return function()
	-- upvalues: ReactModule (copy), ChatScrollModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(true)
	local UseRefResult3 = ReactModule.useRef(true)
	local UseRefResult4 = ReactModule.useRef(0)
	local UseRefResult5 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseRefResult3 (copy), UseRefResult5 (copy)
		if UseRefResult3.current and UseRefResult5.current ~= nil then
			UseRefResult5.current()
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy)
		local Current = UseRefResult1.current
		
		if Current then
			Current.canvasPosition:Disconnect()
			Current.canvasSize:Disconnect()
			Current.windowSize:Disconnect()
			UseRefResult1.current = nil
		end
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult4 (copy), ChatScrollModule (upval), UseRefResult2 (copy), UseRefResult3 (copy)
		local Current = UseRefResult.current
		
		if Current then
			UseRefResult4.current = ChatScrollModule.getDistanceFromBottom(Current)
			UseRefResult2.current = ChatScrollModule.isScrolledToBottom(Current)
			UseRefResult3.current = ChatScrollModule.isScrolledToTop(Current)
		end
	end, {})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseResult2 (copy), UseResult (copy)
		UseResult2()
		UseResult()
	end, { UseResult, UseResult2 })
	local UseResult4 = ReactModule.useCallback(function(): boolean
		-- upvalues: UseRefResult (copy)
		local Current = UseRefResult.current
		
		return Current ~= nil and Current.AbsoluteCanvasSize.Y <= Current.AbsoluteWindowSize.Y
	end, {})
	local UseResult5 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), ChatScrollModule (upval), UseRefResult4 (copy), UseResult2 (copy)
		local Current = UseRefResult.current
		
		if Current then
			ChatScrollModule.syncScrollFromBottom(Current, UseRefResult4.current)
			UseResult2()
		end
	end, { UseResult2 })
	local UseResult6 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult2 (copy), UseResult5 (copy)
		if UseRefResult2.current then
			UseResult5()
		end
	end, { UseResult5 })
	local UseResult7 = ReactModule.useCallback(function()
		-- upvalues: UseResult2 (copy)
		UseResult2()
	end, { UseResult2 })
	local UseResult8 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult (copy), UseResult1 (copy), UseResult2 (copy), UseResult5 (copy), UseRefResult1 (copy), UseResult3 (copy)
		if UseRefResult.current == Current then return end
		UseResult1()
		UseRefResult.current = Current
		
		if Current then
			UseResult2()
			UseResult5()
			task.defer(UseResult5)
			
			local function onScrollViewportChanged()
				-- upvalues: UseResult5 (upval)
				UseResult5()
				task.defer(UseResult5)
			end
			
			UseRefResult1.current = {
				canvasPosition = Current:GetPropertyChangedSignal("CanvasPosition"):Connect(UseResult3),
				canvasSize = Current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(onScrollViewportChanged),
				windowSize = Current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(onScrollViewportChanged)
			}
			
			return
		end
	end, { UseResult1, UseResult5, UseResult2, UseResult3 })
	local UseResult9 = ReactModule.useCallback(function()
		-- upvalues: UseResult2 (copy)
		UseResult2()
	end, { UseResult2 })
	local UseResult10 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult2 (copy), UseRefResult4 (copy), UseResult5 (copy)
		if UseRefResult2.current then
			UseRefResult4.current = 0
			UseResult5()
		end
	end, { UseResult5 })
	local UseResult11 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult4 (copy), UseRefResult2 (copy), UseResult5 (copy)
		UseRefResult4.current = 0
		UseRefResult2.current = true
		UseResult5()
		task.defer(UseResult5)
	end, { UseResult5 })
	local UseResult12 = ReactModule.useCallback(function(Current)
		-- upvalues: UseRefResult5 (copy), UseResult (copy)
		UseRefResult5.current = Current
		task.defer(UseResult)
	end, { UseResult })
	ReactModule.useEffect(function()
		-- upvalues: UseResult1 (copy)
		return UseResult1
	end, { UseResult1 })
	
	return ReactModule.useMemo(function()
		-- upvalues: UseResult8 (copy), UseResult6 (copy), UseResult7 (copy), UseResult9 (copy), UseResult10 (copy), UseResult11 (copy), UseResult4 (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseResult12 (copy)
		return {
			setScrollingFrame = UseResult8,
			scrollToBottomIfNeeded = UseResult6,
			captureDistanceFromBottom = UseResult7,
			captureStickToBottomForSend = UseResult9,
			scrollToBottomAfterSend = UseResult10,
			scrollToBottomUnconditionally = UseResult11,
			isViewportUnderfilled = UseResult4,
			isAtBottomRef = UseRefResult2,
			isAtTopRef = UseRefResult3,
			setOnScrolledToTop = UseResult12
		}
	end, {
		UseResult8, UseResult6, UseResult7, UseResult9, UseResult10, UseResult11,
		UseResult4, UseResult12
	})
end