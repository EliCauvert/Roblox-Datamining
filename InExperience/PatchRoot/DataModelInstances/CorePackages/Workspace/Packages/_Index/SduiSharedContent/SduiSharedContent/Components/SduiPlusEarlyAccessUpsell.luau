local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local PlusEarlyAccessUpsellBanner = require(Parent.GamePlayButton).PlusEarlyAccessUpsellBanner

return ReactModule.memo(function(p1) --[[ Line: 14 | Named "SduiPlusEarlyAccessUpsell" ]]
	-- upvalues: ReactModule (copy), PlusEarlyAccessUpsellBanner (copy)
	return if p1.universeId == nil then nil else ReactModule.createElement(PlusEarlyAccessUpsellBanner, { universeId = p1.universeId, LayoutOrder = p1.layoutOrder })
end)