local AmpV2Wizard = script:FindFirstAncestor("AmpV2Wizard")
local _ = require(AmpV2Wizard.Types)
local FFlagAmpV2WizardRateLimitedOutcomeModule = require(AmpV2Wizard.FFlagAmpV2WizardRateLimitedOutcome)
local FFlagAmpV2WizardTerminalOutcomeModule = require(AmpV2Wizard.FFlagAmpV2WizardTerminalOutcome)

local function _(Tbl, p1)
	local Copy = table.clone(Tbl)
	table.insert(Copy, p1)
	
	return Copy
end

local function errorExit(p1, History, Outcome)
	return {
		isLoading = false,
		presentingError = false,
		exited = true,
		flowId = p1.flowId,
		analyticsSessionId = p1.analyticsSessionId,
		chosenFlow = p1.chosenFlow,
		nodes = p1.nodes,
		currentNodeId = p1.currentNodeId,
		history = History,
		flowInputs = p1.flowInputs,
		flowState = p1.flowState,
		analyticsStrings = p1.analyticsStrings,
		exitResult = { reason = "Error", flowId = p1.flowId, outcome = Outcome }
	}
end

local _ = function(Tbl, List)
	if List == nil then
		return Tbl
	end
	if Tbl == nil then
		return List
	end
	local Copy = table.clone(Tbl)
	
	for i, value in List do
		Copy[i] = value
	end
	return Copy
end

