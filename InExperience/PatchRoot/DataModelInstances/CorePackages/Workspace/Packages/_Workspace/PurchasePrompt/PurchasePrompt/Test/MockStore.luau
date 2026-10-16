local PurchasePrompt = script:FindFirstAncestor("PurchasePrompt")
local Rodux = require(PurchasePrompt.Parent.PurchasePromptDeps).Rodux
local ReducerModule = require(PurchasePrompt.Reducers.Reducer)
local ABTestModule = require(PurchasePrompt.Services.ABTest)
local NetworkModule = require(PurchasePrompt.Services.Network)
local AnalyticsModule = require(PurchasePrompt.Services.Analytics)
local PlatformInterfaceModule = require(PurchasePrompt.Services.PlatformInterface)
local ExternalSettingsModule = require(PurchasePrompt.Services.ExternalSettings)
local ThunkModule = require(PurchasePrompt.Thunk)
local PurchaseFlowModule = require(PurchasePrompt.Enums.PurchaseFlow)

return {
	getMockPurchaseFlow = function(p1) --[[ Line: 17 ]]
		-- upvalues: PurchaseFlowModule (copy)
		return p1 or PurchaseFlowModule.Product
	end,
	getMockNativeUpsell = function(_, _, _) --[[ Line: 21 ]]
		return {
			robuxProductId = "testRobuxProductId",
			productId = "testProductId",
			robuxPurchaseAmount = 500
		}
	end,
	getMockRobuxUpsellSuggestions = function(p1) --[[ Line: 29 ]]
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
	getMockStore = function() --[[ Line: 44 ]]
		-- upvalues: ABTestModule (copy), NetworkModule (copy), AnalyticsModule (copy), PlatformInterfaceModule (copy), ExternalSettingsModule (copy), Rodux (copy), ReducerModule (copy), ThunkModule (copy)
		return Rodux.Store.new(ReducerModule, {}, {
			ThunkModule.middleware({
				[ABTestModule] = ABTestModule.new(),
				[NetworkModule] = NetworkModule.new(),
				[AnalyticsModule] = AnalyticsModule.new(),
				[PlatformInterfaceModule] = PlatformInterfaceModule.new(),
				[ExternalSettingsModule] = ExternalSettingsModule.new()
			})
		})
	end
}