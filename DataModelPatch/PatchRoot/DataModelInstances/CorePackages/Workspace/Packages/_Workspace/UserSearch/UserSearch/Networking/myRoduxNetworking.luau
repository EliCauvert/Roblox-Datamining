local UserSearch = script:FindFirstAncestor("UserSearch")
local Parent = UserSearch.Parent
local MyHttpRequestModule = require(script.Parent.myHttpRequest)
local ChallengeRequestWrapperFunction = require(Parent.GenericChallenges).Middleware.ChallengeRequestWrapper

return (require(Parent.LuaSocialLibrariesDeps).RoduxNetworking.config({
	keyPath = require(UserSearch.Common.Constants).RODUX_KEY .. ".NetworkStatus",
	networkImpl = if game:DefineFastFlag("EnableUserSearchChallengeInterceptor", false) then ChallengeRequestWrapperFunction(MyHttpRequestModule) else MyHttpRequestModule
}))