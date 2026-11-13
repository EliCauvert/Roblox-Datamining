local CorePackages = game:GetService("CorePackages")
local MakeActionCreatorFunction = require(CorePackages.Packages.Rodux).makeActionCreator
local TModule = require(CorePackages.Packages.t)
local MaybeAssertModule = require(script.Parent.Parent.Helpers.maybeAssert)

return MakeActionCreatorFunction(script.Name, function(Settings)
	-- upvalues: MaybeAssertModule (copy), TModule (copy)
	MaybeAssertModule(TModule.table(Settings))
	
	return { settings = Settings }
end)