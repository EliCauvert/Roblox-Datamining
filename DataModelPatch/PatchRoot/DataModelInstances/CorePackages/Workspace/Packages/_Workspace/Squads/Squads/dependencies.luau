local Parent = script:FindFirstAncestor("Squads").Parent
local HttpModule = require(Parent.SquadsCore.Http)

return {
	Cryo = require(Parent.Cryo),
	Foundation = require(Parent.Foundation),
	Hooks = {
		dependencyArray = require(Parent.RoactUtils).Hooks.dependencyArray,
		useCurrentSquadSelector = require(Parent.RoduxSquads).Hooks.useCurrentSquadSelector,
		useDispatch = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch,
		useEffectOnce = require(Parent.RoactUtils).Hooks.useEffectOnce,
		useLocalization = require(Parent.Localization).Hooks.useLocalization,
		usePrevious = require(Parent.RoactUtils).Hooks.usePrevious,
		useSelector = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector,
		useStore = require(Parent.RoactUtils).Hooks.RoactRodux.useStore
	},
	LuauPolyfill = require(Parent.LuauPolyfill),
	React = require(Parent.React),
	Roact = require(Parent.Roact),
	RoactRodux = require(Parent.RoactRodux),
	Rodux = require(Parent.Rodux),
	RoduxNetworking = require(Parent.SquadsCore.Http).RoduxNetworking,
	SharedFlags = require(Parent.SharedFlags),
	SocialExperiments = require(Parent.SocialExperiments),
	t = require(Parent.t),
	useNavigation = require(Parent.Navigation).useNavigation,
	RoduxPresence = HttpModule.RoduxPresence,
	NetworkingPresence = HttpModule.NetworkingPresence,
	RoduxSquads = require(Parent.SquadsCore.RoduxSquads),
	NetworkingSquads = HttpModule.NetworkingSquads,
	UserBlockingRodux = HttpModule.UserBlockingRodux,
	UserBlockingNetworking = HttpModule.UserBlockingNetworking
}