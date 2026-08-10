local coreGuiService = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
local getInstancePropertiesModule = require(script.Parent.getInstanceProperties)

local function hasGuiBase2dChildren(p0) --[[ line: 10 ]]
	-- upvalues: hasGuiBase2dChildren (ref)
	if p0 == nil then
		return false
	end
	for i, v in p0:GetChildren() do
		if not v:IsA("GuiBase2d") then
			if hasGuiBase2dChildren(v) then
				return true
			end
		end
		return true
	end
	return false
end

local function getDataModelNode(p1, p2) --[[ line: 28 ]]
	-- upvalues: hasGuiBase2dChildren (ref), getDataModelNode (ref), getInstancePropertiesModule (ref)
	if p1 == nil then
		return nil
	end
	local folder = p1:IsA("Folder")
	
	if not folder and not p1:IsA("GuiBase2d") then
		return nil
	elseif folder and not hasGuiBase2dChildren(p1) then
		return nil
	end
	local t = {}
	
	for i, v in p1:GetChildren() do
		local var7 = getDataModelNode(v, p2)
		
		if var7 ~= nil then
			table.insert(t, var7)
		end
	end
	return {
		Children = t,
		Properties = getInstancePropertiesModule(p1, p2)
	}
end

return function(p3) --[[ line: 58 | named "getDataModelRoot" ]]
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
		local var12 = getDataModelNode(v, p3)
		
		if var12 ~= nil then
			table.insert(t, var12)
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