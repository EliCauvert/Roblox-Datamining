local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local ChatScrollModule = require(script.Parent.chatScroll)
local FFlagBuildExperienceChatAccordionScrollAnchorModule = require(BuildExperience.Flags.FFlagBuildExperienceChatAccordionScrollAnchor)
local FFlagBuildExperienceChatHistoryPrefetchModule = require(BuildExperience.Flags.FFlagBuildExperienceChatHistoryPrefetch)
local FFlagBuildExperienceChatSheetReversedContentModule = require(BuildExperience.Flags.FFlagBuildExperienceChatSheetReversedContent)

return function(p1) --[[ Line: 47 | Named "useChatScroll" ]]
	-- upvalues: ReactModule (copy), FFlagBuildExperienceChatAccordionScrollAnchorModule (copy), FFlagBuildExperienceChatSheetReversedContentModule (copy), FFlagBuildExperienceChatHistoryPrefetchModule (copy), ChatScrollModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(true)
	local UseRefResult3 = ReactModule.useRef(true)
	local UseRefResult4 = ReactModule.useRef(false)
	local UseRefResult5 = ReactModule.useRef(0)
	local UseRefResult6 = ReactModule.useRef(false)
	local UseRefResult7 = ReactModule.useRef(nil)
	local UseRefResult8 = ReactModule.useRef(false)
	local UseRefResult9 = ReactModule.useRef(Vector2.zero)
	local UseRefResult10 = ReactModule.useRef(Vector2.zero)
	local UseRefResult11 = ReactModule.useRef(nil)
	local UseRefResult12 = if FFlagBuildExperienceChatAccordionScrollAnchorModule then ReactModule.useRef(nil) else { current = nil }
	local UseRefResult13 = if FFlagBuildExperienceChatSheetReversedContentModule then ReactModule.useRef(nil) else { current = nil }
	local UseResult = ReactModule.useCallback(function() --[[ Line: 70 ]]
		-- upvalues: FFlagBuildExperienceChatHistoryPrefetchModule (upval), UseRefResult3 (copy), UseRefResult7 (copy), UseRefResult4 (copy), UseRefResult8 (copy)
		if FFlagBuildExperienceChatHistoryPrefetchModule then
			local Current = UseRefResult4.current
			
			if Current and not UseRefResult8.current and UseRefResult7.current ~= nil then
				UseRefResult7.current()
			end
			UseRefResult8.current = Current
			
			return
		elseif UseRefResult3.current and UseRefResult7.current ~= nil then
			UseRefResult7.current()
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 85 ]]
		-- upvalues: UseRefResult1 (copy), UseRefResult12 (ref), FFlagBuildExperienceChatSheetReversedContentModule (upval), UseRefResult13 (ref), UseRefResult4 (copy), UseRefResult8 (copy)
		local Current = UseRefResult1.current
		
		if Current then
			Current.canvasPosition:Disconnect()
			Current.canvasSize:Disconnect()
			Current.windowSize:Disconnect()
			UseRefResult1.current = nil
		end
		UseRefResult12.current = nil
		
		if FFlagBuildExperienceChatSheetReversedContentModule then
			UseRefResult13.current = nil
		end
		UseRefResult4.current = false
		UseRefResult8.current = false
	end, {})
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 101 ]]
		-- upvalues: UseRefResult (copy), p1 (copy), UseRefResult9 (copy), UseRefResult10 (copy), UseRefResult5 (copy), ChatScrollModule (upval), FFlagBuildExperienceChatSheetReversedContentModule (upval), UseRefResult13 (ref), UseRefResult2 (copy), UseRefResult3 (copy), FFlagBuildExperienceChatHistoryPrefetchModule (upval), UseRefResult4 (copy)
		local Current = UseRefResult.current
		
		if Current then
			if p1 then
				UseRefResult9.current = Current.AbsoluteCanvasSize
				UseRefResult10.current = Current.AbsoluteWindowSize
			end
			UseRefResult5.current = ChatScrollModule.getDistanceFromBottom(Current)
			
			if FFlagBuildExperienceChatSheetReversedContentModule then
				UseRefResult13.current = Vector2.new(Current.AbsoluteCanvasSize.Y, Current.AbsoluteWindowSize.Y)
			end
			UseRefResult2.current = ChatScrollModule.isScrolledToBottom(Current)
			UseRefResult3.current = ChatScrollModule.isScrolledToTop(Current)
			
			if FFlagBuildExperienceChatHistoryPrefetchModule then
				UseRefResult4.current = ChatScrollModule.isScrolledNearTop(Current)
			end
		end
	end, { p1 })
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 121 ]]
		-- upvalues: UseRefResult (copy), FFlagBuildExperienceChatSheetReversedContentModule (upval), UseRefResult13 (ref), p1 (copy), UseRefResult9 (copy), UseRefResult10 (copy), UseRefResult11 (copy), UseRefResult12 (ref), FFlagBuildExperienceChatAccordionScrollAnchorModule (upval), UseResult2 (copy), UseRefResult6 (copy), UseRefResult2 (copy), UseResult (copy)
		local Current = UseRefResult.current
		
		if FFlagBuildExperienceChatSheetReversedContentModule and Current ~= nil then
			local Current2 = UseRefResult13.current
			
			if Current2 ~= nil and (Current2.X ~= Current.AbsoluteCanvasSize.Y or Current2.Y ~= Current.AbsoluteWindowSize.Y) then return end
		end
		local IsNotAbsoluteCanvasSizeMatch: boolean = p1 and (Current ~= nil and (Current.AbsoluteCanvasSize ~= UseRefResult9.current or Current.AbsoluteWindowSize ~= UseRefResult10.current))
		local IsCanvasPositionMatch: boolean = p1 and (Current ~= nil and Current.CanvasPosition == UseRefResult11.current)
		local Current1 = UseRefResult12.current
		
		if FFlagBuildExperienceChatAccordionScrollAnchorModule and Current1 ~= nil and Current ~= nil and math.abs(Current.CanvasPosition.Y - Current1.canvasPositionY) > 0.5 then
			UseRefResult12.current = nil
		end
		UseResult2()
		
		if UseRefResult6.current and not UseRefResult2.current and not IsNotAbsoluteCanvasSizeMatch and not IsCanvasPositionMatch then
			UseRefResult6.current = false
		end
		UseResult()
	end, { UseResult, UseResult2, p1 })
	local UseResult4 = ReactModule.useCallback(function(): boolean --[[ Line: 163 ]]
		-- upvalues: UseRefResult (copy)
		local Current = UseRefResult.current
		
		return Current ~= nil and Current.AbsoluteCanvasSize.Y <= Current.AbsoluteWindowSize.Y
	end, {})
	local UseResult5 = ReactModule.useCallback(function(ScrollFrame): boolean --[[ Line: 168 ]]
		-- upvalues: UseRefResult12 (ref), ChatScrollModule (upval)
		local Current = UseRefResult12.current
		
		if Current == nil then
			return false
		elseif not Current.instance:IsDescendantOf(ScrollFrame) then
			UseRefResult12.current = nil
			
			return false
		else
			local OffsetInViewportDelta = ChatScrollModule.getOffsetInViewport(ScrollFrame, Current.instance) - Current.offsetY
			
			if OffsetInViewportDelta == 0 then
				return true
			end
			local NewY = ScrollFrame.CanvasPosition.Y + OffsetInViewportDelta
			local BottomCanvasPosition: number = ChatScrollModule.getBottomCanvasPosition(ScrollFrame)
			
			if NewY < 0 or BottomCanvasPosition < NewY then
				UseRefResult12.current = nil
				ScrollFrame.CanvasPosition = Vector2.new(0, (math.clamp(NewY, 0, BottomCanvasPosition)))
				
				return true
			else
				Current.canvasPositionY = NewY
				ScrollFrame.CanvasPosition = Vector2.new(0, NewY)
				
				return true
			end
		end
	end, {})
	local UseResult6 = ReactModule.useCallback(function() --[[ Line: 195 ]]
		-- upvalues: UseRefResult (copy), FFlagBuildExperienceChatAccordionScrollAnchorModule (upval), UseResult5 (copy), ChatScrollModule (upval), UseRefResult5 (copy), UseResult2 (copy)
		local Current = UseRefResult.current
		
		if Current then
			if not FFlagBuildExperienceChatAccordionScrollAnchorModule or not UseResult5(Current) then
				ChatScrollModule.syncScrollFromBottom(Current, UseRefResult5.current)
			end
			UseResult2()
		end
	end, { UseResult5, UseResult2 })
	local UseResult7 = ReactModule.useCallback(function() --[[ Line: 205 ]]
		-- upvalues: UseRefResult (copy), p1 (copy), UseRefResult11 (copy), UseResult2 (copy)
		local Current = UseRefResult.current
		
		if Current then
			Current.CanvasPosition = Vector2.new(0, 9007199254740992)
			
			if p1 then
				UseRefResult11.current = Current.CanvasPosition
				UseResult2()
			end
		end
	end, { p1, UseResult2 })
	local UseResult8 = ReactModule.useCallback(function() --[[ Line: 216 ]]
		-- upvalues: UseRefResult2 (copy), UseResult6 (copy)
		if UseRefResult2.current then
			UseResult6()
		end
	end, { UseResult6 })
	local UseResult9 = ReactModule.useCallback(function() --[[ Line: 222 ]]
		-- upvalues: UseResult2 (copy)
		UseResult2()
	end, { UseResult2 })
	local UseResult10 = ReactModule.useCallback(function(Current) --[[ Line: 227 ]]
		-- upvalues: UseRefResult (copy), UseResult1 (copy), UseRefResult6 (copy), UseResult7 (copy), UseResult2 (copy), UseResult6 (copy), FFlagBuildExperienceChatSheetReversedContentModule (upval), FFlagBuildExperienceChatHistoryPrefetchModule (upval), UseResult (copy), FFlagBuildExperienceChatAccordionScrollAnchorModule (upval), UseRefResult12 (ref), UseRefResult1 (copy), UseResult3 (copy)
		if UseRefResult.current == Current then return end
		UseResult1()
		UseRefResult.current = Current
		
		if not Current then return end
		if UseRefResult6.current then
			UseResult7()
		else
			UseResult2()
			UseResult6()
			task.defer(UseResult6)
		end
		local function onScrollViewportChanged() --[[ Line: 247 ]]
			-- upvalues: UseRefResult6 (upval), UseResult7 (upval), UseResult6 (upval), FFlagBuildExperienceChatSheetReversedContentModule (upval), UseResult2 (upval), FFlagBuildExperienceChatHistoryPrefetchModule (upval), UseResult (upval)
			if UseRefResult6.current then
				UseResult7()
			else
				UseResult6()
				task.defer(UseResult6)
			end
			if FFlagBuildExperienceChatSheetReversedContentModule then
				UseResult2()
			end
			if FFlagBuildExperienceChatHistoryPrefetchModule then
				UseResult()
			end
		end
		
		UseRefResult1.current = {
			canvasPosition = Current:GetPropertyChangedSignal("CanvasPosition"):Connect(UseResult3),
			canvasSize = Current:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(onScrollViewportChanged),
			windowSize = Current:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(if FFlagBuildExperienceChatAccordionScrollAnchorModule then function() --[[ Line: 264 ]]
				-- upvalues: UseRefResult12 (upval), UseRefResult6 (upval), UseResult7 (upval), UseResult6 (upval), FFlagBuildExperienceChatSheetReversedContentModule (upval), UseResult2 (upval), FFlagBuildExperienceChatHistoryPrefetchModule (upval), UseResult (upval)
				UseRefResult12.current = nil
				
				if UseRefResult6.current then
					UseResult7()
				else
					UseResult6()
					task.defer(UseResult6)
				end
				if FFlagBuildExperienceChatSheetReversedContentModule then
					UseResult2()
				end
				if FFlagBuildExperienceChatHistoryPrefetchModule then
					UseResult()
				end
			end else onScrollViewportChanged)
		}
		
		if FFlagBuildExperienceChatHistoryPrefetchModule then
			UseResult()
		end
	end, {
		UseResult1, UseResult7, UseResult6, UseResult, UseResult2, UseResult3
	})
	local UseResult11 = ReactModule.useCallback(function(Object) --[[ Line: 296 ]]
		-- upvalues: UseRefResult (copy), UseRefResult6 (copy), ChatScrollModule (upval), UseRefResult12 (ref)
		local Current = UseRefResult.current
		
		if Current ~= nil and Object ~= nil and Object:IsDescendantOf(Current) then
			UseRefResult6.current = false
			local Current1 = {
				instance = Object,
				offsetY = ChatScrollModule.getOffsetInViewport(Current, Object),
				canvasPositionY = Current.CanvasPosition.Y
			}
			UseRefResult12.current = Current1
			task.delay(0.25, function() --[[ Line: 308 ]]
				-- upvalues: UseRefResult12 (upval), Current1 (copy)
				if UseRefResult12.current == Current1 then
					UseRefResult12.current = nil
				end
			end)
			
			return
		end
	end, {})
	local UseResult12 = ReactModule.useCallback(function() --[[ Line: 315 ]]
		-- upvalues: UseRefResult12 (ref), UseRefResult5 (copy), UseRefResult2 (copy), UseRefResult6 (copy), UseResult7 (copy)
		UseRefResult12.current = nil
		UseRefResult5.current = 0
		UseRefResult2.current = true
		UseRefResult6.current = true
		UseResult7()
	end, { UseResult7 })
	local UseResult13 = ReactModule.useCallback(function() --[[ Line: 323 ]]
		-- upvalues: UseResult2 (copy)
		UseResult2()
	end, { UseResult2 })
	local UseResult14 = ReactModule.useCallback(function() --[[ Line: 327 ]]
		-- upvalues: UseRefResult2 (copy), UseRefResult12 (ref), UseRefResult5 (copy), UseResult6 (copy)
		if UseRefResult2.current then
			UseRefResult12.current = nil
			UseRefResult5.current = 0
			UseResult6()
		end
	end, { UseResult6 })
	local UseResult15 = ReactModule.useCallback(function() --[[ Line: 335 ]]
		-- upvalues: UseRefResult12 (ref), UseRefResult5 (copy), UseRefResult2 (copy), UseResult6 (copy)
		UseRefResult12.current = nil
		UseRefResult5.current = 0
		UseRefResult2.current = true
		UseResult6()
		task.defer(UseResult6)
	end, { UseResult6 })
	local UseResult16 = ReactModule.useCallback(function(Current) --[[ Line: 343 ]]
		-- upvalues: UseRefResult7 (copy), FFlagBuildExperienceChatHistoryPrefetchModule (upval), UseRefResult8 (copy), UseResult (copy)
		UseRefResult7.current = Current
		
		if FFlagBuildExperienceChatHistoryPrefetchModule then
			UseRefResult8.current = false
		end
		task.defer(UseResult)
	end, { UseResult })
	ReactModule.useEffect(function() --[[ Line: 351 ]]
		-- upvalues: UseResult1 (copy)
		return UseResult1
	end, { UseResult1 })
	
	return ReactModule.useMemo(function() --[[ Line: 356 ]]
		-- upvalues: UseResult10 (copy), UseResult11 (copy), UseResult12 (copy), UseResult8 (copy), UseResult9 (copy), UseResult13 (copy), UseResult14 (copy), UseResult15 (copy), UseResult4 (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseRefResult4 (copy), UseResult16 (copy)
		return {
			setScrollingFrame = UseResult10,
			anchorToInstance = UseResult11,
			lockToBottom = UseResult12,
			scrollToBottomIfNeeded = UseResult8,
			captureDistanceFromBottom = UseResult9,
			captureStickToBottomForSend = UseResult13,
			scrollToBottomAfterSend = UseResult14,
			scrollToBottomUnconditionally = UseResult15,
			isViewportUnderfilled = UseResult4,
			isAtBottomRef = UseRefResult2,
			isAtTopRef = UseRefResult3,
			isNearTopRef = UseRefResult4,
			setOnScrolledToTop = UseResult16
		}
	end, {
		UseResult10, UseResult11, UseResult12, UseResult8, UseResult9, UseResult13,
		UseResult14, UseResult15, UseResult4, UseResult16
	})
end