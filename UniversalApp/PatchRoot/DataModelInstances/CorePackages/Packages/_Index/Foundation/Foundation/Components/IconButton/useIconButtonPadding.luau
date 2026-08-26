local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local iconSizeModule = require(foundation.Enums.IconSize)
local useTokensModule = require(foundation.Providers.Style.useTokens)

return function(p1, p2)
	-- upvalues: useTokensModule (ref), reactModule (ref), iconSizeModule (ref)
	local var1 = useTokensModule()
	local var2 = reactModule.useMemo(function()
		-- upvalues: p2 (ref), iconSizeModule (copy), var1 (ref)
		return if p2 then {
			[iconSizeModule.XSmall] = var1.Size.Size_150,
			[iconSizeModule.Small] = var1.Size.Size_200,
			[iconSizeModule.Medium] = var1.Size.Size_250,
			[iconSizeModule.Large] = var1.Size.Size_350
		} else {
			[iconSizeModule.XSmall] = var1.Size.Size_50,
			[iconSizeModule.Small] = var1.Size.Size_50,
			[iconSizeModule.Medium] = var1.Size.Size_100,
			[iconSizeModule.Large] = var1.Size.Size_150,
			[iconSizeModule.XLarge] = var1.Size.Size_200,
			[iconSizeModule.XXLarge] = var1.Size.Size_250
		}
	end, { var1, p2 })[p1]
	
	if var2 == nil then
		error("Invalid icon button size: " .. p0)
	end
	return var2
end