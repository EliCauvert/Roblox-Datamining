local resolvePlayerTargetModule = require(script.Parent.resolvePlayerTarget)

return function(p1, p2)
	-- upvalues: resolvePlayerTargetModule (ref)
	return resolvePlayerTargetModule(p1, p2, "CoreScripts.TextChat.Mute.Success")
end