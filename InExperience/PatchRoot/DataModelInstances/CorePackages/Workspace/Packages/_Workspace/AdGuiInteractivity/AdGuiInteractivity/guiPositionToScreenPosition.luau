local guiService = game:GetService("GuiService")
local t = {
	[Enum.NormalId.Front] = CFrame.identity,
	[Enum.NormalId.Left] = CFrame.fromEulerAngles(0, 1.570796326795, 0),
	[Enum.NormalId.Back] = CFrame.fromEulerAngles(0, 3.14159265359, 0),
	[Enum.NormalId.Right] = CFrame.fromEulerAngles(0, -1.570796326795, 0),
	[Enum.NormalId.Top] = CFrame.fromEulerAnglesYXZ(1.570796326795, -1.570796326795, 0),
	[Enum.NormalId.Bottom] = CFrame.fromEulerAnglesYXZ(-1.570796326795, -1.570796326795, 0)
}

return function(p0, p1, p2) --[[ line: 21 | named "guiPositionToScreenPosition" ]]
	-- upvalues: guiService (ref), t (ref)
	local var2 = p1 / p0.AbsoluteSize
	
	if p0:IsA("ScreenGui") then
		return p1
	elseif p0:IsA("BillboardGui") then
		local screenSpaceBounds = p0:GetScreenSpaceBounds()
		
		return if screenSpaceBounds then screenSpaceBounds.Min + var2 * Vector2.new(screenSpaceBounds.Width, screenSpaceBounds.Height) + guiService:GetInsetArea(Enum.ScreenInsets.None).Min else nil
	elseif not p0:IsA("SurfaceGui") then
		return nil
	end
	local adornee = p0.Adornee or p0.Parent
	
	if not adornee or not adornee:IsA("BasePart") then
		return nil
	end
	local face = t[p0.Face]
	local var5, var6 = p2:WorldToScreenPoint(adornee.CFrame * face * ((face:Inverse() * adornee.Size):Abs() * Vector3.new(0.5 - var2.X, 0.5 - var2.Y, -0.5)))
	
	return if var6 then Vector2.new(var5.X, var5.Y) else nil
end