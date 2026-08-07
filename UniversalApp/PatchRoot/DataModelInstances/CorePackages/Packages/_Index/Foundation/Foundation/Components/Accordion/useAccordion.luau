local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.InputSize)
local _ = require(foundation.Components.Types)
local accordionContextModule = require(script.Parent.AccordionContext)

return function() --[[ line: 22 ]]
	-- upvalues: reactModule (ref), accordionContextModule (ref)
	return reactModule.useContext(accordionContextModule)
end