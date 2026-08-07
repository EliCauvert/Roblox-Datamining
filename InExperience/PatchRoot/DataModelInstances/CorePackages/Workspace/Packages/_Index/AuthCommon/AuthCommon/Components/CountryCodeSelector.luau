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

function countryCodeSelector.init(p0) --[[ line: 21 ]]
	p0.props.fetchCountryCodes(p0.props.networking):catch(function() --[[ line: 22 ]] end)
end

function countryCodeSelector.render(p1) --[[ line: 27 ]]
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

countryCodeSelector = roactRoduxModule.connect(if fFlagUseSignalsForCountryCodeList then nil else function(p2) --[[ line: 41 ]]
	return { countryCodeList = p2.CountryCodeList }
end, function(p3) --[[ line: 46 ]]
	-- upvalues: apiFetchCountryCodesModule (ref)
	return {
		fetchCountryCodes = function(p4) --[[ line: 48 ]]
			-- upvalues: p3 (ref), apiFetchCountryCodesModule (copy)
			return p3(apiFetchCountryCodesModule.Fetch(p4))
		end
	}
end)(countryCodeSelector)

if fFlagUseSignalsForCountryCodeList then
	local var10 = countryCodeSelector
	countryCodeSelector = reactModule.memo(function(p5) --[[ line: 57 ]]
		-- upvalues: useSignalState (ref), getCountryCodeListStoreModule (ref), roactModule (ref), var10 (ref), cryoModule (ref)
		return roactModule.createElement(var10, cryoModule.Dictionary.union(p5, {
			countryCodeList = useSignalState(getCountryCodeListStoreModule(false).getCountryCodeList)
		}))
	end)
end
return roactServices.connect({ networking = roactNetworking })(countryCodeSelector)