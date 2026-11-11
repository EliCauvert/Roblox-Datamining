local BuildExperience = script:FindFirstAncestor("BuildExperience")
local ReactModule = require(BuildExperience.Parent.React)
local _ = require(BuildExperience.Chat.chatTypes)
local ChatSheetViewModule = require(script.Parent.ChatSheetView)
local UseChatSheetViewModelModule = require(script.Parent.useChatSheetViewModel)

return function(p1)
	-- upvalues: UseChatSheetViewModelModule (copy), ReactModule (copy), ChatSheetViewModule (copy)
	return ReactModule.createElement(ChatSheetViewModule, (UseChatSheetViewModelModule(p1)))
end