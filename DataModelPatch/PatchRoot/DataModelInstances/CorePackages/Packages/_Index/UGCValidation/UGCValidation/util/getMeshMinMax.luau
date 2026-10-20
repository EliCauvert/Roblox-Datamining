local UGCValidationService = game:GetService("UGCValidationService")
local Parent = script.Parent.Parent
local _ = require(Parent.util.Types)
local PcallDeferredModule = require(Parent.util.pcallDeferred)
local CalculateMinMaxModule = require(Parent.util.calculateMinMax)

local function getVerts(p1, IsServer, p2)
	-- upvalues: PcallDeferredModule (copy), UGCValidationService (copy)
	local PcallDeferredModuleResult, PcallDeferredModuleResult2 = PcallDeferredModule(function()
		-- upvalues: UGCValidationService (upval), p1 (copy)
		return UGCValidationService:GetEditableMeshVerts(p1.editableMesh)
	end, p2)
	
	if PcallDeferredModuleResult then
		return true, nil, PcallDeferredModuleResult2
	end
	local Text = "Failed to read mesh: " .. p1.fullName
	
	if IsServer then
		error(Text)
	end
	return false, { Text }
end

local function getBoundsInfo(List, Scale)
	-- upvalues: CalculateMinMaxModule (copy)
	local v1 = nil
	local v2 = nil
	
	for _, value in pairs(List) do
		local ScaledScale = if Scale then value * Scale else value
		v1, v11 = CalculateMinMaxModule(v1, v2, ScaledScale, ScaledScale)
	end
	return v1, v2
end

return function(p1, p2)
	-- upvalues: getVerts (copy), getBoundsInfo (copy)
	local Verts, Verts2, Verts3 = getVerts(p1, p2.isServer, p2)
	
	if not Verts then
		return Verts, Verts2
	elseif Verts3 and #Verts3 ~= 0 then
		local BoundsInfo, BoundsInfo2 = getBoundsInfo(Verts3, p1.scale)
		
		return true, nil, BoundsInfo, BoundsInfo2
	else
		return false, { "Mesh: " .. p1.fullName .. " contains no verts" }
	end
end