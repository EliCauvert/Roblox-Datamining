local Parent = script:FindFirstAncestor("SocialCarousel").Parent
local ReactModule = require(Parent.React)
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens

return function()
	-- upvalues: UseTokensFunction (copy), RobloxAppHooksModule (copy), RobloxAppEnumsModule (copy), ReactModule (copy)
	local UseTokensResult = UseTokensFunction()
	local IsUseDeviceTypeResultMatch = RobloxAppHooksModule.useDeviceType() == RobloxAppEnumsModule.DeviceType.Phone
	
	return ReactModule.useMemo(function()
		-- upvalues: IsUseDeviceTypeResultMatch (copy), UseTokensResult (copy)
		if IsUseDeviceTypeResultMatch then
			local FontSize200 = UseTokensResult.FontSize.FontSize_200
			local Copy = table.clone(UseTokensResult.Typography.TitleSmall)
			Copy.FontSize = FontSize200
			local Copy1 = table.clone(UseTokensResult.Typography.LabelSmall)
			Copy1.FontSize = FontSize200
			
			return { title = Copy, label = Copy1 }
		else
			return nil
		end
	end, { UseTokensResult, IsUseDeviceTypeResultMatch })
end