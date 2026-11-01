local Parent = script:FindFirstAncestor("ProfilePlatform").Parent
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local FFlagJoinabilityCTAContextCopy = require(Parent.SharedFlags).FFlagJoinabilityCTAContextCopy

return function(p1)
	-- upvalues: UseTokensFunction (copy), FFlagJoinabilityCTAContextCopy (copy)
	local UseTokensResult = UseTokensFunction()
	
	if p1 == nil or p1.universeId == nil then
		return 0
	end
	local NewSize = UseTokensResult.Size.Size_1000 + 2 * UseTokensResult.Padding.Large
	
	if FFlagJoinabilityCTAContextCopy then
		local Joinability = p1.joinability
		
		if Joinability == "Joinable" or Joinability == "NotJoinable" then
			NewSize += UseTokensResult.Typography.BodyMedium.FontSize + UseTokensResult.Gap.XSmall
		end
	end
	return NewSize
end