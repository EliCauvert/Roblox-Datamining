local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local UseFinishChatWindowMessageRenderIntervalsModule = require(ChatUIPrimitives.Hooks.useFinishChatWindowMessageRenderIntervals)
local _ = require(script.Parent.groupMessages)

return function(Callback)
	-- upvalues: ReactModule (copy), SignalsModule (copy), SignalsReactModule (copy), UseFinishChatWindowMessageRenderIntervalsModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), Callback (copy)
		return SignalsModule.createComputed(function(p1)
			-- upvalues: Callback (upval)
			return Callback(p1).id
		end)
	end, { Callback })))
	local UseFinishChatWindowMessageRenderIntervalsModuleResult = UseFinishChatWindowMessageRenderIntervalsModule((ReactModule.useCallback(function()
		-- upvalues: UseSignalStateResult (copy)
		return UseSignalStateResult
	end, { UseSignalStateResult })))
	ReactModule.useEffect(function()
		-- upvalues: UseFinishChatWindowMessageRenderIntervalsModuleResult (copy)
		UseFinishChatWindowMessageRenderIntervalsModuleResult()
	end, { UseFinishChatWindowMessageRenderIntervalsModuleResult })
end