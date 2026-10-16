local MaybeAssertModule = require(script.Parent.Parent.Helpers.maybeAssert)
local TypesModule = require(script.Parent.Parent.Types)

return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator(script.Name, function(Message) --[[ Line: 7 ]]
	-- upvalues: MaybeAssertModule (copy), TypesModule (copy)
	MaybeAssertModule(TypesModule.IMessage(Message))
	
	return { message = Message }
end)