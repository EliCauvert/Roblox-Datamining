local reactModule = require(script:FindFirstAncestor("FriendsChat").Parent.React)
local conversationHeaderFadeLayoutModule = require(script.Parent.ConversationHeaderFadeLayout)
local getMessageFadeSequenceModule = require(script.Parent.getMessageFadeSequence)

return function(p0) --[[ line: 38 | named "useConversationHeaderFadeLayout" ]]
	-- upvalues: reactModule (ref), conversationHeaderFadeLayoutModule (ref), getMessageFadeSequenceModule (ref)
	local transparencyValue = p0.transparencyValue
	local conversationId = p0.conversationId
	local var3, var4 = reactModule.useBinding(0)
	local var5, var6 = reactModule.useBinding(0)
	local var7, var8 = reactModule.useBinding(0)
	local var9 = reactModule.useCallback(function(p1) --[[ line: 46 ]]
		-- upvalues: var4 (ref)
		var4(p1.AbsoluteSize.Y)
	end, {})
	local var10 = reactModule.useCallback(function(p2) --[[ line: 49 ]]
		-- upvalues: var8 (ref)
		var8(p2.AbsoluteSize.Y)
	end, {})
	local var11 = reactModule.useCallback(function(p3, p4) --[[ line: 52 ]]
		-- upvalues: var6 (ref)
		var6(math.clamp(p3.Y, 0, p4))
	end, {})
	local var12 = reactModule.useMemo(function() --[[ line: 56 ]]
		-- upvalues: conversationHeaderFadeLayoutModule (copy), var3 (ref)
		return conversationHeaderFadeLayoutModule.getHeaderOverlapPadding(var3)
	end, { var3 })
	local var13 = reactModule.useMemo(function() --[[ line: 59 ]]
		-- upvalues: conversationHeaderFadeLayoutModule (copy), var3 (ref), transparencyValue (ref)
		return conversationHeaderFadeLayoutModule.getHeaderVisibleHeight(var3, transparencyValue)
	end, { var3, transparencyValue })
	local var14 = reactModule.useMemo(function() --[[ line: 62 ]]
		-- upvalues: conversationHeaderFadeLayoutModule (copy), var3 (ref), var13 (ref), var5 (ref)
		return conversationHeaderFadeLayoutModule.getContentTopPadding(var3, var13, var5)
	end, { var3, var13, var5 })
	local var15 = reactModule.useMemo(function() --[[ line: 65 ]]
		-- upvalues: reactModule (copy), var3 (ref), var13 (ref), var7 (ref), getMessageFadeSequenceModule (copy)
		return reactModule.joinBindings({
			headerHeight = var3,
			headerVisibleHeight = var13,
			viewportHeight = var7
		}):map(function(p5) --[[ line: 70 ]]
			-- upvalues: getMessageFadeSequenceModule (copy)
			return getMessageFadeSequenceModule(p5.headerHeight, p5.viewportHeight, if p5.headerHeight > 0 then p5.headerVisibleHeight / p5.headerHeight else 0)
		end)
	end, { var3, var13, var7 })
	local var16 = reactModule.useMemo(function() --[[ line: 77 ]]
		-- upvalues: conversationHeaderFadeLayoutModule (copy), transparencyValue (ref)
		return conversationHeaderFadeLayoutModule.getHeaderInteractable(transparencyValue)
	end, { transparencyValue })
	reactModule.useEffect(function() --[[ line: 83 ]]
		-- upvalues: var6 (ref)
		var6(0)
	end, { conversationId })
	
	return {
		onHeaderAbsoluteSizeChanged = var9,
		onMessageViewportAbsoluteSizeChanged = var10,
		onMessageCanvasPositionChanged = var11,
		headerLayoutPadding = var12,
		contentTopPadding = var14,
		messageFadeSequence = var15,
		headerInteractable = var16
	}
end