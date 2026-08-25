local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local iconButton = foundationModule.IconButton
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local inputSize = foundationModule.Enums.InputSize

local function constantSource()
	return 0
end

return function(p0)
	-- upvalues: reactModule (ref), constantSource (ref), signalsReactModule (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref)
	local var4 = signalsReactModule.useSignalState(reactModule.useCallback(function(p1)
		-- upvalues: p0 (ref), constantSource (copy)
		if p0.getIsComposerEmpty ~= nil then
			return p0.getIsComposerEmpty(p1)
		elseif typeof(p1) == "function" then
			p1(constantSource)
		end
		return p0.isComposerEmpty == true
	end, { p0.getIsComposerEmpty, p0.isComposerEmpty }))
	local var5 = p0.isAssistantResponding and (p0.canStopAssistantResponse ~= false and p0.canSendWhileResponding ~= true)
	
	return reactModule.createElement(iconButton, {
		isCircular = true,
		LayoutOrder = p0.LayoutOrder,
		icon = if var5 then iconName.StopSmall else iconName.ArrowWideShortUp,
		size = inputSize.Small,
		variant = if var5 then buttonVariant.Standard elseif not var4 then buttonVariant.Emphasis else buttonVariant.Standard,
		isDisabled = not var5 and (var4 or p0.isSendDisabled == true),
		onActivated = function()
			-- upvalues: var5 (ref), p0 (ref)
			if var5 then
				p0.onStop()
				
				return
			end
			p0.onSend()
		end
	})
end