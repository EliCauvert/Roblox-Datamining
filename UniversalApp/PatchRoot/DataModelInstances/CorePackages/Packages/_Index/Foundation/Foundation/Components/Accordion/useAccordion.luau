local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Enums.InputPlacement)
local _ = require(Foundation.Enums.InputSize)
local _ = require(Foundation.Components.Types)
local AccordionContextModule = require(script.Parent.AccordionContext)

return function() --[[ Line: 26 ]]
	-- upvalues: ReactModule (copy), AccordionContextModule (copy)
	return ReactModule.useContext(AccordionContextModule)
end