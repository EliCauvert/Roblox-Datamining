local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local _ = require(parent.React)
local sduiComponentModule = require(sduiCoreSystem.SduiComponent)
local sduiFastPathComponentModule = require(sduiCoreSystem.SduiFastPathComponent)
local createSduiClientBindingWrappersModule = require(sduiCoreSystem.ClientBinding.createSduiClientBindingWrappers)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.SduiConfigTypes)
local fFlagSduiPoolBackedFeed = require(parent.SharedFlags).FFlagSduiPoolBackedFeed
local var1 = nil

local var2 = function(p1)
	-- upvalues: fFlagSduiPoolBackedFeed (ref), var1 (write), sduiFastPathComponentModule (ref), sduiComponentModule (ref)
	return if p1 and p1.__isClientBinding then if p1.propSignals or p1.isComponentFilteredSignal ~= nil or fFlagSduiPoolBackedFeed and p1._requiresDataBinding == true then var1.SduiDataBindingWrapper else var1.SduiClientBindingThinWrapper elseif p1 and p1.__processed and (p1.conditionalProps == nil and p1.children == nil) and (p1.templateKey == nil or p1.templateKey == "NONE") then sduiFastPathComponentModule else sduiComponentModule
end

var1 = createSduiClientBindingWrappersModule(var2)

return var2