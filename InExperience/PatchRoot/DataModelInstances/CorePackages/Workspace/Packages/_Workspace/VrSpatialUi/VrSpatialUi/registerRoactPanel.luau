local vrSpatialUi = script:FindFirstAncestor("VrSpatialUi")
local httpService = game:GetService("HttpService")
local UIManagerModule = require(vrSpatialUi.UIManager)
local constantsModule = require(vrSpatialUi.Constants)
local fFlagEnableSpatialUIBottomBarFixPlaceFilterModule = require(vrSpatialUi.Flags.FFlagEnableSpatialUIBottomBarFixPlaceFilter)

local function _(p1, p2)
	local part = Instance.new("Part")
	part.Name = p1
	part.Anchored = true
	part.CanCollide = false
	part.CanTouch = false
	part.CanQuery = false
	part.CastShadow = false
	part.Transparency = 1
	part.Size = Vector3.new(0.050000000745, 0.050000000745, 0.050000000745)
	part:SetAttribute("_isProtectedSpatialUIPart", true)
	part.Parent = p2
end

local _ = function(p1)
	-- upvalues: httpService (ref)
	if p1:GetAttribute("_isProtectedSpatialUIPart") then
		return
	end
	local name = p1.Name
	local parent = p1.Parent
	p1:SetAttribute("_isProtectedSpatialUIPart", true)
	p1.Name = httpService:GenerateGUID(false)
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

return function(p1, p2, p3)
	-- upvalues: constantsModule (ref), fFlagEnableSpatialUIBottomBarFixPlaceFilterModule (ref), httpService (ref), UIManagerModule (ref)
	local t = nil
	local var1 = constantsModule.ROACT_PANEL_UIGROUP_MAP[p2]
	
	if var1 then
		t = {
			uiGroupElementOffset = constantsModule.ROACT_PANEL_UIGROUP_ELEMENT_OFFSET_MAP[p2]
		}
	end
	local t_1 = {
		headScale = 1,
		panelObject = p1.current,
		uiType = constantsModule.SpatialUIType.SpatialUIRoact,
		panelType = p2,
		panelPositionProps = { uiGroup = var1, cameraFixedPanelProp = t }
	}
	
	if fFlagEnableSpatialUIBottomBarFixPlaceFilterModule and p2 == constantsModule.PanelType.BottomBar then
		local current = p1.current
		
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
	UIManagerModule.getInstance():registerRoactPanel(p2, t_1, p3)
end