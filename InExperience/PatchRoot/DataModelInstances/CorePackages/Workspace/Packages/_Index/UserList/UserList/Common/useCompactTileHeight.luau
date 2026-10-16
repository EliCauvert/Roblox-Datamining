local Parent = script:FindFirstAncestor("UserList").Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

return function() --[[ Line: 21 | Named "useCompactTileHeight" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy)
	local UseTokensResult = UseTokensFunction()
	
	return (ReactModule.useMemo(function() --[[ Line: 24 ]]
		-- upvalues: UseTokensResult (copy)
		local Medium = UseTokensResult.Padding.Medium
		local Small = UseTokensResult.Gap.Small
		
		return Medium + UseTokensResult.Size.Size_1400 + Small + (UseTokensResult.Typography.TitleSmall.FontSize + UseTokensResult.Typography.LabelSmall.FontSize + UseTokensResult.Typography.BodySmall.FontSize) + Small + UseTokensResult.Size.Size_800 + Medium
	end, { UseTokensResult }))
end