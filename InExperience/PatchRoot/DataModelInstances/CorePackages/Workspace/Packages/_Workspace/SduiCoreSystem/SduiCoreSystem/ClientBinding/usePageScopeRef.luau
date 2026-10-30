local SduiCoreSystem = script:FindFirstAncestor("SduiCoreSystem")
local ReactModule = require(SduiCoreSystem.Parent.React)
local GetSduiClientPageScopeModule = require(SduiCoreSystem.ClientBinding.getSduiClientPageScope)

return function(p1)
	-- upvalues: ReactModule (copy), GetSduiClientPageScopeModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	if p1 and UseRefResult.current == nil then
		UseRefResult.current = GetSduiClientPageScopeModule(p1)
	end
	return UseRefResult.current
end