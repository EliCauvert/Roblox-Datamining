local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local ChatCaptureGalleryViewModule = require(script.Parent.ChatCaptureGalleryView)
local UseChatCaptureGalleryViewModelModule = require(script.Parent.useChatCaptureGalleryViewModel)

return function(p1) --[[ Line: 10 | Named "ChatCaptureGalleryContainer" ]]
	-- upvalues: UseChatCaptureGalleryViewModelModule (copy), ReactModule (copy), ChatCaptureGalleryViewModule (copy)
	return ReactModule.createElement(ChatCaptureGalleryViewModule, (UseChatCaptureGalleryViewModelModule(p1)))
end