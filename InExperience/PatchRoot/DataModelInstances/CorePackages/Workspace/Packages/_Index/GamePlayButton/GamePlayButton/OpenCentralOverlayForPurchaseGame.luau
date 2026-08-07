local parent = script:FindFirstAncestor("GamePlayButton").Parent
local centralOverlayType = require(parent.RobloxAppEnums).CentralOverlayType
local setCentralOverlay = require(parent.CentralOverlay).Actions.SetCentralOverlay

return function(p0, p1, p2, p3, p4, p5) --[[ line: 6 ]]
	-- upvalues: setCentralOverlay (ref), centralOverlayType (ref)
	return function(p6) --[[ line: 7 ]]
		-- upvalues: setCentralOverlay (copy), centralOverlayType (copy), p0 (ref), p1 (ref), p2 (ref), p3 (ref), p4 (ref), p5 (ref)
		p6:dispatch(setCentralOverlay(centralOverlayType.PurchaseGame, {
			universeId = p0,
			gameName = p1,
			price = p2,
			productId = p3,
			sellerId = p4,
			pageFilter = p5
		}))
	end
end