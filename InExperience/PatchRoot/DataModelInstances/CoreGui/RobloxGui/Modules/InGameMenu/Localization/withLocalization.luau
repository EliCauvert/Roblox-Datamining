local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local localizationConsumerModule = require(script.Parent.LocalizationConsumer)

return function(p1)
	-- upvalues: t (ref), roact (ref), localizationConsumerModule (ref)
	assert(t.table(p1))
	
	return function(p2)
		-- upvalues: t (copy), roact (copy), localizationConsumerModule (copy), p1 (ref)
		assert(t.callback(p2))
		
		return roact.createElement(localizationConsumerModule, { render = p2, stringsToBeLocalized = p1 })
	end
end