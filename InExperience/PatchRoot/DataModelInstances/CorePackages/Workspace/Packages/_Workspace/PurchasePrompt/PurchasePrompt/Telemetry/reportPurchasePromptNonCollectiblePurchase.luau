local LoggingProtocolModule = require(script:FindFirstAncestor("PurchasePrompt").Parent.LoggingProtocol)
local config = {
	eventName = "PurchasePromptNonCollectiblePurchase",
	description = "Counts confirmed asset and bundle purchases sent to MarketplaceService:PerformPurchase without a collectible item id, so the engine buys them through the legacy economy endpoint.",
	links = "https://roblox.atlassian.net/browse/CLI-220689",
	backends = { LoggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 2026, 10, 1 }
}
local t = {}

for _, enumItem in Enum.AvatarAssetType:GetEnumItems() do
	t[enumItem.Value] = true
end
return function(InfoType, p1)
	-- upvalues: t (copy), LoggingProtocolModule (copy), config (copy)
	if InfoType == Enum.InfoType.Asset then
		if t[p1.assetTypeId] then
			LoggingProtocolModule.default:logRobloxTelemetryCounter(config, 1, {
				infoType = "Asset",
				assetTypeId = tostring(p1.assetTypeId),
				productType = p1.productType or ""
			})
			
			return
		end
		return
	elseif InfoType == Enum.InfoType.Bundle then
		LoggingProtocolModule.default:logRobloxTelemetryCounter(config, 1, { infoType = "Bundle" })
	end
end