-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:03 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local iconSizeModule = require(foundation.Enums.IconSize)
local useTokensModule = require(foundation.Providers.Style.useTokens)

return function(p0, p1) --[[ line: 11 | named "useIconButtonPadding" ]]
	-- upvalues: useTokensModule (ref), reactModule (ref), iconSizeModule (ref)
	local var4 = useTokensModule()
	local var5 = reactModule.useMemo(function() --[[ line: 14 ]]
		-- upvalues: p1 (ref), iconSizeModule (copy), var4 (ref)
		return if p1 then {
			[iconSizeModule.XSmall] = var4.Size.Size_150,
			[iconSizeModule.Small] = var4.Size.Size_200,
			[iconSizeModule.Medium] = var4.Size.Size_250,
			[iconSizeModule.Large] = var4.Size.Size_350
		} else {
			[iconSizeModule.XSmall] = var4.Size.Size_50,
			[iconSizeModule.Small] = var4.Size.Size_50,
			[iconSizeModule.Medium] = var4.Size.Size_100,
			[iconSizeModule.Large] = var4.Size.Size_150,
			[iconSizeModule.XLarge] = var4.Size.Size_200,
			[iconSizeModule.XXLarge] = var4.Size.Size_250
		}
	end, { var4, p1 })[p0]
	
	if var5 == nil then
		error("Invalid icon button size: " .. p0)
	end
	return var5
end