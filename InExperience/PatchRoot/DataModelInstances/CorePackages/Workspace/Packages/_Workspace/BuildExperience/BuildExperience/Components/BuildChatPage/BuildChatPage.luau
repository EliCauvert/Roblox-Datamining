local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local buildChatPageViewModule = require(script.Parent.BuildChatPageView)
local useBuildChatPageViewModelModule = require(script.Parent.useBuildChatPageViewModel)
local chatCardEmphasisProviderModule = require(buildExperience.Components.Chat.ChatCardEmphasis.ChatCardEmphasisProvider)
local fFlagBuildExperienceChatCardEmphasisModule = require(buildExperience.Flags.FFlagBuildExperienceChatCardEmphasis)

return function(p1)
	-- upvalues: useBuildChatPageViewModelModule (ref), fFlagBuildExperienceChatCardEmphasisModule (ref), reactModule (ref), chatCardEmphasisProviderModule (ref), buildChatPageViewModule (ref)
	local var1 = useBuildChatPageViewModelModule(p1)
	
	return if fFlagBuildExperienceChatCardEmphasisModule then reactModule.createElement(chatCardEmphasisProviderModule, nil, reactModule.createElement(buildChatPageViewModule, var1)) else reactModule.createElement(buildChatPageViewModule, var1)
end