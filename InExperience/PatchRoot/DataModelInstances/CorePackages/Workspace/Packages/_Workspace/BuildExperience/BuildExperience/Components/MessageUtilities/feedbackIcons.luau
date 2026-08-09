local httpService = game:GetService("HttpService")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local promiseModule = require(parent.Promise)
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local placeVersionHistoryModule = require(parent.DataHydration.PlaceVersionHistory)
local _ = require(buildExperience.Chat.chatTypes)
local feedbackActionModule = require(script.Parent.FeedbackAction)
local _ = require(script.Parent.UserFeedback)
local sendAgentTurnFeedbackModule = require(script.Parent.sendAgentTurnFeedback)
local iconName = foundationModule.Enums.IconName
local debug = creatorAgentChatModule.debug

local function _(p0) --[[ line: 39 | named "getRollbackTargetVersionNumber" ]]
	if p0.rollbackTargetVersionNumber ~= nil then
		return p0.rollbackTargetVersionNumber
	end
	local publishedVersionNumber = p0.publishedVersionNumber
	
	return if publishedVersionNumber == nil or publishedVersionNumber <= 1 then nil else publishedVersionNumber - 1
end

local function canRevert(p1) --[[ line: 52 ]]
	local var15 = false
	
	if p1.placeId ~= nil then
		local rollbackTargetVersionNumber
		if p1.rollbackTargetVersionNumber == nil then
			local publishedVersionNumber = p1.publishedVersionNumber
			rollbackTargetVersionNumber = if publishedVersionNumber == nil or publishedVersionNumber <= 1 then nil else publishedVersionNumber - 1
		else
			rollbackTargetVersionNumber = p1.rollbackTargetVersionNumber
		end
		var15 = rollbackTargetVersionNumber ~= nil
	end
	return var15
end

local _ = function(p2) --[[ line: 56 | named "getVersionNumber" ]]
	return tonumber(p2.version)
end

local function findVersionNote(p3, p4) --[[ line: 60 ]]
	if p3 == nil or typeof(p3.placeVersions) ~= "table" then
		return nil
	end
	for i, v in p3.placeVersions do
		if tonumber(v.version) == p4 then
			return { title = v.title, description = v.description }
		end
	end
	return nil
end

local function fetchVersionNote(p5, p6, p7, p8) --[[ line: 77 ]]
	-- upvalues: findVersionNote (ref), fetchVersionNote (ref)
	return p5.fetchPageHistory(p6, { cursor = p8 }):andThen(function(p9) --[[ line: 83 ]]
		-- upvalues: findVersionNote (copy), p7 (ref), fetchVersionNote (copy), p5 (ref), p6 (ref)
		local var16 = findVersionNote(p9, p7)
		
		return if var16 == nil then if p9.nextCursor == nil or p9.nextCursor == "" then nil else fetchVersionNote(p5, p6, p7, p9.nextCursor) else var16
	end)
end

local function getVersionNote(p10, p11, p12) --[[ line: 95 ]]
	-- upvalues: findVersionNote (ref), promiseModule (ref), fetchVersionNote (ref)
	local var17 = findVersionNote(p10.getHistory(p11).data(false), p12)
	
	return if var17 == nil then fetchVersionNote(p10, p11, p12, nil) else promiseModule.resolve(var17)
end

local function getFeedbackIcons(p13) --[[ line: 105 ]]
	-- upvalues: iconName (ref), feedbackActionModule (ref)
	local list = {
		{
			iconName = iconName.ThumbUp,
			action = feedbackActionModule.THUMBS_UP
		},
		{
			iconName = iconName.ThumbDown,
			action = feedbackActionModule.THUMBS_DOWN
		}
	}
	
	if p13 ~= nil and p13.includeRevert then
		table.insert(list, {
			allowRepeatedActivation = true,
			iconName = iconName.ArrowCurlToLeft,
			action = feedbackActionModule.REVERT,
			isDisabled = p13.isRevertDisabled
		})
	end
	return list
end

local _ = function(p14) --[[ line: 121 | named "formatDebugValue" ]]
	-- upvalues: httpService (ref)
	if typeof(p14) == "table" then
		local ok, status = pcall(function() --[[ line: 123 ]]
			-- upvalues: httpService (copy), p14 (ref)
			return httpService:JSONEncode(p14)
		end)
		
		return if ok then status else tostring(p14)
	end
end

