local resolvePlayerTargetModule = require(script.Parent.resolvePlayerTarget)

return function(p0, p1)
	-- upvalues: resolvePlayerTargetModule (ref)
	return resolvePlayerTargetModule(p0, p1, "CoreScripts.TextChat.Mute.Success")
end