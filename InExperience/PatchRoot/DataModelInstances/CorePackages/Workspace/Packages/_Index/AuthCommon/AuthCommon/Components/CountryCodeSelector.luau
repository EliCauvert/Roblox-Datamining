local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local RoactModule = require(Parent.Roact)
local ReactModule = require(Parent.React)
local RoactRoduxModule = require(Parent.RoactRodux)
local RoactServices = require(Parent.RoactServices).RoactServices
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local CryoModule = require(Parent.Cryo)
local UseSignalState = require(Parent.SignalsReact).useSignalState
local FFlagUseSignalsForCountryCodeList = require(Parent.SharedFlags).FFlagUseSignalsForCountryCodeList
local GetCountryCodeListStoreModule = require(AuthCommon.Stores.GetCountryCodeListStore)
local ListSearchWidgetModule = require(AuthCommon.Components.ListSearchWidget)
local ApiFetchCountryCodesModule = require(AuthCommon.Thunks.ApiFetchCountryCodes)
local CountryCodeSelectorButtonModule = require(AuthCommon.Components.CountryCodeSelectorButton)
local CountryCodeSelector = RoactModule.PureComponent:extend("CountryCodeSelector")

function CountryCodeSelector.init(p1) --[[ Line: 21 ]]
	p1.props.fetchCountryCodes(p1.props.networking):catch(function() --[[ Line: 22 ]] end)
end

function CountryCodeSelector.render(p1) --[[ Line: 27 ]]
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

local MemoResult = if FFlagUseSignalsForCountryCodeList then ReactModule.memo(function(p1) --[[ Line: 57 ]]
	-- upvalues: UseSignalState (copy), GetCountryCodeListStoreModule (copy), RoactModule (copy), MemoResult (copy), CryoModule (copy)
	return RoactModule.createElement(MemoResult, CryoModule.Dictionary.union(p1, {
		countryCodeList = UseSignalState(GetCountryCodeListStoreModule(false).getCountryCodeList)
	}))
end) else RoactRoduxModule.connect(if FFlagUseSignalsForCountryCodeList then nil else function(p1) --[[ Line: 41 ]]
	return { countryCodeList = p1.CountryCodeList }
end, function(Callback) --[[ Line: 46 ]]
	-- upvalues: ApiFetchCountryCodesModule (copy)
	return {
		fetchCountryCodes = function(p1) --[[ Line: 48 ]]
			-- upvalues: Callback (copy), ApiFetchCountryCodesModule (upval)
			return Callback(ApiFetchCountryCodesModule.Fetch(p1))
		end
	}
end)(CountryCodeSelector)

return RoactServices.connect({ networking = RoactNetworking })(MemoResult)