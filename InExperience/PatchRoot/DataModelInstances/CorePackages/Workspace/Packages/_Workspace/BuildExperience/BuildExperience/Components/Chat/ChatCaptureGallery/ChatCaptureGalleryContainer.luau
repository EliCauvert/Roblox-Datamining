local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local chatCaptureGalleryViewModule = require(script.Parent.ChatCaptureGalleryView)
local useChatCaptureGalleryViewModelModule = require(script.Parent.useChatCaptureGalleryViewModel)

return function(p1)
	-- upvalues: useChatCaptureGalleryViewModelModule (ref), reactModule (ref), chatCaptureGalleryViewModule (ref)
	return reactModule.createElement(chatCaptureGalleryViewModule, useChatCaptureGalleryViewModelModule(p1))
end