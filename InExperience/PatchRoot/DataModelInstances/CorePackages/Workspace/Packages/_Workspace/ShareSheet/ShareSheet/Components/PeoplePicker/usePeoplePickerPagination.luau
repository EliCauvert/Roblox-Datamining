local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local reactModule = require(parent.React)
local _ = require(parent.AppChat.GetConversationListStore)
local fetchConversationListPageToSignalsModule = require(parent.AppChat.fetchConversationListPageToSignals)
local fFlagShareSheetFriendsSort = require(parent.SharedFlags).FFlagShareSheetFriendsSort
local _ = require(shareSheet.Types)
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
	-- upvalues: fFlagShareSheetFriendsSort (ref), shareSheetConstantsModule (ref), reactModule (ref), fetchConversationListPageToSignalsModule (ref), var1 (ref)
	local isFetchingNextPage, var2, nextPageToken
	local isPeoplePickerDisplayed = p1.isPeoplePickerDisplayed
	local _ = nil
	local _ = nil
	local _ = nil
	
	if fFlagShareSheetFriendsSort then
		local listResult = p1.listResult
		isFetchingNextPage = listResult.isFetchingNextPage
		var2 = listResult.nextPageToken ~= nil
		nextPageToken = listResult.nextPageToken
	else
		isFetchingNextPage = p1.listStatus.isFetchingConversations == true
		var2 = p1.listStatus.oldestConversationIsFetched ~= true
		nextPageToken = p1.listStatus.nextCursor
	end
	local isEligibilityLoading = p1.isEligibilityLoading or isFetchingNextPage
	local var3 = if not isEligibilityLoading and (var2 and p1.conversationCount < shareSheetConstantsModule.FIntShareSheetPeoplePickerMaxConversations) then nextPageToken or "" else ""
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var4 (ref), fFlagShareSheetFriendsSort (copy), p1 (ref), fetchConversationListPageToSignalsModule (copy)
		if var3 == "" or var4.current == var3 then return end
		var4.current = var3
		
		if fFlagShareSheetFriendsSort then
			p1.loadMore(var3)
			
			return
		end
		fetchConversationListPageToSignalsModule({ cursor = var3 })
	end, { var3, p1.loadMore })
	local var7 = reactModule.useRef({
		contentLength = nil,
		scrollOffset = 0,
		viewportLength = nil
	})
	local var8, var9 = reactModule.useState(nil)
	local var10 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), var1 (copy), var7 (ref)
		local current = var5.current
		
		if current then
			local y = current.AbsoluteWindowSize.Y
			
			return if y <= 0 then false else current.AbsoluteCanvasSize.Y - y * var1 <= current.CanvasPosition.Y + y
		end
		local current_1 = var7.current
		
		if current_1.viewportLength == nil or current_1.contentLength == nil then
			return false
		end
		local viewportLength = current_1.viewportLength
		
		return if viewportLength <= 0 then false else current_1.contentLength - viewportLength * var1 <= current_1.scrollOffset + viewportLength
	end, {})
	local var11 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), isPeoplePickerDisplayed (ref), var6 (ref)
		local current = var7.current
		
		if isPeoplePickerDisplayed and current.viewportLength ~= nil and current.contentLength ~= nil then
			local viewportLength = current.viewportLength
			
			if viewportLength > 0 and current.contentLength <= viewportLength then
				var6()
			end
		end
	end, { isPeoplePickerDisplayed, var6 })
	local var12 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref), var11 (ref)
		var7.current.contentLength = p2
		var11()
	end, { var11 })
	local var13 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref), isPeoplePickerDisplayed (ref), var10 (ref), var4 (ref)
		var7.current.scrollOffset = p2
		
		if not isPeoplePickerDisplayed then return end
		if not var10() then
			var4.current = nil
		end
	end, { isPeoplePickerDisplayed, var10 })
	local var14 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref), var9 (ref), var1 (copy), var11 (ref)
		var7.current.viewportLength = p2.Y
		var9(p2.Y * var1)
		var11()
	end, { var11 })
	local var15 = reactModule.useCallback(function(p2)
		-- upvalues: var5 (ref)
		var5.current = p2
	end, {})
	reactModule.useEffect(function()
		-- upvalues: isPeoplePickerDisplayed (ref), var4 (ref), var11 (ref)
		if isPeoplePickerDisplayed then
			local var16 = false
			task.defer(function()
				-- upvalues: var16 (write), var11 (copy)
				if not var16 then
					var11()
				end
			end)
			
			return function()
				-- upvalues: var16 (write)
				var16 = true
			end
		end
		var4.current = nil
	end, { isPeoplePickerDisplayed, var11 })
	
	return {
		isLoading = isEligibilityLoading,
		paginationProps = {
			endReachedThreshold = var8,
			scrollingFrameRef = var15,
			onContentLengthChanged = var12,
			onEndReached = if isPeoplePickerDisplayed and var3 ~= "" then var6 else nil,
			onScrollOffsetChanged = var13,
			onViewportChanged = var14
		}
	}
end