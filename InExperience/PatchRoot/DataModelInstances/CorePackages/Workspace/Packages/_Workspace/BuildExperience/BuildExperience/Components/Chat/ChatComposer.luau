local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FFlagBuildExperienceLibrary = require(Parent.SharedFlags).FFlagBuildExperienceLibrary
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local FFlagComposerControlAlignment = require(Parent.SharedFlags).FFlagComposerControlAlignment
local _ = require(BuildExperience.Chat.chatTypes)
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
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FFlagBuildExperienceFixChatComposerInitialSendStateModule (copy), SignalsModule (copy), FFlagBuildExperienceLibrary (copy), UseReleaseFocusOnDownSwipeModule (copy), Composer (copy), InputSize (copy), View (copy), IconButton (copy), IconName (copy), ButtonVariant (copy), FFlagComposerControlAlignment (copy), ChatActionsRowModule (copy)
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
		leadingElement = if HasOnOpenCaptureGallery then ReactModule.createElement(View, {
			tag = "auto-xy",
			padding = {
				top = UDim.new(0, UseTokensResult.Size.Size_200),
				bottom = UDim.new(0, UseTokensResult.Size.Size_200 - 1),
				left = UDim.new(0, UseTokensResult.Size.Size_100),
				right = UDim.new(0, 0)
			}
		}, {
			Attach = ReactModule.createElement(IconButton, {
				isCircular = true,
				testId = "ChatComposer.AttachImage",
				icon = IconName.PlusSmall,
				isDisabled = Frame.isAssistantResponding or IsIsReadOnly,
				onActivated = UseResult2,
				size = InputSize.Small,
				variant = ButtonVariant.Standard
			})
		}) else nil,
		trailingElement = ReactModule.createElement(View, {
			padding = if FFlagComposerControlAlignment then {
				top = UDim.new(0, UseTokensResult.Size.Size_200),
				bottom = UDim.new(0, UseTokensResult.Size.Size_200 - 1),
				left = UDim.new(0, 0),
				right = UDim.new(0, UseTokensResult.Size.Size_100)
			} else nil,
			tag = {
				["auto-xy"] = FFlagComposerControlAlignment,
				["auto-xy padding-x-xsmall padding-y-small"] = not FFlagComposerControlAlignment
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
	})
end