local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local ReactModule = require(AmpV2Wizard.Parent.React)
local _ = require(AmpV2Wizard.ComponentRegistry)
local _ = require(AmpV2Wizard.Types)

return function(Node, Component, p1)
	-- upvalues: ReactModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	
	if Node == nil or Component == nil then
		return nil
	elseif Node.behavior == nil or Node.behavior.presentsOverPrevious ~= true then
		UseRefResult.current = if p1 then { node = Node, component = Component } else nil
		
		return nil
	else
		return UseRefResult.current
	end
end