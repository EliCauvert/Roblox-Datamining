local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local fFlagBuildExperienceChatImageAttachmentsModule = require(buildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local var1 = if fFlagBuildExperienceChatImageAttachmentsModule then require(buildExperience.utils.isImageAttachmentSupported) else nil
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local var2 = if fFlagBuildExperienceChatImageAttachmentsModule then require(parent.Moments.createGalleryCaptureSource) else nil
local _ = require(buildExperience.Chat.chatTypes)
local var3 = if fFlagBuildExperienceChatImageAttachmentsModule then require(script.Parent.ChatCaptureGallery.ChatCaptureGalleryContainer) else nil
local chatComposerModule = require(script.Parent.ChatComposer)
local var4 = if fFlagBuildExperienceChatImageAttachmentsModule then require(script.Parent.ChatImagePreviewList) else nil
local fFlagBuildExperienceChatResourceAttachments = require(parent.SharedFlags).FFlagBuildExperienceChatResourceAttachments
local var5 = if fFlagBuildExperienceChatResourceAttachments then require(script.Parent.ChatResourceAttachmentList) else nil
local view = foundationModule.View

return function(p1)
	-- upvalues: fFlagBuildExperienceChatImageAttachmentsModule (ref), fFlagBuildExperienceChatResourceAttachments (ref), reactModule (ref), var1 (ref), var2 (ref), view (ref), var5 (ref), var4 (ref), chatComposerModule (ref), var3 (ref)
	local images = p1.images or {}
	local resourceAttachments = p1.resourceAttachments or {}
	local var6 = fFlagBuildExperienceChatImageAttachmentsModule and #images > 0
	local var7 = fFlagBuildExperienceChatResourceAttachments and #resourceAttachments > 0
	local var8 = "unmounted"
	local var9 = nil
	local var10 = nil
	local var11 = nil
	
	if fFlagBuildExperienceChatImageAttachmentsModule then
		local unmounted, unmounted_1 = reactModule.useState("unmounted")
		var8 = unmounted
		var9 = unmounted_1
		var10 = reactModule.useRef(nil)
		var11 = reactModule.useRef(false)
	end
	local var12 = fFlagBuildExperienceChatImageAttachmentsModule and (p1.allowImageAttachments ~= false and var1())
	
	local function setCapturedImages(value)
		-- upvalues: p1 (ref), images (ref)
		if p1.onImagesChanged == nil then return end
		local var13
		local t = {}
		
		for i, v in value do
			var13 = nil
			
			for i_1, v_1 in images do
				if v_1.capture == v then
					var13 = v_1
					break
				end
			end
			table.insert(t, var13 or { capture = v })
		end
		p1.onImagesChanged(t)
	end
	
	local function openCaptureGallery()
		-- upvalues: var10 (write), var11 (write), var9 (write), var2 (copy)
		if var10 == nil or var11 == nil or var9 == nil then
			return
		end
		var11.current = true
		var10.current = var2(nil, nil, { Enum.CaptureType.Screenshot })
		var9("open")
	end
	
	local function _()
		-- upvalues: var9 (write)
		if var9 ~= nil then
			var9("closing")
		end
	end
	
	local function confirmCaptureGallery(p2)
		-- upvalues: setCapturedImages (ref), var9 (write)
		setCapturedImages(p2)
		
		if var9 ~= nil then
			var9("closing")
		end
	end
	
	local function handleCaptureGalleryClosed()
		-- upvalues: var9 (write)
		if var9 ~= nil then
			var9("unmounted")
		end
	end
	
	local function removeImage(p2)
		-- upvalues: p1 (ref), images (ref)
		if p1.onImagesChanged == nil then
			return
		end
		local cloned = table.clone(images)
		table.remove(cloned, p2)
		p1.onImagesChanged(cloned)
	end
	
	local t = {}
	
	for i, v in images do
		if v.capture ~= nil then
			table.insert(t, v.capture)
		end
	end
	return reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder
	}, {
		ResourceAttachments = if var7 then reactModule.createElement(var5, {
			LayoutOrder = 1,
			testId = "ChatActions.ResourceAttachments",
			attachments = resourceAttachments,
			onRemove = p1.onRemoveResourceAttachment
		}) else nil,
		Images = if var6 then reactModule.createElement(var4, {
			testId = "ChatActions.Images",
			LayoutOrder = if var7 then 2 else 1,
			images = images,
			onRemove = removeImage,
			onRetry = p1.onRetryImage
		}) else nil,
		Composer = reactModule.createElement(chatComposerModule, {
			LayoutOrder = if var7 then if var6 then 3 else 2 elseif var6 then 2 else 1,
			text = p1.composerText,
			composerErrorText = p1.composerErrorText,
			onChanged = p1.onComposerChanged,
			placeholder = p1.placeholder,
			textBoxRef = p1.textBoxRef,
			isAssistantResponding = p1.isAssistantResponding,
			canStopAssistantResponse = p1.canStopAssistantResponse,
			canSendWhileResponding = p1.canSendWhileResponding,
			allowsTypingWhileResponding = p1.allowsTypingWhileResponding,
			images = if fFlagBuildExperienceChatImageAttachmentsModule then images else nil,
			isSendBlocked = p1.isSendBlocked,
			tracksExternalText = p1.tracksExternalText,
			isAttachmentSupported = var12,
			onOpenCaptureGallery = if var12 then openCaptureGallery else nil,
			onSend = p1.onSend,
			onStop = p1.onStop,
			maxLines = p1.maxLines,
			composerDebug = p1.composerDebug
		}),
		Gallery = if fFlagBuildExperienceChatImageAttachmentsModule and var8 ~= "unmounted" and (var10 ~= nil and var10.current ~= nil) then reactModule.createElement(var3, {
			maxSelections = 2,
			captureSource = var10.current,
			initialCaptures = t,
			isOpen = var8 == "open",
			onClose = handleCaptureGalleryClosed,
			onConfirm = confirmCaptureGallery,
			shouldProgressivelyLoad = if var11 ~= nil then false else var11.current
		}) else nil
	})
end