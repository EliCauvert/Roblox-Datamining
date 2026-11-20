local RobloxSubscriptionPurchaseApp = script:FindFirstAncestor("RobloxSubscriptionPurchaseApp")
local Parent = RobloxSubscriptionPurchaseApp.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local CampaignLocalizationsModule = require(RobloxSubscriptionPurchaseApp.Store.CampaignLocalizations)
local CampaignStringsLoadingStatusModule = require(RobloxSubscriptionPurchaseApp.Enums.CampaignStringsLoadingStatus)

local function _(p1, List): boolean
	for _, value in List do
		local v1 = p1[value]
		
		if type(v1) ~= "string" or v1 == "" then
			return false
		end
	end
	return true
end

return function(p2, List, Delay)
	-- upvalues: CampaignLocalizationsModule (copy), SignalsReactModule (copy), CampaignStringsLoadingStatusModule (copy), ReactModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(CampaignLocalizationsModule.getStringsLoadingStatus)
	local Flag = true
	
	for _, value in List do
		local v2 = p2[value]
		
		if type(v2) ~= "string" or v2 == "" then
			Flag = false
			break
		end
	end
	local IsNotUseSignalStateResultMatch: boolean = not Flag and (UseSignalStateResult ~= CampaignStringsLoadingStatusModule.Ready and UseSignalStateResult ~= CampaignStringsLoadingStatusModule.Unavailable)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: UseSignalStateResult (copy), CampaignStringsLoadingStatusModule (upval), IsNotUseSignalStateResultMatch (copy), UseStateResult2 (copy), Delay (copy)
		if UseSignalStateResult == CampaignStringsLoadingStatusModule.Idle and IsNotUseSignalStateResultMatch then
			UseStateResult2(false)
			local DelayedThread = task.delay(Delay, UseStateResult2, true)
			
			return function()
				-- upvalues: DelayedThread (copy)
				task.cancel(DelayedThread)
			end
		else
			return nil
		end
	end, {
		UseSignalStateResult,
		IsNotUseSignalStateResultMatch,
		Delay
	})
	local IsUseSignalStateResultMatch: boolean = IsNotUseSignalStateResultMatch and (UseSignalStateResult == CampaignStringsLoadingStatusModule.Pending or not UseStateResult)
	
	return {
		isLoading = IsUseSignalStateResultMatch,
		isMissing = not IsUseSignalStateResultMatch and not Flag
	}
end