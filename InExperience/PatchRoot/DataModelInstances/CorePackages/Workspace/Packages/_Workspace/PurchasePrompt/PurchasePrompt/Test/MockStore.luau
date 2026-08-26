local purchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local rodux = require(purchasePrompt.Parent.PurchasePromptDeps).Rodux
local reducerModule = require(purchasePrompt.Reducers.Reducer)
local ABTestModule = require(purchasePrompt.Services.ABTest)
local networkModule = require(purchasePrompt.Services.Network)
local analyticsModule = require(purchasePrompt.Services.Analytics)
local platformInterfaceModule = require(purchasePrompt.Services.PlatformInterface)
local externalSettingsModule = require(purchasePrompt.Services.ExternalSettings)
local thunkModule = require(purchasePrompt.Thunk)
local purchaseFlowModule = require(purchasePrompt.Enums.PurchaseFlow)

return {
	getMockPurchaseFlow = function(p1)
		-- upvalues: purchaseFlowModule (ref)
		return p1 or purchaseFlowModule.Product
	end,
	getMockNativeUpsell = function(_, _, _)
		return {
			robuxProductId = "testRobuxProductId",
			productId = "testProductId",
			robuxPurchaseAmount = 500
		}
	end,
	getMockRobuxUpsellSuggestions = function(p1)
		return {
			selection = 1,
			products = p1 or {
				{
					providerId = "testRobuxProductId",
					productId = "testProductId",
					robuxAmount = 500,
					robuxAmountBeforeBonus = 450,
					price = "4.99"
				}
			}
		}
	end,
	getMockStore = function()
		-- upvalues: ABTestModule (ref), networkModule (ref), analyticsModule (ref), platformInterfaceModule (ref), externalSettingsModule (ref), rodux (ref), reducerModule (ref), thunkModule (ref)
		return rodux.Store.new(reducerModule, {}, {
			thunkModule.middleware({
				[ABTestModule] = ABTestModule.new(),
				[networkModule] = networkModule.new(),
				[analyticsModule] = analyticsModule.new(),
				[platformInterfaceModule] = platformInterfaceModule.new(),
				[externalSettingsModule] = externalSettingsModule.new()
			})
		})
	end
}