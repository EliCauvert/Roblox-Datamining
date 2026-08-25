local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local httpService = game:GetService("HttpService")
local localPlayer = game:GetService("Players").LocalPlayer
local dashModule = require(parent.Dash)
local _ = require(script.Parent.AbuseSheetFlowTypes)
local fFlagAbuseReportMenuV2 = require(parent.SharedFlags).FFlagAbuseReportMenuV2

local function getInitialState(p1, p2, p3)
	-- upvalues: localPlayer (ref), fFlagAbuseReportMenuV2 (ref)
	return {
		navigationState = "idle",
		submissionState = "idle",
		runId = p1,
		userId = if localPlayer then localPlayer.UserId else 0,
		stack = {
			{
				nodeId = if fFlagAbuseReportMenuV2 then p3 else "root",
				store = {},
				enterTime = p2
			}
		},
		openTime = p2
	}
end

return {
	getInitialState = getInitialState,
	getNewRunId = function()
		-- upvalues: httpService (ref)
		return httpService:GenerateGUID(false)
	end,
	selectStore = function(p1)
		local t = {}
		
		for i, v in p1.stack do
			if v.store then
				for i_1, v_1 in v.store do
					t[i_1] = v_1
				end
			end
		end
		return t
	end,
	reducer = function(p1, p2)
		-- upvalues: dashModule (ref), fFlagAbuseReportMenuV2 (ref), getInitialState (ref)
		local var1 = nil
		
		if p2.type == "gotoNode" then
			if not p2.payload or not p2.payload.nodeId then
				error(`gotoNode action requires payload.nodeId, got: {dashModule.pretty(p2, { depth = 5 })}`)
			end
			local cloned = table.clone(p1.stack)
			table.insert(cloned, {
				nodeId = p2.payload.nodeId,
				store = {},
				enterTime = p2.payload.enterTime
			})
			var1 = dashModule.join(p1, {
				navigationState = "idle",
				lastNavigationDirection = "forward",
				stack = cloned
			})
			
			return var1
		elseif p2.type == "replaceAndGotoNode" then
			local var2 = dashModule.last(p1.stack)
			
			if not var2 then
				error("Stack is empty, cannot replace and go to node")
			end
			local var3 = dashModule.slice(p1.stack, 1, #p1.stack - 1)
			table.insert(var3, {
				nodeId = p2.payload.nodeId,
				store = var2.store,
				enterTime = p2.payload.enterTime
			})
			var1 = dashModule.join(p1, {
				navigationState = "idle",
				lastNavigationDirection = "forward",
				stack = var3
			})
			
			return var1
		elseif p2.type == "goBack" then
			if #p1.stack <= 1 then
				warn("Cannot go back from stack with only one or zero items")
				
				return p1
			end
			var1 = dashModule.join(p1, {
				lastNavigationDirection = "back",
				stack = dashModule.slice(p1.stack, 1, #p1.stack - 1)
			})
			
			return var1
		elseif p2.type == "updateDataAndNavigateNext" then
			local var4 = dashModule.last(p1.stack)
			
			if not var4 then
				error("Stack is empty, cannot update data")
			end
			if fFlagAbuseReportMenuV2 then
				if p2.payload.expectedFromNodeId and p2.payload.expectedFromNodeId ~= var4.nodeId then
					return p1
				elseif p1.navigationState == "idle" then
					local var5 = dashModule.slice(p1.stack, 1, #p1.stack - 1)
					table.insert(var5, dashModule.join(var4, { store = dashModule.join(var4.store, p2.payload.store) }))
					var1 = dashModule.join(p1, { navigationState = "gotoNext", stack = var5 })
					
					return var1
				else
					return p1
				end
			end
		elseif p2.type == "navigateFailure" then
			local var6 = dashModule.last(p1.stack)
			
			if not var6 then
				error("Stack is empty, cannot navigate after failure")
			end
			if p2.payload.expectedFromNodeId ~= var6.nodeId then
				return p1
			elseif p1.navigationState == "idle" then
				var1 = dashModule.join(p1, { navigationState = "gotoFailure" })
				
				return var1
			end
			return p1
		elseif p2.type == "startedSubmission" then
			var1 = dashModule.join(p1, { submissionState = "submitting" })
			
			return var1
		elseif p2.type == "completedSubmission" then
			var1 = dashModule.join(p1, { submissionState = "completed" })
			
			return var1
		elseif p2.type == "submissionFailed" then
			var1 = dashModule.join(p1, { submissionState = "failed" })
			
			return var1
		elseif p2.type == "reset" then
			var1 = getInitialState(p2.payload.runId, p2.payload.initialEnterTime, p2.payload.startNodeId)
			
			return var1
		end
		error("Unknown action type: " .. tostring(p2.type))
		
		return var1
	end
}