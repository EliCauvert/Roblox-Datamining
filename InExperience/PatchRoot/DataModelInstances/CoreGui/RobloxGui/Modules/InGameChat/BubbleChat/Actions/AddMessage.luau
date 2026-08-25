local makeActionCreator = require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator
local maybeAssertModule = require(script.Parent.Parent.Helpers.maybeAssert)
local typesModule = require(script.Parent.Parent.Types)

return makeActionCreator(script.Name, function(p0)
	-- upvalues: maybeAssertModule (ref), typesModule (ref)
	maybeAssertModule(typesModule.IMessage(p0))
	
	return { message = p0 }
end)