local function copyVersionNoteAfterRollback(p15, p16, p17, p18) --[[ line: 133 ]]
	-- upvalues: getVersionNote (ref), httpService (ref)
	return getVersionNote(p15, p16, p17):andThen(function(p20) --[[ line: 140 ]]
		-- upvalues: p16 (ref), p17 (ref), p18 (ref), p15 (ref), httpService (copy)
		if p20 == nil then
			print(`[PlaceVersionHistoryNoteDebug] feedback revert note copy was skipped because source notes were not found. placeId={p16} restoredVersion={p17} newVersion={p18}`)
			
			return nil
		end
		local var22 = tostring(p18)
		
		return p15.addVersionNote(p16, var22, p20):catch(function(p21) --[[ line: 149 ]]
			-- upvalues: p16 (copy), p17 (copy), var22 (ref), p20 (ref), httpService (copy)
			local var27
			local _print = print
			local var24 = "[PlaceVersionHistoryNoteDebug] failed to copy version notes after feedback revert. placeId=%* restoredVersion=%* newVersion=%* titleLength=%* descriptionLength=%* error=%*"
			local var25 = if p20.title == nil then "nil" else tostring(#p20.title)
			local var26 = if p20.description == nil then "nil" else tostring(#p20.description)
			
			if typeof(p21) == "table" then
				local ok, status = pcall(function() --[[ line: 123 ]]
					-- upvalues: httpService (copy), p21 (ref)
					return httpService:JSONEncode(p21)
				end)
				var27 = if ok then status else tostring(p21)
			end
			_print(var24:format(p16, p17, var22, var25, var26, var27))
			
			return nil
		end)
	end):catch(function(p19) --[[ line: 161 ]]
		-- upvalues: p16 (ref), p17 (ref), p18 (ref), httpService (copy)
		local var21
		local _print = print
		local var20 = "[PlaceVersionHistoryNoteDebug] failed to load source version notes after feedback revert. placeId=%* restoredVersion=%* newVersion=%* error=%*"
		
		if typeof(p19) == "table" then
			local ok, status = pcall(function() --[[ line: 123 ]]
				-- upvalues: httpService (copy), p19 (ref)
				return httpService:JSONEncode(p19)
			end)
			var21 = if ok then status else tostring(p19)
		end
		_print(var20:format(p16, p17, p18, var21))
		
		return nil
	end)
end

local function rollbackPublishedVersion(p22, p23) --[[ line: 171 ]]
	-- upvalues: debug (ref), placeVersionHistoryModule (ref), copyVersionNoteAfterRollback (ref), httpService (ref)
	local rollbackTargetVersionNumber, publishedVersionNumber
	local universeId = p22.universeId
	local placeId = p22.placeId
	
	if p22.rollbackTargetVersionNumber == nil then
		publishedVersionNumber = p22.publishedVersionNumber
		rollbackTargetVersionNumber = if publishedVersionNumber == nil or publishedVersionNumber <= 1 then nil else publishedVersionNumber - 1
	else
		rollbackTargetVersionNumber = p22.rollbackTargetVersionNumber
	end
	if placeId == nil or rollbackTargetVersionNumber == nil then
		debug.log("warn", "agent feedback revert missing rollback ids", { feedbackIds = p22 })
		
		if p23 ~= nil and p23.onRevertFailure ~= nil then
			p23.onRevertFailure()
		end
		return
	elseif p23 ~= nil and p23.onRevertStart ~= nil then
		p23.onRevertStart()
	end
	publishedVersionNumber = placeVersionHistoryModule.getPlaceVersionHistoryStore()
	publishedVersionNumber.rollbackPlace(placeId, rollbackTargetVersionNumber, "Reverted Creator Agent publish", true):andThen(function(p25) --[[ line: 192 ]]
		-- upvalues: placeId (ref), rollbackTargetVersionNumber (ref), copyVersionNoteAfterRollback (copy), publishedVersionNumber (ref)
		if p25.newVersionNumber == nil then
			print(`[PlaceVersionHistoryNoteDebug] feedback revert note copy was skipped because newVersionNumber was nil. placeId={placeId} restoredVersion={rollbackTargetVersionNumber}`)
			
			return nil
		end
		return copyVersionNoteAfterRollback(publishedVersionNumber, placeId, rollbackTargetVersionNumber, p25.newVersionNumber)
	end):andThen(function() --[[ line: 202 ]]
		-- upvalues: p23 (ref)
		if p23 ~= nil and p23.onRevertSuccess ~= nil then
			p23.onRevertSuccess()
		end
	end):catch(function(p24) --[[ line: 207 ]]
		-- upvalues: httpService (copy), debug (copy), universeId (ref), placeId (ref), rollbackTargetVersionNumber (ref), p23 (ref)
		local var28
		if typeof(p24) == "table" then
			local ok, status = pcall(function() --[[ line: 123 ]]
				-- upvalues: httpService (copy), p24 (ref)
				return httpService:JSONEncode(p24)
			end)
			var28 = if ok then status else tostring(p24)
		end
		debug.log("warn", "agent feedback revert rollback failed", {
			universeId = universeId,
			placeId = placeId,
			versionToRollback = rollbackTargetVersionNumber,
			error = var28,
			rawError = p24
		})
		warn(`[BuildExperience] agent feedback revert rollback failed: {var28}`)
		
		if p23 ~= nil and p23.onRevertFailure ~= nil then
			p23.onRevertFailure()
		end
	end)
end

return {
	canRevert = canRevert,
	getFeedbackIcons = getFeedbackIcons,
	createOnActivated = function(p26, p27) --[[ line: 223 ]]
		-- upvalues: sendAgentTurnFeedbackModule (ref), feedbackActionModule (ref), rollbackPublishedVersion (ref)
		return function(p28) --[[ line: 227 ]]
			-- upvalues: sendAgentTurnFeedbackModule (copy), p26 (ref), feedbackActionModule (copy), rollbackPublishedVersion (copy), p27 (ref)
			if p28.isDisabled == true then return end
			sendAgentTurnFeedbackModule(p28.action, p26)
			
			if p28.action == feedbackActionModule.REVERT then
				rollbackPublishedVersion(p26, p27)
			end
		end
	end
}