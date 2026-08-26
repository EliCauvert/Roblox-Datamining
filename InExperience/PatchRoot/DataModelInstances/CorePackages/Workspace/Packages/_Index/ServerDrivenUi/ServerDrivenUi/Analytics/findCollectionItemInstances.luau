local collectionService = game:GetService("CollectionService")
local itemIndex = require(script:FindFirstAncestor("ServerDrivenUi").Parent.Impressions).Constants.ItemIndex

return function(a)
	-- upvalues: collectionService (ref), itemIndex (ref)
	local t = {}
	
	if not a then
		return t
	end
	for i, v in collectionService:GetTagged(a) do
		if v:IsA("GuiObject") then
			local var1 = v:GetAttribute(itemIndex)
			
			if typeof(var1) == "number" then
				t[var1] = v
			end
		end
	end
	return t
end