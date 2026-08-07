-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:14 2026 Pacific Standard Time.

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