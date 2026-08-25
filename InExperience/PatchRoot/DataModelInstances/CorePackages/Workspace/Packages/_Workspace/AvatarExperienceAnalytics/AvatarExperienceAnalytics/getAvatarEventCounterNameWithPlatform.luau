local userInputService = game:GetService("UserInputService")
local isSpatial = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AppCommonLib).isSpatial

return function(p0)
	-- upvalues: userInputService (ref), isSpatial (ref)
	local platform = userInputService:GetPlatform()
	
	if isSpatial() then
		return "VR" .. p0
	elseif platform == Enum.Platform.Android then
		p0 = "Android" .. p0
		
		return p0
	elseif platform == Enum.Platform.IOS then
		p0 = "IOS" .. p0
		
		return p0
	elseif platform == Enum.Platform.Windows then
		p0 = "Windows" .. p0
		
		return p0
	elseif platform == Enum.Platform.OSX then
		p0 = "OSX" .. p0
		
		return p0
	elseif platform == Enum.Platform.PS4 or platform == Enum.Platform.PS5 then
		p0 = "PlayStation" .. p0
		
		return p0
	elseif platform == Enum.Platform.XBoxOne or platform == Enum.Platform.XBox360 then
		p0 = "Xbox-" .. p0
	end
	return p0
end