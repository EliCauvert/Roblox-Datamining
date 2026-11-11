local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local RoactModule = require(Parent.Roact)
local RoactRoduxModule = require(Parent.RoactRodux)
local RoactServices = require(Parent.RoactServices).RoactServices
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local ListSearchWidgetModule = require(AuthCommon.Components.ListSearchWidget)
local ApiFetchCountryCodesModule = require(AuthCommon.Thunks.ApiFetchCountryCodes)
local CountryCodeSelectorButtonModule = require(AuthCommon.Components.CountryCodeSelectorButton)
local CountryCodeSelector = RoactModule.PureComponent:extend("CountryCodeSelector")

function CountryCodeSelector.init(p1)
	p1.props.fetchCountryCodes(p1.props.networking):catch(function() end)
end

function CountryCodeSelector.render(p1)
	-- upvalues: RoactModule (copy), ListSearchWidgetModule (copy), CountryCodeSelectorButtonModule (copy)
	return RoactModule.createElement(ListSearchWidgetModule, {
		Heading = "Authentication.SignUp.Heading.CountryCodeSelector",
		CloseCallback = p1.props.CloseCallback,
		VisibilityTarget = if p1.props.WidgetVisible then 1 else 0,
		List = p1.props.countryCodeList,
		ListButton = CountryCodeSelectorButtonModule,
		SelectionCallback = p1.props.SelectionCallback
	})
end

return RoactServices.connect({ networking = RoactNetworking })((RoactRoduxModule.connect(function(p1)
	return { countryCodeList = p1.CountryCodeList }
end, function(Callback)
	-- upvalues: ApiFetchCountryCodesModule (copy)
	return {
		fetchCountryCodes = function(p1)
			-- upvalues: Callback (copy), ApiFetchCountryCodesModule (upval)
			return Callback(ApiFetchCountryCodesModule.Fetch(p1))
		end
	}
end)(CountryCodeSelector)))