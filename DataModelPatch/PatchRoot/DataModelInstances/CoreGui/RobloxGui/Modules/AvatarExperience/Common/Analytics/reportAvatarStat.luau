local UserInputService = game:GetService("UserInputService")

return function(p1, Text: string, p2)
	-- upvalues: UserInputService (copy)
	local Platform = UserInputService:GetPlatform()
	
	if Platform == Enum.Platform.Android then
		Text = "Android" .. Text
	elseif Platform == Enum.Platform.IOS then
		Text = "IOS" .. Text
	elseif Platform == Enum.Platform.Windows then
		Text = "Windows" .. Text
	elseif Platform == Enum.Platform.OSX then
		Text = "OSX" .. Text
	elseif Platform == Enum.Platform.XBoxOne then
		Text = "Xbox" .. Text
	end
	p1.Diag:reportStats(Text, p2)
end