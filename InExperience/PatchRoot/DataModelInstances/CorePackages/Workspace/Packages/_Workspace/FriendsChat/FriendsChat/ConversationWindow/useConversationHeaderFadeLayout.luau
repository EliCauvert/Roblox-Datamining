local reactModule = require(script:FindFirstAncestor("FriendsChat").Parent.React)
local conversationHeaderFadeLayoutModule = require(script.Parent.ConversationHeaderFadeLayout)
local getMessageFadeSequenceModule = require(script.Parent.getMessageFadeSequence)

return function(p1)
	-- upvalues: reactModule (ref), conversationHeaderFadeLayoutModule (ref), getMessageFadeSequenceModule (ref)
	local transparencyValue = p1.transparencyValue
	local conversationId = p1.conversationId
	local var1, var2 = reactModule.useBinding(0)
	local var3, var4 = reactModule.useBinding(0)
	local var5, var6 = reactModule.useBinding(0)
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref)
		var2(p2.AbsoluteSize.Y)
	end, {})
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref)
		var6(p2.AbsoluteSize.Y)
	end, {})
	local var9 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var4 (ref)
		var4(math.clamp(p2.Y, 0, p3))
	end, {})
	local var10 = reactModule.useMemo(function()
		-- upvalues: conversationHeaderFadeLayoutModule (copy), var1 (ref)
		return conversationHeaderFadeLayoutModule.getHeaderOverlapPadding(var1)
	end, { var1 })
	local var11 = reactModule.useMemo(function()
		-- upvalues: conversationHeaderFadeLayoutModule (copy), var1 (ref), transparencyValue (ref)
		return conversationHeaderFadeLayoutModule.getHeaderVisibleHeight(var1, transparencyValue)
	end, { var1, transparencyValue })
	local var12 = reactModule.useMemo(function()
		-- upvalues: conversationHeaderFadeLayoutModule (copy), var1 (ref), var11 (ref), var3 (ref)
		return conversationHeaderFadeLayoutModule.getContentTopPadding(var1, var11, var3)
	end, { var1, var11, var3 })
	local var13 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), var1 (ref), var11 (ref), var5 (ref), getMessageFadeSequenceModule (copy)
		return reactModule.joinBindings({
			headerHeight = var1,
			headerVisibleHeight = var11,
			viewportHeight = var5
		}):map(function(p2)
			-- upvalues: getMessageFadeSequenceModule (copy)
			return getMessageFadeSequenceModule(p2.headerHeight, p2.viewportHeight, if p2.headerHeight > 0 then p2.headerVisibleHeight / p2.headerHeight else 0)
		end)
	end, { var1, var11, var5 })
	local var14 = reactModule.useMemo(function()
		-- upvalues: conversationHeaderFadeLayoutModule (copy), transparencyValue (ref)
		return conversationHeaderFadeLayoutModule.getHeaderInteractable(transparencyValue)
	end, { transparencyValue })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref)
		var4(0)
	end, { conversationId })
	
	return {
		onHeaderAbsoluteSizeChanged = var7,
		onMessageViewportAbsoluteSizeChanged = var8,
		onMessageCanvasPositionChanged = var9,
		headerLayoutPadding = var10,
		contentTopPadding = var12,
		messageFadeSequence = var13,
		headerInteractable = var14
	}
end