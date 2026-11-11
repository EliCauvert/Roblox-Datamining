local DependenciesModule = require(script:FindFirstAncestor("SocialTab").dependencies)
local LocalizationProvider = DependenciesModule.LocalizationProvider
local Roact = DependenciesModule.Roact
local Localization = DependenciesModule.Mock.MagicMock.new({ name = "Localization" })

function Localization:Format(p1, _)
	return p1
end

return function(TestElement1)
	-- upvalues: Roact (copy), LocalizationProvider (copy), Localization (copy)
	return Roact.createElement(LocalizationProvider, { localization = Localization }, { TestElement1 = TestElement1 })
end