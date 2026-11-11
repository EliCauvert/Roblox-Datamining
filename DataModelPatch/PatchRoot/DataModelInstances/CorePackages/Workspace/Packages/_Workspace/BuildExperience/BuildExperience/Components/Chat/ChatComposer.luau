local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local ComposerLockSignalModule = require(BuildExperience.Chat.composerLockSignal)
local ChatActionsRowModule = require(script.Parent.ChatActionsRow)
local TextAreaModule = require(BuildExperience.FoundationFork.TextArea)
local UseReleaseFocusOnDownSwipeModule = require(script.Parent.useReleaseFocusOnDownSwipe)
local View = FoundationModule.View
local InputSize = FoundationModule.Enums.InputSize

local function _(Text: string): string
	return string.gsub(Text, "^%s*(.-)%s*$", "%1")
end

return function(Frame)
	-- upvalues: ReactModule (copy), SignalsModule (copy), SignalsReactModule (copy), ComposerLockSignalModule (copy), UseReleaseFocusOnDownSwipeModule (copy), TextAreaModule (copy), InputSize (copy), View (copy), ChatActionsRowModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval)
		local Signal, Signal2 = SignalsModule.createSignal(true)
		
		return {
			getIsComposerEmpty = Signal,
			setIsComposerEmpty = Signal2
		}
	end, {})
	local IsToolResponse = SignalsReactModule.useSignalState(ComposerLockSignalModule.getComposerMode) == "tool_response"
	local NoIsToolResponse: boolean = Frame.isAssistantResponding and not IsToolResponse
	local HasComposerErrorText = Frame.composerErrorText ~= nil
	local UseResult = ReactModule.useCallback(function(Text: string)
		-- upvalues: UseMemoResult (copy), Frame (copy)
		UseMemoResult.setIsComposerEmpty(string.gsub(Text, "^%s*(.-)%s*$", "%1") == "")
		Frame.onChanged(Text)
	end, { Frame.onChanged, UseMemoResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: Frame (copy), UseMemoResult (copy)
		if Frame.onSend() then
			UseMemoResult.setIsComposerEmpty(true)
		end
	end, { Frame.onSend, UseMemoResult })
	UseReleaseFocusOnDownSwipeModule(UseRefResult, Frame.textBoxRef)
	
	return ReactModule.createElement(TextAreaModule, {
		label = "",
		text = Frame.text,
		onChanged = UseResult,
		hint = Frame.composerErrorText,
		hasError = HasComposerErrorText,
		placeholder = Frame.placeholder or "",
		width = UDim.new(1, 0),
		size = InputSize.Large,
		maxLines = Frame.maxLines or 5,
		isDisabled = NoIsToolResponse,
		onReturnPressed = UseResult1,
		textBoxRef = Frame.textBoxRef,
		ref = UseRefResult,
		composerDebug = Frame.composerDebug,
		LayoutOrder = Frame.LayoutOrder,
		trailingElement = ReactModule.createElement(View, { tag = "auto-xy padding-x-xsmall padding-y-small" }, {
			Actions = ReactModule.createElement(ChatActionsRowModule, {
				isAssistantResponding = Frame.isAssistantResponding,
				canStopAssistantResponse = Frame.canStopAssistantResponse,
				canSendWhileResponding = IsToolResponse,
				getIsComposerEmpty = UseMemoResult.getIsComposerEmpty,
				isSendDisabled = HasComposerErrorText,
				onSend = UseResult1,
				onStop = Frame.onStop
			})
		})
	})
end