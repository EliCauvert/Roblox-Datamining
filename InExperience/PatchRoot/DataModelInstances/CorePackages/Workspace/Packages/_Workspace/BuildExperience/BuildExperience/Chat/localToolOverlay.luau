local signalsModule = require(script:FindFirstAncestor("BuildExperience").Parent.Signals)
local _ = require(script.Parent.chatTypes)

return function() --[[ line: 38 | named "createLocalToolOverlay" ]]
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal({
		submittedToolCallIds = {},
		askUserByToolCallId = {},
		planByToolCallId = {}
	})
	local var3, var4 = signalsModule.createSignal({
		onAnswerSelectedByToolCallId = {},
		onAnswerConfirmedByToolCallId = {},
		onPlanAcceptedByToolCallId = {}
	})
	
	local function updateOptimistic(p0) --[[ line: 50 ]]
		-- upvalues: var1 (ref), var2 (ref)
		local var7 = var1(false)
		local t = {
			submittedToolCallIds = table.clone(var7.submittedToolCallIds),
			askUserByToolCallId = table.clone(var7.askUserByToolCallId),
			planByToolCallId = table.clone(var7.planByToolCallId)
		}
		p0(t)
		var2(t)
	end
	
	local function updateActions(p1) --[[ line: 61 ]]
		-- upvalues: var3 (ref), var4 (ref)
		local var9 = var3(false)
		local t = {
			onAnswerSelectedByToolCallId = table.clone(var9.onAnswerSelectedByToolCallId),
			onAnswerConfirmedByToolCallId = table.clone(var9.onAnswerConfirmedByToolCallId),
			onPlanAcceptedByToolCallId = table.clone(var9.onPlanAcceptedByToolCallId)
		}
		p1(t)
		var4(t)
	end
	
	return {
		getOptimisticLocalTools = var1,
		getLocalToolActions = var3,
		markSubmitted = function(p2) --[[ line: 75 ]]
			-- upvalues: updateOptimistic (ref)
			updateOptimistic(function(p3) --[[ line: 76 ]]
				-- upvalues: p2 (ref)
				p3.submittedToolCallIds[p2] = true
			end)
		end,
		setAskUserTool = function(value) --[[ line: 80 ]]
			-- upvalues: updateOptimistic (ref)
			updateOptimistic(function(p4) --[[ line: 81 ]]
				-- upvalues: value (ref)
				p4.askUserByToolCallId[value.toolCallId] = value
			end)
		end,
		removeAskUserTool = function(p5) --[[ line: 85 ]]
			-- upvalues: updateOptimistic (ref)
			updateOptimistic(function(p6) --[[ line: 86 ]]
				-- upvalues: p5 (ref)
				p6.askUserByToolCallId[p5] = nil
			end)
		end,
		setPlanTool = function(value) --[[ line: 90 ]]
			-- upvalues: updateOptimistic (ref)
			updateOptimistic(function(p7) --[[ line: 91 ]]
				-- upvalues: value (ref)
				p7.planByToolCallId[value.toolCallId] = value
			end)
		end,
		removePlanTool = function(p8) --[[ line: 95 ]]
			-- upvalues: updateOptimistic (ref)
			updateOptimistic(function(p9) --[[ line: 96 ]]
				-- upvalues: p8 (ref)
				p9.planByToolCallId[p8] = nil
			end)
		end,
		setAnswerAction = function(value, p10, p11) --[[ line: 100 ]]
			-- upvalues: updateActions (ref)
			updateActions(function(p12) --[[ line: 101 ]]
				-- upvalues: value (ref), p10 (ref), p11 (ref)
				p12.onAnswerSelectedByToolCallId[value] = p10
				
				if p11 == nil then
					p12.onAnswerConfirmedByToolCallId[value] = nil
					
					return
				end
				p12.onAnswerConfirmedByToolCallId[value] = p11
			end)
		end,
		removeAnswerAction = function(p13) --[[ line: 110 ]]
			-- upvalues: updateActions (ref)
			updateActions(function(p14) --[[ line: 111 ]]
				-- upvalues: p13 (ref)
				p14.onAnswerSelectedByToolCallId[p13] = nil
				p14.onAnswerConfirmedByToolCallId[p13] = nil
			end)
		end,
		setPlanAction = function(value, p15) --[[ line: 116 ]]
			-- upvalues: updateActions (ref)
			updateActions(function(p16) --[[ line: 117 ]]
				-- upvalues: value (ref), p15 (ref)
				p16.onPlanAcceptedByToolCallId[value] = p15
			end)
		end,
		removePlanAction = function(p17) --[[ line: 121 ]]
			-- upvalues: updateActions (ref)
			updateActions(function(p18) --[[ line: 122 ]]
				-- upvalues: p17 (ref)
				p18.onPlanAcceptedByToolCallId[p17] = nil
			end)
		end
	}
end