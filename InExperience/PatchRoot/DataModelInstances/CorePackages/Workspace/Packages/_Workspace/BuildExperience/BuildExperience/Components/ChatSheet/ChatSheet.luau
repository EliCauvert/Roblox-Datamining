local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local _ = require(buildExperience.Chat.chatTypes)
local chatSheetViewModule = require(script.Parent.ChatSheetView)
local useChatSheetViewModelModule = require(script.Parent.useChatSheetViewModel)

return function(p0)
	-- upvalues: useChatSheetViewModelModule (ref), reactModule (ref), chatSheetViewModule (ref)
	return reactModule.createElement(chatSheetViewModule, useChatSheetViewModelModule(p0))
end