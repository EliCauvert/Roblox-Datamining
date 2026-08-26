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
	isNetworkRequestInFlight = function(p1)
		return if p1 then p1 < 7 else false
	end
}