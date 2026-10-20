local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local PastCampaignRowModule = require(script.Parent.PastCampaignRow)

return function(p1)
	-- upvalues: ReactModule (copy), PastCampaignRowModule (copy), View (copy)
	local TestId = p1.testId or "PastCampaignsList"
	local Elements = {}
	
	for LayoutOrder, row in p1.rows do
		local Copy = table.clone(row)
		Copy.layoutOrder = LayoutOrder
		Elements[`Row{LayoutOrder}`] = ReactModule.createElement(PastCampaignRowModule, Copy)
	end
	return ReactModule.createElement(View, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder,
		testId = TestId
	}, Elements)
end