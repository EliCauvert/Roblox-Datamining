local httpService = game:GetService("HttpService")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local promiseModule = require(parent.Promise)
local sharedFlagsModule = require(parent.SharedFlags)
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local placeVersionHistoryModule = require(parent.DataHydration.PlaceVersionHistory)
local _ = require(buildExperience.Chat.chatTypes)
local fFlagBuildAgentRollbackModule = require(buildExperience.Flags.FFlagBuildAgentRollback)
local fFlagisPublishOnBuildRevertModule = require(buildExperience.Flags.FFlagisPublishOnBuildRevert)
local feedbackActionModule = require(script.Parent.FeedbackAction)
local _ = require(script.Parent.UserFeedback)
local getAgentRollbackRequestStoreModule = require(buildExperience.Stores.GetAgentRollbackRequestStore)
local rollbackPlaceWithRetryModule = require(buildExperience.utils.rollbackPlaceWithRetry)
local fFlagEnableTeamTestLua = sharedFlagsModule.FFlagEnableTeamTestLua
local fFlagBuildNoPublishOnRevertModule = require(buildExperience.Flags.FFlagBuildNoPublishOnRevert)
local iconName = foundationModule.Enums.IconName
local debug = creatorAgentChatModule.debug
local buildAgentRollbackNoteTimeoutSeconds = game:DefineFastInt("BuildAgentRollbackNoteTimeoutSeconds", 5)

local function getRollbackTargetVersionNumber(p1)
	if p1.rollbackTargetVersionNumber ~= nil then
		return p1.rollbackTargetVersionNumber
	end
	local publishedVersionNumber = p1.publishedVersionNumber
	
	return if publishedVersionNumber == nil or publishedVersionNumber <= 1 then nil else publishedVersionNumber - 1
end

local function canRevert(p1)
	local var1 = false
	
	if p1.placeId ~= nil then
		local rollbackTargetVersionNumber
		if p1.rollbackTargetVersionNumber == nil then
			local publishedVersionNumber = p1.publishedVersionNumber
			rollbackTargetVersionNumber = if publishedVersionNumber == nil or publishedVersionNumber <= 1 then nil else publishedVersionNumber - 1
		else
			rollbackTargetVersionNumber = p1.rollbackTargetVersionNumber
		end
		var1 = rollbackTargetVersionNumber ~= nil
	end
	return var1
end

local function getFeedbackIcons(p1)
	-- upvalues: iconName (ref), feedbackActionModule (ref)
	local t = {}
	
	if p1 ~= nil and p1.includeCopy then
		table.insert(t, {
			iconName = p1.copyIconName or iconName.TwoStackedSquares,
			action = feedbackActionModule.COPY,
			testId = p1.copyTestId
		})
	end
	table.insert(t, {
		iconName = iconName.ThumbUp,
		action = feedbackActionModule.THUMBS_UP
	})
	table.insert(t, {
		iconName = iconName.ThumbDown,
		action = feedbackActionModule.THUMBS_DOWN
	})
	
	if p1 ~= nil and p1.includeRevert then
		table.insert(t, {
			allowRepeatedActivation = true,
			iconName = iconName.ArrowCurlToLeft,
			action = feedbackActionModule.REVERT,
			isDisabled = p1.isRevertDisabled
		})
	end
	return t
end

local function _(p1)
	-- upvalues: httpService (ref)
	if typeof(p1) == "table" then
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), p1 (ref)
			return httpService:JSONEncode(p1)
		end)
		
		return if ok then status else tostring(p1)
	end
end

local _ = function(p1)
	return tonumber(p1.version)
end

local function findVersionNote(p1, p2)
	if p1 == nil or typeof(p1.placeVersions) ~= "table" then
		return nil
	end
	for i, v in p1.placeVersions do
		if tonumber(v.version) == p2 then
			return { title = v.title, description = v.description }
		end
	end
	return nil
end

local function fetchVersionNote(p1, p2, p3, p4, p5)
	-- upvalues: promiseModule (ref), findVersionNote (ref), fetchVersionNote (ref)
	return if p5 == nil or p5 > 0 then p1.fetchPageHistory(p2, { cursor = p4 }):andThen(function(p1)
		-- upvalues: findVersionNote (copy), p3 (ref), fetchVersionNote (copy), p1 (ref), p2 (ref), p5 (ref)
		local var1 = findVersionNote(p1, p3)
		
		return if var1 == nil then if p1.nextCursor == nil or p1.nextCursor == "" then nil else fetchVersionNote(p1, p2, p3, p1.nextCursor, if p5 == nil then nil else p5 - 1) else var1
	end) else promiseModule.resolve(nil)
