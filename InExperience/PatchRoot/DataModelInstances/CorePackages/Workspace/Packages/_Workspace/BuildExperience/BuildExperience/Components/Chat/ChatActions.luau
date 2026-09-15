local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local fFlagBuildExperienceLibraryModule = require(buildExperience.Flags.FFlagBuildExperienceLibrary)
local fFlagBuildExperienceChatImageAttachmentsModule = require(buildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local var1 = if fFlagBuildExperienceChatImageAttachmentsModule then game:GetService("CaptureService") else nil
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local var2 = if fFlagBuildExperienceChatImageAttachmentsModule then require(parent.Moments.createGalleryCaptureSource) else nil
local _ = require(buildExperience.Chat.chatTypes)
local var3 = if fFlagBuildExperienceChatImageAttachmentsModule then require(script.Parent.ChatCaptureGallery.ChatCaptureGalleryContainer) else nil
local chatComposerModule = require(script.Parent.ChatComposer)
local chatReferencePreviewListModule = require(script.Parent.ChatReferencePreviewList)
local var4 = if fFlagBuildExperienceChatImageAttachmentsModule then require(script.Parent.ChatImagePreviewList) else nil
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

local function _()
	-- upvalues: var1 (ref)
	local ok, status = pcall(function()
		return game:GetEngineFeature("CaptureServiceStartUploadCoreScriptBypass")
	end)
	
	return ok and (status == true and (var1.ReadCapturesFromGalleryAsync ~= nil and (var1.StartUploadCaptureAsync ~= nil and var1.CheckUploadCaptureStatusAsync ~= nil)))
end

return function(p1)
	-- upvalues: fFlagBuildExperienceLibraryModule (ref), useTokens (ref), fFlagBuildExperienceChatImageAttachmentsModule (ref), reactModule (ref), var1 (ref), var2 (ref), view (ref), chatReferencePreviewListModule (ref), var4 (ref), chatComposerModule (ref), var3 (ref)
	local images = p1.images or {}
	local var5 = if fFlagBuildExperienceLibraryModule then p1.references or {} else {}
	local var6 = if fFlagBuildExperienceLibraryModule then useTokens() else nil
	local var7 = "unmounted"
	local var8 = nil
	local var9 = nil
	local var10 = nil
	
	if fFlagBuildExperienceChatImageAttachmentsModule then
		local unmounted, unmounted_1 = reactModule.useState("unmounted")
		var7 = unmounted
		var8 = unmounted_1
		var9 = reactModule.useRef(nil)
		var10 = reactModule.useRef(false)
	end
	local var11 = fFlagBuildExperienceChatImageAttachmentsModule
	
	if var11 then
		local ok, status = pcall(function()
			return game:GetEngineFeature("CaptureServiceStartUploadCoreScriptBypass")
		end)
		var11 = ok and (status == true and (var1.ReadCapturesFromGalleryAsync ~= nil and (var1.StartUploadCaptureAsync ~= nil and var1.CheckUploadCaptureStatusAsync ~= nil)))
	end
	local function setCapturedImages(value)
		-- upvalues: p1 (ref), images (ref)
		if p1.onImagesChanged == nil then return end
		local var12
		local t = {}
		
		for i, v in value do
			var12 = nil
			
			for i_1, v_1 in images do
				if v_1.capture == v then
					var12 = v_1
					break
				end
			end
			table.insert(t, var12 or { capture = v })
		end
		p1.onImagesChanged(t)
	end
	
	local function openCaptureGallery()
		-- upvalues: var9 (write), var10 (write), var8 (write), var2 (copy)
		if var9 == nil or var10 == nil or var8 == nil then
			return
		end
		var10.current = true
		var9.current = var2(nil, nil, { Enum.CaptureType.Screenshot })
		var8("open")
	end
	
	local function _()
		-- upvalues: var8 (write)
		if var8 ~= nil then
			var8("closing")
		end
	end
	
	local function confirmCaptureGallery(p2)
		-- upvalues: setCapturedImages (ref), var8 (write)
		setCapturedImages(p2)
		
		if var8 ~= nil then
			var8("closing")
		end
	end
	
	local function handleCaptureGalleryClosed()
		-- upvalues: var8 (write)
		if var8 ~= nil then
			var8("unmounted")
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
		LayoutOrder = p1.LayoutOrder,
		padding = if fFlagBuildExperienceLibraryModule and var6 ~= nil and #var5 > 0 then {
			top = UDim.new(0, var6.Size.Size_200 - var6.Margin.Small)
		} else nil
	}, {
		References = if #var5 > 0 then reactModule.createElement(chatReferencePreviewListModule, {
			LayoutOrder = 1,
			testId = "ChatActions.References",
			references = var5,
			onRemove = p1.onRemoveReference
		}) else nil,
		Images = if fFlagBuildExperienceChatImageAttachmentsModule and #images > 0 then reactModule.createElement(var4, {
			testId = "ChatActions.Images",
			LayoutOrder = if #var5 > 0 then 2 else 1,
			images = images,
			onRemove = removeImage,
			onRetry = p1.onRetryImage
		}) else nil,
		Composer = reactModule.createElement(chatComposerModule, {
			LayoutOrder = if fFlagBuildExperienceLibraryModule then 3 elseif fFlagBuildExperienceChatImageAttachmentsModule and #images > 0 then 2 else 1,
			text = p1.composerText,
			textRevision = p1.composerTextRevision,
			composerErrorText = p1.composerErrorText,
			onChanged = p1.onComposerChanged,
			placeholder = p1.placeholder,
			textBoxRef = p1.textBoxRef,
			isAssistantResponding = p1.isAssistantResponding,
			canStopAssistantResponse = p1.canStopAssistantResponse,
			canSendWhileResponding = p1.canSendWhileResponding,
			images = if fFlagBuildExperienceChatImageAttachmentsModule then images else nil,
			hasAttachments = #var5 > 0,
			isImageSendBlocked = p1.isImageSendBlocked,
			isAttachmentSupported = var11,
			onOpenCaptureGallery = if var11 then openCaptureGallery else nil,
			onSend = p1.onSend,
			onStop = p1.onStop,
			maxLines = p1.maxLines,
			composerDebug = p1.composerDebug
		}),
		Gallery = if fFlagBuildExperienceChatImageAttachmentsModule and var7 ~= "unmounted" and (var9 ~= nil and var9.current ~= nil) then reactModule.createElement(var3, {
			maxSelections = 2,
			captureSource = var9.current,
			initialCaptures = t,
			isOpen = var7 == "open",
			onClose = handleCaptureGalleryClosed,
			onConfirm = confirmCaptureGallery,
			shouldProgressivelyLoad = if var10 ~= nil then false else var10.current
		}) else nil
	})
end