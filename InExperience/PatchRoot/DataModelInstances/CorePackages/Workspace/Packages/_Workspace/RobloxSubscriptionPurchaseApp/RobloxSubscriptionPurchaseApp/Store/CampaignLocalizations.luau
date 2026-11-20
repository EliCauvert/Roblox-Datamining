local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local _ = require(Parent.Signals)
local SignalsUtilsModule = require(Parent.SignalsUtils)
local CampaignStringsLoadingStatusModule = require(RobloxSubscriptionPurchaseApp.Enums.CampaignStringsLoadingStatus)
local FFlagClaimSheetWaitForCampaignStringsModule = require(RobloxSubscriptionPurchaseApp.Flags.FFlagClaimSheetWaitForCampaignStrings)
local SessionScopedSignal, SessionScopedSignal2 = SignalsUtilsModule.createSessionScopedSignal({})
local GetStringsLoadingStatus = nil
local SetStringsLoadingStatus = nil

if FFlagClaimSheetWaitForCampaignStringsModule then
	GetStringsLoadingStatus, SetStringsLoadingStatus = SignalsUtilsModule.createSessionScopedSignal(CampaignStringsLoadingStatusModule.Idle)
end
return {
	getCampaignLocalizations = SessionScopedSignal,
	setCampaignLocalizations = SessionScopedSignal2,
	getStringsLoadingStatus = GetStringsLoadingStatus,
	setStringsLoadingStatus = SetStringsLoadingStatus
}