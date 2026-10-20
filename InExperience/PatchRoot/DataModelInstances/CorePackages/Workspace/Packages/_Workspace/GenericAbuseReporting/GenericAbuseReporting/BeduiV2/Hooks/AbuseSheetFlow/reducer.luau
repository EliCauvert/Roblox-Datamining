local HttpService = game:GetService("HttpService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local DashModule = require(script:FindFirstAncestor("GenericAbuseReporting").Parent.Dash)
local _ = require(script.Parent.AbuseSheetFlowTypes)

local function getInitialState(RunId, EnterTime, NodeId)
	-- upvalues: LocalPlayer (copy)
	return {
		navigationState = "idle",
		submissionState = "idle",
		runId = RunId,
		userId = if LocalPlayer then LocalPlayer.UserId else 0,
		stack = { { nodeId = NodeId, store = {}, enterTime = EnterTime } },
		openTime = EnterTime
	}
end

return {
	getInitialState = getInitialState,
	getNewRunId = function()
		-- upvalues: HttpService (copy)
		return HttpService:GenerateGUID(false)
	end,
	selectStore = function(p1)
		local t = {}
		
		for _, value in p1.stack do
			if value.store then
				for i, value1 in value.store do
					t[i] = value1
				end
			end
		end
		return t
	end,
	reducer = function(InitialState, p2)
		-- upvalues: DashModule (copy), getInitialState (copy)
		local JoinResult = nil
		
		if p2.type == "gotoNode" then
			if not p2.payload or not p2.payload.nodeId then
				error(`gotoNode action requires payload.nodeId, got: {DashModule.pretty(p2, { depth = 5 })}`)
			end
			local Copy = table.clone(InitialState.stack)
			table.insert(Copy, {
				nodeId = p2.payload.nodeId,
				store = {},
				enterTime = p2.payload.enterTime
			})
			JoinResult = DashModule.join(InitialState, {
				navigationState = "idle",
				lastNavigationDirection = "forward",
				stack = Copy
			})
			
			return JoinResult
		elseif p2.type == "replaceAndGotoNode" then
			local LastResult = DashModule.last(InitialState.stack)
			
			if not LastResult then
				error("Stack is empty, cannot replace and go to node")
			end
			local SliceResult = DashModule.slice(InitialState.stack, 1, #InitialState.stack - 1)
			table.insert(SliceResult, {
				nodeId = p2.payload.nodeId,
				store = LastResult.store,
				enterTime = p2.payload.enterTime
			})
			JoinResult = DashModule.join(InitialState, {
				navigationState = "idle",
				lastNavigationDirection = "forward",
				stack = SliceResult
			})
			
			return JoinResult
		elseif p2.type ~= "goBack" then
			if p2.type == "updateDataAndNavigateNext" then
				local LastResult = DashModule.last(InitialState.stack)
				
				if not LastResult then
					error("Stack is empty, cannot update data")
				end
				if p2.payload.expectedFromNodeId ~= LastResult.nodeId then
					return InitialState
				elseif InitialState.navigationState == "idle" then
					local SliceResult = DashModule.slice(InitialState.stack, 1, #InitialState.stack - 1)
					table.insert(SliceResult, (DashModule.join(LastResult, {
						store = DashModule.join(LastResult.store, p2.payload.store)
					})))
					JoinResult = DashModule.join(InitialState, { navigationState = "gotoNext", stack = SliceResult })
					
					return JoinResult
				else
					return InitialState
				end
			elseif p2.type == "navigateFailure" then
				local LastResult = DashModule.last(InitialState.stack)
				
				if not LastResult then
					error("Stack is empty, cannot navigate after failure")
				end
				if p2.payload.expectedFromNodeId ~= LastResult.nodeId then
					return InitialState
				elseif InitialState.navigationState == "idle" then
					JoinResult = DashModule.join(InitialState, { navigationState = "gotoFailure" })
					
					return JoinResult
				else
					return InitialState
				end
			elseif p2.type == "startedSubmission" then
				JoinResult = DashModule.join(InitialState, { submissionState = "submitting" })
				
				return JoinResult
			elseif p2.type == "completedSubmission" then
				JoinResult = DashModule.join(InitialState, { submissionState = "completed" })
				
				return JoinResult
			elseif p2.type == "submissionFailed" then
				JoinResult = DashModule.join(InitialState, { submissionState = "failed" })
				
				return JoinResult
			elseif p2.type == "reset" then
				JoinResult = getInitialState(p2.payload.runId, p2.payload.initialEnterTime, p2.payload.startNodeId)
				
				return JoinResult
			else
				error("Unknown action type: " .. tostring(p2.type))
				
				return JoinResult
			end
		elseif #InitialState.stack <= 1 then
			warn("Cannot go back from stack with only one or zero items")
			
			return InitialState
		else
			JoinResult = DashModule.join(InitialState, {
				lastNavigationDirection = "back",
				stack = DashModule.slice(InitialState.stack, 1, #InitialState.stack - 1)
			})
			
			return JoinResult
		end
	end
}