local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local momentsCommonModule = require(parent.MomentsCommon)
local useNavigationFocus = require(parent.Navigation).useNavigationFocus
local useSignalState = require(parent.SignalsReact).useSignalState
local useMomentsTabIsVisibleModule = require(moments.Hooks.useMomentsTabIsVisible)
local getMomentsPreferencesStoreModule = require(moments.Stores.GetMomentsPreferencesStore)
local feedPlaybackSuspension = momentsCommonModule.Media.feedPlaybackSuspension

return function()
	-- upvalues: useNavigationFocus (ref), useMomentsTabIsVisibleModule (ref), useSignalState (ref), feedPlaybackSuspension (ref), getMomentsPreferencesStoreModule (ref)
	return useNavigationFocus() and (useMomentsTabIsVisibleModule() and (not useSignalState(feedPlaybackSuspension.getSuspended) and not useSignalState(getMomentsPreferencesStoreModule(false).getIsTeleporting)))
end