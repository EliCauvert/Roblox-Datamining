local ReactModule = require(script:FindFirstAncestor("FriendsChat").Parent.React)
local ConversationHeaderFadeLayoutModule = require(script.Parent.ConversationHeaderFadeLayout)
local GetMessageFadeSequenceModule = require(script.Parent.getMessageFadeSequence)

return function(p1) --[[ Line: 38 | Named "useConversationHeaderFadeLayout" ]]
	-- upvalues: ReactModule (copy), ConversationHeaderFadeLayoutModule (copy), GetMessageFadeSequenceModule (copy)
	local TransparencyValue = p1.transparencyValue
	local ConversationId = p1.conversationId
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local UseBindingResult1, UseBindingResult2_1 = ReactModule.useBinding(0)
	local UseBindingResult3, UseBindingResult2_2 = ReactModule.useBinding(0)
	local UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 46 ]]
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(Frame.AbsoluteSize.Y)
	end, {})
	local UseResult1 = ReactModule.useCallback(function(Frame) --[[ Line: 49 ]]
		-- upvalues: UseBindingResult2_2 (copy)
		UseBindingResult2_2(Frame.AbsoluteSize.Y)
	end, {})
	local UseResult2 = ReactModule.useCallback(function(p2, MaxValue: number) --[[ Line: 52 ]]
		-- upvalues: UseBindingResult2_1 (copy)
		UseBindingResult2_1((math.clamp(p2.Y, 0, MaxValue)))
	end, {})
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 56 ]]
		-- upvalues: ConversationHeaderFadeLayoutModule (upval), UseBindingResult (copy)
		return ConversationHeaderFadeLayoutModule.getHeaderOverlapPadding(UseBindingResult)
	end, { UseBindingResult })
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 59 ]]
		-- upvalues: ConversationHeaderFadeLayoutModule (upval), UseBindingResult (copy), TransparencyValue (copy)
		return ConversationHeaderFadeLayoutModule.getHeaderVisibleHeight(UseBindingResult, TransparencyValue)
	end, { UseBindingResult, TransparencyValue })
	local UseMemoResult2 = ReactModule.useMemo(function() --[[ Line: 62 ]]
		-- upvalues: ConversationHeaderFadeLayoutModule (upval), UseBindingResult (copy), UseMemoResult1 (copy), UseBindingResult1 (copy)
		return ConversationHeaderFadeLayoutModule.getContentTopPadding(UseBindingResult, UseMemoResult1, UseBindingResult1)
	end, { UseBindingResult, UseMemoResult1, UseBindingResult1 })
	local UseMemoResult3 = ReactModule.useMemo(function() --[[ Line: 65 ]]
		-- upvalues: ReactModule (upval), UseBindingResult (copy), UseMemoResult1 (copy), UseBindingResult3 (copy), GetMessageFadeSequenceModule (upval)
		return ReactModule.joinBindings({
			headerHeight = UseBindingResult,
			headerVisibleHeight = UseMemoResult1,
			viewportHeight = UseBindingResult3
		}):map(function(p2) --[[ Line: 70 ]]
			-- upvalues: GetMessageFadeSequenceModule (upval)
			return GetMessageFadeSequenceModule(p2.headerHeight, p2.viewportHeight, if p2.headerHeight > 0 then p2.headerVisibleHeight / p2.headerHeight else 0)
		end)
	end, { UseBindingResult, UseMemoResult1, UseBindingResult3 })
	local UseMemoResult4 = ReactModule.useMemo(function() --[[ Line: 77 ]]
		-- upvalues: ConversationHeaderFadeLayoutModule (upval), TransparencyValue (copy)
		return ConversationHeaderFadeLayoutModule.getHeaderInteractable(TransparencyValue)
	end, { TransparencyValue })
	ReactModule.useEffect(function() --[[ Line: 83 ]]
		-- upvalues: UseBindingResult2_1 (copy)
		UseBindingResult2_1(0)
	end, { ConversationId })
	
	return {
		onHeaderAbsoluteSizeChanged = UseResult,
		onMessageViewportAbsoluteSizeChanged = UseResult1,
		onMessageCanvasPositionChanged = UseResult2,
		headerLayoutPadding = UseMemoResult,
		contentTopPadding = UseMemoResult2,
		messageFadeSequence = UseMemoResult3,
		headerInteractable = UseMemoResult4
	}
end