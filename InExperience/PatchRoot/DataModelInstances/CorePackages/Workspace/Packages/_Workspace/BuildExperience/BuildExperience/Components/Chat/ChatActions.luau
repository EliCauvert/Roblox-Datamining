local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local fFlagBuildExperienceChatImageAttachmentsModule = require(buildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local var1 = if fFlagBuildExperienceChatImageAttachmentsModule then game:GetService("CaptureService") else nil
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local var2 = if fFlagBuildExperienceChatImageAttachmentsModule then require(parent.Moments.createGalleryCaptureSource) else nil
local _ = require(buildExperience.Chat.chatTypes)
local var3 = if fFlagBuildExperienceChatImageAttachmentsModule then require(script.Parent.ChatCaptureGallery.ChatCaptureGalleryContainer) else nil
local chatComposerModule = require(script.Parent.ChatComposer)
local var4 = if fFlagBuildExperienceChatImageAttachmentsModule then require(script.Parent.ChatImagePreviewList) else nil
local view = foundationModule.View

local function _()
	-- upvalues: var1 (ref)
	local ok, status = pcall(function()
		return game:GetEngineFeature("CaptureServiceStartUploadCoreScriptBypass")
	end)
	
	return ok and (status == true and (var1.ReadCapturesFromGalleryAsync ~= nil and (var1.StartUploadCaptureAsync ~= nil and var1.CheckUploadCaptureStatusAsync ~= nil)))
end

return function(p1)
	-- upvalues: fFlagBuildExperienceChatImageAttachmentsModule (ref), reactModule (ref), var1 (ref), var2 (ref), view (ref), var4 (ref), chatComposerModule (ref), var3 (ref)
	local images = p1.images or {}
	local var5 = "unmounted"
	local var6 = nil
	local var7 = nil
	local var8 = nil
	
	if fFlagBuildExperienceChatImageAttachmentsModule then
		local unmounted, unmounted_1 = reactModule.useState("unmounted")
		var5 = unmounted
		var6 = unmounted_1
		var7 = reactModule.useRef(nil)
		var8 = reactModule.useRef(false)
	end
	local var9 = fFlagBuildExperienceChatImageAttachmentsModule
	
	if var9 then
		local ok, status = pcall(function()
			return game:GetEngineFeature("CaptureServiceStartUploadCoreScriptBypass")
		end)
		var9 = ok and (status == true and (var1.ReadCapturesFromGalleryAsync ~= nil and (var1.StartUploadCaptureAsync ~= nil and var1.CheckUploadCaptureStatusAsync ~= nil)))
	end
	local function setCapturedImages(value)
		-- upvalues: p1 (ref), images (ref)
		if p1.onImagesChanged == nil then return end
		local var10
		local t = {}
		
		for i, v in value do
			var10 = nil
			
			for i_1, v_1 in images do
				if v_1.capture == v then
					var10 = v_1
					break
				end
			end
			table.insert(t, var10 or { capture = v })
		end
		p1.onImagesChanged(t)
	end
	
	local function openCaptureGallery()
		-- upvalues: var7 (write), var8 (write), var6 (write), var2 (copy)
		if var7 == nil or var8 == nil or var6 == nil then
			return
		end
		var8.current = true
		var7.current = var2(nil, nil, { Enum.CaptureType.Screenshot })
		var6("open")
	end
	
	local function _()
		-- upvalues: var6 (write)
		if var6 ~= nil then
			var6("closing")
		end
	end
	
	local function confirmCaptureGallery(p2)
		-- upvalues: setCapturedImages (ref), var6 (write)
		setCapturedImages(p2)
		
		if var6 ~= nil then
			var6("closing")
		end
	end
	
	local function handleCaptureGalleryClosed()
		-- upvalues: var6 (write)
		if var6 ~= nil then
			var6("unmounted")
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
		Images = if fFlagBuildExperienceChatImageAttachmentsModule and #images > 0 then reactModule.createElement(var4, {
			LayoutOrder = 1,
			testId = "ChatActions.Images",
			images = images,
			onRemove = removeImage,
			onRetry = p1.onRetryImage
		}) else nil,
		Composer = reactModule.createElement(chatComposerModule, {
			LayoutOrder = if fFlagBuildExperienceChatImageAttachmentsModule and #images > 0 then 2 else 1,
			text = p1.composerText,
			composerErrorText = p1.composerErrorText,
			onChanged = p1.onComposerChanged,
			placeholder = p1.placeholder,
			textBoxRef = p1.textBoxRef,
			isAssistantResponding = p1.isAssistantResponding,
			canStopAssistantResponse = p1.canStopAssistantResponse,
			canSendWhileResponding = p1.canSendWhileResponding,
			images = if fFlagBuildExperienceChatImageAttachmentsModule then images else nil,
			isImageSendBlocked = p1.isImageSendBlocked,
			isAttachmentSupported = var9,
			onOpenCaptureGallery = if var9 then openCaptureGallery else nil,
			onSend = p1.onSend,
			onStop = p1.onStop,
			maxLines = p1.maxLines,
			composerDebug = p1.composerDebug
		}),
		Gallery = if fFlagBuildExperienceChatImageAttachmentsModule and var5 ~= "unmounted" and (var7 ~= nil and var7.current ~= nil) then reactModule.createElement(var3, {
			maxSelections = 2,
			captureSource = var7.current,
			initialCaptures = t,
			isOpen = var5 == "open",
			onClose = handleCaptureGalleryClosed,
			onConfirm = confirmCaptureGallery,
			shouldProgressivelyLoad = if var8 ~= nil then false else var8.current
		}) else nil
	})
end