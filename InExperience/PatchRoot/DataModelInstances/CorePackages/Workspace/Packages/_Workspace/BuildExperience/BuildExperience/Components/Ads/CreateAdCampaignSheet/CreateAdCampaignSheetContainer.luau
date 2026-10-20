local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local FFlagEnablePaidAdsModule = require(BuildExperience.Flags.FFlagEnablePaidAds)
local FFlagBuildAgentAdCampaignCardModule = require(BuildExperience.Flags.FFlagBuildAgentAdCampaignCard)
local CreateAdCampaignSheetViewModule = require(script.Parent.CreateAdCampaignSheetView)
local UseCreateAdCampaignSheetViewModelModule = require(script.Parent.useCreateAdCampaignSheetViewModel)

local function _(p1)
	return if p1.runStartTimeMs == nil then nil else { runStartTimeMs = p1.runStartTimeMs }
end

local function MountedCreateAdCampaignSheet(p1)
	-- upvalues: UseCreateAdCampaignSheetViewModelModule (copy), ReactModule (copy), CreateAdCampaignSheetViewModule (copy)
	return ReactModule.createElement(CreateAdCampaignSheetViewModule, (UseCreateAdCampaignSheetViewModelModule(p1)))
end

return function(Tbl)
	-- upvalues: ReactModule (copy), FFlagEnablePaidAdsModule (copy), FFlagBuildAgentAdCampaignCardModule (copy), MountedCreateAdCampaignSheet (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Tbl.isOpen)
	local IsOpen = FFlagEnablePaidAdsModule and Tbl.isOpen
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({
		wasOpen = IsOpen,
		terms = if IsOpen then if Tbl.runStartTimeMs == nil then nil else { runStartTimeMs = Tbl.runStartTimeMs } else nil
	})
	local UseStateResult3 = UseStateResult1
	local IsNotWasOpenMatch = UseStateResult1.wasOpen ~= IsOpen
	local v1 = false
	
	if FFlagBuildAgentAdCampaignCardModule and IsOpen and Tbl.runStartTimeMs ~= nil then
		local Terms = UseStateResult1.terms
		v1 = Terms == nil or Terms.runStartTimeMs ~= Tbl.runStartTimeMs
	end
	if IsNotWasOpenMatch or FFlagBuildAgentAdCampaignCardModule and v1 then
		local config = {
			wasOpen = IsOpen,
			terms = if IsOpen then if Tbl.runStartTimeMs == nil then nil else { runStartTimeMs = Tbl.runStartTimeMs } else UseStateResult1.terms
		}
		UseStateResult2_1(config)
		UseStateResult3 = config
	end
	ReactModule.useEffect(function()
		-- upvalues: Tbl (copy), UseStateResult2 (copy)
		if Tbl.isOpen then
			UseStateResult2(true)
		end
	end, { Tbl.isOpen })
	
	if not UseStateResult or FFlagEnablePaidAdsModule and Tbl.campaignOffers == nil then
		return nil
	end
	local Tbl1 = Tbl
	
	if FFlagEnablePaidAdsModule then
		local Terms = UseStateResult3.terms
		
		if Terms == nil then
			return nil
		end
		Tbl1 = table.clone(Tbl)
		Tbl1.runStartTimeMs = Terms.runStartTimeMs
	end
	return ReactModule.createElement(MountedCreateAdCampaignSheet, Tbl1)
end