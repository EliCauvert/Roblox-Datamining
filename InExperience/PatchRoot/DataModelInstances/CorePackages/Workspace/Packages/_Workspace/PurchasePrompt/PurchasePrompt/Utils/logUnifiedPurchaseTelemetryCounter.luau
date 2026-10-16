local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Parent = PurchasePrompt.Parent
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local ProductPurchaseSurface = require(Parent.PurchasePromptLite).Enums.ProductPurchaseSurface
local AppContextModule = require(PurchasePrompt.Utils.AppContext)
local TypesModule = require(PurchasePrompt.types)

return function(p1, p2, p3) --[[ Line: 12 | Named "logUnifiedPurchaseTelemetryCounter" ]]
	-- upvalues: LoggingProtocolModule (copy), AppContextModule (copy), ProductPurchaseSurface (copy), TypesModule (copy)
	LoggingProtocolModule.default:logRobloxTelemetryCounter(p1, 1, {
		appContext = AppContextModule.get(),
		surface = p2 or ProductPurchaseSurface.Unknown,
		productType = p3 or TypesModule.ProductTypeEnum.Unknown
	})
end