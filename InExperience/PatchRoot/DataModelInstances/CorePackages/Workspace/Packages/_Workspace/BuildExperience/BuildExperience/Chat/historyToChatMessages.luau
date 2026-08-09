local buildExperience = script:FindFirstAncestor("BuildExperience")
local creatorAgentChatModule = require(buildExperience.Parent.DataHydration.CreatorAgentChat)
local chatTurnToolsModule = require(script.Parent.chatTurnTools)
local _ = require(buildExperience.Chat.chatTypes)
local turnDisplayModule = require(script.Parent.turnDisplay)
local clientToolItems = creatorAgentChatModule.ClientToolItems
local saveAndPublishResultModule = require(script.Parent.saveAndPublishResult)

local function _(p0) --[[ line: 41 | named "assistantTextForTurn" ]]
	-- upvalues: turnDisplayModule (ref)
	local var6, var7 = turnDisplayModule.formatTurnDisplayText(p0, nil)
	
	return if var7 then var6 elseif p0.isDone then turnDisplayModule.formatTerminalTurnFallbackText(p0) else turnDisplayModule.ASSISTANT_LOADING_TEXT
end

local _ = function(p1) --[[ line: 51 | named "getSubagentTaskState" ]]
	for i, v in p1 do
		if v.kind == "subagent_tasks" and v.subagentTaskState ~= nil then
			return v.subagentTaskState
		end
	end
	return nil
end

local function appendAssistantTurn(p2, p3, p4) --[[ line: 60 ]]
	-- upvalues: chatTurnToolsModule (ref), clientToolItems (ref), saveAndPublishResultModule (ref), turnDisplayModule (ref)
	local subagentTaskState, v
	local turnState = p4.turnState
	local var8 = chatTurnToolsModule.includesPublishPlaceTool(turnState)
	local completedItemsFromTurnState = clientToolItems.getCompletedItemsFromTurnState(turnState)
	local latestSuccessfulResult = saveAndPublishResultModule.getLatestSuccessfulResult(turnState)
	
	for i, v in completedItemsFromTurnState do
		if v.kind == "subagent_tasks" and v.subagentTaskState ~= nil then
			subagentTaskState = v.subagentTaskState
			local var11 = if p4.startSequenceId == nil or p4.endSequenceId == nil then tostring(#p2 + 1) else `{p4.startSequenceId}-{p4.endSequenceId}`
			local t = { isUser = false, id = `history-assistant-{var11}` }
			var13, v = turnDisplayModule.formatTurnDisplayText(turnState, nil)
			t.text = if v then var13 elseif turnState.isDone then turnDisplayModule.formatTerminalTurnFallbackText(turnState) else turnDisplayModule.ASSISTANT_LOADING_TEXT
			t.isLoading = not turnState.isDone
			t.turnActivity = turnState.activityItems
			t.clientToolItems = if #completedItemsFromTurnState > 0 then completedItemsFromTurnState else nil
			t.universeId = p3.universeId
			t.sessionId = p3.sessionId
			t.turnFeedbackIds = {
				universeId = p3.universeId,
				placeId = p3.placeId,
				sessionId = p3.sessionId,
				sequenceId = p4.endSequenceId,
				publishedVersionNumber = if latestSuccessfulResult ~= nil then nil else latestSuccessfulResult.publishedVersionNumber,
				rollbackTargetVersionNumber = if latestSuccessfulResult ~= nil then nil else latestSuccessfulResult.rollbackTargetVersionNumber
			}
			table.insert(p2, t)
			
			if turnState.isDone and turnState.toolCallCount > 0 then
				table.insert(p2, {
					text = "",
					isUser = false,
					id = `history-turn-footer-{var11}`,
					inlineKind = if var8 then "playtestCard" else "actionsCompleted",
					stepCount = turnState.toolCallCount,
					universeId = p3.universeId,
					sessionId = p3.sessionId,
					turnFeedbackIds = t.turnFeedbackIds
				})
			end
			return var8, subagentTaskState
		end
	end
	subagentTaskState = nil
end

return function(p5, p6) --[[ line: 115 | named "historyToChatMessages" ]]
	-- upvalues: creatorAgentChatModule (ref), appendAssistantTurn (ref)
	local t = {}
	local var15 = false
	local var16 = nil
	local turnState = nil
	local startSequenceId = nil
	local sequenceIds = nil
	local var17 = nil
	
	for i, v in creatorAgentChatModule.replaySessionUpdates(p6.sessionId, p5) do
		if v.kind == "user_message" then
			table.insert(t, {
				isUser = true,
				id = if v.sequenceId ~= nil then v.messageId or `history-user-{#t + 1}` else `history-user-{v.sequenceId}`,
				text = v.text
			})
		elseif v.kind == "assistant_turn" then
			local var18 = #t + 1
			local var19, var20 = appendAssistantTurn(t, p6, v)
			
			if var19 then
				var15 = true
			end
			if var20 ~= nil then
				var17 = var20
			end
			if not v.turnState.isDone then
				var16 = var18
				turnState = v.turnState
				var17 = var20 or var17
				startSequenceId = v.startSequenceId
				sequenceIds = v.sequenceIds
			end
		end
	end
	return {
		messages = t,
		includesPublishTool = var15,
		activeTurnMessageIndex = var16,
		activeTurnState = turnState,
		activeTurnStartSequenceId = startSequenceId,
		activeTurnSequenceIds = sequenceIds,
		subagentTaskState = var17
	}
end