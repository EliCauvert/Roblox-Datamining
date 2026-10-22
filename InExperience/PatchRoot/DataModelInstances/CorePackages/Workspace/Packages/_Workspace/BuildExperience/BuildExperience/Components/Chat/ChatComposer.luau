local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local _ = require(BuildExperience.Components.ModelPicker.ModelPickerTypes)
local FFlagBuildExperienceModelPickerModule = require(BuildExperience.Flags.FFlagBuildExperienceModelPicker)
local FFlagBuildExperienceLibrary = require(Parent.SharedFlags).FFlagBuildExperienceLibrary
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local FFlagComposerControlAlignment = require(Parent.SharedFlags).FFlagComposerControlAlignment
local _ = require(BuildExperience.Chat.chatTypes)
local ModelPickerContainerModule = if FFlagBuildExperienceModelPickerModule then require(BuildExperience.Components.ModelPicker.ModelPickerContainer) else nil
local ChatActionsRowModule = require(script.Parent.ChatActionsRow)
local FFlagBuildExperienceFixChatComposerInitialSendStateModule = require(BuildExperience.Flags.FFlagBuildExperienceFixChatComposerInitialSendState)
local Composer = if require(BuildExperience.Flags.FFlagBuildExperienceUseCommonTextArea) then require(Parent.AppBlox).Composer else require(BuildExperience.FoundationFork.TextArea)
local UseReleaseFocusOnDownSwipeModule = require(script.Parent.useReleaseFocusOnDownSwipe)
local IconButton = FoundationModule.IconButton
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function _(Text: string): string
	return string.gsub(Text, "^%s*(.-)%s*$", "%1")
