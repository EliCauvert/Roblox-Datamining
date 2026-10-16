local GuiService = game:GetService("GuiService")
local config = {
	[Enum.NormalId.Front] = CFrame.identity,
	[Enum.NormalId.Left] = CFrame.fromEulerAngles(0, 1.5707963267948966, 0),
	[Enum.NormalId.Back] = CFrame.fromEulerAngles(0, 3.141592653589793, 0),
	[Enum.NormalId.Right] = CFrame.fromEulerAngles(0, -1.5707963267948966, 0),
	[Enum.NormalId.Top] = CFrame.fromEulerAnglesYXZ(1.5707963267948966, -1.5707963267948966, 0),
	[Enum.NormalId.Bottom] = CFrame.fromEulerAnglesYXZ(-1.5707963267948966, -1.5707963267948966, 0)
}

return function(Object, p1, Camera: Camera) --[[ Line: 21 | Named "guiPositionToScreenPosition" ]]
	-- upvalues: GuiService (copy), config (copy)
	local Vector = p1 / Object.AbsoluteSize
	
	if Object:IsA("ScreenGui") then
		return p1
	elseif Object:IsA("BillboardGui") then
		local ScreenSpaceBounds = Object:GetScreenSpaceBounds()
		
		return if ScreenSpaceBounds then ScreenSpaceBounds.Min + Vector * Vector2.new(ScreenSpaceBounds.Width, ScreenSpaceBounds.Height) + GuiService:GetInsetArea(Enum.ScreenInsets.None).Min else nil
	elseif not Object:IsA("SurfaceGui") then
		return nil
	else
		local Adornee = Object.Adornee or Object.Parent
		
		if Adornee and Adornee:IsA("BasePart") then
			local Entry = config[Object.Face]
			local ScreenPosition, OnScreen = Camera:WorldToScreenPoint(Adornee.CFrame * Entry * ((Entry:Inverse() * Adornee.Size):Abs() * Vector3.new(0.5 - Vector.X, 0.5 - Vector.Y, -0.5)))
			
			return if OnScreen then Vector2.new(ScreenPosition.X, ScreenPosition.Y) else nil
		else
			return nil
		end
	end
end