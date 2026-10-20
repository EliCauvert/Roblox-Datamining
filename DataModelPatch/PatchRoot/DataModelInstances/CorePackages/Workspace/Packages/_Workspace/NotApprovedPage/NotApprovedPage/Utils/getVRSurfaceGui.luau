local CoreGui = game:GetService("CoreGui")

return function()
	-- upvalues: CoreGui (copy)
	local LuaAppScreenGui = CoreGui:FindFirstChild("LuaAppScreenGui")
	local MainAppScreenSurfaceGui = if LuaAppScreenGui then LuaAppScreenGui:FindFirstChild("MainAppScreen_SurfaceGui") else nil
	
	return if MainAppScreenSurfaceGui and MainAppScreenSurfaceGui:IsA("SurfaceGui") then MainAppScreenSurfaceGui else nil
end