local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local roactModule = require(parent.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local roactServices = require(parent.RoactServices).RoactServices
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local listSearchWidgetModule = require(authCommon.Components.ListSearchWidget)
local apiFetchCountryCodesModule = require(authCommon.Thunks.ApiFetchCountryCodes)
local countryCodeSelectorButtonModule = require(authCommon.Components.CountryCodeSelectorButton)
local countryCodeSelector = roactModule.PureComponent:extend("CountryCodeSelector")

function countryCodeSelector.init(p0) --[[ line: 16 ]]
	p0.props.fetchCountryCodes(p0.props.networking):catch(function() --[[ line: 17 ]] end)
end

function countryCodeSelector.render(p1) --[[ line: 22 ]]
	-- upvalues: roactModule (ref), listSearchWidgetModule (ref), countryCodeSelectorButtonModule (ref)
	return roactModule.createElement(listSearchWidgetModule, {
		Heading = "Authentication.SignUp.Heading.CountryCodeSelector",
		CloseCallback = p1.props.CloseCallback,
		VisibilityTarget = if p1.props.WidgetVisible then 1 else 0,
		List = p1.props.countryCodeList,
		ListButton = countryCodeSelectorButtonModule,
		SelectionCallback = p1.props.SelectionCallback
	})
end

return roactServices.connect({ networking = roactNetworking })(roactRoduxModule.connect(function(p2) --[[ line: 33 ]]
	return { countryCodeList = p2.CountryCodeList }
end, function(p3) --[[ line: 37 ]]
	-- upvalues: apiFetchCountryCodesModule (ref)
	return {
		fetchCountryCodes = function(p4) --[[ line: 39 ]]
			-- upvalues: p3 (ref), apiFetchCountryCodesModule (copy)
			return p3(apiFetchCountryCodesModule.Fetch(p4))
		end
	}
end)(countryCodeSelector))