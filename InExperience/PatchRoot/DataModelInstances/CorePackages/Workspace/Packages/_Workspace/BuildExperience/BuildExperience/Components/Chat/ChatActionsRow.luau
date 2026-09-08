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

return function(p1)
	-- upvalues: reactModule (ref), constantSource (ref), signalsReactModule (ref), iconButton (ref), iconName (ref), inputSize (ref), buttonVariant (ref)
	local var1 = signalsReactModule.useSignalState(reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), constantSource (copy)
		if p1.getIsComposerEmpty ~= nil then
			return p1.getIsComposerEmpty(p2)
		elseif typeof(p2) == "function" then
			p2(constantSource)
		end
		return p1.isComposerEmpty == true
	end, { p1.getIsComposerEmpty, p1.isComposerEmpty }))
	local var2 = p1.isAssistantResponding and (p1.canStopAssistantResponse ~= false and p1.canSendWhileResponding ~= true)
	local var3 = not var2
	
	if var3 and var1 then
		var3 = if p1.hasAttachments == true then p1.isSendDisabled == true else true
	end
	return reactModule.createElement(iconButton, {
		isCircular = true,
		LayoutOrder = p1.LayoutOrder,
		icon = if var2 then iconName.StopSmall else iconName.ArrowWideShortUp,
		size = inputSize.Small,
		variant = if var2 then buttonVariant.Standard elseif var1 and p1.hasAttachments ~= true then buttonVariant.Standard else buttonVariant.Emphasis,
		isDisabled = var3,
		onActivated = function()
			-- upvalues: var2 (ref), p1 (ref)
			if var2 then
				p1.onStop()
				
				return
			end
			p1.onSend()
		end
	})
end