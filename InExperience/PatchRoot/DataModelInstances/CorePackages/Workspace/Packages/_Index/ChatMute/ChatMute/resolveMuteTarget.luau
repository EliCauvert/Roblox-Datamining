local ResolvePlayerTargetModule = require(script.Parent.resolvePlayerTarget)

return function(p1, p2) --[[ Line: 5 ]]
	-- upvalues: ResolvePlayerTargetModule (copy)
	return ResolvePlayerTargetModule(p1, p2, "CoreScripts.TextChat.Mute.Success")
end