-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:02 2026 Pacific Standard Time.

local foundation = script:FindFirstAncestor("Foundation")
local dialogSizeModule = require(foundation.Enums.DialogSize)
local _ = require(foundation.Providers.Style.Tokens)
local DIALOG_SIZES = require(script.Parent.useDialogVariants).DIALOG_SIZES

return function(p0, p1, p2) --[[ line: 11 | named "getResponsiveSize" ]]
	-- upvalues: dialogSizeModule (ref), DIALOG_SIZES (ref)
	local var2 = ({
		[dialogSizeModule.Small] = p2.Padding.Large,
		[dialogSizeModule.Medium] = p2.Padding.XLarge,
		[dialogSizeModule.Large] = p2.Padding.XLarge
	})[p1] * 2
	local scale = p2.Config.UI.Scale
	
	return if p0 <= DIALOG_SIZES[dialogSizeModule.Medium] * scale + var2 and p1 ~= dialogSizeModule.Small then dialogSizeModule.Small elseif p0 <= DIALOG_SIZES[dialogSizeModule.Large] * scale + var2 and p1 == dialogSizeModule.Large then dialogSizeModule.Medium else p1
end