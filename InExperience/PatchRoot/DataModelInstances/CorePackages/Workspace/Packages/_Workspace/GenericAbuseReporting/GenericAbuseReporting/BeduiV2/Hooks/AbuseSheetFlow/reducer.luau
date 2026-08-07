local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local httpService = game:GetService("HttpService")
local localPlayer = game:GetService("Players").LocalPlayer
local dashModule = require(parent.Dash)
local _ = require(script.Parent.AbuseSheetFlowTypes)
local fFlagAbuseReportMenuV2 = require(parent.SharedFlags).FFlagAbuseReportMenuV2
local fFlagAbuseReportInlineAlertStateOutsideReducerModule = require(genericAbuseReporting.Flags.FFlagAbuseReportInlineAlertStateOutsideReducer)

local function getInitialState(p0, p1, p2) --[[ line: 36 ]]
	-- upvalues: localPlayer (ref), fFlagAbuseReportMenuV2 (ref)
	return {
		navigationState = "idle",
		submissionState = "idle",
		pendingInlineAlert = nil,
		runId = p0,
		userId = if localPlayer then localPlayer.UserId else 0,
		stack = {
			{
				nodeId = if fFlagAbuseReportMenuV2 then p2 else "root",
				store = {},
				enterTime = p1
			}
		},
		openTime = p1
	}
end

return {
	getInitialState = getInitialState,
	getNewRunId = function() --[[ line: 89 ]]
		-- upvalues: httpService (ref)
		return httpService:GenerateGUID(false)
	end,
	selectStore = function(p3) --[[ line: 93 ]]
		local t = {}
		
		for i, v in p3.stack do
			if v.store then
				for i_1, v_1 in v.store do
					t[i_1] = v_1
				end
			end
		end
		return t
	end,
	reducer = function(p4, p5) --[[ line: 105 ]]
		-- upvalues: dashModule (ref), fFlagAbuseReportMenuV2 (ref), fFlagAbuseReportInlineAlertStateOutsideReducerModule (ref), getInitialState (ref)
		local cloned = nil
		
		if p5.type == "gotoNode" then
			if not p5.payload or not p5.payload.nodeId then
				error(`gotoNode action requires payload.nodeId, got: {dashModule.pretty(p5, { depth = 5 })}`)
			end
			local cloned_1 = table.clone(p4.stack)
			table.insert(cloned_1, {
				nodeId = p5.payload.nodeId,
				store = {},
				enterTime = p5.payload.enterTime
			})
			cloned = dashModule.join(p4, {
				navigationState = "idle",
				lastNavigationDirection = "forward",
				stack = cloned_1
			})
			
			if fFlagAbuseReportMenuV2 and not fFlagAbuseReportInlineAlertStateOutsideReducerModule then
				cloned.pendingInlineAlert = p5.payload.inlineAlert
				
				return cloned
			end
		elseif p5.type == "replaceAndGotoNode" then
			local var8 = dashModule.last(p4.stack)
			
			if not var8 then
				error("Stack is empty, cannot replace and go to node")
			end
			local var9 = dashModule.slice(p4.stack, 1, #p4.stack - 1)
			table.insert(var9, {
				nodeId = p5.payload.nodeId,
				store = var8.store,
				enterTime = p5.payload.enterTime
			})
			cloned = dashModule.join(p4, {
				navigationState = "idle",
				lastNavigationDirection = "forward",
				stack = var9
			})
			
			if fFlagAbuseReportMenuV2 and not fFlagAbuseReportInlineAlertStateOutsideReducerModule then
				cloned.pendingInlineAlert = p5.payload.inlineAlert
				
				return cloned
			end
		elseif p5.type == "goBack" then
			if #p4.stack <= 1 then
				warn("Cannot go back from stack with only one or zero items")
				
				return p4
			end
			cloned = dashModule.join(p4, {
				lastNavigationDirection = "back",
				stack = dashModule.slice(p4.stack, 1, #p4.stack - 1)
			})
			
			if fFlagAbuseReportMenuV2 and not fFlagAbuseReportInlineAlertStateOutsideReducerModule then
				cloned.pendingInlineAlert = nil
				
				return cloned
			end
		elseif p5.type == "updateDataAndNavigateNext" then
			local var10 = dashModule.last(p4.stack)
			
			if not var10 then
				error("Stack is empty, cannot update data")
			end
			if fFlagAbuseReportMenuV2 then
				if p5.payload.expectedFromNodeId and p5.payload.expectedFromNodeId ~= var10.nodeId then
					return p4
				elseif p4.navigationState == "idle" then
					local var11 = dashModule.slice(p4.stack, 1, #p4.stack - 1)
					table.insert(var11, dashModule.join(var10, { store = dashModule.join(var10.store, p5.payload.store) }))
					cloned = dashModule.join(p4, { navigationState = "gotoNext", stack = var11 })
					
					return cloned
				else
					return p4
				end
			end
		elseif p5.type == "startedSubmission" then
			cloned = dashModule.join(p4, { submissionState = "submitting" })
			
			return cloned
		elseif p5.type == "completedSubmission" then
			cloned = dashModule.join(p4, { submissionState = "completed" })
			
			return cloned
		elseif p5.type == "submissionFailed" then
			cloned = dashModule.join(p4, { submissionState = "failed" })
			
			return cloned
		elseif p5.type == "reset" then
			cloned = getInitialState(p5.payload.runId, p5.payload.initialEnterTime, p5.payload.startNodeId)
			
			if fFlagAbuseReportMenuV2 and not fFlagAbuseReportInlineAlertStateOutsideReducerModule then
				cloned.pendingInlineAlert = p5.payload.inlineAlert
				
				return cloned
			end
		elseif fFlagAbuseReportMenuV2 and p5.type == "clearInlineAlert" then
			cloned = table.clone(p4)
			
			if fFlagAbuseReportInlineAlertStateOutsideReducerModule then
				return cloned
			else
				cloned.pendingInlineAlert = nil
				
				return cloned
			end
		else
			error("Unknown action type: " .. tostring(p5.type))
		end
	end
}