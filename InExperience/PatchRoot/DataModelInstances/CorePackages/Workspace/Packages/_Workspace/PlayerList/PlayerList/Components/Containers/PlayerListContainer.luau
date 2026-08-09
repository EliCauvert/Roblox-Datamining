local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local _ = require(parent_1.Signals)
local signalsReactModule = require(parent_1.SignalsReact)
local reactFocusNavigationModule = require(parent_1.ReactFocusNavigation)
local _ = require(parent_1.LeaderboardStore)
local leaderboardStoreContextModule = require(parent.Common.LeaderboardStoreContext)
local layoutValuesContextModule = require(parent.Common.LayoutValuesContext)
local createLayoutValuesModule = require(parent.Common.CreateLayoutValues)
local focusNavigationContext = reactFocusNavigationModule.FocusNavigationContext
local focusNavigationService = reactFocusNavigationModule.FocusNavigationService
local fFlagAddNewPlayerListFocusNavModule = require(parent.Flags.FFlagAddNewPlayerListFocusNav)

return reactModule.memo(function(p0) --[[ line: 27 ]]
	-- upvalues: createLayoutValuesModule (ref), signalsReactModule (ref), focusNavigationService (ref), reactFocusNavigationModule (ref), reactModule (ref), leaderboardStoreContextModule (ref), layoutValuesContextModule (ref), fFlagAddNewPlayerListFocusNavModule (ref), focusNavigationContext (ref)
	return reactModule.createElement(leaderboardStoreContextModule.Provider, {
		value = signalsReactModule.useSignalState(p0.leaderboardStore)
	}, {
		LayoutValuesProvider = reactModule.createElement(layoutValuesContextModule.Provider, {
			value = createLayoutValuesModule(p0.isTenFoot or false, p0.TopBarConstants)
		}, if fFlagAddNewPlayerListFocusNavModule then {
			FocusNavigationProvider = reactModule.createElement(focusNavigationContext.Provider, {
				value = focusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui)
			}, p0.children)
		} else p0.children)
	})
end)