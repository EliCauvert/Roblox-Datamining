local inGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local localizationConsumerModule = require(script.Parent.LocalizationConsumer)

return function(p0) --[[ line: 9 | named "withLocalization" ]]
	-- upvalues: t (ref), roact (ref), localizationConsumerModule (ref)
	assert(t.table(p0))
	
	return function(p1) --[[ line: 12 ]]
		-- upvalues: t (copy), roact (copy), localizationConsumerModule (copy), p0 (ref)
		assert(t.callback(p1))
		
		return roact.createElement(localizationConsumerModule, { render = p1, stringsToBeLocalized = p0 })
	end
end