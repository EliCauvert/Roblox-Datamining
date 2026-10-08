local userSearch = script:FindFirstAncestor("UserSearch")
local parent = userSearch.Parent
local myHttpRequestModule = require(script.Parent.myHttpRequest)

return require(parent.LuaSocialLibrariesDeps).RoduxNetworking.config({
	keyPath = require(userSearch.Common.Constants).RODUX_KEY .. ".NetworkStatus",
	networkImpl = if game:DefineFastFlag("EnableUserSearchChallengeInterceptor", false) then require(parent.GenericChallenges).Middleware.ChallengeRequestWrapper(myHttpRequestModule) else myHttpRequestModule
})