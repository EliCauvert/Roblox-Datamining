local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local httpService = game:GetService("HttpService")
local localPlayer = game:GetService("Players").LocalPlayer
local dashModule = require(parent.Dash)
local _ = require(script.Parent.AbuseSheetFlowTypes)
local fFlagAbuseReportMenuV2 = require(parent.SharedFlags).FFlagAbuseReportMenuV2
local fFlagAbuseReportInlineAlertStateOutsideReducerModule = require(genericAbuseReporting.Flags.FFlagAbuseReportInlineAlertStateOutsideReducer)

local function getInitialState(p1, p2, p3)
	-- upvalues: localPlayer (ref), fFlagAbuseReportMenuV2 (ref)
	return {
		navigationState = "idle",
		submissionState = "idle",
		pendingInlineAlert = nil,
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
	reducer = function(p2, p3)
		-- upvalues: dashModule (ref), fFlagAbuseReportMenuV2 (ref), fFlagAbuseReportInlineAlertStateOutsideReducerModule (ref), getInitialState (ref)
		local cloned = nil
		
		if p3.type == "gotoNode" then
			if not p3.payload or not p3.payload.nodeId then
				error(`gotoNode action requires payload.nodeId, got: {dashModule.pretty(p3, { depth = 5 })}`)
			end
			local cloned_1 = table.clone(p2.stack)
			table.insert(cloned_1, {
				nodeId = p3.payload.nodeId,
				store = {},
				enterTime = p3.payload.enterTime
			})
			cloned = dashModule.join(p2, {
				navigationState = "idle",
				lastNavigationDirection = "forward",
				stack = cloned_1
			})
			
			if fFlagAbuseReportMenuV2 and not fFlagAbuseReportInlineAlertStateOutsideReducerModule then
				cloned.pendingInlineAlert = p3.payload.inlineAlert
				
				return cloned
			end
		elseif p3.type == "replaceAndGotoNode" then
			local var1 = dashModule.last(p2.stack)
			
			if not var1 then
				error("Stack is empty, cannot replace and go to node")
			end
			local var2 = dashModule.slice(p2.stack, 1, #p2.stack - 1)
			table.insert(var2, {
				nodeId = p3.payload.nodeId,
				store = var1.store,
				enterTime = p3.payload.enterTime
			})
			cloned = dashModule.join(p2, {
				navigationState = "idle",
				lastNavigationDirection = "forward",
				stack = var2
			})
			
			if fFlagAbuseReportMenuV2 and not fFlagAbuseReportInlineAlertStateOutsideReducerModule then
				cloned.pendingInlineAlert = p3.payload.inlineAlert
				
				return cloned
			end
		elseif p3.type == "goBack" then
			if #p2.stack <= 1 then
				warn("Cannot go back from stack with only one or zero items")
				
				return p2
			end
			cloned = dashModule.join(p2, {
				lastNavigationDirection = "back",
				stack = dashModule.slice(p2.stack, 1, #p2.stack - 1)
			})
			
			if fFlagAbuseReportMenuV2 and not fFlagAbuseReportInlineAlertStateOutsideReducerModule then
				cloned.pendingInlineAlert = nil
				
				return cloned
			end
		elseif p3.type == "updateDataAndNavigateNext" then
			local var3 = dashModule.last(p2.stack)
			
			if not var3 then
				error("Stack is empty, cannot update data")
			end
			if fFlagAbuseReportMenuV2 then
				if p3.payload.expectedFromNodeId and p3.payload.expectedFromNodeId ~= var3.nodeId then
					return p2
				elseif p2.navigationState == "idle" then
					local var4 = dashModule.slice(p2.stack, 1, #p2.stack - 1)
					table.insert(var4, dashModule.join(var3, { store = dashModule.join(var3.store, p3.payload.store) }))
					cloned = dashModule.join(p2, { navigationState = "gotoNext", stack = var4 })
					
					return cloned
				else
					return p2
				end
			end
		elseif p3.type == "navigateFailure" then
			local var5 = dashModule.last(p2.stack)
			
			if not var5 then
				error("Stack is empty, cannot navigate after failure")
			end
			if p3.payload.expectedFromNodeId ~= var5.nodeId then
				return p2
			elseif p2.navigationState == "idle" then
				cloned = dashModule.join(p2, { navigationState = "gotoFailure" })
				
				return cloned
			end
			return p2
		elseif p3.type == "startedSubmission" then
			cloned = dashModule.join(p2, { submissionState = "submitting" })
			
			return cloned
		elseif p3.type == "completedSubmission" then
			cloned = dashModule.join(p2, { submissionState = "completed" })
			
			return cloned
		elseif p3.type == "submissionFailed" then
			cloned = dashModule.join(p2, { submissionState = "failed" })
			
			return cloned
		elseif p3.type == "reset" then
			cloned = getInitialState(p3.payload.runId, p3.payload.initialEnterTime, p3.payload.startNodeId)
			
			if fFlagAbuseReportMenuV2 and not fFlagAbuseReportInlineAlertStateOutsideReducerModule then
				cloned.pendingInlineAlert = p3.payload.inlineAlert
				
				return cloned
			end
		elseif fFlagAbuseReportMenuV2 and p3.type == "clearInlineAlert" then
			cloned = table.clone(p2)
			
			if fFlagAbuseReportInlineAlertStateOutsideReducerModule then
				return cloned
			else
				cloned.pendingInlineAlert = nil
				
				return cloned
			end
		else
			error("Unknown action type: " .. tostring(p3.type))
		end
	end
}