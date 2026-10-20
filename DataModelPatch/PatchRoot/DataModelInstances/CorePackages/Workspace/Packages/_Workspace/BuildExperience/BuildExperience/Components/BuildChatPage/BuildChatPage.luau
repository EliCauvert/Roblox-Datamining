local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local BuildChatPageViewModule = require(script.Parent.BuildChatPageView)
local UseBuildChatPageViewModelModule = require(script.Parent.useBuildChatPageViewModel)

return function(p1)
	-- upvalues: UseBuildChatPageViewModelModule (copy), ReactModule (copy), BuildChatPageViewModule (copy)
	return ReactModule.createElement(BuildChatPageViewModule, (UseBuildChatPageViewModelModule(p1)))
end