local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local socialCardsModule = require(parent.SocialCards)
local useLocalUserId = require(parent.RobloxAppHooks).useLocalUserId
local useChatPagePaddingModule = require(appChat.Contexts.ChatPagePadding.useChatPagePadding)
local useChatPlacementContext = require(appChat.Contexts.ChatPlacementContext).useChatPlacementContext
local cards = socialCardsModule.Cards
local userTile = require(parent.UserTile).UserTile
local layoutMode = require(parent.UserTile).LayoutMode
local userPresence = require(parent.Foundation).Enums.UserPresence
local useTokens = foundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: useLocalUserId (ref), useTokens (ref), useChatPagePaddingModule (ref), useChatPlacementContext (ref), reactModule (ref), foundationModule (ref), userTile (ref), layoutMode (ref), userPresence (ref), cards (ref)
	local var1 = useLocalUserId()
	local var2 = tostring(var1) == p1.senderTargetId
	local var3 = useTokens()
	local var4 = useChatPagePaddingModule()
	local var5 = useChatPlacementContext()
	local var6 = reactModule.useMemo(function()
		-- upvalues: var3 (ref)
		return Vector2.new(var3.Size.Size_700, var3.Size.Size_700)
	end, { var3 })
	local size200 = var3.Size.Size_200
	
	return reactModule.createElement(foundationModule.View, {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		testId = p1.testId,
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = if not p1.senderTargetId then Enum.HorizontalAlignment.Center elseif var2 then Enum.HorizontalAlignment.Right else Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, size200),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Bottom
		},
		padding = {
			left = UDim.new(0, var4.left),
			right = UDim.new(0, var4.right),
			top = UDim.new(0, var3.Padding.XSmall)
		}
	}, {
		Avatar = if p1.senderTargetId and p1.senderTargetId ~= var1 then reactModule.createElement(foundationModule.View, {
			Size = UDim2.new(0, var6.X, 0, var6.Y),
			LayoutOrder = if var2 then 2 else 1
		}, {
			reactModule.createElement(userTile, {
				userId = p1.senderTargetId,
				layoutMode = layoutMode.compact,
				userPresenceType = userPresence.None
			})
		}) else nil,
		Cards = if p1.cards then reactModule.createElement(foundationModule.View, {
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, if p1.senderTargetId then -(var6.X + size200) else 0, 0, 0),
			LayoutOrder = if var2 then 1 else 2
		}, reactModule.createElement(cards, {
			analyticsInfo = { moduleLocation = var5.chatPlacement },
			anchorPoint = if var2 then Vector2.new(1, 0) else Vector2.new(0, 0),
			position = if var2 then UDim2.fromScale(1, 0) else UDim2.fromScale(0, 0),
			cards = p1.cards
		})) else nil
	})
end