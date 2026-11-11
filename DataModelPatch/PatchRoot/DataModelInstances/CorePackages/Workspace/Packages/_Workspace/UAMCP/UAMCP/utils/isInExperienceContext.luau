return function(): boolean
	local CoreGui = game:FindFirstChild("CoreGui")
	
	if not CoreGui then
		return false
	end
	local TopBarApp = CoreGui:FindFirstChild("TopBarApp")
	
	if TopBarApp then
		local TopBarApp1 = TopBarApp:FindFirstChild("TopBarApp")
		
		return if TopBarApp1 and TopBarApp1:IsA("ScreenGui") then not CoreGui:FindFirstChild("LuaAppScreenGui") else false
	else
		return false
	end
end