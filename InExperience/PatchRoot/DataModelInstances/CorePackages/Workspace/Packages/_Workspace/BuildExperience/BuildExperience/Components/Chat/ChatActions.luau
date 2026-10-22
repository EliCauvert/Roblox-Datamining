local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local _ = require(BuildExperience.Components.ModelPicker.ModelPickerTypes)
local FFlagBuildExperienceModelPickerModule = require(BuildExperience.Flags.FFlagBuildExperienceModelPicker)
local FFlagBuildExperienceChatImageAttachmentsModule = require(BuildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local FFlagBuildEnableFTUXChipsModule = require(BuildExperience.Flags.FFlagBuildEnableFTUXChips)
local IsImageAttachmentSupportedModule = if FFlagBuildExperienceChatImageAttachmentsModule then require(BuildExperience.utils.isImageAttachmentSupported) else nil
local ReactModule = require(Parent.React)
local CreateGalleryCaptureSourceModule = if FFlagBuildExperienceChatImageAttachmentsModule then require(Parent.Moments.createGalleryCaptureSource) else nil
local _ = require(BuildExperience.Chat.chatTypes)
local ChatCaptureGalleryContainerModule = if FFlagBuildExperienceChatImageAttachmentsModule then require(script.Parent.ChatCaptureGallery.ChatCaptureGalleryContainer) else nil
local ChatComposerModule = require(script.Parent.ChatComposer)
local ChatImagePreviewListModule = if FFlagBuildExperienceChatImageAttachmentsModule then require(script.Parent.ChatImagePreviewList) else nil
local PromptChipGroupModule = require(script.Parent.PromptChipGroup)
local FFlagBuildExperienceChatResourceAttachments = require(Parent.SharedFlags).FFlagBuildExperienceChatResourceAttachments
local ChatResourceAttachmentListModule = if FFlagBuildExperienceChatResourceAttachments then require(script.Parent.ChatResourceAttachmentList) else nil
local View = require(Parent.Foundation).View

return function(Frame)
	-- upvalues: FFlagBuildExperienceChatImageAttachmentsModule (copy), FFlagBuildExperienceChatResourceAttachments (copy), FFlagBuildEnableFTUXChipsModule (copy), ReactModule (copy), IsImageAttachmentSupportedModule (copy), CreateGalleryCaptureSourceModule (copy), View (copy), ChatResourceAttachmentListModule (copy), ChatImagePreviewListModule (copy), ChatComposerModule (copy), FFlagBuildExperienceModelPickerModule (copy), PromptChipGroupModule (copy), ChatCaptureGalleryContainerModule (copy)
	local Images = Frame.images or {}
	local ResourceAttachments = Frame.resourceAttachments or {}
	local PromptChips = Frame.promptChips or {}
	local v1: boolean = FFlagBuildExperienceChatImageAttachmentsModule and #Images > 0
	local v2: boolean = FFlagBuildExperienceChatResourceAttachments and #ResourceAttachments > 0
	local v3: boolean = FFlagBuildEnableFTUXChipsModule and #PromptChips > 0
	local LayoutOrder: number = if v2 then if v1 then 3 else 2 elseif v1 then 2 else 1
	local v4 = "unmounted"
	local Callback = nil
	local UseRefResult = nil
	local UseRefResult1 = nil
	
	if FFlagBuildExperienceChatImageAttachmentsModule then
		v4, Callback = ReactModule.useState("unmounted")
		UseRefResult = ReactModule.useRef(nil)
		UseRefResult1 = ReactModule.useRef(false)
	end
	local IsImageAttachmentSupportedModule1 = FFlagBuildExperienceChatImageAttachmentsModule and (Frame.allowImageAttachments ~= false and IsImageAttachmentSupportedModule())
	
	local function setCapturedImages(Captures)
		-- upvalues: Frame (copy), Images (copy)
		if Frame.onImagesChanged == nil then return end
		local List = {}
		local v5 = nil
		
		for _, capture in Captures do
			v5 = nil
			
			for _, image in Images do
				if image.capture == capture then
					v5 = image
					break
				end
			end
			table.insert(List, v5 or { capture = capture })
		end
		Frame.onImagesChanged(List)
	end
	
	local function openCaptureGallery()
		-- upvalues: UseRefResult (ref), UseRefResult1 (ref), Callback (ref), CreateGalleryCaptureSourceModule (upval)
		if UseRefResult ~= nil and UseRefResult1 ~= nil and Callback ~= nil then
			UseRefResult1.current = true
			UseRefResult.current = CreateGalleryCaptureSourceModule(nil, nil, { Enum.CaptureType.Screenshot })
			Callback("open")
			
			return
		end
	end
	
	local function _()
		-- upvalues: Callback (ref)
		if Callback ~= nil then
			Callback("closing")
		end
	end
	
	local function confirmCaptureGallery(p1)
		-- upvalues: setCapturedImages (copy), Callback (ref)
		setCapturedImages(p1)
		
		if Callback ~= nil then
			Callback("closing")
		end
	end
	
	local function handleCaptureGalleryClosed()
		-- upvalues: Callback (ref)
		if Callback ~= nil then
			Callback("unmounted")
		end
	end
	
	local function removeImage(Index)
		-- upvalues: Frame (copy), Images (copy)
		if Frame.onImagesChanged ~= nil then
			local Copy = table.clone(Images)
			table.remove(Copy, Index)
			Frame.onImagesChanged(Copy)
			
			return
		end
	end
	
	local InitialCaptures = {}
	
	for _, image in Images do
		if image.capture ~= nil then
			table.insert(InitialCaptures, image.capture)
		end
	end
	return ReactModule.createElement(View, {
		tag = "col gap-small size-full-0 auto-y",
		LayoutOrder = Frame.LayoutOrder
	}, {
		ResourceAttachments = if v2 then ReactModule.createElement(ChatResourceAttachmentListModule, {
			LayoutOrder = 1,
			testId = "ChatActions.ResourceAttachments",
			attachments = ResourceAttachments,
			onRemove = Frame.onRemoveResourceAttachment,
			onActivateAttachment = Frame.onActivateResourceAttachment
		}) else nil,
		Images = if v1 then ReactModule.createElement(ChatImagePreviewListModule, {
			testId = "ChatActions.Images",
			LayoutOrder = if v2 then 2 else 1,
			images = Images,
			onRemove = removeImage,
			onRetry = Frame.onRetryImage
		}) else nil,
		Composer = ReactModule.createElement(ChatComposerModule, {
			LayoutOrder = LayoutOrder,
			modelPicker = if FFlagBuildExperienceModelPickerModule then Frame.modelPicker else nil,
			text = Frame.composerText,
			composerErrorText = Frame.composerErrorText,
			onChanged = Frame.onComposerChanged,
			placeholder = Frame.placeholder,
			textBoxRef = Frame.textBoxRef,
			isAssistantResponding = Frame.isAssistantResponding,
			canStopAssistantResponse = Frame.canStopAssistantResponse,
			canSendWhileResponding = Frame.canSendWhileResponding,
			allowsTypingWhileResponding = Frame.allowsTypingWhileResponding,
			images = if FFlagBuildExperienceChatImageAttachmentsModule then Images else nil,
			isSendBlocked = Frame.isSendBlocked,
			isReadOnly = Frame.isReadOnly,
			tracksExternalText = Frame.tracksExternalText,
			isAttachmentSupported = IsImageAttachmentSupportedModule1,
			onOpenCaptureGallery = if IsImageAttachmentSupportedModule1 then openCaptureGallery else nil,
			onSend = Frame.onSend,
			onStop = Frame.onStop,
			maxLines = Frame.maxLines,
			composerDebug = Frame.composerDebug
		}),
		PromptChips = if v3 then ReactModule.createElement(PromptChipGroupModule, {
			LayoutOrder = LayoutOrder + 1,
			promptChips = PromptChips,
			onActivated = Frame.onPromptChipActivated
		}) else nil,
		Gallery = if FFlagBuildExperienceChatImageAttachmentsModule and v4 ~= "unmounted" and UseRefResult ~= nil and UseRefResult.current ~= nil then ReactModule.createElement(ChatCaptureGalleryContainerModule, {
			maxSelections = 2,
			captureSource = UseRefResult.current,
			initialCaptures = InitialCaptures,
			isOpen = v4 == "open",
			onClose = handleCaptureGalleryClosed,
			onConfirm = confirmCaptureGallery,
			shouldProgressivelyLoad = UseRefResult1 ~= nil and UseRefResult1.current
		}) else nil
	})
end