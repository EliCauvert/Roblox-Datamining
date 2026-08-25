local parent = script:FindFirstAncestor("UserList").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens

return function()
	-- upvalues: useTokens (ref), reactModule (ref)
	local var1 = useTokens()
	
	return reactModule.useMemo(function()
		-- upvalues: var1 (ref)
		local size1400 = var1.Size.Size_1400
		local medium = var1.Padding.Medium
		local small = var1.Gap.Small
		
		return medium + size1400 + small + (var1.Typography.TitleSmall.FontSize + var1.Typography.LabelSmall.FontSize + var1.Typography.BodySmall.FontSize) + small + var1.Size.Size_800 + medium
	end, { var1 })
end