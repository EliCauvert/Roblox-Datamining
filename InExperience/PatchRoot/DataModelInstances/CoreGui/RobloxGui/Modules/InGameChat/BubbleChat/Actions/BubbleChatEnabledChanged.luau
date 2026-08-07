local corePackagesService = game:GetService("CorePackages")
local makeActionCreator = require(corePackagesService.Packages.Rodux).makeActionCreator
local tModule = require(corePackagesService.Packages.t)
local maybeAssertModule = require(script.Parent.Parent.Helpers.maybeAssert)

return makeActionCreator(script.Name, function(p0) --[[ line: 7 ]]
	-- upvalues: maybeAssertModule (ref), tModule (ref)
	maybeAssertModule(tModule.boolean(p0))
	
	return { enabled = p0 }
end)