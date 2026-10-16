local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local fFlagEnablePaidAdsModule = require(buildExperience.Flags.FFlagEnablePaidAds)
local createAdCampaignSheetViewModule = require(script.Parent.CreateAdCampaignSheetView)
local useCreateAdCampaignSheetViewModelModule = require(script.Parent.useCreateAdCampaignSheetViewModel)

local function _(p1)
	return if p1.runStartTimeMs == nil then nil else { runStartTimeMs = p1.runStartTimeMs }
end

local function MountedCreateAdCampaignSheet(p1)
	-- upvalues: useCreateAdCampaignSheetViewModelModule (ref), reactModule (ref), createAdCampaignSheetViewModule (ref)
	return reactModule.createElement(createAdCampaignSheetViewModule, useCreateAdCampaignSheetViewModelModule(p1))
end

return function(p1)
	-- upvalues: reactModule (ref), fFlagEnablePaidAdsModule (ref), MountedCreateAdCampaignSheet (ref)
	local var1, var2 = reactModule.useState(p1.isOpen)
	local isOpen = fFlagEnablePaidAdsModule and p1.isOpen
	local var3, var4 = reactModule.useState({
		wasOpen = isOpen,
		terms = if isOpen then if p1.runStartTimeMs == nil then nil else { runStartTimeMs = p1.runStartTimeMs } else nil
	})
	local var5 = var3
	
	if var3.wasOpen ~= isOpen then
		local t = {
			wasOpen = isOpen,
			terms = if isOpen then if p1.runStartTimeMs == nil then nil else { runStartTimeMs = p1.runStartTimeMs } else var3.terms
		}
		var4(t)
		var5 = t
	end
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref)
		if p1.isOpen then
			var2(true)
		end
	end, { p1.isOpen })
	
	if not var1 or fFlagEnablePaidAdsModule and p1.campaignOffers == nil then
		return nil
	end
	local var6 = p1
	
	if fFlagEnablePaidAdsModule then
		local terms = var5.terms
		
		if terms == nil then
			return nil
		end
		var6 = table.clone(p1)
		var6.runStartTimeMs = terms.runStartTimeMs
	end
	return reactModule.createElement(MountedCreateAdCampaignSheet, var6)
end