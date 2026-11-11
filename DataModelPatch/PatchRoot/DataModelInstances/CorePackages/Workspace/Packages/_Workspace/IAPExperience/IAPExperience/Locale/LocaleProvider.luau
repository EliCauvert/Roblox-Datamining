local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local LocaleRoactContextModule = require(Parent.LocaleRoactContext)
local Localization = require(Parent1.RobloxAppLocales).Localization
local LocaleProvider = RoactModule.Component:extend("LocaleProvider")
LocaleProvider.validateProps = TModule.interface({ locale = TModule.string })

function LocaleProvider.render(p1)
	-- upvalues: Localization (copy), RoactModule (copy), LocaleRoactContextModule (copy)
	return RoactModule.createElement(LocaleRoactContextModule.Provider, { value = Localization.new(p1.props.locale) }, p1.props[RoactModule.Children])
end

return LocaleProvider