end

local function getVersionNote(p1, p2, p3, p4)
	-- upvalues: findVersionNote (ref), promiseModule (ref), fetchVersionNote (ref)
	local var1 = findVersionNote(p1.getHistory(p2).data(false), p3)
	
	return if var1 == nil then fetchVersionNote(p1, p2, p3, nil, p4) else promiseModule.resolve(var1)
end

return {
	canRevert = canRevert,
	getRollbackTargetVersionNumber = getRollbackTargetVersionNumber,
	getFeedbackIcons = getFeedbackIcons,
	requestAgentRollback = if fFlagBuildAgentRollbackModule then function(p1)
		-- upvalues: debug (ref), promiseModule (ref), getAgentRollbackRequestStoreModule (ref), placeVersionHistoryModule (ref), getVersionNote (ref), buildAgentRollbackNoteTimeoutSeconds (ref), httpService (ref)
		local rollbackTargetVersionNumber, publishedVersionNumber
		local placeId = p1.placeId
		
		if p1.rollbackTargetVersionNumber == nil then
			publishedVersionNumber = p1.publishedVersionNumber
			rollbackTargetVersionNumber = if publishedVersionNumber == nil or publishedVersionNumber <= 1 then nil else publishedVersionNumber - 1
		else
			rollbackTargetVersionNumber = p1.rollbackTargetVersionNumber
		end
		if placeId == nil or rollbackTargetVersionNumber == nil then
			debug.log("warn", "agent feedback revert missing rollback ids", { feedbackIds = p1 })
			
			return promiseModule.reject("agent_rollback_missing_ids")
		end
		publishedVersionNumber = getAgentRollbackRequestStoreModule(false)
		local var1, var2 = publishedVersionNumber.beginRequest({ universeId = p1.universeId, placeId = placeId })
		
		if var1 ~= nil then
			getVersionNote(placeVersionHistoryModule.getPlaceVersionHistoryStore(), placeId, rollbackTargetVersionNumber, 3):timeout(buildAgentRollbackNoteTimeoutSeconds):catch(function(p1)
				-- upvalues: debug (copy), placeId (ref), rollbackTargetVersionNumber (ref), httpService (copy)
				local var1
				local log = debug.log
				local var2 = "warn"
				local var3 = "agent feedback revert source note load failed"
				local t = {
					placeId = placeId,
					restoredVersion = rollbackTargetVersionNumber
				}
				
				if typeof(p1) == "table" then
					local ok, status = pcall(function()
						-- upvalues: httpService (copy), p1 (ref)
						return httpService:JSONEncode(p1)
					end)
					var1 = if ok then status else tostring(p1)
				end
				t.error = var1
				t.rawError = p1
				log(var2, var3, t)
				
				return nil
			end):andThen(function(p1)
				-- upvalues: publishedVersionNumber (ref), var1 (ref), rollbackTargetVersionNumber (ref)
				publishedVersionNumber.setRequestData(var1, {
					versionNumber = rollbackTargetVersionNumber,
					noteTitle = if p1 == nil then nil else p1.title,
					noteDescription = if p1 == nil then nil else p1.description
				})
			end):catch(function(p1)
				-- upvalues: debug (copy), placeId (ref), rollbackTargetVersionNumber (ref), httpService (copy), publishedVersionNumber (ref), var1 (ref)
				local var1
				local log = debug.log
				local var2 = "warn"
				local var3 = "agent feedback revert request preparation failed"
				local t = {
					placeId = placeId,
					restoredVersion = rollbackTargetVersionNumber
				}
				
				if typeof(p1) == "table" then
					local ok, status = pcall(function()
						-- upvalues: httpService (copy), p1 (ref)
						return httpService:JSONEncode(p1)
					end)
					var1 = if ok then status else tostring(p1)
				end
				t.error = var1
				t.rawError = p1
				log(var2, var3, t)
				publishedVersionNumber.failRequest(var1)
			end)
		end
		return var2:catch(function(p1)
			-- upvalues: debug (copy), placeId (ref), rollbackTargetVersionNumber (ref), httpService (copy)
			local var1
			local log = debug.log
			local var2 = "warn"
			local var3 = "agent feedback revert request failed"
			local t = {
				placeId = placeId,
				versionToRollback = rollbackTargetVersionNumber
			}
			
			if typeof(p1) == "table" then
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p1 (ref)
					return httpService:JSONEncode(p1)
				end)
				var1 = if ok then status else tostring(p1)
			end
			t.error = var1
			t.rawError = p1
			log(var2, var3, t)
			error(p1)
		end)
	end else nil,
	rollbackPublishedVersion = function(p1, p2)
		-- upvalues: debug (ref), placeVersionHistoryModule (ref), getVersionNote (ref), httpService (ref), rollbackPlaceWithRetryModule (ref), fFlagEnableTeamTestLua (ref), fFlagBuildNoPublishOnRevertModule (ref), fFlagisPublishOnBuildRevertModule (ref)
		local rollbackTargetVersionNumber
		local universeId = p1.universeId
		local placeId = p1.placeId
		
		if p1.rollbackTargetVersionNumber == nil then
			local publishedVersionNumber = p1.publishedVersionNumber
			rollbackTargetVersionNumber = if publishedVersionNumber == nil or publishedVersionNumber <= 1 then nil else publishedVersionNumber - 1
		else
			rollbackTargetVersionNumber = p1.rollbackTargetVersionNumber
		end
		if placeId == nil or rollbackTargetVersionNumber == nil then
			debug.log("warn", "agent feedback revert missing rollback ids", { feedbackIds = p1 })
			
			if p2 ~= nil and p2.onRevertFailure ~= nil then
				p2.onRevertFailure()
			end
			return
		elseif p2 ~= nil and p2.onRevertStart ~= nil then
			p2.onRevertStart()
		end
		getVersionNote(placeVersionHistoryModule.getPlaceVersionHistoryStore(), placeId, rollbackTargetVersionNumber):catch(function(p1)
			-- upvalues: debug (copy), placeId (ref), rollbackTargetVersionNumber (ref), httpService (copy)
			local var1
			local log = debug.log
			local var2 = "warn"
			local var3 = "agent feedback revert source note load failed"
			local t = {
				placeId = placeId,
				restoredVersion = rollbackTargetVersionNumber
			}
			
			if typeof(p1) == "table" then
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p1 (ref)
					return httpService:JSONEncode(p1)
				end)
				var1 = if ok then status else tostring(p1)
			end
			t.error = var1
			t.rawError = p1
			log(var2, var3, t)
			
			return nil
		end):andThen(function(p1)
			-- upvalues: debug (copy), placeId (ref), rollbackTargetVersionNumber (ref), rollbackPlaceWithRetryModule (copy), fFlagEnableTeamTestLua (copy), fFlagBuildNoPublishOnRevertModule (copy), fFlagisPublishOnBuildRevertModule (copy)
			if p1 == nil then
				debug.log("info", "agent feedback revert note copy skipped", {
					reason = "source_notes_not_found",
					placeId = placeId,
					restoredVersion = rollbackTargetVersionNumber
				})
			end
			return rollbackPlaceWithRetryModule(placeId, rollbackTargetVersionNumber, {
				debugSource = "agent feedback revert",
				note = p1,
				published = if fFlagEnableTeamTestLua then if fFlagBuildNoPublishOnRevertModule then false else true else fFlagisPublishOnBuildRevertModule
			})
		end):andThen(function()
			-- upvalues: p2 (ref)
			if p2 ~= nil and p2.onRevertSuccess ~= nil then
				p2.onRevertSuccess()
			end
		end):catch(function(p1)
			-- upvalues: httpService (copy), debug (copy), universeId (ref), placeId (ref), rollbackTargetVersionNumber (ref), p2 (ref)
			local var1
			if typeof(p1) == "table" then
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p1 (ref)
					return httpService:JSONEncode(p1)
				end)
				var1 = if ok then status else tostring(p1)
			end
			debug.log("warn", "agent feedback revert rollback failed", {
				universeId = universeId,
				placeId = placeId,
				versionToRollback = rollbackTargetVersionNumber,
				error = var1,
				rawError = p1
			})
			warn(`[BuildExperience] agent feedback revert rollback failed: {var1}`)
			
			if p2 ~= nil and p2.onRevertFailure ~= nil then
				p2.onRevertFailure()
			end
		end)
	end
}