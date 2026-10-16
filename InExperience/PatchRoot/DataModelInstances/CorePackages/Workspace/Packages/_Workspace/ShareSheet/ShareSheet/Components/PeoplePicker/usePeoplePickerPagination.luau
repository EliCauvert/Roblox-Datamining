local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local reactModule = require(parent.React)
local _ = require(parent.AppChat.GetConversationListStore)
local fetchConversationListPageToSignalsModule = require(parent.AppChat.fetchConversationListPageToSignals)
local shareSheetConstantsModule = require(shareSheet.ShareSheetConstants)
local var1 = shareSheetConstantsModule.FIntShareSheetPeoplePickerLoadMoreThresholdWindowHundredthsPercent / 10000

local function _(p1, p2, p3)
	-- upvalues: var1 (ref)
	return if p2 <= 0 then false else p3 - p2 * var1 <= p1 + p2
end

local _ = function(p1, p2)
	return p1 > 0 and p2 <= p1
end

return function(p1)
	-- upvalues: shareSheetConstantsModule (ref), reactModule (ref), fetchConversationListPageToSignalsModule (ref), var1 (ref)
	local isPeoplePickerDisplayed = p1.isPeoplePickerDisplayed
	local isEligibilityLoading = p1.isEligibilityLoading or p1.listStatus.isFetchingConversations == true
	local var2 = if not isEligibilityLoading and (p1.listStatus.oldestConversationIsFetched ~= true and p1.conversationCount < shareSheetConstantsModule.FIntShareSheetPeoplePickerMaxConversations) then p1.listStatus.nextCursor or "" else ""
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), var3 (ref), fetchConversationListPageToSignalsModule (copy)
		if var2 == "" or var3.current == var2 then
			return
		end
		var3.current = var2
		fetchConversationListPageToSignalsModule({ cursor = var2 })
	end, { var2 })
	local var6 = reactModule.useRef({
		contentLength = nil,
		scrollOffset = 0,
		viewportLength = nil
	})
	local var7, var8 = reactModule.useState(nil)
	local var9 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), var1 (copy), var6 (ref)
		local current = var4.current
		
		if current then
			local y = current.AbsoluteWindowSize.Y
			
			return if y <= 0 then false else current.AbsoluteCanvasSize.Y - y * var1 <= current.CanvasPosition.Y + y
		end
		local current_1 = var6.current
		
		if current_1.viewportLength == nil or current_1.contentLength == nil then
			return false
		end
		local viewportLength = current_1.viewportLength
		
		return if viewportLength <= 0 then false else current_1.contentLength - viewportLength * var1 <= current_1.scrollOffset + viewportLength
	end, {})
	local var10 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), isPeoplePickerDisplayed (ref), var5 (ref)
		local current = var6.current
		
		if isPeoplePickerDisplayed and current.viewportLength ~= nil and current.contentLength ~= nil then
			local viewportLength = current.viewportLength
			
			if viewportLength > 0 and current.contentLength <= viewportLength then
				var5()
			end
		end
	end, { isPeoplePickerDisplayed, var5 })
	local var11 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref), var10 (ref)
		var6.current.contentLength = p2
		var10()
	end, { var10 })
	local var12 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref), isPeoplePickerDisplayed (ref), var9 (ref), var3 (ref)
		var6.current.scrollOffset = p2
		
		if not isPeoplePickerDisplayed then return end
		if not var9() then
			var3.current = nil
		end
	end, { isPeoplePickerDisplayed, var9 })
	local var13 = reactModule.useCallback(function(p2)
		-- upvalues: var6 (ref), var8 (ref), var1 (copy), var10 (ref)
		var6.current.viewportLength = p2.Y
		var8(p2.Y * var1)
		var10()
	end, { var10 })
	local var14 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref)
		var4.current = p2
	end, {})
	reactModule.useEffect(function()
		-- upvalues: isPeoplePickerDisplayed (ref), var3 (ref), var10 (ref)
		if isPeoplePickerDisplayed then
			local var15 = false
			task.defer(function()
				-- upvalues: var15 (write), var10 (copy)
				if not var15 then
					var10()
				end
			end)
			
			return function()
				-- upvalues: var15 (write)
				var15 = true
			end
		end
		var3.current = nil
	end, { isPeoplePickerDisplayed, var10 })
	
	return {
		isLoading = isEligibilityLoading,
		paginationProps = {
			endReachedThreshold = var7,
			scrollingFrameRef = var14,
			onContentLengthChanged = var11,
			onEndReached = if isPeoplePickerDisplayed and var2 ~= "" then var5 else nil,
			onScrollOffsetChanged = var12,
			onViewportChanged = var13
		}
	}
end