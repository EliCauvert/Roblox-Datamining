local collectionService = game:GetService("CollectionService")
local constantsModule = require(script.Parent.Constants)

return {
	AddTag = function(p0, p1, p2) --[[ line: 4 ]]
		-- upvalues: constantsModule (ref), collectionService (ref)
		local var2 = if p0 then p0.current else nil
		
		if p1 and var2 then
			if p2 then
				var2:SetAttribute(constantsModule.ItemIndex, p2)
				
				if collectionService:HasTag(var2, p1) then
					return
				else
					collectionService:AddTag(var2, p1)
					
					return
				end
			else
				warn("addTag: impression instance not tagged, missing index")
			end
		end
	end,
	RemoveTag = function(p3, p4, p5) --[[ line: 18 ]]
		-- upvalues: constantsModule (ref), collectionService (ref)
		local var3 = if p3 then p3.current else nil
		
		if p4 and var3 then
			if p5 then
				var3:SetAttribute(constantsModule.ItemIndex, nil)
			end
			collectionService:RemoveTag(var3, p4)
		end
	end
}