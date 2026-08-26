local parent = script.Parent
local parent_1 = parent.Parent
local cryoModule = require(parent_1.Cryo)
local foundationModule = require(parent_1.Foundation)
local reactModule = require(parent_1.React)
local altTextCard = require(parent.Components).AltTextCard.AltTextCard
local cardComponent = require(parent.utils).CardsHelper.CardComponent
local _ = require(parent.CardsType)
local useTokens = foundationModule.Hooks.useTokens
local t = {
	layoutOrder = 1,
	anchorPoint = Vector2.new(0, 0),
	position = UDim2.fromScale(0, 0)
}

return function(p1)
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), reactModule (ref), cardComponent (ref), altTextCard (ref), foundationModule (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local var2 = useTokens()
	local var3 = reactModule.useCallback(function(p2)
		-- upvalues: cardComponent (copy), var1 (ref), cryoModule (copy), reactModule (copy), altTextCard (copy), foundationModule (copy), var2 (ref)
		local t = {}
		
		for i, v in ipairs(p2.components) do
			if cardComponent[v.type] then
				local data = v.data
				
				if var1.analyticsInfo then
					data = cryoModule.Dictionary.join(data, var1.analyticsInfo)
				end
				table.insert(t, reactModule.createElement(cardComponent[v.type], data))
			else
				t = {
					reactModule.createElement(altTextCard, { altText = p2.alt_text })
				}
				break
			end
		end
		return reactModule.createElement(foundationModule.View, {
			AutomaticSize = Enum.AutomaticSize.XY,
			backgroundStyle = var2.Color.Shift.Shift_200,
			cornerRadius = UDim.new(0, var2.Radius.Large)
		}, t)
	end, {})
	local t_1 = {}
	
	for i, v in pairs(var1.cards) do
		table.insert(t_1, var3(v))
	end
	return reactModule.createElement(foundationModule.View, {
		AutomaticSize = Enum.AutomaticSize.XY,
		AnchorPoint = var1.anchorPoint,
		Position = var1.position,
		LayoutOrder = var1.layoutOrder
	}, t_1)
end