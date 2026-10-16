local Parent = script:FindFirstAncestor("BuildExperience").Parent
local AdCampaignEligibilityModule = require(Parent.DataHydration.AdCampaignEligibility)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local CreateComputedFunction = require(Parent.Signals).createComputed
local Computed = CreateComputedFunction(function() --[[ Line: 24 ]]
	return nil
end)
local Computed1 = CreateComputedFunction(function(): string --[[ Line: 27 ]]
	return "NotReady"
end)

return function(p1, p2) --[[ Line: 31 | Named "useGetAdCampaignEligibility" ]]
	-- upvalues: AdCampaignEligibilityModule (copy), UseSignalStateFunction (copy), Computed (copy), Computed1 (copy)
	local v1: boolean = p1 ~= nil and p1 ~= 0
	local P1 = if v1 then p2 or AdCampaignEligibilityModule.getAdCampaignEligibilityStore(false) else nil
	local AndFetchEligibility = if P1 == nil then nil else P1.getAndFetchEligibility(p1)
	local UseSignalStateResult = UseSignalStateFunction(if AndFetchEligibility == nil then Computed else AndFetchEligibility.data)
	local UseSignalStateResult1 = UseSignalStateFunction(if AndFetchEligibility == nil then Computed1 else AndFetchEligibility.status)
	
	return if UseSignalStateResult1 == "Ready" then UseSignalStateResult else nil, UseSignalStateResult1
end