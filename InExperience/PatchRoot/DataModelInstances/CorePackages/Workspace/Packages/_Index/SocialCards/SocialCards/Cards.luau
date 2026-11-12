local Parent = script.Parent
local Parent1 = Parent.Parent
local CryoModule = require(Parent1.Cryo)
local FoundationModule = require(Parent1.Foundation)
local ReactModule = require(Parent1.React)
local AltTextCard = require(Parent.Components).AltTextCard.AltTextCard
local CardComponent = require(Parent.utils).CardsHelper.CardComponent
local _ = require(Parent.CardsType)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local config = {
	layoutOrder = 1,
	anchorPoint = Vector2.new(0, 0),
	position = UDim2.fromScale(0, 0)
}

local function renderCard(p1, ConversationId, AnalyticsInfo, p2)
	-- upvalues: CardComponent (copy), CryoModule (copy), ReactModule (copy), AltTextCard (copy), FoundationModule (copy)
	local List = {}
	
	for _, component in ipairs(p1.components) do
		if not CardComponent[component.type] then
			List = {
				ReactModule.createElement(AltTextCard, { altText = p1.alt_text })
			}
			break
		end
		local JoinResult = CryoModule.Dictionary.join(component.data, { conversationId = ConversationId })
		
		if AnalyticsInfo then
			JoinResult = CryoModule.Dictionary.join(JoinResult, AnalyticsInfo)
		end
		table.insert(List, ReactModule.createElement(CardComponent[component.type], JoinResult))
	end
	return ReactModule.createElement(FoundationModule.View, {
		AutomaticSize = Enum.AutomaticSize.XY,
		backgroundStyle = p2.Color.Shift.Shift_200,
		cornerRadius = UDim.new(0, p2.Radius.Large)
	}, List)
end

return function(p3)
	-- upvalues: CryoModule (copy), config (copy), UseTokensFunction (copy), renderCard (copy), ReactModule (copy), FoundationModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p3)
	local UseTokensResult = UseTokensFunction()
	local List = {}
	
	for _, card in pairs(UnionResult.cards) do
		table.insert(List, renderCard(card, UnionResult.conversationId, UnionResult.analyticsInfo, UseTokensResult))
	end
	return ReactModule.createElement(FoundationModule.View, {
		AutomaticSize = Enum.AutomaticSize.XY,
		AnchorPoint = UnionResult.anchorPoint,
		Position = UnionResult.position,
		LayoutOrder = UnionResult.layoutOrder
	}, List)
end