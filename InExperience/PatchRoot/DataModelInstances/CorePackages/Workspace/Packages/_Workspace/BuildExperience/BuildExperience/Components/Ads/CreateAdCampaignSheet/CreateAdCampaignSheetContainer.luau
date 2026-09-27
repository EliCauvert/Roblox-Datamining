local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local fFlagEnablePaidAdsModule = require(buildExperience.Flags.FFlagEnablePaidAds)
local createAdCampaignSheetViewModule = require(script.Parent.CreateAdCampaignSheetView)
local useCreateAdCampaignSheetViewModelModule = require(script.Parent.useCreateAdCampaignSheetViewModel)

local function _(p1)
	return if p1.campaignDurationDays == nil or p1.runStartTimeMs == nil then nil else {
		campaignDurationDays = p1.campaignDurationDays,
		runStartTimeMs = p1.runStartTimeMs
	}
end

local function MountedCreateAdCampaignSheet(p1)
	-- upvalues: useCreateAdCampaignSheetViewModelModule (ref), reactModule (ref), createAdCampaignSheetViewModule (ref)
	return reactModule.createElement(createAdCampaignSheetViewModule, useCreateAdCampaignSheetViewModelModule(p1))
end

return function(p1)
	-- upvalues: reactModule (ref), fFlagEnablePaidAdsModule (ref), MountedCreateAdCampaignSheet (ref)
	local var1, var2 = reactModule.useState(p1.isOpen)
	local isOpen = fFlagEnablePaidAdsModule and p1.isOpen
	local useState = reactModule.useState
	local t = {
		wasOpen = isOpen,
		terms = if not isOpen then if p1.campaignDurationDays == nil or p1.runStartTimeMs == nil then nil else {
			campaignDurationDays = p1.campaignDurationDays,
			runStartTimeMs = p1.runStartTimeMs
		} else nil
	}
	useState, t = useState(t)
	local var3 = useState
	
	if useState.wasOpen ~= isOpen then
		local t_1 = {
			wasOpen = isOpen,
			terms = if not isOpen then if p1.campaignDurationDays == nil or p1.runStartTimeMs == nil then nil else {
				campaignDurationDays = p1.campaignDurationDays,
				runStartTimeMs = p1.runStartTimeMs
			} else useState.terms
		}
		t(t_1)
		var3 = t_1
	end
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref)
		if p1.isOpen then
			var2(true)
		end
	end, { p1.isOpen })
	
	if not var1 then
		return nil
	end
	local var4 = p1
	
	if fFlagEnablePaidAdsModule then
		local terms = var3.terms
		
		if terms == nil then
			return nil
		end
		var4 = table.clone(p1)
		var4.campaignDurationDays = terms.campaignDurationDays
		var4.runStartTimeMs = terms.runStartTimeMs
	end
	return reactModule.createElement(MountedCreateAdCampaignSheet, var4)
end