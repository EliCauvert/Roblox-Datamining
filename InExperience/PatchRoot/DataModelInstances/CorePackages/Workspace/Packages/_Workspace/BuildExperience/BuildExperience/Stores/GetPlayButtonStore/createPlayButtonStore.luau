local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(BuildExperience.Chat.chatTypes)

return function() --[[ Line: 26 | Named "createPlayButtonStore" ]]
	-- upvalues: SignalsModule (copy), SignalsReactModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(false)
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	local Signal3, Signal2_2 = SignalsModule.createSignal(nil)
	
	return {
		getIsActive = Signal,
		useIsActive = function() --[[ Line: 32 ]]
			-- upvalues: SignalsReactModule (upval), Signal (copy)
			return SignalsReactModule.useSignalState(Signal)
		end,
		setIsActive = Signal2,
		getResumeTarget = Signal1,
		useResumeTarget = function() --[[ Line: 36 ]]
			-- upvalues: SignalsReactModule (upval), Signal1 (copy)
			return SignalsReactModule.useSignalState(Signal1)
		end,
		setResumeTarget = Signal2_1,
		getPendingResourceAttachment = Signal3,
		setPendingResourceAttachment = Signal2_2
	}
end