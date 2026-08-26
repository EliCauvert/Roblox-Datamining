local corePackagesService = game:GetService("CorePackages")
local makeActionCreator = require(corePackagesService.Packages.Rodux).makeActionCreator
local tModule = require(corePackagesService.Packages.t)
local maybeAssertModule = require(script.Parent.Parent.Helpers.maybeAssert)

return makeActionCreator(script.Name, function(p1)
	-- upvalues: maybeAssertModule (ref), tModule (ref)
	maybeAssertModule(tModule.table(p1))
	
	return { settings = p1 }
end)