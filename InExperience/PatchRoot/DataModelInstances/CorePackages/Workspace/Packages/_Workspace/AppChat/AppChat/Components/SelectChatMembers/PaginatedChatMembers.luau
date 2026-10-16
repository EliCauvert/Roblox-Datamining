local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FlatList = require(Parent.VirtualizedList).FlatList
local AppChatPerfChatMembersPaginationWindowSize = game:DefineFastInt("AppChatPerfChatMembersPaginationWindowSize", 2)
local AppChatPerfChatMembersPaginationInitialRender = game:DefineFastInt("AppChatPerfChatMembersPaginationInitialRender", 8)
local AppChatPerfChatMembersPaginationOnEndReachedUnits = game:DefineFastInt("AppChatPerfChatMembersPaginationOnEndReachedUnits", 1)

local function KeyExtractor(p1, p2): string --[[ Line: 22 ]]
	return (tostring(p1 or p2))
end

local Style = {
	ScrollBarThickness = 0,
	Name = "PaginatedChatMembers",
	BackgroundTransparency = 1
}
local ContentContainerStyle = { BackgroundTransparency = 1 }

return ReactModule.memo(function(p1) --[[ Line: 35 | Named "PaginatedChatMembers" ]]
	-- upvalues: ReactModule (copy), AppChatPerfChatMembersPaginationWindowSize (copy), AppChatPerfChatMembersPaginationInitialRender (copy), AppChatPerfChatMembersPaginationOnEndReachedUnits (copy), FoundationModule (copy), FlatList (copy), Style (copy), ContentContainerStyle (copy), KeyExtractor (copy)
	local UseRefResult = ReactModule.useRef(nil)
	ReactModule.useEffect(function() --[[ Line: 38 ]]
		-- upvalues: UseRefResult (copy)
		if UseRefResult.current then
			local NativeScrollRef = UseRefResult.current:getNativeScrollRef()
			
			if NativeScrollRef and NativeScrollRef._nativeRef and NativeScrollRef._nativeRef.current then
				NativeScrollRef._nativeRef.current.Selectable = false
			end
		end
	end, {})
	
	return ReactModule.createElement(FoundationModule.View, { tag = "size-full col gap-small" }, {
		Header = if p1.headerText then ReactModule.createElement(FoundationModule.Text, {
			tag = "size-full-0 auto-y text-align-x-left text-align-y-bottom text-title-large padding-x-medium",
			LayoutOrder = 1,
			Text = p1.headerText
		}) else nil,
		ListContainer = ReactModule.createElement(FoundationModule.View, { LayoutOrder = 2, tag = "size-full-0 fill" }, {
			List = ReactModule.createElement(FlatList, {
				style = Style,
				contentContainerStyle = ContentContainerStyle,
				renderItem = p1.renderItem,
				data = p1.userIds,
				windowSize = AppChatPerfChatMembersPaginationWindowSize,
				initialNumToRender = AppChatPerfChatMembersPaginationInitialRender,
				onEndReachedThreshold = AppChatPerfChatMembersPaginationOnEndReachedUnits,
				onEndReached = ReactModule.useCallback(function() --[[ Line: 51 ]]
					-- upvalues: p1 (copy)
					if p1.fetchMoreFriends then
						p1.fetchMoreFriends()
					end
				end, { p1.fetchMoreFriends }),
				keyExtractor = KeyExtractor,
				ref = UseRefResult
			})
		})
	})
end)