local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local LocalizationConsumerModule = require(script.Parent.LocalizationConsumer)

return function(StringsToBeLocalized)
	-- upvalues: T (copy), Roact (copy), LocalizationConsumerModule (copy)
	assert(T.table(StringsToBeLocalized))
	
	return function(Render)
		-- upvalues: T (upval), Roact (upval), LocalizationConsumerModule (upval), StringsToBeLocalized (copy)
		assert(T.callback(Render))
		
		return Roact.createElement(LocalizationConsumerModule, {
			render = Render,
			stringsToBeLocalized = StringsToBeLocalized
		})
	end
end