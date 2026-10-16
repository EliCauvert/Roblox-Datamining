local UserInputService = require(script:FindFirstAncestor("Foundation").Utility.Wrappers).Services.UserInputService
local t = {}

return function(Key) --[[ Line: 13 ]]
	-- upvalues: t (copy), UserInputService (copy)
	if t[Key] then
		return t[Key]
	end
	local ImageForKeyCode = UserInputService:GetImageForKeyCode(Key)
	
	if ImageForKeyCode and ImageForKeyCode ~= "" then
		return {
			keyVisualType = "Image",
			size = UDim2.fromScale(0.7, 0.7),
			key = ImageForKeyCode
		}
	else
		local config = {
			keyVisualType = "String",
			size = UDim2.fromScale(0.8, 0.8),
			key = UserInputService:GetStringForKeyCode(Key) or ""
		}
		t[Key] = config
		
		return config
	end
end