local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local composerLockSignalModule = require(buildExperience.Chat.composerLockSignal)
local chatActionsRowModule = require(script.Parent.ChatActionsRow)
local textAreaModule = require(buildExperience.FoundationFork.TextArea)
local useReleaseFocusOnDownSwipeModule = require(script.Parent.useReleaseFocusOnDownSwipe)
local view = foundationModule.View
local inputSize = foundationModule.Enums.InputSize

local function _(p0) --[[ line: 37 | named "trimMessage" ]]
	return string.gsub(p0, "^%s*(.-)%s*$", "%1")
end

return function(p1) --[[ line: 41 | named "ChatComposer" ]]
	-- upvalues: reactModule (ref), signalsModule (ref), signalsReactModule (ref), composerLockSignalModule (ref), useReleaseFocusOnDownSwipeModule (ref), textAreaModule (ref), inputSize (ref), view (ref), chatActionsRowModule (ref)
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useMemo(function() --[[ line: 43 ]]
		-- upvalues: signalsModule (copy)
		local var16, var17 = signalsModule.createSignal(true)
		
		return { getIsComposerEmpty = var16, setIsComposerEmpty = var17 }
	end, {})
	local isToolResponse = signalsReactModule.useSignalState(composerLockSignalModule.getComposerMode) == "tool_response"
	local var12 = p1.isAssistantResponding and not isToolResponse
	local var13 = p1.composerErrorText ~= nil
	local var14 = reactModule.useCallback(function(p2) --[[ line: 57 ]]
		-- upvalues: var10 (ref), p1 (ref)
		var10.setIsComposerEmpty(string.gsub(p2, "^%s*(.-)%s*$", "%1") == "")
		p1.onChanged(p2)
	end, { p1.onChanged, var10 })
	local var15 = reactModule.useCallback(function() --[[ line: 62 ]]
		-- upvalues: p1 (ref), var10 (ref)
		if p1.onSend() then
			var10.setIsComposerEmpty(true)
		end
	end, { p1.onSend, var10 })
	useReleaseFocusOnDownSwipeModule(var9, p1.textBoxRef)
	
	return reactModule.createElement(textAreaModule, {
		label = "",
		text = p1.text,
		onChanged = var14,
		hint = p1.composerErrorText,
		hasError = var13,
		placeholder = p1.placeholder or "",
		width = UDim.new(1, 0),
		size = inputSize.Large,
		maxLines = p1.maxLines or 5,
		isDisabled = var12,
		onReturnPressed = var15,
		textBoxRef = p1.textBoxRef,
		ref = var9,
		composerDebug = p1.composerDebug,
		LayoutOrder = p1.LayoutOrder,
		trailingElement = reactModule.createElement(view, { tag = "auto-xy padding-x-xsmall padding-y-small" }, {
			Actions = reactModule.createElement(chatActionsRowModule, {
				isAssistantResponding = p1.isAssistantResponding,
				canSendWhileResponding = isToolResponse,
				getIsComposerEmpty = var10.getIsComposerEmpty,
				isSendDisabled = var13,
				onSend = var15,
				onStop = p1.onStop
			})
		})
	})
end