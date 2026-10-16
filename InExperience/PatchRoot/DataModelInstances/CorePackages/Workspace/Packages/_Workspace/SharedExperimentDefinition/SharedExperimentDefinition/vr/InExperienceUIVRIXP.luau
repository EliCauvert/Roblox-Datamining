local Parent = script:FindFirstAncestor("SharedExperimentDefinition").Parent
local ExperimentCacheManager = require(Parent.ExperimentCacheManager).ExperimentCacheManager
local LuaAppIECVRLayerName = game:DefineFastString("LuaAppIECVRLayerName", "PlatformExcellence.VR.SpatialUI")
local LuaAppIECVRVariantKey = game:DefineFastString("LuaAppIECVRVariantKey", "spatial_ui_type")
local LuaAppIECVRVariantNoSpatialUI = game:DefineFastInt("LuaAppIECVRVariantNoSpatialUI", 0)
local LuaAppIECVRVariantSpatialUIWithDragging = game:DefineFastInt("LuaAppIECVRVariantSpatialUIWithDragging", 1)
local LuaAppIECVRVariantSpatialUIWithoutDragging = game:DefineFastInt("LuaAppIECVRVariantSpatialUIWithoutDragging", 2)
local LuaAppIECVRVariantSpatialUIMovePanelToCenter = game:DefineFastInt("LuaAppIECVRVariantSpatialUIMovePanelToCenter", 3)
local LuaAppIECVRIxpEnabled8 = game:DefineFastFlag("LuaAppIECVRIxpEnabled8", false)
local FFlagEnableUIManagerPackgify = require(Parent.SharedFlags).FFlagEnableUIManagerPackgify
local EnableSpatialUIScalingFix = game:DefineFastFlag("EnableSpatialUIScalingFix", false)
local EnableSpatialUICameraTypeFix8 = game:DefineFastFlag("EnableSpatialUICameraTypeFix8", false)
local LuaAppIECVREnabled8 = game:DefineFastFlag("LuaAppIECVREnabled8", false)
local SpatialUIEnableDrag8 = game:DefineFastFlag("SpatialUIEnableDrag8", false)
local SpatialUIEnableMovePanelToCenter8 = game:DefineFastFlag("SpatialUIEnableMovePanelToCenter8", false)
local EnableSpatialUIPlaceFilter = game:DefineFastFlag("EnableSpatialUIPlaceFilter", false)
local Module = {}
Module.__index = Module

function Module.new() --[[ Line: 40 ]]
	-- upvalues: Module (copy)
	local config = { _layer_data = nil }
	setmetatable(config, Module)
	
	return config
end

function Module:getIXPVariant() --[[ Line: 48 ]]
	-- upvalues: ExperimentCacheManager (copy), LuaAppIECVRLayerName (copy), LuaAppIECVRVariantKey (copy), LuaAppIECVRVariantNoSpatialUI (copy)
	if self._layer_data == nil then
		self._layer_data = ExperimentCacheManager.default:getLayerVariables(LuaAppIECVRLayerName) or {}
	end
	local Layer = self._layer_data[LuaAppIECVRVariantKey] or nil
	
	return if Layer == nil then LuaAppIECVRVariantNoSpatialUI else tonumber(Layer)
end

function Module.isDependencyFlagsEnabled(): boolean --[[ Line: 60 ]]
	-- upvalues: FFlagEnableUIManagerPackgify (copy), EnableSpatialUIPlaceFilter (copy)
	return FFlagEnableUIManagerPackgify and not EnableSpatialUIPlaceFilter
end

function Module.isInExperienceUIVREnabled(p1): boolean --[[ Line: 64 ]]
	-- upvalues: LuaAppIECVREnabled8 (copy), LuaAppIECVRIxpEnabled8 (copy), LuaAppIECVRVariantNoSpatialUI (copy)
	return if p1:isDependencyFlagsEnabled() then if LuaAppIECVREnabled8 then true elseif LuaAppIECVRIxpEnabled8 then p1:getIXPVariant() ~= LuaAppIECVRVariantNoSpatialUI else false else false
end

function Module:isDraggingAllowed() --[[ Line: 78 ]]
	-- upvalues: SpatialUIEnableDrag8 (copy), SpatialUIEnableMovePanelToCenter8 (copy), LuaAppIECVRVariantSpatialUIWithDragging (copy), LuaAppIECVRVariantSpatialUIWithoutDragging (copy), LuaAppIECVRVariantSpatialUIMovePanelToCenter (copy)
	if not self:isInExperienceUIVREnabled() then
		return false
	elseif SpatialUIEnableDrag8 then
		return not SpatialUIEnableMovePanelToCenter8
	elseif SpatialUIEnableMovePanelToCenter8 then
		return false
	else
		local IXPVariant = self:getIXPVariant()
		
		return IXPVariant == LuaAppIECVRVariantSpatialUIWithDragging or IXPVariant ~= LuaAppIECVRVariantSpatialUIWithoutDragging and (IXPVariant ~= LuaAppIECVRVariantSpatialUIMovePanelToCenter and SpatialUIEnableDrag8)
	end
end

function Module.isMovePanelToCenter(p1): boolean --[[ Line: 101 ]]
	-- upvalues: SpatialUIEnableMovePanelToCenter8 (copy), LuaAppIECVRVariantSpatialUIMovePanelToCenter (copy)
	return if p1:isInExperienceUIVREnabled() then if SpatialUIEnableMovePanelToCenter8 then true else p1:getIXPVariant() == LuaAppIECVRVariantSpatialUIMovePanelToCenter else false
end

function Module:isSpatialUICameraTypeFixEnabled() --[[ Line: 112 ]]
	-- upvalues: EnableSpatialUICameraTypeFix8 (copy)
	return EnableSpatialUICameraTypeFix8
end

function Module:isSpatialUIScalingFixEnabled() --[[ Line: 116 ]]
	-- upvalues: EnableSpatialUIScalingFix (copy)
	return EnableSpatialUIScalingFix
end

return (Module.new())