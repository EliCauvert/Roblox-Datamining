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

return function(p0) --[[ line: 28 | named "CardContainer" ]]
	-- upvalues: useLocalUserId (ref), useTokens (ref), useChatPagePaddingModule (ref), useChatPlacementContext (ref), reactModule (ref), foundationModule (ref), userTile (ref), layoutMode (ref), userPresence (ref), cards (ref)
	local var5 = useLocalUserId()
	local var6 = tostring(var5) == p0.senderTargetId
	local var7 = useTokens()
	local var8 = useChatPagePaddingModule()
	local var9 = useChatPlacementContext()
	local var10 = reactModule.useMemo(function() --[[ line: 35 ]]
		-- upvalues: var7 (ref)
		return Vector2.new(var7.Size.Size_700, var7.Size.Size_700)
	end, { var7 })
	local size200 = var7.Size.Size_200
	
	return reactModule.createElement(foundationModule.View, {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.fromScale(1, 0),
		testId = p0.testId,
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = if not p0.senderTargetId then Enum.HorizontalAlignment.Center elseif var6 then Enum.HorizontalAlignment.Right else Enum.HorizontalAlignment.Left,
			Padding = UDim.new(0, size200),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Bottom
		},
		padding = {
			left = UDim.new(0, var8.left),
			right = UDim.new(0, var8.right),
			top = UDim.new(0, var7.Padding.XSmall)
		}
	}, {
		Avatar = if p0.senderTargetId and p0.senderTargetId ~= var5 then reactModule.createElement(foundationModule.View, {
			Size = UDim2.new(0, var10.X, 0, var10.Y),
			LayoutOrder = if var6 then 2 else 1
		}, {
			reactModule.createElement(userTile, {
				userId = p0.senderTargetId,
				layoutMode = layoutMode.compact,
				userPresenceType = userPresence.None
			})
		}) else nil,
		Cards = if p0.cards then reactModule.createElement(foundationModule.View, {
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, if p0.senderTargetId then -(var10.X + size200) else 0, 0, 0),
			LayoutOrder = if var6 then 1 else 2
		}, reactModule.createElement(cards, {
			analyticsInfo = { moduleLocation = var9.chatPlacement },
			anchorPoint = if var6 then Vector2.new(1, 0) else Vector2.new(0, 0),
			position = if var6 then UDim2.fromScale(1, 0) else UDim2.fromScale(0, 0),
			cards = p0.cards
		})) else nil
	})
end