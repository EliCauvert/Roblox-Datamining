local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local Parent = SduiCoreSystem.Parent
local ReactModule = require(Parent.React)
local GetSduiClientPageScopeModule = require(SduiCoreSystem.ClientBinding.getSduiClientPageScope)
local FFlagSduiClientPageScope = require(Parent.SharedFlags).FFlagSduiClientPageScope

return function(p1)
	-- upvalues: ReactModule (copy), FFlagSduiClientPageScope (copy), GetSduiClientPageScopeModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	if FFlagSduiClientPageScope and p1 and UseRefResult.current == nil then
		UseRefResult.current = GetSduiClientPageScopeModule(p1)
	end
	return UseRefResult.current
end