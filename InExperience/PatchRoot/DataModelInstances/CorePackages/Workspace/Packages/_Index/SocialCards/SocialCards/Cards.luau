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

return function(p1) --[[ Line: 30 | Named "Cards" ]]
	-- upvalues: CryoModule (copy), config (copy), UseTokensFunction (copy), ReactModule (copy), CardComponent (copy), AltTextCard (copy), FoundationModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseTokensResult = UseTokensFunction()
	local UseResult = ReactModule.useCallback(function(p2) --[[ Line: 34 ]]
		-- upvalues: CardComponent (upval), UnionResult (copy), CryoModule (upval), ReactModule (upval), AltTextCard (upval), FoundationModule (upval), UseTokensResult (copy)
		local List = {}
		
		for _, component in ipairs(p2.components) do
			if not CardComponent[component.type] then
				List = {
					ReactModule.createElement(AltTextCard, { altText = p2.alt_text })
				}
				break
			end
			local Data = component.data
			
			if UnionResult.analyticsInfo then
				Data = CryoModule.Dictionary.join(Data, UnionResult.analyticsInfo)
			end
			table.insert(List, ReactModule.createElement(CardComponent[component.type], Data))
		end
		return ReactModule.createElement(FoundationModule.View, {
			AutomaticSize = Enum.AutomaticSize.XY,
			backgroundStyle = UseTokensResult.Color.Shift.Shift_200,
			cornerRadius = UDim.new(0, UseTokensResult.Radius.Large)
		}, List)
	end, {})
	local List = {}
	
	for _, card in pairs(UnionResult.cards) do
		table.insert(List, UseResult(card))
	end
	return ReactModule.createElement(FoundationModule.View, {
		AutomaticSize = Enum.AutomaticSize.XY,
		AnchorPoint = UnionResult.anchorPoint,
		Position = UnionResult.position,
		LayoutOrder = UnionResult.layoutOrder
	}, List)
end