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

local function fetchVersionNote(p3, p4, p5, p6, p7)
	-- upvalues: promiseModule (ref), findVersionNote (ref), fetchVersionNote (ref)
	return if p7 == nil or p7 > 0 then p3.fetchPageHistory(p4, { cursor = p6 }):andThen(function(p8)
		-- upvalues: findVersionNote (copy), p5 (ref), fetchVersionNote (copy), p8 (ref), p4 (ref), p7 (ref)
		local var1 = findVersionNote(p8, p5)
		
		return if var1 == nil then if p8.nextCursor == nil or p8.nextCursor == "" then nil else fetchVersionNote(p8, p4, p5, p8.nextCursor, if p7 == nil then nil else p7 - 1) else var1
	end) else promiseModule.resolve(nil)
end

local function getVersionNote(p3, p4, p5, p6)
	-- upvalues: findVersionNote (ref), promiseModule (ref), fetchVersionNote (ref)
	local var1 = findVersionNote(p3.getHistory(p4).data(false), p5)
	
	return if var1 == nil then fetchVersionNote(p3, p4, p5, nil, p6) else promiseModule.resolve(var1)
end

return {
	canRevert = canRevert,
	getRollbackTargetVersionNumber = getRollbackTargetVersionNumber,
	getFeedbackIcons = getFeedbackIcons,
	requestAgentRollback = if fFlagBuildAgentRollbackModule then function(p3)
		-- upvalues: debug (ref), promiseModule (ref), getAgentRollbackRequestStoreModule (ref), placeVersionHistoryModule (ref), getVersionNote (ref), buildAgentRollbackNoteTimeoutSeconds (ref), httpService (ref)
		local rollbackTargetVersionNumber, publishedVersionNumber
		local placeId = p3.placeId
		
		if p3.rollbackTargetVersionNumber == nil then
			publishedVersionNumber = p3.publishedVersionNumber
			rollbackTargetVersionNumber = if publishedVersionNumber == nil or publishedVersionNumber <= 1 then nil else publishedVersionNumber - 1
		else
			rollbackTargetVersionNumber = p3.rollbackTargetVersionNumber
		end
		if placeId == nil or rollbackTargetVersionNumber == nil then
			debug.log("warn", "agent feedback revert missing rollback ids", { feedbackIds = p3 })
			
			return promiseModule.reject("agent_rollback_missing_ids")
		end
		publishedVersionNumber = getAgentRollbackRequestStoreModule(false)
		local var1, var2 = publishedVersionNumber.beginRequest({ universeId = p3.universeId, placeId = placeId })
		
		if var1 ~= nil then
			getVersionNote(placeVersionHistoryModule.getPlaceVersionHistoryStore(), placeId, rollbackTargetVersionNumber, 3):timeout(buildAgentRollbackNoteTimeoutSeconds):catch(function(p4)
				-- upvalues: debug (copy), placeId (ref), rollbackTargetVersionNumber (ref), httpService (copy)
				local var3
				local log = debug.log
				local var4 = "warn"
				local var5 = "agent feedback revert source note load failed"
				local t = {
					placeId = placeId,
					restoredVersion = rollbackTargetVersionNumber
				}
				
				if typeof(p4) == "table" then
					local ok, status = pcall(function()
						-- upvalues: httpService (copy), p4 (ref)
						return httpService:JSONEncode(p4)
					end)
					var3 = if ok then status else tostring(p4)
				end
				t.error = var3
				t.rawError = p4
				log(var4, var5, t)
				
				return nil
			end):andThen(function(p4)
				-- upvalues: publishedVersionNumber (ref), var1 (ref), rollbackTargetVersionNumber (ref)
				publishedVersionNumber.setRequestData(var1, {
					versionNumber = rollbackTargetVersionNumber,
					noteTitle = if p4 == nil then nil else p4.title,
					noteDescription = if p4 == nil then nil else p4.description
				})
			end):catch(function(p4)
				-- upvalues: debug (copy), placeId (ref), rollbackTargetVersionNumber (ref), httpService (copy), publishedVersionNumber (ref), var1 (ref)
				local var3
				local log = debug.log
				local var4 = "warn"
				local var5 = "agent feedback revert request preparation failed"
				local t = {
					placeId = placeId,
					restoredVersion = rollbackTargetVersionNumber
				}
				
				if typeof(p4) == "table" then
					local ok, status = pcall(function()
						-- upvalues: httpService (copy), p4 (ref)
						return httpService:JSONEncode(p4)
					end)
					var3 = if ok then status else tostring(p4)
				end
				t.error = var3
				t.rawError = p4
				log(var4, var5, t)
				publishedVersionNumber.failRequest(var3)
			end)
		end
		return var2:catch(function(p4)
			-- upvalues: debug (copy), placeId (ref), rollbackTargetVersionNumber (ref), httpService (copy)
			local var3
			local log = debug.log
			local var4 = "warn"
			local var5 = "agent feedback revert request failed"
			local t = {
				placeId = placeId,
				versionToRollback = rollbackTargetVersionNumber
			}
			
			if typeof(p4) == "table" then
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p4 (ref)
					return httpService:JSONEncode(p4)
				end)
				var3 = if ok then status else tostring(p4)
			end
			t.error = var3
			t.rawError = p4
			log(var4, var5, t)
			error(p4)
		end)
	end else nil,
	rollbackPublishedVersion = function(p3, p4)
		-- upvalues: debug (ref), placeVersionHistoryModule (ref), getVersionNote (ref), httpService (ref), rollbackPlaceWithRetryModule (ref), fFlagEnableTeamTestLua (ref), fFlagBuildNoPublishOnRevertModule (ref), fFlagisPublishOnBuildRevertModule (ref)
		local rollbackTargetVersionNumber
		local universeId = p3.universeId
		local placeId = p3.placeId
		
		if p3.rollbackTargetVersionNumber == nil then
			local publishedVersionNumber = p3.publishedVersionNumber
			rollbackTargetVersionNumber = if publishedVersionNumber == nil or publishedVersionNumber <= 1 then nil else publishedVersionNumber - 1
		else
			rollbackTargetVersionNumber = p3.rollbackTargetVersionNumber
		end
		if placeId == nil or rollbackTargetVersionNumber == nil then
			debug.log("warn", "agent feedback revert missing rollback ids", { feedbackIds = p3 })
			
			if p4 ~= nil and p4.onRevertFailure ~= nil then
				p4.onRevertFailure()
			end
			return
		elseif p4 ~= nil and p4.onRevertStart ~= nil then
			p4.onRevertStart()
		end
		getVersionNote(placeVersionHistoryModule.getPlaceVersionHistoryStore(), placeId, rollbackTargetVersionNumber):catch(function(p5)
			-- upvalues: debug (copy), placeId (ref), rollbackTargetVersionNumber (ref), httpService (copy)
			local var1
			local log = debug.log
			local var2 = "warn"
			local var3 = "agent feedback revert source note load failed"
			local t = {
				placeId = placeId,
				restoredVersion = rollbackTargetVersionNumber
			}
			
			if typeof(p5) == "table" then
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p5 (ref)
					return httpService:JSONEncode(p5)
				end)
				var1 = if ok then status else tostring(p5)
			end
			t.error = var1
			t.rawError = p5
			log(var2, var3, t)
			
			return nil
		end):andThen(function(p5)
			-- upvalues: debug (copy), placeId (ref), rollbackTargetVersionNumber (ref), rollbackPlaceWithRetryModule (copy), fFlagEnableTeamTestLua (copy), fFlagBuildNoPublishOnRevertModule (copy), fFlagisPublishOnBuildRevertModule (copy)
			if p5 == nil then
				debug.log("info", "agent feedback revert note copy skipped", {
					reason = "source_notes_not_found",
					placeId = placeId,
					restoredVersion = rollbackTargetVersionNumber
				})
			end
			return rollbackPlaceWithRetryModule(placeId, rollbackTargetVersionNumber, {
				debugSource = "agent feedback revert",
				note = p5,
				published = if fFlagEnableTeamTestLua then if fFlagBuildNoPublishOnRevertModule then false else true else fFlagisPublishOnBuildRevertModule
			})
		end):andThen(function()
			-- upvalues: p4 (ref)
			if p4 ~= nil and p4.onRevertSuccess ~= nil then
				p4.onRevertSuccess()
			end
		end):catch(function(p5)
			-- upvalues: httpService (copy), debug (copy), universeId (ref), placeId (ref), rollbackTargetVersionNumber (ref), p4 (ref)
			local var1
			if typeof(p5) == "table" then
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p5 (ref)
					return httpService:JSONEncode(p5)
				end)
				var1 = if ok then status else tostring(p5)
			end
			debug.log("warn", "agent feedback revert rollback failed", {
				universeId = universeId,
				placeId = placeId,
				versionToRollback = rollbackTargetVersionNumber,
				error = var1,
				rawError = p5
			})
			warn(`[BuildExperience] agent feedback revert rollback failed: {var1}`)
			
			if p4 ~= nil and p4.onRevertFailure ~= nil then
				p4.onRevertFailure()
			end
		end)
	end
}