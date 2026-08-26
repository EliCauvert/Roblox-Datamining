local userInputService = game:GetService("UserInputService")
local isSpatial = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AppCommonLib).isSpatial

return function(p1)
	-- upvalues: userInputService (ref), isSpatial (ref)
	local platform = userInputService:GetPlatform()
	
	if isSpatial() then
		return "VR" .. p0
	elseif platform == Enum.Platform.Android then
		p1 = "Android" .. p0
		
		return p1
	elseif platform == Enum.Platform.IOS then
		p1 = "IOS" .. p0
		
		return p1
	elseif platform == Enum.Platform.Windows then
		p1 = "Windows" .. p0
		
		return p1
	elseif platform == Enum.Platform.OSX then
		p1 = "OSX" .. p0
		
		return p1
	elseif platform == Enum.Platform.PS4 or platform == Enum.Platform.PS5 then
		p1 = "PlayStation" .. p0
		
		return p1
	elseif platform == Enum.Platform.XBoxOne or platform == Enum.Platform.XBox360 then
		p1 = "Xbox-" .. p0
	end
	return p1
end