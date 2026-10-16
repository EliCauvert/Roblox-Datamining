local CorePackages = game:GetService("CorePackages")
local TModule = require(CorePackages.Packages.t)
local MaybeAssertModule = require(script.Parent.Parent.Helpers.maybeAssert)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(Settings) --[[ Line: 10 ]]
	-- upvalues: MaybeAssertModule (copy), TModule (copy)
	MaybeAssertModule(TModule.table(Settings))
	
	return { settings = Settings }
end)