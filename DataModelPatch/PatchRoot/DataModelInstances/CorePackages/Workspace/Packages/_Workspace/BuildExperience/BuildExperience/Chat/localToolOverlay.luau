local SignalsModule = require(script:FindFirstAncestor("BuildExperience").Parent.Signals)
local _ = require(script.Parent.chatTypes)

return function()
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal({
		submittedToolCallIds = {},
		askUserByToolCallId = {},
		planByToolCallId = {}
	})
	local Signal1, Signal2_1 = SignalsModule.createSignal({
		onAnswerSelectedByToolCallId = {},
		onAnswerConfirmedByToolCallId = {},
		onPlanAcceptedByToolCallId = {}
	})
	
	local function updateOptimistic(Callback: (any) -> ())
		-- upvalues: Signal (copy), Signal2 (copy)
		local SignalResult = Signal(false)
		local config = {
			submittedToolCallIds = table.clone(SignalResult.submittedToolCallIds),
			askUserByToolCallId = table.clone(SignalResult.askUserByToolCallId),
			planByToolCallId = table.clone(SignalResult.planByToolCallId)
		}
		Callback(config)
		Signal2(config)
	end
	
	local function updateActions(Callback: (any) -> ())
		-- upvalues: Signal1 (copy), Signal2_1 (copy)
		local SignalResult = Signal1(false)
		local config = {
			onAnswerSelectedByToolCallId = table.clone(SignalResult.onAnswerSelectedByToolCallId),
			onAnswerConfirmedByToolCallId = table.clone(SignalResult.onAnswerConfirmedByToolCallId),
			onPlanAcceptedByToolCallId = table.clone(SignalResult.onPlanAcceptedByToolCallId)
		}
		Callback(config)
		Signal2_1(config)
	end
	
	return {
		getOptimisticLocalTools = Signal,
		getLocalToolActions = Signal1,
		markSubmitted = function(p1)
			-- upvalues: updateOptimistic (copy)
			updateOptimistic(function(p2)
				-- upvalues: p1 (copy)
				p2.submittedToolCallIds[p1] = true
			end)
		end,
		setAskUserTool = function(p1)
			-- upvalues: updateOptimistic (copy)
			updateOptimistic(function(p2)
				-- upvalues: p1 (copy)
				p2.askUserByToolCallId[p1.toolCallId] = p1
			end)
		end,
		removeAskUserTool = function(p1)
			-- upvalues: updateOptimistic (copy)
			updateOptimistic(function(p2)
				-- upvalues: p1 (copy)
				p2.askUserByToolCallId[p1] = nil
			end)
		end,
		setPlanTool = function(p1)
			-- upvalues: updateOptimistic (copy)
			updateOptimistic(function(p2)
				-- upvalues: p1 (copy)
				p2.planByToolCallId[p1.toolCallId] = p1
			end)
		end,
		removePlanTool = function(p1)
			-- upvalues: updateOptimistic (copy)
			updateOptimistic(function(p2)
				-- upvalues: p1 (copy)
				p2.planByToolCallId[p1] = nil
			end)
		end,
		setAnswerAction = function(p1, p2, p3)
			-- upvalues: updateActions (copy)
			updateActions(function(p4)
				-- upvalues: p1 (copy), p2 (copy), p3 (copy)
				p4.onAnswerSelectedByToolCallId[p1] = p2
				
				if p3 == nil then
					p4.onAnswerConfirmedByToolCallId[p1] = nil
					
					return
				else
					p4.onAnswerConfirmedByToolCallId[p1] = p3
				end
			end)
		end,
		removeAnswerAction = function(p1)
			-- upvalues: updateActions (copy)
			updateActions(function(p2)
				-- upvalues: p1 (copy)
				p2.onAnswerSelectedByToolCallId[p1] = nil
				p2.onAnswerConfirmedByToolCallId[p1] = nil
			end)
		end,
		setPlanAction = function(p1, p2)
			-- upvalues: updateActions (copy)
			updateActions(function(p3)
				-- upvalues: p1 (copy), p2 (copy)
				p3.onPlanAcceptedByToolCallId[p1] = p2
			end)
		end,
		removePlanAction = function(p1)
			-- upvalues: updateActions (copy)
			updateActions(function(p2)
				-- upvalues: p1 (copy)
				p2.onPlanAcceptedByToolCallId[p1] = nil
			end)
		end
	}
end