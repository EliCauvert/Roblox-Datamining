local fFlagDebugEnablePioneerUX = require(script:FindFirstAncestor("PioneerUtils").Parent.SharedFlags).FFlagDebugEnablePioneerUX
local pioneerInfoModule = require(script.Parent.PioneerInfo)
local enablePioneerUXDev = game:DefineFastFlag("EnablePioneerUXDev", false)

return function()
	-- upvalues: fFlagDebugEnablePioneerUX (ref), enablePioneerUXDev (ref), pioneerInfoModule (ref)
	return fFlagDebugEnablePioneerUX or enablePioneerUXDev and pioneerInfoModule.isPioneerApp()
end