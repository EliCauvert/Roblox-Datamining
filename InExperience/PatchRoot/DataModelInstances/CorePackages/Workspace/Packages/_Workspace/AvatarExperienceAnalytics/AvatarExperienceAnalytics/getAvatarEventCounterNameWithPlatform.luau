local UserInputService = game:GetService("UserInputService")
local IsSpatialFunction = require(script:FindFirstAncestor("AvatarExperienceAnalytics").Parent.AppCommonLib).isSpatial

return function(Text: string): string --[[ Line: 8 | Named "getAvatarEventCounterNameWithPlatform" ]]
	-- upvalues: UserInputService (copy), IsSpatialFunction (copy)
	local Platform = UserInputService:GetPlatform()
	
	if IsSpatialFunction() then
		return "VR" .. Text
	end
	if Platform == Enum.Platform.Android then
		Text = "Android" .. Text
		
		return Text
	end
	if Platform == Enum.Platform.IOS then
		Text = "IOS" .. Text
		
		return Text
	end
	if Platform == Enum.Platform.Windows then
		Text = "Windows" .. Text
		
		return Text
	end
	if Platform == Enum.Platform.OSX then
		Text = "OSX" .. Text
		
		return Text
	end
	if Platform == Enum.Platform.PS4 or Platform == Enum.Platform.PS5 then
		Text = "PlayStation" .. Text
		
		return Text
	end
	if Platform == Enum.Platform.XBoxOne or Platform == Enum.Platform.XBox360 then
		Text = "Xbox-" .. Text
	end
	return Text
end