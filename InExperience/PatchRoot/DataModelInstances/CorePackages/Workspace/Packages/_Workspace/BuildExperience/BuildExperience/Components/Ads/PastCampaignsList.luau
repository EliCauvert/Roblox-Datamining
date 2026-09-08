local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local pastCampaignRowModule = require(script.Parent.PastCampaignRow)

return function(p1)
	-- upvalues: reactModule (ref), pastCampaignRowModule (ref), view (ref)
	local testId = p1.testId or "PastCampaignsList"
	local t = {}
	
	for i, v in p1.rows do
		local cloned = table.clone(v)
		cloned.layoutOrder = i
		t[`Row{i}`] = reactModule.createElement(pastCampaignRowModule, cloned)
	end
	return reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = testId
	}, t)
end