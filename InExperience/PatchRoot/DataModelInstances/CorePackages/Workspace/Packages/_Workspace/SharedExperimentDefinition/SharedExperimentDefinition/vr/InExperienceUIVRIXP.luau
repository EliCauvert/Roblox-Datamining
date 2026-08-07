local parent = script:FindFirstAncestor("SharedExperimentDefinition").Parent
local experimentCacheManager = require(parent.ExperimentCacheManager).ExperimentCacheManager
local luaAppIECVRLayerName = game:DefineFastString("LuaAppIECVRLayerName", "PlatformExcellence.VR.SpatialUI")
local luaAppIECVRVariantKey = game:DefineFastString("LuaAppIECVRVariantKey", "spatial_ui_type")
local luaAppIECVRVariantNoSpatialUI = game:DefineFastInt("LuaAppIECVRVariantNoSpatialUI", 0)
local luaAppIECVRVariantSpatialUIWithDragging = game:DefineFastInt("LuaAppIECVRVariantSpatialUIWithDragging", 1)
local luaAppIECVRVariantSpatialUIWithoutDragging = game:DefineFastInt("LuaAppIECVRVariantSpatialUIWithoutDragging", 2)
local luaAppIECVRVariantSpatialUIMovePanelToCenter = game:DefineFastInt("LuaAppIECVRVariantSpatialUIMovePanelToCenter", 3)
local luaAppIECVRIxpEnabled8 = game:DefineFastFlag("LuaAppIECVRIxpEnabled8", false)
local fFlagEnableUIManagerPackgify = require(parent.SharedFlags).FFlagEnableUIManagerPackgify
local enableSpatialUIScalingFix = game:DefineFastFlag("EnableSpatialUIScalingFix", false)
local enableSpatialUICameraTypeFix8 = game:DefineFastFlag("EnableSpatialUICameraTypeFix8", false)
local luaAppIECVREnabled8 = game:DefineFastFlag("LuaAppIECVREnabled8", false)
local spatialUIEnableDrag8 = game:DefineFastFlag("SpatialUIEnableDrag8", false)
local spatialUIEnableMovePanelToCenter8 = game:DefineFastFlag("SpatialUIEnableMovePanelToCenter8", false)
local enableSpatialUIPlaceFilter = game:DefineFastFlag("EnableSpatialUIPlaceFilter", false)
local t = {}
t.__index = t

function t.new() --[[ line: 40 ]]
	-- upvalues: t (ref)
	local t_1 = { _layer_data = nil }
	setmetatable(t_1, t)
	
	return t_1
end

function t:getIXPVariant() --[[ line: 48 ]]
	-- upvalues: experimentCacheManager (ref), luaAppIECVRLayerName (ref), luaAppIECVRVariantKey (ref), luaAppIECVRVariantNoSpatialUI (ref)
	if self._layer_data == nil then
		self._layer_data = experimentCacheManager.default:getLayerVariables(luaAppIECVRLayerName) or {}
	end
	local var15 = self._layer_data[luaAppIECVRVariantKey] or nil
	
	return if var15 == nil then luaAppIECVRVariantNoSpatialUI else tonumber(var15)
end

function t.isDependencyFlagsEnabled() --[[ line: 60 ]]
	-- upvalues: fFlagEnableUIManagerPackgify (ref), enableSpatialUIPlaceFilter (ref)
	return fFlagEnableUIManagerPackgify and not enableSpatialUIPlaceFilter
end

function t:isInExperienceUIVREnabled() --[[ line: 64 ]]
	-- upvalues: luaAppIECVREnabled8 (ref), luaAppIECVRIxpEnabled8 (ref), luaAppIECVRVariantNoSpatialUI (ref)
	return if self:isDependencyFlagsEnabled() then if luaAppIECVREnabled8 then true elseif luaAppIECVRIxpEnabled8 then self:getIXPVariant() ~= luaAppIECVRVariantNoSpatialUI else false else false
end

function t:isDraggingAllowed() --[[ line: 78 ]]
	-- upvalues: spatialUIEnableDrag8 (ref), spatialUIEnableMovePanelToCenter8 (ref), luaAppIECVRVariantSpatialUIWithDragging (ref), luaAppIECVRVariantSpatialUIWithoutDragging (ref), luaAppIECVRVariantSpatialUIMovePanelToCenter (ref)
	if not self:isInExperienceUIVREnabled() then
		return false
	elseif spatialUIEnableDrag8 then
		return not spatialUIEnableMovePanelToCenter8
	elseif spatialUIEnableMovePanelToCenter8 then
		return false
	end
	local IXPVariant = self:getIXPVariant()
	
	return IXPVariant == luaAppIECVRVariantSpatialUIWithDragging or (if IXPVariant == luaAppIECVRVariantSpatialUIWithoutDragging then false elseif IXPVariant == luaAppIECVRVariantSpatialUIMovePanelToCenter then false else spatialUIEnableDrag8)
end

function t:isMovePanelToCenter() --[[ line: 101 ]]
	-- upvalues: spatialUIEnableMovePanelToCenter8 (ref), luaAppIECVRVariantSpatialUIMovePanelToCenter (ref)
	return if self:isInExperienceUIVREnabled() then if spatialUIEnableMovePanelToCenter8 then true else self:getIXPVariant() == luaAppIECVRVariantSpatialUIMovePanelToCenter else false
end

function t.isSpatialUICameraTypeFixEnabled(_) --[[ line: 112 ]]
	-- upvalues: enableSpatialUICameraTypeFix8 (ref)
	return enableSpatialUICameraTypeFix8
end

function t.isSpatialUIScalingFixEnabled(_) --[[ line: 116 ]]
	-- upvalues: enableSpatialUIScalingFix (ref)
	return enableSpatialUIScalingFix
end

return t.new()