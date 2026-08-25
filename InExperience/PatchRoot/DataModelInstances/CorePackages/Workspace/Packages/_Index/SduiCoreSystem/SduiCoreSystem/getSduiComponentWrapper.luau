local sduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local parent = sduiCoreSystem.Parent
local _ = require(parent.React)
local sduiComponentModule = require(sduiCoreSystem.SduiComponent)
local sduiFastPathComponentModule = require(sduiCoreSystem.SduiFastPathComponent)
local createSduiClientBindingWrappersModule = require(sduiCoreSystem.ClientBinding.createSduiClientBindingWrappers)
local _ = require(sduiCoreSystem.SduiBuilderTypes)
local _ = require(sduiCoreSystem.SduiConfigTypes)
local fFlagSduiPoolBackedFeed = require(parent.SharedFlags).FFlagSduiPoolBackedFeed
local var4 = nil

local var5 = function(p0)
	-- upvalues: fFlagSduiPoolBackedFeed (ref), var4 (write), sduiFastPathComponentModule (ref), sduiComponentModule (ref)
	return if p0 and p0.__isClientBinding then if p0.propSignals or p0.isComponentFilteredSignal ~= nil or fFlagSduiPoolBackedFeed and p0._requiresDataBinding == true then var4.SduiDataBindingWrapper else var4.SduiClientBindingThinWrapper elseif p0 and p0.__processed and (p0.conditionalProps == nil and p0.children == nil) and (p0.templateKey == nil or p0.templateKey == "NONE") then sduiFastPathComponentModule else sduiComponentModule
end

var4 = createSduiClientBindingWrappersModule(var5)

return var5