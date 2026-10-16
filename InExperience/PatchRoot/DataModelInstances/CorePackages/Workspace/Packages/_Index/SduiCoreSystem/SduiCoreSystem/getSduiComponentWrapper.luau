local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local _ = require(SduiCoreSystem.Parent.React)
local SduiComponentModule = require(SduiCoreSystem.SduiComponent)
local SduiFastPathComponentModule = require(SduiCoreSystem.SduiFastPathComponent)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local _ = require(SduiCoreSystem.SduiConfigTypes)
local v1 = nil

local function v7(p1) --[[ Line: 30 ]]
	-- upvalues: v1 (ref), SduiFastPathComponentModule (copy), SduiComponentModule (copy)
	return if p1 and p1.__isClientBinding then if p1.propSignals or p1.isComponentFilteredSignal ~= nil or p1._requiresDataBinding == true then v1.SduiDataBindingWrapper else v1.SduiClientBindingThinWrapper elseif p1 and p1.__processed and p1.conditionalProps == nil and p1.children == nil and (p1.templateKey == nil or p1.templateKey == "NONE") then SduiFastPathComponentModule else SduiComponentModule
end

v1 = require(SduiCoreSystem.ClientBinding.createSduiClientBindingWrappers)(v7)

return v7