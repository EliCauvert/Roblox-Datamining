local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local UseFinishChatWindowMessageRenderIntervalsModule = require(ChatUIPrimitives.Hooks.useFinishChatWindowMessageRenderIntervals)
local MessageRenderedContextModule = require(script.Parent.MessageRenderedContext)
local _ = require(script.Parent.groupMessages)

return function(p1)
	-- upvalues: ReactModule (copy), MessageRenderedContextModule (copy), SignalsModule (copy), SignalsReactModule (copy), UseFinishChatWindowMessageRenderIntervalsModule (copy)
	local ItemSignalFunction = p1.itemSignal
	local UseContextResult = ReactModule.useContext(MessageRenderedContextModule)
	local UseSignalStateResult = SignalsReactModule.useSignalState((ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), ItemSignalFunction (copy)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: ItemSignalFunction (upval)
			return ItemSignalFunction(p2).id
		end)
	end, { ItemSignalFunction })))
	local UseFinishChatWindowMessageRenderIntervalsModuleResult = UseFinishChatWindowMessageRenderIntervalsModule((ReactModule.useCallback(function()
		-- upvalues: UseSignalStateResult (copy)
		return UseSignalStateResult
	end, { UseSignalStateResult })))
	ReactModule.useEffect(function()
		-- upvalues: UseContextResult (copy), UseSignalStateResult (copy), UseFinishChatWindowMessageRenderIntervalsModuleResult (copy)
		if UseContextResult == nil then
			UseFinishChatWindowMessageRenderIntervalsModuleResult()
			
			return
		else
			UseContextResult(UseSignalStateResult)
		end
	end, {
		UseFinishChatWindowMessageRenderIntervalsModuleResult,
		UseContextResult,
		UseSignalStateResult
	})
	
	return nil
end