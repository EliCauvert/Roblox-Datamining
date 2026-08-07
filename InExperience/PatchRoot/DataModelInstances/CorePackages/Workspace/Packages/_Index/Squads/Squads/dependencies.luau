local parent = script:FindFirstAncestor("Squads").Parent
local httpModule = require(parent.SquadsCore.Http)

return {
	Cryo = require(parent.Cryo),
	Foundation = require(parent.Foundation),
	Hooks = {
		dependencyArray = require(parent.RoactUtils).Hooks.dependencyArray,
		useCurrentSquadSelector = require(parent.RoduxSquads).Hooks.useCurrentSquadSelector,
		useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch,
		useEffectOnce = require(parent.RoactUtils).Hooks.useEffectOnce,
		useLocalization = require(parent.Localization).Hooks.useLocalization,
		usePrevious = require(parent.RoactUtils).Hooks.usePrevious,
		useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector,
		useStore = require(parent.RoactUtils).Hooks.RoactRodux.useStore
	},
	LuauPolyfill = require(parent.LuauPolyfill),
	React = require(parent.React),
	Roact = require(parent.Roact),
	RoactRodux = require(parent.RoactRodux),
	Rodux = require(parent.Rodux),
	RoduxNetworking = require(parent.SquadsCore.Http).RoduxNetworking,
	SharedFlags = require(parent.SharedFlags),
	SocialExperiments = require(parent.SocialExperiments),
	t = require(parent.t),
	useNavigation = require(parent.Navigation).useNavigation,
	RoduxPresence = httpModule.RoduxPresence,
	NetworkingPresence = httpModule.NetworkingPresence,
	RoduxSquads = require(parent.SquadsCore.RoduxSquads),
	NetworkingSquads = httpModule.NetworkingSquads,
	UserBlockingRodux = httpModule.UserBlockingRodux,
	UserBlockingNetworking = httpModule.UserBlockingNetworking
}