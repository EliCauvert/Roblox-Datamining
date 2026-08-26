local collectionService = game:GetService("CollectionService")
local constantsModule = require(script.Parent.Constants)

return {
	AddTag = function(p1, p2, p3)
		-- upvalues: constantsModule (ref), collectionService (ref)
		local var1 = if p1 then p1.current else nil
		
		if p2 and var1 then
			if p3 then
				var1:SetAttribute(constantsModule.ItemIndex, p3)
				
				if collectionService:HasTag(var1, p2) then
					return
				else
					collectionService:AddTag(var1, p2)
					
					return
				end
			else
				warn("addTag: impression instance not tagged, missing index")
			end
		end
	end,
	RemoveTag = function(p1, p2, p3)
		-- upvalues: constantsModule (ref), collectionService (ref)
		local var1 = if p1 then p1.current else nil
		
		if p2 and var1 then
			if p3 then
				var1:SetAttribute(constantsModule.ItemIndex, nil)
			end
			collectionService:RemoveTag(var1, p2)
		end
	end
}