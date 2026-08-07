local corePackagesService = game:GetService("CorePackages")
local VRHub = require(corePackagesService.Workspace.Packages.VrCommon).VRHub
local isVRAppBuild = require(corePackagesService.Workspace.Packages.AppCommonLib).IsVRAppBuild
local reactModule = require(corePackagesService.Packages.React)
local runService = game:GetService("RunService")
local toolTipModule = require(script.Parent.ToolTip)
local luauPolyfillModule = require(corePackagesService.Packages.LuauPolyfill)
local t = {}

local function onRenderStepped(_) --[[ line: 28 ]]
	-- upvalues: isVRAppBuild (ref), t (ref), VRHub (ref)
	if isVRAppBuild() then
		for i, v in pairs(t) do
			local controllerControllerModel = VRHub:GetControllerModel(v.Button.Controller)
			local var8 = if controllerControllerModel then controllerControllerModel:getButtonPosition(v.Button.ButtonKeycode) else nil
			
			if v.Part then
				if controllerControllerModel == nil or var8 == nil then
					v.Part.Position = Vector3.new(-99999, -99999, -99999)
				else
					v.Part.Position = var8
				end
			end
		end
	end
end

function spawnTooltipPart() --[[ line: 49 ]]
	local tooltipPart = Instance.new("Part")
	tooltipPart.Name = "TooltipPart"
	tooltipPart.Position = Vector3.new(0, -100, 0)
	tooltipPart.Anchored = true
	tooltipPart.CanCollide = false
	tooltipPart.Transparency = 1
	tooltipPart.Size = Vector3.new(0.10000000149, 0.10000000149, 0.10000000149)
	tooltipPart.Parent = game.Workspace
	local billboardGui = Instance.new("BillboardGui")
	billboardGui.Parent = tooltipPart
	billboardGui.Adornee = tooltipPart
	billboardGui.AlwaysOnTop = true
	billboardGui.Active = false
	billboardGui.Size = UDim2.new(1, 0, 1, 0)
	
	return tooltipPart
end

function showTooltipText(p0) --[[ line: 69 ]]
	for i, v in ipairs(p0.Part:GetDescendants()) do
		if v:IsA("TextLabel") and v.Name == "Body" then
			v.ZIndex = 10
		end
	end
end

function Tooltips(p1) --[[ line: 77 ]]
	-- upvalues: t (ref), reactModule (ref), runService (ref), onRenderStepped (ref), luauPolyfillModule (ref), toolTipModule (ref)
	for i, v in pairs(p1.tooltipButtons) do
		t[i] = { Button = v, Part = spawnTooltipPart() }
	end
	reactModule.useEffect(function() --[[ line: 85 ]]
		-- upvalues: t (copy)
		for i, v in pairs(t) do
			showTooltipText(v)
		end
	end, {})
	runService.RenderStepped:Connect(onRenderStepped)
	
	return reactModule.createElement("Frame", {}, luauPolyfillModule.Array.map(t, function(p2, p3) --[[ line: 96 ]]
		-- upvalues: reactModule (copy), toolTipModule (copy), p1 (ref)
		return reactModule.createElement(toolTipModule, {
			controllerPart = p2.Part,
			tooltipText = p1.tooltipButtons[p3].Text
		})
	end))
end

return Tooltips