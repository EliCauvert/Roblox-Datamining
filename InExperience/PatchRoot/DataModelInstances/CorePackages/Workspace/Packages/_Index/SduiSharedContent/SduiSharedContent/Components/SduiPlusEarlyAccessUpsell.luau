local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local plusEarlyAccessUpsellBanner = require(parent.GamePlayButton).PlusEarlyAccessUpsellBanner

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), plusEarlyAccessUpsellBanner (ref)
	return if p1.universeId == nil then nil else reactModule.createElement(plusEarlyAccessUpsellBanner, { universeId = p1.universeId, LayoutOrder = p1.layoutOrder })
end)