local Parent = script:FindFirstAncestor("GamePlayButton").Parent
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay

return function(UniverseId, GameName, Price, ProductId, SellerId, PageFilter) --[[ Line: 6 ]]
	-- upvalues: SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	return function(p1) --[[ Line: 7 ]]
		-- upvalues: SetCentralOverlayFunction (upval), CentralOverlayType (upval), UniverseId (copy), GameName (copy), Price (copy), ProductId (copy), SellerId (copy), PageFilter (copy)
		p1:dispatch(SetCentralOverlayFunction(CentralOverlayType.PurchaseGame, {
			universeId = UniverseId,
			gameName = GameName,
			price = Price,
			productId = ProductId,
			sellerId = SellerId,
			pageFilter = PageFilter
		}))
	end
end