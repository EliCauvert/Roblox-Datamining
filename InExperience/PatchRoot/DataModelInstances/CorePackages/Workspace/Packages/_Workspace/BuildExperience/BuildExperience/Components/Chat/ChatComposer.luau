local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local _ = require(BuildExperience.Components.ModelPicker.ModelPickerTypes)
local FFlagBuildExperienceModelPickerModule = require(BuildExperience.Flags.FFlagBuildExperienceModelPicker)
local FFlagBuildExperienceSingleLineComposerModule = require(BuildExperience.Flags.FFlagBuildExperienceSingleLineComposer)
local FFlagBuildExperienceLibrary = require(Parent.SharedFlags).FFlagBuildExperienceLibrary
local FFlagBuildExperienceInGameShellComposer = require(Parent.SharedFlags).FFlagBuildExperienceInGameShellComposer
local FFlagBuildExperienceFTUXChipSendGuidanceModule = require(BuildExperience.Flags.FFlagBuildExperienceFTUXChipSendGuidance)
local FFlagBuildChatPasteAsAttachmentModule = require(BuildExperience.Flags.FFlagBuildChatPasteAsAttachment)
local FFlagBuildChatAttachmentMenuModule = require(BuildExperience.Flags.FFlagBuildChatAttachmentMenu)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local _ = require(BuildExperience.Chat.chatTypes)
local ModelPickerContainerModule = if FFlagBuildExperienceModelPickerModule then require(BuildExperience.Components.ModelPicker.ModelPickerContainer) else nil
local ChatActionsRowModule = require(script.Parent.ChatActionsRow)
local ChatAttachmentMenuContainerModule = require(script.Parent.ChatAttachmentMenuContainer)
local Composer = if require(BuildExperience.Flags.FFlagBuildExperienceUseCommonTextArea) then require(Parent.AppBlox).Composer else require(BuildExperience.FoundationFork.TextArea)
local UseReleaseFocusOnDownSwipeModule = require(script.Parent.useReleaseFocusOnDownSwipe)
local SplitPastedTextModule = require(script.Parent.splitPastedText)
local IconButton = FoundationModule.IconButton
local EducationalTooltip = FoundationModule.EducationalTooltip
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function _(Text: string): string
	return string.gsub(Text, "^%s*(.-)%s*$", "%1")
end

local _ = function(p1, p2)
	return function()
		-- upvalues: p1 (copy), p2 (copy)
		if p1 ~= nil and p1.current ~= nil then
			p1.current.releaseFocus()
		end
		p2()
	end
