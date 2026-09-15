local fFlagDebugEnablePioneerUX = require(script:FindFirstAncestor("PioneerUtils").Parent.SharedFlags).FFlagDebugEnablePioneerUX
local pioneerInfoModule = require(script.Parent.PioneerInfo)
local enablePioneerUX = game:DefineFastFlag("EnablePioneerUX", false)

return function()
	-- upvalues: fFlagDebugEnablePioneerUX (ref), enablePioneerUX (ref), pioneerInfoModule (ref)
	return fFlagDebugEnablePioneerUX or enablePioneerUX and pioneerInfoModule.isPioneerApp()
end