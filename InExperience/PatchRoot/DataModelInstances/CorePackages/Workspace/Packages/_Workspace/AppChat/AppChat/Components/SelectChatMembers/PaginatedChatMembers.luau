local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local flatList = require(parent.VirtualizedList).FlatList
local appChatPerfChatMembersPaginationWindowSize = game:DefineFastInt("AppChatPerfChatMembersPaginationWindowSize", 2)
local appChatPerfChatMembersPaginationInitialRender = game:DefineFastInt("AppChatPerfChatMembersPaginationInitialRender", 8)
local appChatPerfChatMembersPaginationOnEndReachedUnits = game:DefineFastInt("AppChatPerfChatMembersPaginationOnEndReachedUnits", 1)

local var1 = function(p1, p2)
	return tostring(p1 or p2)
end

local t = {
	ScrollBarThickness = 0,
	Name = "PaginatedChatMembers",
	BackgroundTransparency = 1
}
local t_1 = { BackgroundTransparency = 1 }

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), appChatPerfChatMembersPaginationWindowSize (ref), appChatPerfChatMembersPaginationInitialRender (ref), appChatPerfChatMembersPaginationOnEndReachedUnits (ref), foundationModule (ref), flatList (ref), t (ref), t_1 (ref), var1 (ref)
	local var2 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		if var2.current then
			local nativeScrollRef = var2.current:getNativeScrollRef()
			
			if nativeScrollRef and nativeScrollRef._nativeRef and nativeScrollRef._nativeRef.current then
				nativeScrollRef._nativeRef.current.Selectable = false
			end
		end
	end, {})
	
	return reactModule.createElement(foundationModule.View, { tag = "size-full col gap-small" }, {
		Header = if p1.headerText then reactModule.createElement(foundationModule.Text, {
			tag = "size-full-0 auto-y text-align-x-left text-align-y-bottom text-title-large padding-x-medium",
			LayoutOrder = 1,
			Text = p1.headerText
		}) else nil,
		ListContainer = reactModule.createElement(foundationModule.View, { LayoutOrder = 2, tag = "size-full-0 fill" }, {
			List = reactModule.createElement(flatList, {
				style = t,
				contentContainerStyle = t_1,
				renderItem = p1.renderItem,
				data = p1.userIds,
				windowSize = appChatPerfChatMembersPaginationWindowSize,
				initialNumToRender = appChatPerfChatMembersPaginationInitialRender,
				onEndReachedThreshold = appChatPerfChatMembersPaginationOnEndReachedUnits,
				onEndReached = reactModule.useCallback(function()
					-- upvalues: p1 (ref)
					if p1.fetchMoreFriends then
						p1.fetchMoreFriends()
					end
				end, { p1.fetchMoreFriends }),
				keyExtractor = var1,
				ref = var2
			})
		})
	})
end)