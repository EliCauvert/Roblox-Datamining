local CorePackages = game:GetService("CorePackages")
local TModule = require(CorePackages.Packages.t)
local MaybeAssertModule = require(script.Parent.Parent.Helpers.maybeAssert)

return require(CorePackages.Packages.Rodux).makeActionCreator(script.Name, function(Enabled) --[[ Line: 7 ]]
	-- upvalues: MaybeAssertModule (copy), TModule (copy)
	MaybeAssertModule(TModule.boolean(Enabled))
	
	return { enabled = Enabled }
end)