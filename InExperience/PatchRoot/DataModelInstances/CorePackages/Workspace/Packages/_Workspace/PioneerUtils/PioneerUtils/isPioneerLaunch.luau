local FFlagDebugEnablePioneerUX = require(script:FindFirstAncestor("PioneerUtils").Parent.SharedFlags).FFlagDebugEnablePioneerUX
local PioneerInfoModule = require(script.Parent.PioneerInfo)
local EnablePioneerUX = game:DefineFastFlag("EnablePioneerUX", false)

return function() --[[ Line: 13 | Named "isPioneerLaunch" ]]
	-- upvalues: FFlagDebugEnablePioneerUX (copy), EnablePioneerUX (copy), PioneerInfoModule (copy)
	return FFlagDebugEnablePioneerUX or EnablePioneerUX and PioneerInfoModule.isPioneerApp()
end