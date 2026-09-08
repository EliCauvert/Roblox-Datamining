local signalsModule = require(script:FindFirstAncestor("BuildExperience").Parent.Signals)
local _ = require(script.Parent.chatTypes)

return function()
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal({
		submittedToolCallIds = {},
		askUserByToolCallId = {},
		planByToolCallId = {},
		devProductByToolCallId = {}
	})
	local var3, var4 = signalsModule.createSignal({
		onAnswerSelectedByToolCallId = {},
		onAnswerConfirmedByToolCallId = {},
		onPlanAcceptedByToolCallId = {},
		onDevProductApprovedByToolCallId = {},
		onDevProductRejectedByToolCallId = {}
	})
	
	local function updateOptimistic(p1)
		-- upvalues: var1 (ref), var2 (ref)
		local var5 = var1(false)
		local t = {
			submittedToolCallIds = table.clone(var5.submittedToolCallIds),
			askUserByToolCallId = table.clone(var5.askUserByToolCallId),
			planByToolCallId = table.clone(var5.planByToolCallId),
			devProductByToolCallId = table.clone(var5.devProductByToolCallId)
		}
		p1(t)
		var2(t)
	end
	
	local function updateActions(p1)
		-- upvalues: var3 (ref), var4 (ref)
		local var5 = var3(false)
		local t = {
			onAnswerSelectedByToolCallId = table.clone(var5.onAnswerSelectedByToolCallId),
			onAnswerConfirmedByToolCallId = table.clone(var5.onAnswerConfirmedByToolCallId),
			onPlanAcceptedByToolCallId = table.clone(var5.onPlanAcceptedByToolCallId),
			onDevProductApprovedByToolCallId = table.clone(var5.onDevProductApprovedByToolCallId),
			onDevProductRejectedByToolCallId = table.clone(var5.onDevProductRejectedByToolCallId)
		}
		p1(t)
		var4(t)
	end
	
	return {
		getOptimisticLocalTools = var1,
		getLocalToolActions = var3,
		markSubmitted = function(p1)
			-- upvalues: updateOptimistic (ref)
			updateOptimistic(function(p2)
				-- upvalues: p1 (ref)
				p2.submittedToolCallIds[p1] = true
			end)
		end,
		clearSubmitted = function(p1)
			-- upvalues: updateOptimistic (ref)
			updateOptimistic(function(p2)
				-- upvalues: p1 (ref)
				p2.submittedToolCallIds[p1] = nil
			end)
		end,
		setAskUserTool = function(value)
			-- upvalues: updateOptimistic (ref)
			updateOptimistic(function(p1)
				-- upvalues: value (ref)
				p1.askUserByToolCallId[value.toolCallId] = value
			end)
		end,
		removeAskUserTool = function(p1)
			-- upvalues: updateOptimistic (ref)
			updateOptimistic(function(p2)
				-- upvalues: p1 (ref)
				p2.askUserByToolCallId[p1] = nil
			end)
		end,
		setPlanTool = function(value)
			-- upvalues: updateOptimistic (ref)
			updateOptimistic(function(p1)
				-- upvalues: value (ref)
				p1.planByToolCallId[value.toolCallId] = value
			end)
		end,
		removePlanTool = function(p1)
			-- upvalues: updateOptimistic (ref)
			updateOptimistic(function(p2)
				-- upvalues: p1 (ref)
				p2.planByToolCallId[p1] = nil
			end)
		end,
		setAnswerAction = function(value, p1, p2)
			-- upvalues: updateActions (ref)
			updateActions(function(p3)
				-- upvalues: value (ref), p1 (ref), p2 (ref)
				p3.onAnswerSelectedByToolCallId[value] = p1
				
				if p2 == nil then
					p3.onAnswerConfirmedByToolCallId[value] = nil
					
					return
				end
				p3.onAnswerConfirmedByToolCallId[value] = p2
			end)
		end,
		removeAnswerAction = function(p1)
			-- upvalues: updateActions (ref)
			updateActions(function(p2)
				-- upvalues: p1 (ref)
				p2.onAnswerSelectedByToolCallId[p1] = nil
				p2.onAnswerConfirmedByToolCallId[p1] = nil
			end)
		end,
		setPlanAction = function(value, p1)
			-- upvalues: updateActions (ref)
			updateActions(function(p2)
				-- upvalues: value (ref), p1 (ref)
				p2.onPlanAcceptedByToolCallId[value] = p1
			end)
		end,
		removePlanAction = function(p1)
			-- upvalues: updateActions (ref)
			updateActions(function(p2)
				-- upvalues: p1 (ref)
				p2.onPlanAcceptedByToolCallId[p1] = nil
			end)
		end,
		setDevProductTool = function(value)
			-- upvalues: updateOptimistic (ref)
			updateOptimistic(function(p1)
				-- upvalues: value (ref)
				p1.devProductByToolCallId[value.toolCallId] = value
			end)
		end,
		removeDevProductTool = function(p1)
			-- upvalues: updateOptimistic (ref)
			updateOptimistic(function(p2)
				-- upvalues: p1 (ref)
				p2.devProductByToolCallId[p1] = nil
			end)
		end,
		setDevProductAction = function(value, p1, p2)
			-- upvalues: updateActions (ref)
			updateActions(function(p3)
				-- upvalues: value (ref), p1 (ref), p2 (ref)
				p3.onDevProductApprovedByToolCallId[value] = p1
				p3.onDevProductRejectedByToolCallId[value] = p2
			end)
		end,
		removeDevProductAction = function(p1)
			-- upvalues: updateActions (ref)
			updateActions(function(p2)
				-- upvalues: p1 (ref)
				p2.onDevProductApprovedByToolCallId[p1] = nil
				p2.onDevProductRejectedByToolCallId[p1] = nil
			end)
		end
	}
end