local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local _ = require(Parent.React)
local SduiComponentModule = require(SduiCoreSystem.SduiComponent)
local SduiFastPathComponentModule = require(SduiCoreSystem.SduiFastPathComponent)
local _ = require(SduiCoreSystem.SduiBuilderTypes)
local _ = require(SduiCoreSystem.SduiConfigTypes)
local FFlagSduiPoolBackedFeed = require(Parent.SharedFlags).FFlagSduiPoolBackedFeed
local v1 = nil

local function v9(p1)
	-- upvalues: FFlagSduiPoolBackedFeed (copy), v1 (ref), SduiFastPathComponentModule (copy), SduiComponentModule (copy)
	return if p1 and p1.__isClientBinding then if p1.propSignals or p1.isComponentFilteredSignal ~= nil or FFlagSduiPoolBackedFeed and p1._requiresDataBinding == true then v1.SduiDataBindingWrapper else v1.SduiClientBindingThinWrapper elseif p1 and p1.__processed and p1.conditionalProps == nil and p1.children == nil and (p1.templateKey == nil or p1.templateKey == "NONE") then SduiFastPathComponentModule else SduiComponentModule
end

v1 = require(SduiCoreSystem.ClientBinding.createSduiClientBindingWrappers)(v9)

return v9