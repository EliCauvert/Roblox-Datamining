local guiService = game:GetService("GuiService")
local guiPositionToScreenPositionModule = require(script:FindFirstAncestor("AdGuiInteractivity").guiPositionToScreenPosition)
local removeAdIntegrationsInputPositionOffset = game:DefineFastFlag("RemoveAdIntegrationsInputPositionOffset", false)

local function inputPositionToGuiPosition(p0, p1, p2) --[[ line: 11 ]]
	-- upvalues: guiService (ref)
	return if p0 == Vector2.zero then p2.AbsolutePosition + p2.AbsoluteSize / 2 elseif p1:IsA("BillboardGui") or p1:IsA("SurfaceGui") then p0 - guiService:GetInsetArea(Enum.ScreenInsets.None).Min else p0
end

return function(p3, p4) --[[ line: 31 ]]
	-- upvalues: removeAdIntegrationsInputPositionOffset (ref), guiPositionToScreenPositionModule (ref), inputPositionToGuiPosition (ref)
	local currentCamera = game.Workspace.CurrentCamera
	
	if not currentCamera then
		return Vector2.zero
	end
	local layerCollector = p3:FindFirstAncestorWhichIsA("LayerCollector")
	
	if removeAdIntegrationsInputPositionOffset then
		local var5 = currentCamera.ViewportSize / 2
		
		if not layerCollector then
			return var5
		end
		local vector2 = Vector2.new(p4.Position.X, p4.Position.Y)
		
		if vector2 == Vector2.zero then
			vector2 = p3.AbsolutePosition + p3.AbsoluteSize / 2
		end
		return guiPositionToScreenPositionModule(layerCollector, vector2, currentCamera) or var5
	elseif layerCollector then
		local var7 = guiPositionToScreenPositionModule(layerCollector, inputPositionToGuiPosition(Vector2.new(p4.Position.X, p4.Position.Y), layerCollector, p3), currentCamera)
		
		return var7 or currentCamera.ViewportSize / 2
	end
end