end

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), SignalsModule (copy), FFlagBuildExperienceLibrary (copy), FFlagBuildExperienceModelPickerModule (copy), FFlagBuildChatPasteAsAttachmentModule (copy), FFlagBuildChatAttachmentMenuModule (copy), FFlagBuildExperienceFTUXChipSendGuidanceModule (copy), SplitPastedTextModule (copy), UseReleaseFocusOnDownSwipeModule (copy), FFlagBuildExperienceSingleLineComposerModule (copy), View (copy), ChatAttachmentMenuContainerModule (copy), IconButton (copy), IconName (copy), InputSize (copy), ButtonVariant (copy), ModelPickerContainerModule (copy), FFlagBuildExperienceInGameShellComposer (copy), ChatActionsRowModule (copy), EducationalTooltip (copy), FoundationModule (copy), Composer (copy)
	local UseTokensResult = UseTokensFunction()
	local UseRefResult = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: Frame (copy), SignalsModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(string.gsub(Frame.text:getValue(), "^%s*(.-)%s*$", "%1") == "")
		
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
	local HasSendableAttachments = if Frame.images == nil then FFlagBuildChatPasteAsAttachmentModule and Frame.hasSendableAttachments else #Frame.images > 0 or FFlagBuildChatPasteAsAttachmentModule and Frame.hasSendableAttachments
	local HasOnOpenCaptureGallery: boolean = if FFlagBuildChatAttachmentMenuModule then #Frame.attachmentMenuItems > 0 else Frame.isAttachmentSupported and Frame.onOpenCaptureGallery ~= nil
	local IsOpen = false
	
	local function v39(_) end
	
	if FFlagBuildExperienceFTUXChipSendGuidanceModule then
		IsOpen, v39 = ReactModule.useState(false)
		ReactModule.useEffect(function()
			-- upvalues: Frame (copy), v39 (ref)
			if Frame.isFtuxSendGated ~= true then
				v39(false)
			end
		end, { Frame.isFtuxSendGated })
	end
	local UseResult = if FFlagBuildChatPasteAsAttachmentModule then ReactModule.useCallback(function(p1)
		-- upvalues: Frame (copy), SplitPastedTextModule (upval), UseMemoResult (copy)
		local Text: string = p1
		
		if Frame.onTextPasted ~= nil and Frame.textBoxRef ~= nil and Frame.textBoxRef.current ~= nil then
			local Current = Frame.textBoxRef.current
			local Value = Frame.text:getValue()
			local SplitPastedTextModuleResult = SplitPastedTextModule(Value, p1, Current.getCursorPosition() or -1)
			
			if SplitPastedTextModuleResult ~= nil then
				Text = Value
				Frame.onTextPasted(SplitPastedTextModuleResult.pastedText)
				Current.setCursorPosition(SplitPastedTextModuleResult.cursorPosition)
			end
		end
		UseMemoResult.setIsComposerEmpty(string.gsub(Text, "^%s*(.-)%s*$", "%1") == "")
		Frame.onChanged(Text)
	end, {
		Frame.onChanged,
		UseMemoResult,
		Frame.onTextPasted,
		Frame.text,
		Frame.textBoxRef
	}) else ReactModule.useCallback(function(Text: string)
		-- upvalues: UseMemoResult (copy), Frame (copy)
		UseMemoResult.setIsComposerEmpty(string.gsub(Text, "^%s*(.-)%s*$", "%1") == "")
		Frame.onChanged(Text)
	end, { Frame.onChanged, UseMemoResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: v1 (ref), FFlagBuildExperienceFTUXChipSendGuidanceModule (upval), Frame (copy), IsIsReadOnly (copy), FFlagBuildExperienceModelPickerModule (upval), HasComposerErrorText (copy), HasSendableAttachments (copy), v39 (ref), UseMemoResult (copy)
		if v1 then return end
		if not FFlagBuildExperienceFTUXChipSendGuidanceModule or Frame.isFtuxSendGated ~= true then
			if FFlagBuildExperienceFTUXChipSendGuidanceModule then
				v39(false)
			end
			if Frame.onSend() then
				UseMemoResult.setIsComposerEmpty(not FFlagBuildExperienceModelPickerModule or string.gsub(Frame.text:getValue(), "^%s*(.-)%s*$", "%1") == "")
			end
			return
		elseif not IsIsReadOnly and (FFlagBuildExperienceModelPickerModule or not HasComposerErrorText) and (Frame.isSendBlocked ~= true and (string.gsub(Frame.text:getValue(), "^%s*(.-)%s*$", "%1") ~= "" or HasSendableAttachments)) then
			v39(true)
		end
	end, if FFlagBuildExperienceFTUXChipSendGuidanceModule then {
		Frame.onSend, UseMemoResult, v1, IsIsReadOnly, HasComposerErrorText,
		Frame.isSendBlocked, Frame.isFtuxSendGated, HasSendableAttachments, Frame.text
	} else {
		Frame.onSend,
		UseMemoResult,
		v1,
		if FFlagBuildExperienceModelPickerModule then Frame.text else nil
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: Frame (copy)
		if Frame.textBoxRef ~= nil and Frame.textBoxRef.current ~= nil then
			Frame.textBoxRef.current.releaseFocus()
		end
		if Frame.onOpenCaptureGallery ~= nil then
			Frame.onOpenCaptureGallery()
		end
	end, { Frame.textBoxRef, Frame.onOpenCaptureGallery })
	
	if FFlagBuildExperienceModelPickerModule then
		ReactModule.useEffect(function()
			-- upvalues: UseMemoResult (copy), ReactModule (upval), Frame (copy)
			local SubscribeToBindingResult = ReactModule.__subscribeToBinding(Frame.text, function(Text: string)
				-- upvalues: UseMemoResult (upval)
				UseMemoResult.setIsComposerEmpty(string.gsub(Text, "^%s*(.-)%s*$", "%1") == "")
			end)
			UseMemoResult.setIsComposerEmpty(string.gsub(Frame.text:getValue(), "^%s*(.-)%s*$", "%1") == "")
			
			return SubscribeToBindingResult
		end, { Frame.text, UseMemoResult })
	elseif FFlagBuildExperienceLibrary then
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
	local IsNotIsSingleLine = if FFlagBuildExperienceSingleLineComposerModule then FFlagBuildExperienceModelPickerModule and Frame.isSingleLine ~= true else FFlagBuildExperienceModelPickerModule
	local Size100 = UseTokensResult.Size.Size_100
	local Tag = "auto-xy"
	local LayoutOrder: number? = nil
	local LayoutOrder1: number? = nil
	
	if IsNotIsSingleLine then
		Size100 = UseTokensResult.Padding.Small - UseTokensResult.Stroke.Standard
		Tag = "row align-y-center gap-small auto-xy"
		LayoutOrder = 1
		LayoutOrder1 = 3
	end
	local Element = if HasOnOpenCaptureGallery or ModelPicker ~= nil then ReactModule.createElement(View, {
		padding = {
			top = UDim.new(0, UseTokensResult.Size.Size_200),
			bottom = UDim.new(0, UseTokensResult.Size.Size_200 - 1),
			left = UDim.new(0, Size100)
		},
		tag = Tag
	}, {
		Attach = if FFlagBuildChatAttachmentMenuModule then if HasOnOpenCaptureGallery then ReactModule.createElement(ChatAttachmentMenuContainerModule, {
			testId = "ChatComposer.AttachImage",
			items = Frame.attachmentMenuItems,
			isDisabled = Frame.isAssistantResponding or IsIsReadOnly,
			LayoutOrder = LayoutOrder
		}) else nil elseif HasOnOpenCaptureGallery then ReactModule.createElement(IconButton, {
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
			internalTesting = ModelPicker.internalTesting,
			data = ModelPicker.data,
			selectedId = ModelPicker.selectedId,
			onSelect = ModelPicker.onSelect,
			isDisabled = Frame.isAssistantResponding or (IsIsReadOnly or ModelPicker.isDisabled == true)
		})
	}) else nil
	local HasOnSelectionActivated: boolean = FFlagBuildExperienceInGameShellComposer and (Frame.onSelectionActivated ~= nil or Frame.onCaptureActivated ~= nil)
	local CreateElementFunction = ReactModule.createElement
	local config = {
		LayoutOrder = LayoutOrder1,
		padding = {
			top = UDim.new(0, UseTokensResult.Size.Size_200),
			bottom = UDim.new(0, UseTokensResult.Size.Size_200 - 1),
			left = UDim.new(0, 0),
			right = UDim.new(0, Size100)
		},
		tag = {
			["auto-xy"] = true,
			["row align-y-center gap-xsmall"] = HasOnSelectionActivated
		}
	}
	local t = {}
	local Element1 = nil
	
	if FFlagBuildExperienceInGameShellComposer and Frame.onSelectionActivated ~= nil then
		local TextBoxRef = Frame.textBoxRef
		local OnSelectionActivated = Frame.onSelectionActivated
		Element1 = ReactModule.createElement(IconButton, {
			LayoutOrder = 1,
			isCircular = true,
			testId = "ChatComposer.Select",
			icon = IconName.CursorStars,
			isDisabled = Frame.isAssistantResponding or IsIsReadOnly,
			onActivated = function()
				-- upvalues: TextBoxRef (copy), OnSelectionActivated (copy)
				if TextBoxRef ~= nil and TextBoxRef.current ~= nil then
					TextBoxRef.current.releaseFocus()
				end
				OnSelectionActivated()
			end,
			size = InputSize.Small,
			variant = ButtonVariant.Utility
		})
	else
		Element1 = nil
	end
	t.Select = Element1
	local Element2 = nil
	
	if FFlagBuildExperienceInGameShellComposer and Frame.onCaptureActivated ~= nil then
		local TextBoxRef1 = Frame.textBoxRef
		local OnCaptureActivatedFunction = Frame.onCaptureActivated
		Element2 = ReactModule.createElement(IconButton, {
			LayoutOrder = 2,
			isCircular = true,
			testId = "ChatComposer.Capture",
			icon = IconName.FrameCameraCenter,
			isDisabled = Frame.isAssistantResponding or IsIsReadOnly,
			onActivated = function()
				-- upvalues: TextBoxRef1 (copy), OnCaptureActivatedFunction (copy)
				if TextBoxRef1 ~= nil and TextBoxRef1.current ~= nil then
					TextBoxRef1.current.releaseFocus()
				end
				OnCaptureActivatedFunction()
			end,
			size = InputSize.Small,
			variant = ButtonVariant.Utility
		})
	else
		Element2 = nil
	end
	t.Capture = Element2
	t.Actions = ReactModule.createElement(ChatActionsRowModule, {
		LayoutOrder = if HasOnSelectionActivated then 3 else nil,
		isAssistantResponding = Frame.isAssistantResponding,
		canStopAssistantResponse = Frame.canStopAssistantResponse,
		canSendWhileResponding = Frame.canSendWhileResponding,
		getIsComposerEmpty = UseMemoResult.getIsComposerEmpty,
		hasAttachments = HasSendableAttachments,
		isSendDisabled = (if FFlagBuildExperienceModelPickerModule then Frame.isSendBlocked == true else HasComposerErrorText or Frame.isSendBlocked == true) or IsIsReadOnly,
		isFtuxSendGated = if FFlagBuildExperienceFTUXChipSendGuidanceModule then Frame.isFtuxSendGated else nil,
		isStopDisabled = IsIsReadOnly,
		onSend = UseResult1,
		onStop = Frame.onStop
	})
	local Element3 = CreateElementFunction(View, config, t)
	
	if FFlagBuildExperienceFTUXChipSendGuidanceModule and Frame.isFtuxSendGated == true then
		Element3 = ReactModule.createElement(EducationalTooltip, {
			hasActions = false,
			hasSecondaryButtons = false,
			showSteps = false,
			text = "Pick a chip, or edit the prompt yourself, to send",
			title = "",
			LayoutOrder = LayoutOrder1,
			align = FoundationModule.Enums.PopoverAlign.End,
			isOpen = IsOpen,
			onPressedOutside = function()
				-- upvalues: v39 (ref)
				v39(false)
			end,
			side = FoundationModule.Enums.PopoverSide.Top
		}, { Anchor = Element3 })
	end
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
		leadingElement = if IsNotIsSingleLine then nil else Element,
		trailingElement = if IsNotIsSingleLine then nil else Element3,
		footerElement = if IsNotIsSingleLine then ReactModule.createElement(View, { tag = "row align-y-center size-full-0 auto-y" }, {
			Leading = Element,
			Spacer = ReactModule.createElement(View, { LayoutOrder = 2, tag = "fill" }),
			Trailing = Element3
		}) else nil
	})
end