local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local IconSizeModule = require(Foundation.Enums.IconSize)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return function(Text, p1) --[[ Line: 11 | Named "useIconButtonPadding" ]]
	-- upvalues: UseTokensModule (copy), ReactModule (copy), IconSizeModule (copy)
	local UseTokensModuleResult = UseTokensModule()
	local UseMemoResultEntry = ReactModule.useMemo(function() --[[ Line: 14 ]]
		-- upvalues: p1 (copy), IconSizeModule (upval), UseTokensModuleResult (copy)
		return if p1 then {
			[IconSizeModule.XSmall] = UseTokensModuleResult.Size.Size_150,
			[IconSizeModule.Small] = UseTokensModuleResult.Size.Size_200,
			[IconSizeModule.Medium] = UseTokensModuleResult.Size.Size_250,
			[IconSizeModule.Large] = UseTokensModuleResult.Size.Size_350
		} else {
			[IconSizeModule.XSmall] = UseTokensModuleResult.Size.Size_50,
			[IconSizeModule.Small] = UseTokensModuleResult.Size.Size_50,
			[IconSizeModule.Medium] = UseTokensModuleResult.Size.Size_100,
			[IconSizeModule.Large] = UseTokensModuleResult.Size.Size_150,
			[IconSizeModule.XLarge] = UseTokensModuleResult.Size.Size_200,
			[IconSizeModule.XXLarge] = UseTokensModuleResult.Size.Size_250
		}
	end, { UseTokensModuleResult, p1 })[Text]
	
	if UseMemoResultEntry == nil then
		error("Invalid icon button size: " .. Text)
	end
	return UseMemoResultEntry
end