end

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FFlagBuildExperienceFixChatComposerInitialSendStateModule (copy), SignalsModule (copy), FFlagBuildExperienceLibrary (copy), FFlagBuildExperienceModelPickerModule (copy), UseReleaseFocusOnDownSwipeModule (copy), FFlagComposerControlAlignment (copy), View (copy), IconButton (copy), IconName (copy), InputSize (copy), ButtonVariant (copy), ModelPickerContainerModule (copy), ChatActionsRowModule (copy), Composer (copy)
	local UseTokensResult = UseTokensFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: FFlagBuildExperienceFixChatComposerInitialSendStateModule (upval), Frame (copy), SignalsModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(not FFlagBuildExperienceFixChatComposerInitialSendStateModule or string.gsub(Frame.text:getValue(), "^%s*(.-)%s*$", "%1") == "")
		
		return {
			getIsComposerEmpty = Signal,
			setIsComposerEmpty = Signal2
		}
	end, { Frame.text })
	local IsNotCanSendWhileResponding: boolean = Frame.isAssistantResponding and Frame.canSendWhileResponding ~= true
	local v1 = false
	
	if FFlagBuildExperienceLibrary and Frame.allowsTypingWhileResponding == true then
		v1 = IsNotCanSendWhileResponding
		IsNotCanSendWhileResponding = false
	end
	local ModelPicker = if FFlagBuildExperienceModelPickerModule then Frame.modelPicker else nil
	local IsIsReadOnly = Frame.isReadOnly == true
	
	if IsIsReadOnly then
		IsNotCanSendWhileResponding = true
	end
	local HasComposerErrorText = Frame.composerErrorText ~= nil
	local HasAttachments: boolean = Frame.images ~= nil and #Frame.images > 0
	local HasOnOpenCaptureGallery: boolean = Frame.isAttachmentSupported and Frame.onOpenCaptureGallery ~= nil
	local UseResult = ReactModule.useCallback(function(Text: string)
		-- upvalues: UseMemoResult (copy), Frame (copy)
		UseMemoResult.setIsComposerEmpty(string.gsub(Text, "^%s*(.-)%s*$", "%1") == "")
		Frame.onChanged(Text)
	end, { Frame.onChanged, UseMemoResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: v1 (ref), Frame (copy), UseMemoResult (copy)
		if v1 then return end
		if Frame.onSend() then
			UseMemoResult.setIsComposerEmpty(true)
		end
	end, { Frame.onSend, UseMemoResult, v1 })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: Frame (copy)
		if Frame.textBoxRef ~= nil and Frame.textBoxRef.current ~= nil then
			Frame.textBoxRef.current.releaseFocus()
		end
		if Frame.onOpenCaptureGallery ~= nil then
			Frame.onOpenCaptureGallery()
		end
	end, { Frame.textBoxRef, Frame.onOpenCaptureGallery })
	
	if FFlagBuildExperienceLibrary then
		ReactModule.useEffect(function()
			-- upvalues: Frame (copy), UseMemoResult (copy), ReactModule (upval)
			if Frame.tracksExternalText then
				local SubscribeToBindingResult = ReactModule.__subscribeToBinding(Frame.text, function(Text: string)
					-- upvalues: UseMemoResult (upval)
					UseMemoResult.setIsComposerEmpty(string.gsub(Text, "^%s*(.-)%s*$", "%1") == "")
				end)
				UseMemoResult.setIsComposerEmpty(string.gsub(Frame.text:getValue(), "^%s*(.-)%s*$", "%1") == "")
				
				return SubscribeToBindingResult
			else
				return nil
			end
		end, { Frame.tracksExternalText, Frame.text, UseMemoResult })
	end
	UseReleaseFocusOnDownSwipeModule(UseRefResult, Frame.textBoxRef)
	local Size100 = UseTokensResult.Size.Size_100
	local Tag = "auto-xy"
	local LayoutOrder: number? = nil
	local LayoutOrder1: number? = nil
	local FFlagComposerControlAlignment1: boolean = FFlagComposerControlAlignment
	
	if FFlagBuildExperienceModelPickerModule then
		Size100 = UseTokensResult.Padding.Small - UseTokensResult.Stroke.Standard
		Tag = "row align-y-center gap-small auto-xy"
		LayoutOrder = 1
		LayoutOrder1 = 3
		FFlagComposerControlAlignment1 = true
	end
	local Element = if HasOnOpenCaptureGallery or ModelPicker ~= nil then ReactModule.createElement(View, {
		padding = {
			top = UDim.new(0, UseTokensResult.Size.Size_200),
			bottom = UDim.new(0, UseTokensResult.Size.Size_200 - 1),
			left = UDim.new(0, Size100)
		},
		tag = Tag
	}, {
		Attach = if HasOnOpenCaptureGallery then ReactModule.createElement(IconButton, {
			isCircular = true,
			testId = "ChatComposer.AttachImage",
			LayoutOrder = LayoutOrder,
			icon = IconName.PlusSmall,
			isDisabled = Frame.isAssistantResponding or IsIsReadOnly,
			onActivated = UseResult2,
			size = InputSize.Small,
			variant = ButtonVariant.Standard
		}) else nil,
		Picker = if ModelPicker == nil then nil else ReactModule.createElement(ModelPickerContainerModule, {
			LayoutOrder = 2,
			data = ModelPicker.data,
			selectedId = ModelPicker.selectedId,
			onSelect = ModelPicker.onSelect,
			isDisabled = Frame.isAssistantResponding or IsIsReadOnly
		})
	}) else nil
	local Element1 = ReactModule.createElement(View, {
		LayoutOrder = LayoutOrder1,
		padding = if FFlagComposerControlAlignment1 then {
			top = UDim.new(0, UseTokensResult.Size.Size_200),
			bottom = UDim.new(0, UseTokensResult.Size.Size_200 - 1),
			left = UDim.new(0, 0),
			right = UDim.new(0, Size100)
		} else nil,
		tag = {
			["auto-xy"] = FFlagComposerControlAlignment1,
			["auto-xy padding-x-xsmall padding-y-small"] = not FFlagComposerControlAlignment1
		}
	}, {
		Actions = ReactModule.createElement(ChatActionsRowModule, {
			isAssistantResponding = Frame.isAssistantResponding,
			canStopAssistantResponse = Frame.canStopAssistantResponse,
			canSendWhileResponding = Frame.canSendWhileResponding,
			getIsComposerEmpty = UseMemoResult.getIsComposerEmpty,
			hasAttachments = HasAttachments,
			isSendDisabled = HasComposerErrorText or (Frame.isSendBlocked == true or IsIsReadOnly),
			isStopDisabled = IsIsReadOnly,
			onSend = UseResult1,
			onStop = Frame.onStop
		})
	})
	
	return ReactModule.createElement(Composer, {
		label = "",
		text = Frame.text,
		onChanged = UseResult,
		hint = Frame.composerErrorText,
		hasError = HasComposerErrorText,
		placeholder = Frame.placeholder or "",
		width = UDim.new(1, 0),
		size = InputSize.Large,
		maxLines = Frame.maxLines or 5,
		isDisabled = IsNotCanSendWhileResponding,
		onReturnPressed = UseResult1,
		textBoxRef = Frame.textBoxRef,
		ref = UseRefResult,
		composerDebug = Frame.composerDebug,
		LayoutOrder = Frame.LayoutOrder,
		leadingElement = if FFlagBuildExperienceModelPickerModule then nil else Element,
		trailingElement = if FFlagBuildExperienceModelPickerModule then nil else Element1,
		footerElement = if FFlagBuildExperienceModelPickerModule then ReactModule.createElement(View, { tag = "row align-y-center size-full-0 auto-y" }, {
			Leading = Element,
			Spacer = ReactModule.createElement(View, { LayoutOrder = 2, tag = "fill" }),
			Trailing = Element1
		}) else nil
	})
end