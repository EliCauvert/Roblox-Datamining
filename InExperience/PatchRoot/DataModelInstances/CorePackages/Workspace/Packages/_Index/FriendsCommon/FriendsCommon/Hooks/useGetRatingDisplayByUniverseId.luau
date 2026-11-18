local Parent = script:FindFirstAncestor("FriendsCommon").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(Parent.DataHydration)
local ExperienceGuidelinesModule = require(Parent.DataHydration.ExperienceGuidelines)
local FFlagExperienceGuidelinesRatingDisplayStoreModule = require(Parent.DataHydration.FFlagExperienceGuidelinesRatingDisplayStore)
local config = {
	data = SignalsModule.createSignal(nil),
	status = SignalsModule.createSignal("Ready")
}

return function(p1)
	-- upvalues: ReactModule (copy), FFlagExperienceGuidelinesRatingDisplayStoreModule (copy), config (copy), ExperienceGuidelinesModule (copy), SignalsReactModule (copy)
	local Number = if p1 == nil then nil else tonumber(p1)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FFlagExperienceGuidelinesRatingDisplayStoreModule (upval), Number (copy), config (upval), ExperienceGuidelinesModule (upval)
		return if FFlagExperienceGuidelinesRatingDisplayStoreModule and Number ~= nil then ExperienceGuidelinesModule.getExperienceGuidelinesStore().getAndFetchRatingDisplay(Number) else config
	end, { Number })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMemoResult.data)
	
	return if UseSignalStateResult then UseSignalStateResult.displayRating else nil, (SignalsReactModule.useSignalState(UseMemoResult.status))
end