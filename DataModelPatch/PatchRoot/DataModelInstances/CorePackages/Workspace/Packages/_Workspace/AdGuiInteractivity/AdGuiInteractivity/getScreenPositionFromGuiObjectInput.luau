local GuiService = game:GetService("GuiService")
local GuiPositionToScreenPositionModule = require(script:FindFirstAncestor("AdGuiInteractivity").guiPositionToScreenPosition)
local RemoveAdIntegrationsInputPositionOffset = game:DefineFastFlag("RemoveAdIntegrationsInputPositionOffset", false)

local function inputPositionToGuiPosition(Vector, Object, Frame: Frame)
	-- upvalues: GuiService (copy)
	return if Vector == Vector2.zero then Frame.AbsolutePosition + Frame.AbsoluteSize / 2 elseif Object:IsA("BillboardGui") or Object:IsA("SurfaceGui") then Vector - GuiService:GetInsetArea(Enum.ScreenInsets.None).Min else Vector
end

return function(Frame: Frame, p1)
	-- upvalues: RemoveAdIntegrationsInputPositionOffset (copy), GuiPositionToScreenPositionModule (copy), inputPositionToGuiPosition (copy)
	local CurrentCamera = game.Workspace.CurrentCamera
	
	if not CurrentCamera then
		return Vector2.zero
	end
	local LayerCollector = Frame:FindFirstAncestorWhichIsA("LayerCollector")
	
	if RemoveAdIntegrationsInputPositionOffset then
		local ViewportSizeRatio = CurrentCamera.ViewportSize / 2
		
		if not LayerCollector then
			return ViewportSizeRatio
		end
		local _Vector2 = Vector2.new(p1.Position.X, p1.Position.Y)
		
		if _Vector2 == Vector2.zero then
			_Vector2 = Frame.AbsolutePosition + Frame.AbsoluteSize / 2
		end
		return GuiPositionToScreenPositionModule(LayerCollector, _Vector2, CurrentCamera) or ViewportSizeRatio
	else
		if LayerCollector then
			local GuiPositionToScreenPositionModuleResult = GuiPositionToScreenPositionModule(LayerCollector, inputPositionToGuiPosition(Vector2.new(p1.Position.X, p1.Position.Y), LayerCollector, Frame), CurrentCamera)
			
			if GuiPositionToScreenPositionModuleResult then
				return GuiPositionToScreenPositionModuleResult
			end
		end
		return CurrentCamera.ViewportSize / 2
	end
end