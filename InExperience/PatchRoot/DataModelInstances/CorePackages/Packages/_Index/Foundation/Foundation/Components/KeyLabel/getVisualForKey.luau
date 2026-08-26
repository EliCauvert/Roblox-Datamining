local userInputService = require(script:FindFirstAncestor("Foundation").Utility.Wrappers).Services.UserInputService
local t = {}

return function(p1)
	-- upvalues: t (ref), userInputService (ref)
	if t[p1] then
		return t[p1]
	end
	local _ = nil
	local var1 = userInputService:GetImageForKeyCode(p1)
	
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
		key = userInputService:GetStringForKeyCode(p1) or ""
	}
	t[p1] = t_1
	
	return t_1
end