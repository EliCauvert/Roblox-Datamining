local AvatarExperienceHeadRefinement = script:FindFirstAncestor("AvatarExperienceHeadRefinement")
local HeadShapeModule = require(AvatarExperienceHeadRefinement.Enums.HeadShape)
local FFlagDynamicHeadsMigration = require(AvatarExperienceHeadRefinement.Parent.AvatarExperienceFlags).FFlagDynamicHeadsMigration
local t = {}

for i, value in {
	HeadShapeModule.Default, HeadShapeModule.WomanHead, HeadShapeModule.ManHead,
	HeadShapeModule.Blockhead, HeadShapeModule.Cheeks, HeadShapeModule.Chiseled,
	HeadShapeModule.Narrow, HeadShapeModule.Paragon, HeadShapeModule.Roundy,
	HeadShapeModule.StrongJaw, HeadShapeModule.Trim
} do
	t[value] = i
end
return function(Tbl, Callback)
	-- upvalues: FFlagDynamicHeadsMigration (copy), t (copy)
	if FFlagDynamicHeadsMigration then
		local Copy = table.clone(Tbl)
		table.sort(Copy, function(A, B): boolean
			-- upvalues: Callback (copy), t (upval)
			local CallbackResult = Callback(A)
			local CallbackResult1 = Callback(B)
			local Entry = t[CallbackResult]
			local Entry1 = t[CallbackResult1]
			
			return if Entry == nil and Entry1 == nil then CallbackResult < CallbackResult1 else Entry ~= nil and (Entry1 == nil or Entry < Entry1)
		end)
		
		return Copy
	else
		local Copy = table.clone(Tbl)
		table.sort(Copy, function(A, B): boolean
			-- upvalues: Callback (copy), t (upval)
			return t[Callback(A)] < t[Callback(B)]
		end)
		
		return Copy
	end
end