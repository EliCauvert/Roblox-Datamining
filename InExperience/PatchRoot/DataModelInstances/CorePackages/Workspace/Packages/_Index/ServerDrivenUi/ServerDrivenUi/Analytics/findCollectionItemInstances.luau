local collectionService = game:GetService("CollectionService")
local itemIndex = require(script:FindFirstAncestor("ServerDrivenUi").Parent.Impressions).Constants.ItemIndex

return function(a) --[[ line: 14 | named "findCollectionItemInstances" ]]
	-- upvalues: collectionService (ref), itemIndex (ref)
	local t = {}
	
	if not a then
		return t
	end
	for i, v in collectionService:GetTagged(a) do
		if v:IsA("GuiObject") then
			local var2 = v:GetAttribute(itemIndex)
			
			if typeof(var2) == "number" then
				t[var2] = v
			end
		end
	end
	return t
end