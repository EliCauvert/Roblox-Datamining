local vrSpatialUi = script:FindFirstAncestor("VrSpatialUi")
local httpService = game:GetService("HttpService")
local UIManagerModule = require(vrSpatialUi.UIManager)
local constantsModule = require(vrSpatialUi.Constants)
local fFlagEnableSpatialUIBottomBarFixPlaceFilterModule = require(vrSpatialUi.Flags.FFlagEnableSpatialUIBottomBarFixPlaceFilter)

local function _(p0, p1)
	local part = Instance.new("Part")
	part.Name = p0
	part.Anchored = true
	part.CanCollide = false
	part.CanTouch = false
	part.CanQuery = false
	part.CastShadow = false
	part.Transparency = 1
	part.Size = Vector3.new(0.050000000745, 0.050000000745, 0.050000000745)
	part:SetAttribute("_isProtectedSpatialUIPart", true)
	part.Parent = p1
end

local _ = function(p2)
	-- upvalues: httpService (ref)
	if p2:GetAttribute("_isProtectedSpatialUIPart") then
		return
	end
	local name = p2.Name
	local parent = p2.Parent
	p2:SetAttribute("_isProtectedSpatialUIPart", true)
	p2.Name = httpService:GenerateGUID(false)
	local part = Instance.new("Part")
	part.Name = name
	part.Anchored = true
	part.CanCollide = false
	part.CanTouch = false
	part.CanQuery = false
	part.CastShadow = false
	part.Transparency = 1
	part.Size = Vector3.new(0.050000000745, 0.050000000745, 0.050000000745)
	part:SetAttribute("_isProtectedSpatialUIPart", true)
	part.Parent = parent
end

local _ = function(value)
	-- upvalues: httpService (ref)
	if value == nil then return end
	local adornee = value.Adornee
	
	if adornee == nil then return end
	if adornee:GetAttribute("_isProtectedSpatialUIPart") then
		return
	end
	local name = adornee.Name
	local parent = adornee.Parent
	adornee:SetAttribute("_isProtectedSpatialUIPart", true)
	adornee.Name = httpService:GenerateGUID(false)
	local part = Instance.new("Part")
	part.Name = name
	part.Anchored = true
	part.CanCollide = false
	part.CanTouch = false
	part.CanQuery = false
	part.CastShadow = false
	part.Transparency = 1
	part.Size = Vector3.new(0.050000000745, 0.050000000745, 0.050000000745)
	part:SetAttribute("_isProtectedSpatialUIPart", true)
	part.Parent = parent
end

return function(p3, p4, p5)
	-- upvalues: constantsModule (ref), fFlagEnableSpatialUIBottomBarFixPlaceFilterModule (ref), httpService (ref), UIManagerModule (ref)
	local t = nil
	local var9 = constantsModule.ROACT_PANEL_UIGROUP_MAP[p4]
	
	if var9 then
		t = {
			uiGroupElementOffset = constantsModule.ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP[p4]
		}
	end
	local t_1 = {
		headScale = 1,
		panelObject = p3.current,
		uiType = constantsModule.SpatialUIType.SpatialUIRoact,
		panelType = p4,
		panelPositionProps = { uiGroup = var9, cameraFixedPanelProp = t }
	}
	
	if fFlagEnableSpatialUIBottomBarFixPlaceFilterModule and p4 == constantsModule.PanelType.BottomBar then
		local current = p3.current
		
		if current ~= nil then
			local adornee = current.Adornee
			
			if adornee ~= nil and not adornee:GetAttribute("_isProtectedSpatialUIPart") then
				local name = adornee.Name
				local parent = adornee.Parent
				adornee:SetAttribute("_isProtectedSpatialUIPart", true)
				adornee.Name = httpService:GenerateGUID(false)
				local part = Instance.new("Part")
				part.Name = name
				part.Anchored = true
				part.CanCollide = false
				part.CanTouch = false
				part.CanQuery = false
				part.CastShadow = false
				part.Transparency = 1
				part.Size = Vector3.new(0.050000000745, 0.050000000745, 0.050000000745)
				part:SetAttribute("_isProtectedSpatialUIPart", true)
				part.Parent = parent
			end
		end
	end
	UIManagerModule.getInstance():registerRoactPanel(p4, t_1, p5)
end