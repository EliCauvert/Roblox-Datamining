-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:29 2026 Pacific Standard Time.

local builderIconsModule = require(script:FindFirstAncestor("Foundation").Parent.BuilderIcons)
local font = builderIconsModule.Font
local iconVariant = builderIconsModule.IconVariant

return function(p0, p1) --[[ line: 8 | named "getIconRichText" ]]
	-- upvalues: iconVariant (ref), font (ref)
	local var1 = font[p1 or iconVariant.Regular]
	
	return `<font family="{var1.Family}" weight="{var1.Weight.Value}">{p0}</font>`
end