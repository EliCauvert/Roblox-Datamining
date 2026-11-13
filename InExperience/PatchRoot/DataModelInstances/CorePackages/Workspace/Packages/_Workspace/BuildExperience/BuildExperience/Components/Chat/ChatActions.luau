local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local _ = require(BuildExperience.Components.ModelPicker.ModelPickerTypes)
local FFlagBuildExperienceModelPickerModule = require(BuildExperience.Flags.FFlagBuildExperienceModelPicker)
local FFlagBuildEnableFTUXChipsModule = require(BuildExperience.Flags.FFlagBuildEnableFTUXChips)
local FFlagBuildExperienceFTUXChipSendGuidanceModule = require(BuildExperience.Flags.FFlagBuildExperienceFTUXChipSendGuidance)
local FFlagBuildExperienceFTUXChipExhaustedTelemetryModule = require(BuildExperience.Flags.FFlagBuildExperienceFTUXChipExhaustedTelemetry)
local IsImageAttachmentSupportedModule = require(BuildExperience.utils.isImageAttachmentSupported)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local CreateGalleryCaptureSourceModule = require(Parent.Moments.createGalleryCaptureSource)
local _ = require(BuildExperience.Chat.chatTypes)
local ChatCaptureGalleryContainerModule = require(script.Parent.ChatCaptureGallery.ChatCaptureGalleryContainer)
local ChatComposerModule = require(script.Parent.ChatComposer)
local ChatImagePreviewListModule = require(script.Parent.ChatImagePreviewList)
local PromptChipGroupModule = require(script.Parent.PromptChipGroup)
local ChatResourceAttachmentListModule = require(script.Parent.ChatResourceAttachmentList)
local View = FoundationModule.View
local Text = FoundationModule.Text

return function(Frame)
	-- upvalues: FFlagBuildEnableFTUXChipsModule (copy), FFlagBuildExperienceFTUXChipSendGuidanceModule (copy), ReactModule (copy), IsImageAttachmentSupportedModule (copy), CreateGalleryCaptureSourceModule (copy), View (copy), ChatResourceAttachmentListModule (copy), ChatImagePreviewListModule (copy), ChatComposerModule (copy), FFlagBuildExperienceModelPickerModule (copy), PromptChipGroupModule (copy), FFlagBuildExperienceFTUXChipExhaustedTelemetryModule (copy), Text (copy), ChatCaptureGalleryContainerModule (copy)
	local Images = Frame.images or {}
	local ResourceAttachments = Frame.resourceAttachments or {}
	local PromptChips = Frame.promptChips or {}
	local v1 = #Images > 0
	local v2 = #ResourceAttachments > 0
	local v3: boolean = FFlagBuildEnableFTUXChipsModule and (#PromptChips > 0 or Frame.isPromptChipsLoading == true)
	local HasFtuxGuidanceText: boolean = FFlagBuildExperienceFTUXChipSendGuidanceModule and (v3 and Frame.ftuxGuidanceText ~= nil)
	local LayoutOrder: number = if v2 then if v1 then 3 else 2 elseif v1 then 2 else 1
	local Unmounted, Unmounted2 = ReactModule.useState("unmounted")
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(false)
	local IsImageAttachmentSupportedModule1 = Frame.allowImageAttachments ~= false and IsImageAttachmentSupportedModule()
	
	local function setCapturedImages(Captures)
		-- upvalues: Frame (copy), Images (copy)
		if Frame.onImagesChanged == nil then return end
		local List = {}
		local v4 = nil
		
		for _, capture in Captures do
			v4 = nil
			
			for _, image in Images do
				if image.capture == capture then
					v4 = image
					break
				end
			end
			table.insert(List, v4 or { capture = capture })
		end
		Frame.onImagesChanged(List)
	end
	
	local function openCaptureGallery()
		-- upvalues: UseRefResult1 (copy), UseRefResult (copy), CreateGalleryCaptureSourceModule (upval), Unmounted2 (copy)
		UseRefResult1.current = true
		UseRefResult.current = CreateGalleryCaptureSourceModule(nil, nil, { Enum.CaptureType.Screenshot })
		Unmounted2("open")
	end
	
	local function _()
		-- upvalues: Unmounted2 (copy)
		Unmounted2("closing")
	end
	
	local function confirmCaptureGallery(p1)
		-- upvalues: setCapturedImages (copy), Unmounted2 (copy)
		setCapturedImages(p1)
		Unmounted2("closing")
	end
	
	local function handleCaptureGalleryClosed()
		-- upvalues: Unmounted2 (copy)
		Unmounted2("unmounted")
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
			images = Images,
			isSendBlocked = Frame.isSendBlocked,
			isFtuxSendGated = if FFlagBuildExperienceFTUXChipSendGuidanceModule then Frame.isFtuxSendGated else nil,
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
			LayoutOrder = LayoutOrder + (if HasFtuxGuidanceText then 2 else 1),
			promptChips = PromptChips,
			isLoading = Frame.isPromptChipsLoading,
			onActivated = Frame.onPromptChipActivated,
			onExhausted = if FFlagBuildExperienceFTUXChipExhaustedTelemetryModule then Frame.onPromptChipExhausted else nil
		}) else nil,
		FtuxGuidance = if HasFtuxGuidanceText then ReactModule.createElement(Text, {
			tag = "size-full-0 auto-y text-caption-medium text-align-x-left content-muted",
			LayoutOrder = LayoutOrder + 1,
			Text = Frame.ftuxGuidanceText
		}) else nil,
		Gallery = if Unmounted == "unmounted" or UseRefResult == nil or UseRefResult.current == nil then nil else ReactModule.createElement(ChatCaptureGalleryContainerModule, {
			maxSelections = 2,
			captureSource = UseRefResult.current,
			initialCaptures = InitialCaptures,
			isOpen = Unmounted == "open",
			onClose = handleCaptureGalleryClosed,
			onConfirm = confirmCaptureGallery,
			shouldProgressivelyLoad = UseRefResult1.current
		})
	})
end