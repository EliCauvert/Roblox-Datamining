local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local FFlagJoinabilityCTARefactor = require(Parent.SharedFlags).FFlagJoinabilityCTARefactor

return function(p1) --[[ Line: 10 ]]
	-- upvalues: UseTokensFunction (copy), FFlagJoinabilityCTARefactor (copy)
	local UseTokensResult = UseTokensFunction()
	
	if p1 == nil or p1.universeId == nil then
		return 0
	end
	local NewSize = UseTokensResult.Size.Size_1000 + 2 * UseTokensResult.Padding.Large
	
	if FFlagJoinabilityCTARefactor then
		local Joinability = p1.joinability
		
		if Joinability == "Joinable" or Joinability == "NotJoinable" then
			NewSize += UseTokensResult.Typography.BodyMedium.FontSize + UseTokensResult.Gap.XSmall
		end
	end
	return NewSize
end