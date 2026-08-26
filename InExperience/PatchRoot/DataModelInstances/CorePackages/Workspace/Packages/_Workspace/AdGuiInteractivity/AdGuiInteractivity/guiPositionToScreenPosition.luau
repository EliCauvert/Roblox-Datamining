local guiService = game:GetService("GuiService")
local t = {
	[Enum.NormalId.Front] = CFrame.identity,
	[Enum.NormalId.Left] = CFrame.fromEulerAngles(0, 1.570796326795, 0),
	[Enum.NormalId.Back] = CFrame.fromEulerAngles(0, 3.14159265359, 0),
	[Enum.NormalId.Right] = CFrame.fromEulerAngles(0, -1.570796326795, 0),
	[Enum.NormalId.Top] = CFrame.fromEulerAnglesYXZ(1.570796326795, -1.570796326795, 0),
	[Enum.NormalId.Bottom] = CFrame.fromEulerAnglesYXZ(-1.570796326795, -1.570796326795, 0)
}

return function(p1, p2, p3)
	-- upvalues: guiService (ref), t (ref)
	local var1 = p2 / p1.AbsoluteSize
	
	if p1:IsA("ScreenGui") then
		return p2
	elseif p1:IsA("BillboardGui") then
		local screenSpaceBounds = p1:GetScreenSpaceBounds()
		
		return if screenSpaceBounds then screenSpaceBounds.Min + var1 * Vector2.new(screenSpaceBounds.Width, screenSpaceBounds.Height) + guiService:GetInsetArea(Enum.ScreenInsets.None).Min else nil
	elseif not p1:IsA("SurfaceGui") then
		return nil
	end
	local adornee = p1.Adornee or p1.Parent
	
	if not adornee or not adornee:IsA("BasePart") then
		return nil
	end
	local face = t[p1.Face]
	local var2, var3 = p3:WorldToScreenPoint(adornee.CFrame * face * ((face:Inverse() * adornee.Size):Abs() * Vector3.new(0.5 - var1.X, 0.5 - var1.Y, -0.5)))
	
	return if var3 then Vector2.new(var2.X, var2.Y) else nil
end