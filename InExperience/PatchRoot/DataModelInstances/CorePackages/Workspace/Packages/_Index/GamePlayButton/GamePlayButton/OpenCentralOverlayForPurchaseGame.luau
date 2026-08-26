local parent = script:FindFirstAncestor("GamePlayButton").Parent
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: setCentralOverlay (ref), centralOverlayType (ref)
	return function(p7)
		-- upvalues: setCentralOverlay (copy), centralOverlayType (copy), p1 (ref), p2 (ref), p3 (ref), p4 (ref), p5 (ref), p6 (ref)
		p7:dispatch(setCentralOverlay(centralOverlayType.PurchaseGame, {
			universeId = p1,
			gameName = p2,
			price = p3,
			productId = p4,
			sellerId = p5,
			pageFilter = p6
		}))
	end
end