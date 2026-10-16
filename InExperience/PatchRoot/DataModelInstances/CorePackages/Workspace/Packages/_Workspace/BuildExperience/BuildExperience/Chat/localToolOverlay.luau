local SignalsModule = require(script:FindFirstAncestor("BuildExperience").Parent.Signals)
local _ = require(script.Parent.chatTypes)

return function() --[[ Line: 44 | Named "createLocalToolOverlay" ]]
	-- upvalues: SignalsModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal({
		submittedToolCallIds = {},
		askUserByToolCallId = {},
		planByToolCallId = {},
		devProductByToolCallId = {}
	})
	local Signal1, Signal2_1 = SignalsModule.createSignal({
		onAnswerSelectedByToolCallId = {},
		onAnswerConfirmedByToolCallId = {},
		onPlanAcceptedByToolCallId = {},
		onDevProductApprovedByToolCallId = {},
		onDevProductRejectedByToolCallId = {}
	})
	
	local function updateOptimistic(Callback: (any) -> ()) --[[ Line: 59 ]]
		-- upvalues: Signal (copy), Signal2 (copy)
		local SignalResult = Signal(false)
		local config = {
			submittedToolCallIds = table.clone(SignalResult.submittedToolCallIds),
			askUserByToolCallId = table.clone(SignalResult.askUserByToolCallId),
			planByToolCallId = table.clone(SignalResult.planByToolCallId),
			devProductByToolCallId = table.clone(SignalResult.devProductByToolCallId)
		}
		Callback(config)
		Signal2(config)
	end
	
	local function updateActions(Callback: (any) -> ()) --[[ Line: 71 ]]
		-- upvalues: Signal1 (copy), Signal2_1 (copy)
		local SignalResult = Signal1(false)
		local config = {
			onAnswerSelectedByToolCallId = table.clone(SignalResult.onAnswerSelectedByToolCallId),
			onAnswerConfirmedByToolCallId = table.clone(SignalResult.onAnswerConfirmedByToolCallId),
			onPlanAcceptedByToolCallId = table.clone(SignalResult.onPlanAcceptedByToolCallId),
			onDevProductApprovedByToolCallId = table.clone(SignalResult.onDevProductApprovedByToolCallId),
			onDevProductRejectedByToolCallId = table.clone(SignalResult.onDevProductRejectedByToolCallId)
		}
		Callback(config)
		Signal2_1(config)
	end
	
	return {
		getOptimisticLocalTools = Signal,
		getLocalToolActions = Signal1,
		markSubmitted = function(p1) --[[ Line: 87 ]]
			-- upvalues: updateOptimistic (copy)
			updateOptimistic(function(p2) --[[ Line: 88 ]]
				-- upvalues: p1 (copy)
				p2.submittedToolCallIds[p1] = true
			end)
		end,
		clearSubmitted = function(p1) --[[ Line: 92 ]]
			-- upvalues: updateOptimistic (copy)
			updateOptimistic(function(p2) --[[ Line: 93 ]]
				-- upvalues: p1 (copy)
				p2.submittedToolCallIds[p1] = nil
			end)
		end,
		setAskUserTool = function(p1) --[[ Line: 97 ]]
			-- upvalues: updateOptimistic (copy)
			updateOptimistic(function(p2) --[[ Line: 98 ]]
				-- upvalues: p1 (copy)
				p2.askUserByToolCallId[p1.toolCallId] = p1
			end)
		end,
		removeAskUserTool = function(p1) --[[ Line: 102 ]]
			-- upvalues: updateOptimistic (copy)
			updateOptimistic(function(p2) --[[ Line: 103 ]]
				-- upvalues: p1 (copy)
				p2.askUserByToolCallId[p1] = nil
			end)
		end,
		setPlanTool = function(p1) --[[ Line: 107 ]]
			-- upvalues: updateOptimistic (copy)
			updateOptimistic(function(p2) --[[ Line: 108 ]]
				-- upvalues: p1 (copy)
				p2.planByToolCallId[p1.toolCallId] = p1
			end)
		end,
		removePlanTool = function(p1) --[[ Line: 112 ]]
			-- upvalues: updateOptimistic (copy)
			updateOptimistic(function(p2) --[[ Line: 113 ]]
				-- upvalues: p1 (copy)
				p2.planByToolCallId[p1] = nil
			end)
		end,
		setAnswerAction = function(p1, p2, p3) --[[ Line: 117 ]]
			-- upvalues: updateActions (copy)
			updateActions(function(p4) --[[ Line: 118 ]]
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
		removeAnswerAction = function(p1) --[[ Line: 127 ]]
			-- upvalues: updateActions (copy)
			updateActions(function(p2) --[[ Line: 128 ]]
				-- upvalues: p1 (copy)
				p2.onAnswerSelectedByToolCallId[p1] = nil
				p2.onAnswerConfirmedByToolCallId[p1] = nil
			end)
		end,
		setPlanAction = function(p1, p2) --[[ Line: 133 ]]
			-- upvalues: updateActions (copy)
			updateActions(function(p3) --[[ Line: 134 ]]
				-- upvalues: p1 (copy), p2 (copy)
				p3.onPlanAcceptedByToolCallId[p1] = p2
			end)
		end,
		removePlanAction = function(p1) --[[ Line: 138 ]]
			-- upvalues: updateActions (copy)
			updateActions(function(p2) --[[ Line: 139 ]]
				-- upvalues: p1 (copy)
				p2.onPlanAcceptedByToolCallId[p1] = nil
			end)
		end,
		setDevProductTool = function(p1) --[[ Line: 143 ]]
			-- upvalues: updateOptimistic (copy)
			updateOptimistic(function(p2) --[[ Line: 144 ]]
				-- upvalues: p1 (copy)
				p2.devProductByToolCallId[p1.toolCallId] = p1
			end)
		end,
		removeDevProductTool = function(p1) --[[ Line: 148 ]]
			-- upvalues: updateOptimistic (copy)
			updateOptimistic(function(p2) --[[ Line: 149 ]]
				-- upvalues: p1 (copy)
				p2.devProductByToolCallId[p1] = nil
			end)
		end,
		setDevProductAction = function(p1, p2, p3) --[[ Line: 153 ]]
			-- upvalues: updateActions (copy)
			updateActions(function(p4) --[[ Line: 154 ]]
				-- upvalues: p1 (copy), p2 (copy), p3 (copy)
				p4.onDevProductApprovedByToolCallId[p1] = p2
				p4.onDevProductRejectedByToolCallId[p1] = p3
			end)
		end,
		removeDevProductAction = function(p1) --[[ Line: 159 ]]
			-- upvalues: updateActions (copy)
			updateActions(function(p2) --[[ Line: 160 ]]
				-- upvalues: p1 (copy)
				p2.onDevProductApprovedByToolCallId[p1] = nil
				p2.onDevProductRejectedByToolCallId[p1] = nil
			end)
		end
	}
end