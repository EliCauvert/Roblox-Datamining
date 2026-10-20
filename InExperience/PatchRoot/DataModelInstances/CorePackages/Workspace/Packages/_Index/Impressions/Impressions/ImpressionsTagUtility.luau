local CollectionService = game:GetService("CollectionService")
local ConstantsModule = require(script.Parent.Constants)

return {
	AddTag = function(p1, Tag, Tag1)
		-- upvalues: ConstantsModule (copy), CollectionService (copy)
		local Current = p1 and p1.current or nil
		
		if Tag and Current then
			if Tag1 then
				Current:SetAttribute(ConstantsModule.ItemIndex, Tag1)
				
				if not CollectionService:HasTag(Current, Tag) then
					CollectionService:AddTag(Current, Tag)
					
					return
				end
			else
				warn("addTag: impression instance not tagged, missing index")
			end
		end
	end,
	RemoveTag = function(p1, Tag, Tag1)
		-- upvalues: ConstantsModule (copy), CollectionService (copy)
		local Current = p1 and p1.current or nil
		
		if Tag and Current then
			if Tag1 then
				Current:SetAttribute(ConstantsModule.ItemIndex, nil)
			end
			CollectionService:RemoveTag(Current, Tag)
		end
	end
}