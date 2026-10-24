local BuyRobuxRouting = script:FindFirstAncestor("BuyRobuxRouting")
local SharedFlagsModule = require(BuyRobuxRouting.Parent.SharedFlags)
local EngineFeaturesModule = require(BuyRobuxRouting.EngineFeatures)

return function()
	-- upvalues: SharedFlagsModule (copy), EngineFeaturesModule (copy)
	return SharedFlagsModule.FFlagSduiBuyRobuxHydration and (SharedFlagsModule.FFlagInitializeSduiForApp and (EngineFeaturesModule.isRobloxSubscriptionReadSupported() and EngineFeaturesModule.isFirstTimePurchaseConsentStorageSupported()))
end