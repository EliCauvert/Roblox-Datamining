local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local parent = purchasePrompt.Parent
local loggingProtocolModule = require(parent.LoggingProtocol)
local productPurchaseSurface = require(parent.PurchasePromptLite).Enums.ProductPurchaseSurface
local appContextModule = require(purchasePrompt.Utils.AppContext)
local typesModule = require(purchasePrompt.types)

return function(value, p1, p2)
	-- upvalues: loggingProtocolModule (ref), appContextModule (ref), productPurchaseSurface (ref), typesModule (ref)
	loggingProtocolModule.default:logRobloxTelemetryCounter(value, 1, {
		appContext = appContextModule.get(),
		surface = p1 or productPurchaseSurface.Unknown,
		productType = p2 or typesModule.ProductTypeEnum.Unknown
	})
end