local function enterFragment(p1, History, FlowId, AnalyticsSessionId, ChosenFlow, FlowInputs, FlowState, Tbl)
	-- upvalues: FFlagAmpV2WizardRateLimitedOutcomeModule (copy), FFlagAmpV2WizardTerminalOutcomeModule (copy)
	local IsNotEntryMatch: boolean = p1.entry ~= nil and p1.entry ~= ""
	local HasNode: boolean = IsNotEntryMatch and p1.nodes[p1.entry] ~= nil
	local IsRateLimited: boolean = if not IsNotEntryMatch then FFlagAmpV2WizardRateLimitedOutcomeModule and not IsNotEntryMatch and p1.outcome == "RateLimited" or p1.outcome == "Error" else FFlagAmpV2WizardRateLimitedOutcomeModule and not IsNotEntryMatch and p1.outcome == "RateLimited" or not IsNotEntryMatch
	local ExitResult = nil
	
	if IsNotEntryMatch then
		if not HasNode then
			ExitResult = { reason = "Error", flowId = FlowId }
		end
	else
		local HistoryEntry = History[#History]
		local Outcome = if FFlagAmpV2WizardTerminalOutcomeModule then if HistoryEntry == nil then p1.outcome else HistoryEntry.outcome else nil
		ExitResult = if IsRateLimited then { reason = "Error", flowId = FlowId, outcome = p1.outcome } else { reason = "Completed", flowId = FlowId, outcome = Outcome }
	end
	local config = {
		isLoading = false,
		flowId = FlowId,
		analyticsSessionId = AnalyticsSessionId,
		chosenFlow = ChosenFlow,
		nodes = p1.nodes,
		currentNodeId = if HasNode then p1.entry else nil,
		history = History,
		flowInputs = p1.flowInputs or FlowInputs,
		flowState = p1.state or FlowState
	}
	local Analytics = p1.analytics
	local AnalyticsStrings = nil
	
	if Analytics == nil then
		AnalyticsStrings = Tbl
	elseif Tbl == nil then
		AnalyticsStrings = Analytics
	else
		local Copy = table.clone(Tbl)
		
		for i, analytic in Analytics do
			Copy[i] = analytic
		end
		AnalyticsStrings = Copy
	end
	config.analyticsStrings = AnalyticsStrings
	config.presentingError = IsRateLimited
	config.exited = not HasNode and not IsRateLimited
	config.exitResult = ExitResult
	
	return config
end

local function reduceReport(p2, p3)
	-- upvalues: errorExit (copy)
	assert(p3.type == "ReportOutcome", "reduceReport called with wrong action")
	local CurrentNodeId = p2.currentNodeId
	
	if CurrentNodeId == nil then
		return p2
	end
	local Node = p2.nodes[CurrentNodeId]
	local Transition = if Node then Node.transitions[p3.outcome] else nil
	local config = {
		flow = p2.chosenFlow,
		node = CurrentNodeId,
		outcome = p3.outcome,
		data = p3.data
	}
	local Copy = table.clone(p2.history)
	table.insert(Copy, config)
	
	if Transition == nil then
		return (errorExit(p2, Copy, p3.outcome))
	elseif Transition.kind == "Goto" then
		local Node1 = Transition.node
		
		return if Node1 == nil or p2.nodes[Node1] == nil then errorExit(p2, Copy, p3.outcome) else {
			isLoading = false,
			presentingError = false,
			exited = false,
			exitResult = nil,
			flowId = p2.flowId,
			analyticsSessionId = p2.analyticsSessionId,
			chosenFlow = p2.chosenFlow,
			nodes = p2.nodes,
			currentNodeId = Node1,
			history = Copy,
			flowInputs = p2.flowInputs,
			flowState = p2.flowState,
			analyticsStrings = p2.analyticsStrings
		}
	else
		return if Transition.kind == "Continue" then {
			isLoading = true,
			presentingError = false,
			exited = false,
			exitResult = nil,
			flowId = p2.flowId,
			analyticsSessionId = p2.analyticsSessionId,
			chosenFlow = p2.chosenFlow,
			nodes = p2.nodes,
			currentNodeId = p2.currentNodeId,
			history = Copy,
			flowInputs = p2.flowInputs,
			flowState = p2.flowState,
			analyticsStrings = p2.analyticsStrings
		} else {
			isLoading = false,
			presentingError = false,
			exited = true,
			flowId = p2.flowId,
			analyticsSessionId = p2.analyticsSessionId,
			chosenFlow = p2.chosenFlow,
			nodes = p2.nodes,
			currentNodeId = p2.currentNodeId,
			history = Copy,
			flowInputs = p2.flowInputs,
			flowState = p2.flowState,
			analyticsStrings = p2.analyticsStrings,
			exitResult = {
				reason = "Completed",
				flowId = p2.flowId,
				outcome = p3.outcome
			}
		}
	end
end

local function reduceFragmentLoaded(p2, Response)
	-- upvalues: enterFragment (copy)
	local AnalyticsSessionId = Response.analyticsSessionId
	
	return (enterFragment(Response, p2.history, if Response.flowId == "" then p2.flowId else Response.flowId, if AnalyticsSessionId == nil or AnalyticsSessionId == "" then p2.analyticsSessionId else AnalyticsSessionId, if Response.chosenFlow == "" then p2.chosenFlow else Response.chosenFlow, p2.flowInputs, p2.flowState, p2.analyticsStrings))
end

return {
	init = function(p2)
		-- upvalues: enterFragment (copy)
		return (enterFragment(p2, {}, p2.flowId, p2.analyticsSessionId or "", p2.chosenFlow, nil, nil, nil))
	end,
	reduce = function(Tbl, p2)
		-- upvalues: reduceReport (copy), reduceFragmentLoaded (copy)
		if p2.type == "DismissPresentation" then
			local Copy = table.clone(Tbl)
			Copy.isLoading = false
			Copy.presentingError = false
			Copy.exited = false
			Copy.exitResult = nil
			
			if Tbl.currentNodeId ~= nil then
				local Copy1 = table.clone(Tbl.history)
				table.insert(Copy1, {
					outcome = "Cancel",
					flow = Tbl.chosenFlow,
					node = Tbl.currentNodeId
				})
				Copy.history = Copy1
			end
			if p2.nodeId == nil or p2.node == nil then
				Copy.exited = true
				Copy.exitResult = {
					reason = "Cancelled",
					outcome = "Cancel",
					flowId = Tbl.flowId
				}
				
				return Copy
			else
				Copy.nodes = table.clone(Tbl.nodes)
				Copy.nodes[p2.nodeId] = p2.node
				Copy.currentNodeId = p2.nodeId
				
				return Copy
			end
		elseif p2.type == "ReportOutcome" then
			return (reduceReport(Tbl, p2))
		elseif p2.type == "FragmentLoaded" then
			return (reduceFragmentLoaded(Tbl, p2.response))
		elseif p2.type == "ContinueFailed" then
			return {
				isLoading = false,
				presentingError = false,
				exited = true,
				flowId = Tbl.flowId,
				analyticsSessionId = Tbl.analyticsSessionId,
				chosenFlow = Tbl.chosenFlow,
				nodes = Tbl.nodes,
				currentNodeId = Tbl.currentNodeId,
				history = Tbl.history,
				flowInputs = Tbl.flowInputs,
				flowState = Tbl.flowState,
				analyticsStrings = Tbl.analyticsStrings,
				exitResult = { reason = "Error", flowId = Tbl.flowId }
			}
		elseif p2.type ~= "AcknowledgeError" then
			return Tbl
		elseif Tbl.presentingError then
			local Copy = table.clone(Tbl)
			Copy.presentingError = false
			Copy.exited = true
			
			return Copy
		else
			return Tbl
		end
	end
}