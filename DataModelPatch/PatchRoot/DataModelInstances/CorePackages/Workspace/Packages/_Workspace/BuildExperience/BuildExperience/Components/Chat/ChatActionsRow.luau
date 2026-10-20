local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local IconButton = FoundationModule.IconButton
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local InputSize = FoundationModule.Enums.InputSize

local function constantSource(): number
	return 0
end

return function(Frame)
	-- upvalues: ReactModule (copy), constantSource (copy), SignalsReactModule (copy), IconButton (copy), IconName (copy), InputSize (copy), ButtonVariant (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useCallback(function(Callback: (any) -> ())
		-- upvalues: Frame (copy), constantSource (upval)
		if Frame.getIsComposerEmpty ~= nil then
			return Frame.getIsComposerEmpty(Callback)
		end
		if typeof(Callback) == "function" then
			Callback(constantSource)
		end
		return Frame.isComposerEmpty == true
	end, { Frame.getIsComposerEmpty, Frame.isComposerEmpty })))
	local Inverted: boolean = Frame.isAssistantResponding and (Frame.canStopAssistantResponse ~= false and not (Frame.canSendWhileResponding == true and not UseSignalStateResult))
	
	return ReactModule.createElement(IconButton, {
		isCircular = true,
		LayoutOrder = Frame.LayoutOrder,
		icon = if Inverted then IconName.StopSmall else IconName.ArrowWideShortUp,
		size = InputSize.Small,
		variant = if Inverted then ButtonVariant.Standard elseif UseSignalStateResult then ButtonVariant.Standard else ButtonVariant.Emphasis,
		isDisabled = not Inverted and (UseSignalStateResult or Frame.isSendDisabled == true),
		onActivated = function()
			-- upvalues: Inverted (copy), Frame (copy)
			if Inverted then
				Frame.onStop()
				
				return
			else
				Frame.onSend()
			end
		end
	})
end