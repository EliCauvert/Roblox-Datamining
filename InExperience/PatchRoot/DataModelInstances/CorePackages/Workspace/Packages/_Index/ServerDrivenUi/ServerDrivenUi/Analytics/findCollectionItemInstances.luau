local CollectionService = game:GetService("CollectionService")
local ItemIndex = require(script:FindFirstAncestor("ServerDrivenUi").Parent.Impressions).Constants.ItemIndex

return function(Tag) --[[ Line: 14 | Named "findCollectionItemInstances" ]]
	-- upvalues: CollectionService (copy), ItemIndex (copy)
	local Guis = {}
	
	if not Tag then
		return Guis
	end
	for _, Gui in CollectionService:GetTagged(Tag) do
		if Gui:IsA("GuiObject") then
			local Attribute = Gui:GetAttribute(ItemIndex)
			
			if typeof(Attribute) == "number" then
				Guis[Attribute] = Gui
			end
		end
	end
	return Guis
end