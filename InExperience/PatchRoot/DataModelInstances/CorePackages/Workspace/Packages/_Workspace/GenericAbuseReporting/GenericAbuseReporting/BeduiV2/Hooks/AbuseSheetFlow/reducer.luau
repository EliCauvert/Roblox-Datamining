local genericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local parent = genericAbuseReporting.Parent
local httpService = game:GetService("HttpService")
local localPlayer = game:GetService("Players").LocalPlayer
local dashModule = require(parent.Dash)
local _ = require(script.Parent.AbuseSheetFlowTypes)
local fFlagAbuseReportConfigStoreResolver = require(parent.SharedFlags).FFlagAbuseReportConfigStoreResolver
local fFlagAbuseReportMenuV2 = require(parent.SharedFlags).FFlagAbuseReportMenuV2
local fFlagAbuseReportInlineAlertStateOutsideReducerModule = require(genericAbuseReporting.Flags.FFlagAbuseReportInlineAlertStateOutsideReducer)

local function getInitialState(p0, p1, p2) --[[ line: 41 ]]
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
				data = {},
				context = {},
				store = {},
				enterTime = p1
			}
		},
		openTime = p1
	}
end

return {
	getInitialState = getInitialState,
	getNewRunId = function() --[[ line: 98 ]]
		-- upvalues: httpService (ref)
		return httpService:GenerateGUID(false)
	end,
	selectContext = function(p3) --[[ line: 102 ]]
		local t = {}
		
		for i, v in p3.stack do
			if v.context then
				for i_1, v_1 in v.context do
					t[i_1] = v_1
				end
			end
		end
		return t
	end,
	selectFormData = function(p4) --[[ line: 114 ]]
		local t = {}
		
		for i, v in p4.stack do
			if v.data then
				for i_1, v_1 in v.data do
					t[i_1] = v_1
				end
			end
		end
		return t
	end,
	selectStore = function(p5) --[[ line: 126 ]]
		local t = {}
		
		for i, v in p5.stack do
			if v.store then
				for i_1, v_1 in v.store do
					t[i_1] = v_1
				end
			end
		end
		return t
	end,
	reducer = function(p6, p7) --[[ line: 138 ]]
		-- upvalues: dashModule (ref), fFlagAbuseReportMenuV2 (ref), fFlagAbuseReportInlineAlertStateOutsideReducerModule (ref), fFlagAbuseReportConfigStoreResolver (ref), getInitialState (ref)
		local cloned = nil
		
		if p7.type == "gotoNode" then
			if not p7.payload or not p7.payload.nodeId then
				error(`gotoNode action requires payload.nodeId, got: {dashModule.pretty(p7, { depth = 5 })}`)
			end
			local cloned_1 = table.clone(p6.stack)
			table.insert(cloned_1, {
				nodeId = p7.payload.nodeId,
				data = {},
				context = {},
				store = {},
				enterTime = p7.payload.enterTime
			})
			cloned = dashModule.join(p6, {
				navigationState = "idle",
				lastNavigationDirection = "forward",
				stack = cloned_1
			})
			
			if fFlagAbuseReportMenuV2 and not fFlagAbuseReportInlineAlertStateOutsideReducerModule then
				cloned.pendingInlineAlert = p7.payload.inlineAlert
				
				return cloned
			end
		elseif p7.type == "replaceAndGotoNode" then
			local var10 = dashModule.last(p6.stack)
			
			if not var10 then
				error("Stack is empty, cannot replace and go to node")
			end
			local var11 = dashModule.slice(p6.stack, 1, #p6.stack - 1)
			table.insert(var11, {
				nodeId = p7.payload.nodeId,
				data = if not fFlagAbuseReportConfigStoreResolver then var10.data else {},
				context = if not fFlagAbuseReportConfigStoreResolver then var10.context else {},
				store = if fFlagAbuseReportConfigStoreResolver then var10.store else {},
				enterTime = p7.payload.enterTime
			})
			cloned = dashModule.join(p6, {
				navigationState = "idle",
				lastNavigationDirection = "forward",
				stack = var11
			})
			
			if fFlagAbuseReportMenuV2 and not fFlagAbuseReportInlineAlertStateOutsideReducerModule then
				cloned.pendingInlineAlert = p7.payload.inlineAlert
				
				return cloned
			end
		elseif p7.type == "goBack" then
			if #p6.stack <= 1 then
				warn("Cannot go back from stack with only one or zero items")
				
				return p6
			end
			cloned = dashModule.join(p6, {
				lastNavigationDirection = "back",
				stack = dashModule.slice(p6.stack, 1, #p6.stack - 1)
			})
			
			if fFlagAbuseReportMenuV2 and not fFlagAbuseReportInlineAlertStateOutsideReducerModule then
				cloned.pendingInlineAlert = nil
				
				return cloned
			end
		elseif p7.type == "updateDataAndNavigateNext" then
			local var12 = dashModule.last(p6.stack)
			
			if not var12 then
				error("Stack is empty, cannot update data")
			end
			if fFlagAbuseReportMenuV2 then
				if p7.payload.expectedFromNodeId and p7.payload.expectedFromNodeId ~= var12.nodeId then
					return p6
				elseif p6.navigationState == "idle" then
					local var13 = dashModule.slice(p6.stack, 1, #p6.stack - 1)
					table.insert(var13, dashModule.join(var12, {
						data = if not fFlagAbuseReportConfigStoreResolver then dashModule.join(var12.data, p7.payload.data) else {},
						context = if not fFlagAbuseReportConfigStoreResolver then dashModule.join(var12.context, p7.payload.context) else {},
						store = if fFlagAbuseReportConfigStoreResolver then dashModule.join(var12.store, p7.payload.store) else {}
					}))
					cloned = dashModule.join(p6, { navigationState = "gotoNext", stack = var13 })
					
					return cloned
				else
					return p6
				end
			end
		elseif p7.type == "startedSubmission" then
			cloned = dashModule.join(p6, { submissionState = "submitting" })
			
			return cloned
		elseif p7.type == "completedSubmission" then
			cloned = dashModule.join(p6, { submissionState = "completed" })
			
			return cloned
		elseif p7.type == "submissionFailed" then
			cloned = dashModule.join(p6, { submissionState = "failed" })
			
			return cloned
		elseif p7.type == "reset" then
			cloned = getInitialState(p7.payload.runId, p7.payload.initialEnterTime, p7.payload.startNodeId)
			
			if fFlagAbuseReportMenuV2 and not fFlagAbuseReportInlineAlertStateOutsideReducerModule then
				cloned.pendingInlineAlert = p7.payload.inlineAlert
				
				return cloned
			end
		elseif fFlagAbuseReportMenuV2 and p7.type == "clearInlineAlert" then
			cloned = table.clone(p6)
			
			if fFlagAbuseReportInlineAlertStateOutsideReducerModule then
				return cloned
			else
				cloned.pendingInlineAlert = nil
				
				return cloned
			end
		else
			error("Unknown action type: " .. tostring(p7.type))
		end
	end
}