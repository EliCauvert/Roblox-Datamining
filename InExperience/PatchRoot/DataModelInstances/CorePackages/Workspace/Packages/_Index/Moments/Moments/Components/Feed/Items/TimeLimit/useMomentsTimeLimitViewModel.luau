local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local LocalizationModule = require(Parent.Localization)
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local SignalsReactModule = require(Parent.SignalsReact)
local GetMomentsUsageStoreModule = require(Moments.Stores.GetMomentsUsageStore)
local _ = require(script.Parent.MomentsTimeLimitView)
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local config = {
	title = "Feature.Moments.Label.TimeLimitReachedTitle",
	description = "Feature.Moments.Description.TimeLimitReachedBody"
}
local config1 = {
	title = "Feature.Moments.Label.MomentsOffTitle",
	description = "Feature.Moments.Description.MomentsOffBody"
}

local function _(p1): boolean
	local SettingsChanged = if type(p1) == "table" then p1.SettingsChanged else nil
	
	return type(SettingsChanged) == "table" and table.find(SettingsChanged, "MomentsUsageLimit") ~= nil
end

return function()
	-- upvalues: GetMomentsUsageStoreModule (copy), SignalsReactModule (copy), UseLocalizationFunction (copy), config1 (copy), config (copy), RealtimeDeliveryModule (copy)
	local MomentsUsageStoreModule = GetMomentsUsageStoreModule(false)
	local UseLocalizationResult = UseLocalizationFunction(if SignalsReactModule.useSignalState(MomentsUsageStoreModule.getLimitSeconds) == 0 then config1 else config)
	RealtimeDeliveryModule.useRealtimeNamespace("UserSettingsChanged", function(p1)
		-- upvalues: MomentsUsageStoreModule (copy)
		local SettingsChanged = if type(p1) == "table" then p1.SettingsChanged else nil
		
		if type(SettingsChanged) == "table" and table.find(SettingsChanged, "MomentsUsageLimit") ~= nil then
			MomentsUsageStoreModule.checkForMoreTime()
		end
	end, { MomentsUsageStoreModule })
	RealtimeDeliveryModule.useRealtimeConnectionStateChanged("UserSettingsChanged", function(_, p1)
		-- upvalues: MomentsUsageStoreModule (copy)
		if p1 then
			MomentsUsageStoreModule.checkForMoreTime()
		end
	end, { MomentsUsageStoreModule })
	
	return {
		title = UseLocalizationResult.title,
		description = UseLocalizationResult.description
	}
end