local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local MomentsCommonModule = require(Parent.MomentsCommon)
local SignalsReactModule = require(Parent.SignalsReact)
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local UseSignalStateFunction = SignalsReactModule.useSignalState
local UseMomentsTabIsVisibleModule = require(Moments.Hooks.useMomentsTabIsVisible)
local GetMomentsPreferencesStoreModule = require(Moments.Stores.GetMomentsPreferencesStore)
local FeedPlaybackSuspension = MomentsCommonModule.Media.feedPlaybackSuspension

return function(): boolean
	-- upvalues: UseNavigationFocusFunction (copy), UseMomentsTabIsVisibleModule (copy), UseSignalStateFunction (copy), FeedPlaybackSuspension (copy), GetMomentsPreferencesStoreModule (copy)
	local UseNavigationFocusResult = UseNavigationFocusFunction()
	local UseMomentsTabIsVisibleModuleResult = UseMomentsTabIsVisibleModule()
	local UseSignalStateResult = UseSignalStateFunction(FeedPlaybackSuspension.getSuspended)
	local UseSignalStateResult1 = UseSignalStateFunction(GetMomentsPreferencesStoreModule(false).getIsTeleporting)
	
	return UseNavigationFocusResult and (UseMomentsTabIsVisibleModuleResult and (not UseSignalStateResult and not UseSignalStateResult1))
end