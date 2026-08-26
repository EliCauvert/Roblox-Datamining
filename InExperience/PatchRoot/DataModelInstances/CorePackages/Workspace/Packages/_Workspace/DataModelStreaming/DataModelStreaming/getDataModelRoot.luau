local coreGuiService = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
local getInstancePropertiesModule = require(script.Parent.getInstanceProperties)

local function hasGuiBase2dChildren(p1)
	-- upvalues: hasGuiBase2dChildren (ref)
	if p1 == nil then
		return false
	end
	for i, v in p1:GetChildren() do
		if not v:IsA("GuiBase2d") then
			if hasGuiBase2dChildren(v) then
				return true
			end
		end
		return true
	end
	return false
end

local function getDataModelNode(p2, p3)
	-- upvalues: hasGuiBase2dChildren (ref), getDataModelNode (ref), getInstancePropertiesModule (ref)
	if p2 == nil then
		return nil
	end
	local folder = p2:IsA("Folder")
	
	if not folder and not p2:IsA("GuiBase2d") then
		return nil
	elseif folder and not hasGuiBase2dChildren(p2) then
		return nil
	end
	local t = {}
	
	for i, v in p2:GetChildren() do
		local var1 = getDataModelNode(v, p3)
		
		if var1 ~= nil then
			table.insert(t, var1)
		end
	end
	return {
		Children = t,
		Properties = getInstancePropertiesModule(p2, p3)
	}
end

return function(p4)
	-- upvalues: coreGuiService (ref), getDataModelNode (ref), guiService (ref)
	local list = { 0, 0 }
	local currentCamera = game.Workspace.CurrentCamera
	
	if currentCamera then
		list = {
			currentCamera.ViewportSize.X,
			currentCamera.ViewportSize.Y
		}
	end
	local t = {}
	
	for i, v in coreGuiService:GetChildren() do
		local var2 = getDataModelNode(v, p4)
		
		if var2 ~= nil then
			table.insert(t, var2)
		end
	end
	local guiInset, guiInset_1 = guiService:GetGuiInset()
	
	return {
		Children = t,
		Properties = {
			Name = "CoreGui",
			Viewport = list,
			GuiInset = { guiInset.X, guiInset.Y, guiInset_1.X, guiInset_1.Y }
		}
	}
end