local loggingProtocolModule = require(script:FindFirstAncestor("PurchasePrompt").Parent.LoggingProtocol)
local t = {
	eventName = "PurchasePromptNonCollectiblePurchase",
	description = "Counts confirmed asset and bundle purchases sent to MarketplaceService:PerformPurchase without a collectible item id, so the engine buys them through the legacy economy endpoint.",
	links = "https://roblox.atlassian.net/browse/CLI-220689",
	backends = { loggingProtocolModule.TelemetryBackends.Counter },
	lastUpdated = { 2026, 10, 1 }
}
local t_1 = {}

for i, v in Enum.AvatarAssetType:GetEnumItems() do
	t_1[v.Value] = true
end
return function(p1, p2)
	-- upvalues: t_1 (ref), loggingProtocolModule (ref), t (ref)
	if p1 == Enum.InfoType.Asset then
		if t_1[p2.assetTypeId] then
			loggingProtocolModule.default:logRobloxTelemetryCounter(t, 1, {
				infoType = "Asset",
				assetTypeId = tostring(p2.assetTypeId),
				productType = p2.productType or ""
			})
			
			return
		end
		return
	elseif p1 == Enum.InfoType.Bundle then
		loggingProtocolModule.default:logRobloxTelemetryCounter(t, 1, { infoType = "Bundle" })
	end
end