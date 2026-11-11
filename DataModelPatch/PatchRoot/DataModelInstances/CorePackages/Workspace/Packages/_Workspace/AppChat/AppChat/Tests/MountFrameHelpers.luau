local AppChat = script:FindFirstAncestor("AppChat")
local UnitTestHelpersModule = require(AppChat.Parent.Dev.UnitTestHelpers)
local MountFrameFunction = UnitTestHelpersModule.mountFrame
local MountStyledFrameFunction = UnitTestHelpersModule.mountStyledFrame
local MockAnalyticsModule = require(AppChat.LegacyAnalytics.Mock.mockAnalytics)
local MockApolloProviderModule = require(script.Parent.mockApolloProvider)
local MockTopBarModule = require(script.Parent.mockTopBar)

return {
	mountFrameWithApollo = function(p1, p2)
		-- upvalues: MountFrameFunction (copy), MockApolloProviderModule (copy), MockAnalyticsModule (copy)
		return MountFrameFunction(MockApolloProviderModule(MockAnalyticsModule(p1)), p2)
	end,
	mountFrame = MountFrameFunction,
	mountStyledFrame = function(p1, p2)
		-- upvalues: MountStyledFrameFunction (copy), MockAnalyticsModule (copy)
		return MountStyledFrameFunction(MockAnalyticsModule(p1), p2)
	end,
	mountFrameWithAnalytics = function(p1, p2)
		-- upvalues: MountFrameFunction (copy), MockAnalyticsModule (copy)
		return MountFrameFunction(MockAnalyticsModule(p1), p2)
	end,
	mountFrameWithTopBar = function(p1, p2)
		-- upvalues: MountFrameFunction (copy), MockApolloProviderModule (copy), MockAnalyticsModule (copy), MockTopBarModule (copy)
		return MountFrameFunction(MockApolloProviderModule(MockAnalyticsModule(MockTopBarModule(p1))), p2)
	end
}