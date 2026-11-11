local GenericAbuseReporting = script:FindFirstAncestor("GenericAbuseReporting")
local Parent = GenericAbuseReporting.Parent
local HttpService = game:GetService("HttpService")
local LocalPlayer = game:GetService("Players").LocalPlayer
local DashModule = require(Parent.Dash)
local _ = require(script.Parent.AbuseSheetFlowTypes)
local FFlagAbuseReportMenuV2 = require(Parent.SharedFlags).FFlagAbuseReportMenuV2
local FFlagAbuseReportInlineAlertStateOutsideReducerModule = require(GenericAbuseReporting.Flags.FFlagAbuseReportInlineAlertStateOutsideReducer)

local function getInitialState(RunId, EnterTime, StartNodeId)
	-- upvalues: LocalPlayer (copy), FFlagAbuseReportMenuV2 (copy)
	return {
		navigationState = "idle",
		submissionState = "idle",
		pendingInlineAlert = nil,
		runId = RunId,
		userId = if LocalPlayer then LocalPlayer.UserId else 0,
		stack = {
			{
				nodeId = if FFlagAbuseReportMenuV2 then StartNodeId else "root",
				store = {},
				enterTime = EnterTime
			}
		},
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
	reducer = function(Tbl, p2)
		-- upvalues: DashModule (copy), FFlagAbuseReportMenuV2 (copy), FFlagAbuseReportInlineAlertStateOutsideReducerModule (copy), getInitialState (copy)
		local JoinResult = nil
		
		if p2.type == "gotoNode" then
			if not p2.payload or not p2.payload.nodeId then
				error(`gotoNode action requires payload.nodeId, got: {DashModule.pretty(p2, { depth = 5 })}`)
			end
			local Copy = table.clone(Tbl.stack)
			table.insert(Copy, {
				nodeId = p2.payload.nodeId,
				store = {},
				enterTime = p2.payload.enterTime
			})
			JoinResult = DashModule.join(Tbl, {
				navigationState = "idle",
				lastNavigationDirection = "forward",
				stack = Copy
			})
			
			if FFlagAbuseReportMenuV2 and not FFlagAbuseReportInlineAlertStateOutsideReducerModule then
				JoinResult.pendingInlineAlert = p2.payload.inlineAlert
				
				return JoinResult
			end
		elseif p2.type == "replaceAndGotoNode" then
			local LastResult = DashModule.last(Tbl.stack)
			
			if not LastResult then
				error("Stack is empty, cannot replace and go to node")
			end
			local SliceResult = DashModule.slice(Tbl.stack, 1, #Tbl.stack - 1)
			table.insert(SliceResult, {
				nodeId = p2.payload.nodeId,
				store = LastResult.store,
				enterTime = p2.payload.enterTime
			})
			JoinResult = DashModule.join(Tbl, {
				navigationState = "idle",
				lastNavigationDirection = "forward",
				stack = SliceResult
			})
			
			if FFlagAbuseReportMenuV2 and not FFlagAbuseReportInlineAlertStateOutsideReducerModule then
				JoinResult.pendingInlineAlert = p2.payload.inlineAlert
				
				return JoinResult
			end
		elseif p2.type == "goBack" then
			if #Tbl.stack <= 1 then
				warn("Cannot go back from stack with only one or zero items")
				
				return Tbl
			end
			JoinResult = DashModule.join(Tbl, {
				lastNavigationDirection = "back",
				stack = DashModule.slice(Tbl.stack, 1, #Tbl.stack - 1)
			})
			
			if FFlagAbuseReportMenuV2 and not FFlagAbuseReportInlineAlertStateOutsideReducerModule then
				JoinResult.pendingInlineAlert = nil
				
				return JoinResult
			end
		elseif p2.type == "updateDataAndNavigateNext" then
			local LastResult = DashModule.last(Tbl.stack)
			
			if not LastResult then
				error("Stack is empty, cannot update data")
			end
			if FFlagAbuseReportMenuV2 then
				if p2.payload.expectedFromNodeId and p2.payload.expectedFromNodeId ~= LastResult.nodeId then
					return Tbl
				elseif Tbl.navigationState ~= "idle" then
					return Tbl
				end
			end
			local SliceResult = DashModule.slice(Tbl.stack, 1, #Tbl.stack - 1)
			table.insert(SliceResult, (DashModule.join(LastResult, {
				store = DashModule.join(LastResult.store, p2.payload.store)
			})))
			JoinResult = DashModule.join(Tbl, { navigationState = "gotoNext", stack = SliceResult })
			
			return JoinResult
		else
			if p2.type == "startedSubmission" then
				JoinResult = DashModule.join(Tbl, { submissionState = "submitting" })
				
				return JoinResult
			end
			if p2.type == "completedSubmission" then
				JoinResult = DashModule.join(Tbl, { submissionState = "completed" })
				
				return JoinResult
			end
			if p2.type == "submissionFailed" then
				JoinResult = DashModule.join(Tbl, { submissionState = "failed" })
				
				return JoinResult
			end
			if p2.type == "reset" then
				JoinResult = getInitialState(p2.payload.runId, p2.payload.initialEnterTime, p2.payload.startNodeId)
				
				if FFlagAbuseReportMenuV2 and not FFlagAbuseReportInlineAlertStateOutsideReducerModule then
					JoinResult.pendingInlineAlert = p2.payload.inlineAlert
					
					return JoinResult
				end
			elseif FFlagAbuseReportMenuV2 and p2.type == "clearInlineAlert" then
				JoinResult = table.clone(Tbl)
				
				if not FFlagAbuseReportInlineAlertStateOutsideReducerModule then
					JoinResult.pendingInlineAlert = nil
					
					return JoinResult
				end
			else
				error("Unknown action type: " .. tostring(p2.type))
			end
		end
		return JoinResult
	end
}