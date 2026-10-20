local ResolvePlayerTargetModule = require(script.Parent.resolvePlayerTarget)

return function(p1, p2)
	-- upvalues: ResolvePlayerTargetModule (copy)
	return ResolvePlayerTargetModule(p1, p2, "CoreScripts.TextChat.Unmute.Success")
end