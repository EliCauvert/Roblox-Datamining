local parent = script.Parent
local parent_1 = parent.Parent.Parent
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local localeRoactContextModule = require(parent.LocaleRoactContext)
local localization = require(parent_1.RobloxAppLocales).Localization
local localeProvider = roactModule.Component:extend("LocaleProvider")
localeProvider.validateProps = tModule.interface({ locale = tModule.string })

function localeProvider.render(p1)
	-- upvalues: localization (ref), roactModule (ref), localeRoactContextModule (ref)
	return roactModule.createElement(localeRoactContextModule.Provider, { value = localization.new(p1.props.locale) }, p1.props[roactModule.Children])
end

return localeProvider