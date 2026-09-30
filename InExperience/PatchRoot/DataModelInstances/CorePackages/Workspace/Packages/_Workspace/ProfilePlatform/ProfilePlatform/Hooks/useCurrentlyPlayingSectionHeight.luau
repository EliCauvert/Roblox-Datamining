local parent = script:FindFirstAncestor("ProfilePlatform").Parent
local useTokens = require(parent.Foundation).Hooks.useTokens
local fFlagJoinabilityCTARefactor = require(parent.SharedFlags).FFlagJoinabilityCTARefactor

return function(p1)
	-- upvalues: useTokens (ref), fFlagJoinabilityCTARefactor (ref)
	local var1 = useTokens()
	
	if p1 == nil or p1.universeId == nil then
		return 0
	end
	local var2 = var1.Size.Size_1000 + 2 * var1.Padding.Large
	
	if fFlagJoinabilityCTARefactor then
		local joinability = p1.joinability
		
		if joinability == "Joinable" or joinability == "NotJoinable" then
			var2 += var1.Typography.BodyMedium.FontSize + var1.Gap.XSmall
		end
	end
	return var2
end