local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local BuildChatPageViewModule = require(script.Parent.BuildChatPageView)
local UseBuildChatPageViewModelModule = require(script.Parent.useBuildChatPageViewModel)
local ChatCardEmphasisProviderModule = require(BuildExperience.Components.Chat.ChatCardEmphasis.ChatCardEmphasisProvider)
local FFlagBuildExperienceChatCardEmphasisModule = require(BuildExperience.Flags.FFlagBuildExperienceChatCardEmphasis)

return function(p1)
	-- upvalues: UseBuildChatPageViewModelModule (copy), FFlagBuildExperienceChatCardEmphasisModule (copy), ReactModule (copy), ChatCardEmphasisProviderModule (copy), BuildChatPageViewModule (copy)
	local UseBuildChatPageViewModelModuleResult = UseBuildChatPageViewModelModule(p1)
	
	return if FFlagBuildExperienceChatCardEmphasisModule then ReactModule.createElement(ChatCardEmphasisProviderModule, nil, ReactModule.createElement(BuildChatPageViewModule, UseBuildChatPageViewModelModuleResult)) else ReactModule.createElement(BuildChatPageViewModule, UseBuildChatPageViewModelModuleResult)
end