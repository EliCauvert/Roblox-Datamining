local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local IXPServiceWrapper = require(Parent.IxpServiceWrapper).IXPServiceWrapper
local BuildChatPageViewModule = require(script.Parent.BuildChatPageView)
local UseBuildChatPageViewModelModule = require(script.Parent.useBuildChatPageViewModel)
local ChatCardEmphasisProviderModule = require(BuildExperience.Components.Chat.ChatCardEmphasis.ChatCardEmphasisProvider)
local FFlagBuildExperienceChatCardEmphasisModule = require(BuildExperience.Flags.FFlagBuildExperienceChatCardEmphasis)
local FFlagBuildChatIXPExposureModule = require(BuildExperience.Flags.FFlagBuildChatIXPExposure)
local FStringBuildChatIXPLayerModule = require(BuildExperience.Flags.FStringBuildChatIXPLayer)

return function(p1)
	-- upvalues: UseBuildChatPageViewModelModule (copy), FFlagBuildChatIXPExposureModule (copy), ReactModule (copy), IXPServiceWrapper (copy), FStringBuildChatIXPLayerModule (copy), FFlagBuildExperienceChatCardEmphasisModule (copy), ChatCardEmphasisProviderModule (copy), BuildChatPageViewModule (copy)
	local UseBuildChatPageViewModelModuleResult = UseBuildChatPageViewModelModule(p1)
	
	if FFlagBuildChatIXPExposureModule then
		ReactModule.useEffect(function()
			-- upvalues: IXPServiceWrapper (upval), FStringBuildChatIXPLayerModule (upval)
			IXPServiceWrapper:LogFlagLinkedUserLayerExposure(FStringBuildChatIXPLayerModule)
		end, {})
	end
	return if FFlagBuildExperienceChatCardEmphasisModule then ReactModule.createElement(ChatCardEmphasisProviderModule, nil, ReactModule.createElement(BuildChatPageViewModule, UseBuildChatPageViewModelModuleResult)) else ReactModule.createElement(BuildChatPageViewModule, UseBuildChatPageViewModelModuleResult)
end