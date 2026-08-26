local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local roactModule = require(parent.Roact)
local reactModule = require(parent.React)
local roactRoduxModule = require(parent.RoactRodux)
local roactServices = require(parent.RoactServices).RoactServices
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local cryoModule = require(parent.Cryo)
local useSignalState = require(parent.SignalsReact).useSignalState
local fFlagUseSignalsForCountryCodeList = require(parent.SharedFlags).FFlagUseSignalsForCountryCodeList
local getCountryCodeListStoreModule = require(authCommon.Stores.GetCountryCodeListStore)
local listSearchWidgetModule = require(authCommon.Components.ListSearchWidget)
local apiFetchCountryCodesModule = require(authCommon.Thunks.ApiFetchCountryCodes)
local countryCodeSelectorButtonModule = require(authCommon.Components.CountryCodeSelectorButton)
local countryCodeSelector = roactModule.PureComponent:extend("CountryCodeSelector")

function countryCodeSelector.init(p1)
	p1.props.fetchCountryCodes(p1.props.networking):catch(function() end)
end

function countryCodeSelector.render(p1)
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

countryCodeSelector = roactRoduxModule.connect(if fFlagUseSignalsForCountryCodeList then nil else function(p1)
	return { countryCodeList = p1.CountryCodeList }
end, function(p1)
	-- upvalues: apiFetchCountryCodesModule (ref)
	return {
		fetchCountryCodes = function(p2)
			-- upvalues: p1 (ref), apiFetchCountryCodesModule (copy)
			return p1(apiFetchCountryCodesModule.Fetch(p2))
		end
	}
end)(countryCodeSelector)

if fFlagUseSignalsForCountryCodeList then
	local var1 = countryCodeSelector
	countryCodeSelector = reactModule.memo(function(p1)
		-- upvalues: useSignalState (ref), getCountryCodeListStoreModule (ref), roactModule (ref), var1 (ref), cryoModule (ref)
		return roactModule.createElement(var1, cryoModule.Dictionary.union(p1, {
			countryCodeList = useSignalState(getCountryCodeListStoreModule(false).getCountryCodeList)
		}))
	end)
end
return roactServices.connect({ networking = roactNetworking })(countryCodeSelector)