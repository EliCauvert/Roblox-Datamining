local CoreGui = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local GetInstancePropertiesModule = require(script.Parent.getInstanceProperties)

local function hasGuiBase2dChildren(Gui): boolean --[[ Line: 10 ]]
	-- upvalues: hasGuiBase2dChildren (copy)
	if Gui == nil then
		return false
	end
	for _, Gui1 in Gui:GetChildren() do
		if Gui1:IsA("GuiBase2d") then
			return true
		elseif hasGuiBase2dChildren(Gui1) then
			return true
		end
	end
	return false
end

local function getDataModelNode(Object, p1) --[[ Line: 28 ]]
	-- upvalues: hasGuiBase2dChildren (copy), getDataModelNode (copy), GetInstancePropertiesModule (copy)
	if Object == nil then
		return nil
	end
	local IsFolder = Object:IsA("Folder")
	local IsGuiBase2d = Object:IsA("GuiBase2d")
	
	if not IsFolder and not IsGuiBase2d then
		return nil
	end
	if IsFolder and not hasGuiBase2dChildren(Object) then
		return nil
	end
	local Children = {}
	
	for _, child in Object:GetChildren() do
		local DataModelNode = getDataModelNode(child, p1)
		
		if DataModelNode ~= nil then
			table.insert(Children, DataModelNode)
		end
	end
	return {
		Children = Children,
		Properties = GetInstancePropertiesModule(Object, p1)
	}
end

return function(p2) --[[ Line: 58 | Named "getDataModelRoot" ]]
	-- upvalues: CoreGui (copy), getDataModelNode (copy), GuiService (copy)
	local Viewport = { 0, 0 }
	local CurrentCamera = game.Workspace.CurrentCamera
	
	if CurrentCamera then
		Viewport = {
			CurrentCamera.ViewportSize.X,
			CurrentCamera.ViewportSize.Y
		}
	end
	local Children = {}
	
	for _, child in CoreGui:GetChildren() do
		local DataModelNode = getDataModelNode(child, p2)
		
		if DataModelNode ~= nil then
			table.insert(Children, DataModelNode)
		end
	end
	local GuiInset, GuiInset2 = GuiService:GetGuiInset()
	
	return {
		Children = Children,
		Properties = {
			Name = "CoreGui",
			Viewport = Viewport,
			GuiInset = { GuiInset.X, GuiInset.Y, GuiInset2.X, GuiInset2.Y }
		}
	}
end