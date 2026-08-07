return {
	NetworkStatus = {
		loading = 1,
		setVariables = 2,
		fetchMore = 3,
		refetch = 4,
		poll = 6,
		ready = 7,
		error = 8
	},
	isNetworkRequestInFlight = function(p0) --[[ line: 65 ]]
		return if p0 then p0 < 7 else false
	end
}