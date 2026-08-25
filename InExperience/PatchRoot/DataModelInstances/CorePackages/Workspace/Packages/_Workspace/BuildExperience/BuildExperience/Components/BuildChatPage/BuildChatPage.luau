local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local buildChatPageViewModule = require(script.Parent.BuildChatPageView)
local useBuildChatPageViewModelModule = require(script.Parent.useBuildChatPageViewModel)

return function(p0)
	-- upvalues: useBuildChatPageViewModelModule (ref), reactModule (ref), buildChatPageViewModule (ref)
	return reactModule.createElement(buildChatPageViewModule, useBuildChatPageViewModelModule(p0))
end