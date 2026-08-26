local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local chatActionsRowModule = require(script.Parent.ChatActionsRow)
local fFlagBuildExperienceFixChatComposerInitialSendStateModule = require(buildExperience.Flags.FFlagBuildExperienceFixChatComposerInitialSendState)
local var1 = if require(buildExperience.Flags.FFlagBuildExperienceUseCommonTextArea) then require(parent.AppBlox).Composer else require(buildExperience.FoundationFork.TextArea)
local useReleaseFocusOnDownSwipeModule = require(script.Parent.useReleaseFocusOnDownSwipe)
local view = foundationModule.View
local inputSize = foundationModule.Enums.InputSize

local function _(p1)
	return string.gsub(p1, "^%s*(.-)%s*$", "%1")
end

return function(p1)
	-- upvalues: reactModule (ref), fFlagBuildExperienceFixChatComposerInitialSendStateModule (ref), signalsModule (ref), useReleaseFocusOnDownSwipeModule (ref), var1 (ref), inputSize (ref), view (ref), chatActionsRowModule (ref)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useMemo(function()
		-- upvalues: fFlagBuildExperienceFixChatComposerInitialSendStateModule (copy), p1 (ref), signalsModule (copy)
		local var4
		if fFlagBuildExperienceFixChatComposerInitialSendStateModule then
			var4 = string.gsub(p1.text:getValue(), "^%s*(.-)%s*$", "%1") == ""
			var4 = nil
		else
			var4 = true
		end
		local var5, var6 = signalsModule.createSignal(var4)
		
		return { getIsComposerEmpty = var5, setIsComposerEmpty = var6 }
	end, { p1.text })
	local var4 = p1.isAssistantResponding and p1.canSendWhileResponding ~= true
	local var5 = p1.composerErrorText ~= nil
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), p1 (ref)
		var3.setIsComposerEmpty(string.gsub(p2, "^%s*(.-)%s*$", "%1") == "")
		p1.onChanged(p2)
	end, { p1.onChanged, var3 })
	local var7 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var3 (ref)
		if p1.onSend() then
			var3.setIsComposerEmpty(true)
		end
	end, { p1.onSend, var3 })
	useReleaseFocusOnDownSwipeModule(var2, p1.textBoxRef)
	
	return reactModule.createElement(var1, {
		label = "",
		text = p1.text,
		onChanged = var6,
		hint = p1.composerErrorText,
		hasError = var5,
		placeholder = p1.placeholder or "",
		width = UDim.new(1, 0),
		size = inputSize.Large,
		maxLines = p1.maxLines or 5,
		isDisabled = var4,
		onReturnPressed = var7,
		textBoxRef = p1.textBoxRef,
		ref = var2,
		composerDebug = p1.composerDebug,
		LayoutOrder = p1.LayoutOrder,
		trailingElement = reactModule.createElement(view, { tag = "auto-xy padding-x-xsmall padding-y-small" }, {
			Actions = reactModule.createElement(chatActionsRowModule, {
				isAssistantResponding = p1.isAssistantResponding,
				canStopAssistantResponse = p1.canStopAssistantResponse,
				canSendWhileResponding = p1.canSendWhileResponding,
				getIsComposerEmpty = var3.getIsComposerEmpty,
				isSendDisabled = var5,
				onSend = var7,
				onStop = p1.onStop
			})
		})
	})
end