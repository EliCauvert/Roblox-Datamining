local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local chatActionsRowModule = require(script.Parent.ChatActionsRow)
local textAreaModule = require(buildExperience.FoundationFork.TextArea)
local useReleaseFocusOnDownSwipeModule = require(script.Parent.useReleaseFocusOnDownSwipe)
local view = foundationModule.View
local inputSize = foundationModule.Enums.InputSize

local function _(p0) --[[ line: 34 | named "trimMessage" ]]
	return string.gsub(p0, "^%s*(.-)%s*$", "%1")
end

return function(p1) --[[ line: 38 | named "ChatComposer" ]]
	-- upvalues: reactModule (ref), signalsModule (ref), useReleaseFocusOnDownSwipeModule (ref), textAreaModule (ref), inputSize (ref), view (ref), chatActionsRowModule (ref)
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useMemo(function() --[[ line: 40 ]]
		-- upvalues: signalsModule (copy)
		local var13, var14 = signalsModule.createSignal(true)
		
		return { getIsComposerEmpty = var13, setIsComposerEmpty = var14 }
	end, {})
	local var9 = p1.isAssistantResponding and p1.canSendWhileResponding ~= true
	local var10 = p1.composerErrorText ~= nil
	local var11 = reactModule.useCallback(function(p2) --[[ line: 51 ]]
		-- upvalues: var8 (ref), p1 (ref)
		var8.setIsComposerEmpty(string.gsub(p2, "^%s*(.-)%s*$", "%1") == "")
		p1.onChanged(p2)
	end, { p1.onChanged, var8 })
	local var12 = reactModule.useCallback(function() --[[ line: 56 ]]
		-- upvalues: p1 (ref), var8 (ref)
		if p1.onSend() then
			var8.setIsComposerEmpty(true)
		end
	end, { p1.onSend, var8 })
	useReleaseFocusOnDownSwipeModule(var7, p1.textBoxRef)
	
	return reactModule.createElement(textAreaModule, {
		label = "",
		text = p1.text,
		onChanged = var11,
		hint = p1.composerErrorText,
		hasError = var10,
		placeholder = p1.placeholder or "",
		width = UDim.new(1, 0),
		size = inputSize.Large,
		maxLines = p1.maxLines or 5,
		isDisabled = var9,
		onReturnPressed = var12,
		textBoxRef = p1.textBoxRef,
		ref = var7,
		composerDebug = p1.composerDebug,
		LayoutOrder = p1.LayoutOrder,
		trailingElement = reactModule.createElement(view, { tag = "auto-xy padding-x-xsmall padding-y-small" }, {
			Actions = reactModule.createElement(chatActionsRowModule, {
				isAssistantResponding = p1.isAssistantResponding,
				canStopAssistantResponse = p1.canStopAssistantResponse,
				canSendWhileResponding = p1.canSendWhileResponding,
				getIsComposerEmpty = var8.getIsComposerEmpty,
				isSendDisabled = var10,
				onSend = var12,
				onStop = p1.onStop
			})
		})
	})
end