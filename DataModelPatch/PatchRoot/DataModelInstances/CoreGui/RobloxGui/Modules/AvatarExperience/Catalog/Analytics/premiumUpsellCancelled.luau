local ArgCheckModule = require(game:GetService("CorePackages").Workspace.Packages.ArgCheck)

return function(p1, BundleID, p2)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isType(BundleID, "string", "premiumUpsellCancelled event expects assetId")
	ArgCheckModule.isType(p2, "boolean", "premiumUpsellCancelled event expects isBundle")
	p1:sendTelemetryEvent("PremiumUpsell", if p2 then "BundlePremiumUpsellCanceled" else "AssetPremiumUpsellCanceled", { Location = "Catalog", BundleID = BundleID })
end