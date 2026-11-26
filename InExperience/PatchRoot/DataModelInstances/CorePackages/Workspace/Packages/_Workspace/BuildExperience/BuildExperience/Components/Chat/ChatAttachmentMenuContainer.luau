local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local ChatAttachmentMenuViewModule = require(script.Parent.ChatAttachmentMenuView)
local UseChatAttachmentMenuViewModelModule = require(script.Parent.useChatAttachmentMenuViewModel)

return function(p1)
	-- upvalues: UseChatAttachmentMenuViewModelModule (copy), ReactModule (copy), ChatAttachmentMenuViewModule (copy)
	return ReactModule.createElement(ChatAttachmentMenuViewModule, (UseChatAttachmentMenuViewModelModule(p1)))
end