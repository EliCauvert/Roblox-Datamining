local UseAppPolicyFunction = require(script:FindFirstAncestor("AvatarWorkshop").Parent.UniversalAppPolicy).useAppPolicy

local function selectCanUseCustomOutfitNames(p1)
	return p1.getCustomOutfitNames()
end

return function()
	-- upvalues: UseAppPolicyFunction (copy), selectCanUseCustomOutfitNames (copy)
	return UseAppPolicyFunction(selectCanUseCustomOutfitNames)
end