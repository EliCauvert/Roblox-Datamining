-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:48:05 2026 Pacific Standard Time.

local userInputService = require(script:FindFirstAncestor("Foundation").Utility.Wrappers).Services.UserInputService
local t = {}

return function(p0) --[[ line: 13 ]]
	-- upvalues: t (ref), userInputService (ref)
	if t[p0] then
		return t[p0]
	end
	local _ = nil
	local var1 = userInputService:GetImageForKeyCode(p0)
	
	if var1 and var1 ~= "" then
		return {
			keyVisualType = "Image",
			size = UDim2.fromScale(0.7, 0.7),
			key = var1
		}
	end
	local t_1 = {
		keyVisualType = "String",
		size = UDim2.fromScale(0.8, 0.8),
		key = userInputService:GetStringForKeyCode(p0) or ""
	}
	t[p0] = t_1
	
	return t_1
end