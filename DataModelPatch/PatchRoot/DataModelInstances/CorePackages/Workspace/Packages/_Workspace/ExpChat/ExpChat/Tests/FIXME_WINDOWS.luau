local UserInputService = game:GetService("UserInputService")

return function(Callback1: (any, any) -> (), Callback: (any, any) -> (), Text, p1)
	-- upvalues: UserInputService (copy)
	if UserInputService:GetPlatform() == Enum.Platform.Windows then
		Callback(Text .. " TODO: EXPCHAT-812 Test disabled on Windows", p1)
		
		return
	else
		Callback1(Text, p1)
	end
end