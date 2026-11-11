local VrSpatialUi = script:FindFirstAncestor("VrSpatialUi")
local HttpService = game:GetService("HttpService")
local UIManagerModule = require(VrSpatialUi.UIManager)
local ConstantsModule = require(VrSpatialUi.Constants)
local FFlagEnableSpatialUIBottomBarFixPlaceFilterModule = require(VrSpatialUi.Flags.FFlagEnableSpatialUIBottomBarFixPlaceFilter)

local function _(Name, Parent)
	local Part = Instance.new("Part")
	Part.Name = Name
	Part.Anchored = true
	Part.CanCollide = false
	Part.CanTouch = false
	Part.CanQuery = false
	Part.CastShadow = false
	Part.Transparency = 1
	Part.Size = vector.create(0.05000000074505806, 0.05000000074505806, 0.05000000074505806)
	Part:SetAttribute("_isProtectedSpatialUIPart", true)
	Part.Parent = Parent
end

local _ = function(Object)
	-- upvalues: HttpService (copy)
	if not Object:GetAttribute("_isProtectedSpatialUIPart") then
		local Name = Object.Name
		local Parent = Object.Parent
		Object:SetAttribute("_isProtectedSpatialUIPart", true)
		Object.Name = HttpService:GenerateGUID(false)
		local Part = Instance.new("Part")
		Part.Name = Name
		Part.Anchored = true
		Part.CanCollide = false
		Part.CanTouch = false
		Part.CanQuery = false
		Part.CastShadow = false
		Part.Transparency = 1
		Part.Size = vector.create(0.05000000074505806, 0.05000000074505806, 0.05000000074505806)
		Part:SetAttribute("_isProtectedSpatialUIPart", true)
		Part.Parent = Parent
		
		return
	end
end

local _ = function(p1)
	-- upvalues: HttpService (copy)
	if p1 == nil then return end
	local Adornee = p1.Adornee
	
	if Adornee == nil then return end
	if not Adornee:GetAttribute("_isProtectedSpatialUIPart") then
		local Name = Adornee.Name
		local Parent = Adornee.Parent
		Adornee:SetAttribute("_isProtectedSpatialUIPart", true)
		Adornee.Name = HttpService:GenerateGUID(false)
		local Part = Instance.new("Part")
		Part.Name = Name
		Part.Anchored = true
		Part.CanCollide = false
		Part.CanTouch = false
		Part.CanQuery = false
		Part.CastShadow = false
		Part.Transparency = 1
		Part.Size = vector.create(0.05000000074505806, 0.05000000074505806, 0.05000000074505806)
		Part:SetAttribute("_isProtectedSpatialUIPart", true)
		Part.Parent = Parent
		
		return
	end
end

return function(p1, PanelType, p2)
	-- upvalues: ConstantsModule (copy), FFlagEnableSpatialUIBottomBarFixPlaceFilterModule (copy), HttpService (copy), UIManagerModule (copy)
	local CameraFixedPanelProp = nil
	local ROACTPANELUIGROUP = ConstantsModule.ROACT_PANEL_UIGROUP_MAP[PanelType]
	
	if ROACTPANELUIGROUP then
		CameraFixedPanelProp = {
			uiGroupElementOffset = ConstantsModule.ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP[PanelType]
		}
	end
	local config = {
		headScale = 1,
		panelObject = p1.current,
		uiType = ConstantsModule.SpatialUIType.SpatialUIRoact,
		panelType = PanelType,
		panelPositionProps = {
			uiGroup = ROACTPANELUIGROUP,
			cameraFixedPanelProp = CameraFixedPanelProp
		}
	}
	
	if FFlagEnableSpatialUIBottomBarFixPlaceFilterModule and PanelType == ConstantsModule.PanelType.BottomBar then
		local Current = p1.current
		
		if Current ~= nil then
			local Adornee = Current.Adornee
			
			if Adornee ~= nil and not Adornee:GetAttribute("_isProtectedSpatialUIPart") then
				local Name = Adornee.Name
				local Parent = Adornee.Parent
				Adornee:SetAttribute("_isProtectedSpatialUIPart", true)
				Adornee.Name = HttpService:GenerateGUID(false)
				local Part = Instance.new("Part")
				Part.Name = Name
				Part.Anchored = true
				Part.CanCollide = false
				Part.CanTouch = false
				Part.CanQuery = false
				Part.CastShadow = false
				Part.Transparency = 1
				Part.Size = vector.create(0.05000000074505806, 0.05000000074505806, 0.05000000074505806)
				Part:SetAttribute("_isProtectedSpatialUIPart", true)
				Part.Parent = Parent
			end
		end
	end
	UIManagerModule.getInstance():registerRoactPanel(PanelType, config, p2)
end