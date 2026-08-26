local makeActionCreator = require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator
local maybeAssertModule = require(script.Parent.Parent.Helpers.maybeAssert)
local typesModule = require(script.Parent.Parent.Types)

return makeActionCreator(script.Name, function(p1)
	-- upvalues: maybeAssertModule (ref), typesModule (ref)
	maybeAssertModule(typesModule.IMessage(p1))
	
	return { message = p1 }
end)