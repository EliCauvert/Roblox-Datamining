local CorePackages = game:GetService("CorePackages")
local VRHub = require(CorePackages.Workspace.Packages.VrCommon).VRHub
local IsVRAppBuildFunction = require(CorePackages.Workspace.Packages.AppCommonLib).IsVRAppBuild
local ReactModule = require(CorePackages.Packages.React)
local RunService = game:GetService("RunService")
local ToolTipModule = require(script.Parent.ToolTip)
local LuauPolyfillModule = require(CorePackages.Packages.LuauPolyfill)
local t = {}

local function onRenderStepped(_) --[[ Line: 28 ]]
	-- upvalues: IsVRAppBuildFunction (copy), t (copy), VRHub (copy)
	if IsVRAppBuildFunction() then
		for _, value in pairs(t) do
			local ControllerModel = VRHub:GetControllerModel(value.Button.Controller)
			local ButtonPosition = if ControllerModel then ControllerModel:getButtonPosition(value.Button.ButtonKeycode) else nil
			
			if value.Part then
				if ControllerModel == nil or ButtonPosition == nil then
					value.Part.Position = vector.create(-99999, -99999, -99999)
				else
					value.Part.Position = ButtonPosition
				end
			end
		end
	end
end

function spawnTooltipPart() --[[ Line: 49 ]]
	local TooltipPart = Instance.new("Part")
	TooltipPart.Name = "TooltipPart"
	TooltipPart.Position = vector.create(0, -100, 0)
	TooltipPart.Anchored = true
	TooltipPart.CanCollide = false
	TooltipPart.Transparency = 1
	TooltipPart.Size = vector.create(0.10000000149011612, 0.10000000149011612, 0.10000000149011612)
	TooltipPart.Parent = game.Workspace
	local Billboard = Instance.new("BillboardGui")
	Billboard.Parent = TooltipPart
	Billboard.Adornee = TooltipPart
	Billboard.AlwaysOnTop = true
	Billboard.Active = false
	Billboard.Size = UDim2.new(1, 0, 1, 0)
	
	return TooltipPart
end

function showTooltipText(p1) --[[ Line: 69 ]]
	for _, Label in ipairs(p1.Part:GetDescendants()) do
		if Label:IsA("TextLabel") and Label.Name == "Body" then
			Label.ZIndex = 10
		end
	end
end

function Tooltips(p2) --[[ Line: 77 ]]
	-- upvalues: t (copy), ReactModule (copy), RunService (copy), onRenderStepped (copy), LuauPolyfillModule (copy), ToolTipModule (copy)
	for i, tooltipButton in pairs(p2.tooltipButtons) do
		t[i] = { Button = tooltipButton, Part = spawnTooltipPart() }
	end
	ReactModule.useEffect(function() --[[ Line: 85 ]]
		-- upvalues: t (upval)
		for _, value in pairs(t) do
			showTooltipText(value)
		end
	end, {})
	RunService.RenderStepped:Connect(onRenderStepped)
	
	return ReactModule.createElement("Frame", {}, (LuauPolyfillModule.Array.map(t, function(p3, p4) --[[ Line: 96 ]]
		-- upvalues: ReactModule (upval), ToolTipModule (upval), p2 (copy)
		return (ReactModule.createElement(ToolTipModule, {
			controllerPart = p3.Part,
			tooltipText = p2.tooltipButtons[p4].Text
		}))
	end)))
end

return Tooltips