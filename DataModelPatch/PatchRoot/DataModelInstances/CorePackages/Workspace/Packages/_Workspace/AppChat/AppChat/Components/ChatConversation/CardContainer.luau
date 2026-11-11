local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalUserIdFunction = require(Parent.RobloxAppHooks).useLocalUserId
local UseChatPagePaddingModule = require(AppChat.Contexts.ChatPagePadding.useChatPagePadding)
local UseChatPlacementContextFunction = require(AppChat.Contexts.ChatPlacementContext).useChatPlacementContext
local Cards = require(Parent.SocialCards).Cards
local UserTile = require(Parent.UserTile).UserTile
local LayoutMode = require(Parent.UserTile).LayoutMode
local UserPresence = require(Parent.Foundation).Enums.UserPresence
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseLocalUserIdFunction (copy), UseTokensFunction (copy), UseChatPagePaddingModule (copy), UseChatPlacementContextFunction (copy), ReactModule (copy), FoundationModule (copy), UserTile (copy), LayoutMode (copy), UserPresence (copy), Cards (copy)
	local UseLocalUserIdResult = UseLocalUserIdFunction()
	local IsTextMatch = tostring(UseLocalUserIdResult) == p1.senderTargetId
	local UseTokensResult = UseTokensFunction()
	local UseChatPagePaddingModuleResult = UseChatPagePaddingModule()
	local UseChatPlacementContextResult = UseChatPlacementContextFunction()
	local UseMemoResult = ReactModule.useMemo(function(): Vector2
		-- upvalues: UseTokensResult (copy)
		return Vector2.new(UseTokensResult.Size.Size_700, UseTokensResult.Size.Size_700)
	end, { UseTokensResult })
	local Size200 = UseTokensResult.Size.Size_200
	
	return ReactModule.createElement(FoundationModule.View, {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		testId = p1.testId,
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = if p1.senderTargetId then if IsTextMatch then Enum.HorizontalAlignment.Right else Enum.HorizontalAlignment.Left else Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, Size200),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Bottom
		},
		padding = {
			left = UDim.new(0, UseChatPagePaddingModuleResult.left),
			right = UDim.new(0, UseChatPagePaddingModuleResult.right),
			top = UDim.new(0, UseTokensResult.Padding.XSmall)
		}
	}, {
		Avatar = if p1.senderTargetId and p1.senderTargetId ~= UseLocalUserIdResult then ReactModule.createElement(FoundationModule.View, {
			Size = UDim2.new(0, UseMemoResult.X, 0, UseMemoResult.Y),
			LayoutOrder = if IsTextMatch then 2 else 1
		}, {
			ReactModule.createElement(UserTile, {
				userId = p1.senderTargetId,
				layoutMode = LayoutMode.compact,
				userPresenceType = UserPresence.None
			})
		}) else nil,
		Cards = if p1.cards then ReactModule.createElement(FoundationModule.View, {
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, if p1.senderTargetId then -(UseMemoResult.X + Size200) else 0, 0, 0),
			LayoutOrder = if IsTextMatch then 1 else 2
		}, ReactModule.createElement(Cards, {
			analyticsInfo = {
				moduleLocation = UseChatPlacementContextResult.chatPlacement
			},
			anchorPoint = if IsTextMatch then Vector2.new(1, 0) else Vector2.new(0, 0),
			position = if IsTextMatch then UDim2.fromScale(1, 0) else UDim2.fromScale(0, 0),
			cards = p1.cards
		})) else nil
	})
end