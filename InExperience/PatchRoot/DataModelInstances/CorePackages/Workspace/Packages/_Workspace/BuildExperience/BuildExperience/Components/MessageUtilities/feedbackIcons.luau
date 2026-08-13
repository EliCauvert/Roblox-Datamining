local httpService = game:GetService("HttpService")
local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local promiseModule = require(parent.Promise)
local sharedFlagsModule = require(parent.SharedFlags)
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local placeVersionHistoryModule = require(parent.DataHydration.PlaceVersionHistory)
local _ = require(buildExperience.Chat.chatTypes)
local fFlagisPublishOnBuildRevertModule = require(buildExperience.Flags.FFlagisPublishOnBuildRevert)
local feedbackActionModule = require(script.Parent.FeedbackAction)
local _ = require(script.Parent.UserFeedback)
local rollbackPlaceWithRetryModule = require(buildExperience.utils.rollbackPlaceWithRetry)
local fFlagEnableTeamTestLua = sharedFlagsModule.FFlagEnableTeamTestLua
local fFlagBuildNoPublishOnRevertModule = require(buildExperience.Flags.FFlagBuildNoPublishOnRevert)
local iconName = foundationModule.Enums.IconName
local debug = creatorAgentChatModule.debug

local function getRollbackTargetVersionNumber(p0) --[[ line: 45 ]]
	if p0.rollbackTargetVersionNumber ~= nil then
		return p0.rollbackTargetVersionNumber
	end
	local publishedVersionNumber = p0.publishedVersionNumber
	
	return if publishedVersionNumber == nil or publishedVersionNumber <= 1 then nil else publishedVersionNumber - 1
end

local function canRevert(p1) --[[ line: 58 ]]
	local var17 = false
	
	if p1.placeId ~= nil then
		local rollbackTargetVersionNumber
		if p1.rollbackTargetVersionNumber == nil then
			local publishedVersionNumber = p1.publishedVersionNumber
			rollbackTargetVersionNumber = if publishedVersionNumber == nil or publishedVersionNumber <= 1 then nil else publishedVersionNumber - 1
		else
			rollbackTargetVersionNumber = p1.rollbackTargetVersionNumber
		end
		var17 = rollbackTargetVersionNumber ~= nil
	end
	return var17
end

local function getFeedbackIcons(p2) --[[ line: 62 ]]
	-- upvalues: iconName (ref), feedbackActionModule (ref)
	local t = {}
	
	if p2 ~= nil and p2.includeCopy then
		table.insert(t, {
			iconName = p2.copyIconName or iconName.TwoStackedSquares,
			action = feedbackActionModule.COPY,
			testId = p2.copyTestId
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
	
	if p2 ~= nil and p2.includeRevert then
		table.insert(t, {
			allowRepeatedActivation = true,
			iconName = iconName.ArrowCurlToLeft,
			action = feedbackActionModule.REVERT,
			isDisabled = p2.isRevertDisabled
		})
	end
	return t
end

local function _(p3) --[[ line: 84 | named "formatDebugValue" ]]
	-- upvalues: httpService (ref)
	if typeof(p3) == "table" then
		local ok, status = pcall(function() --[[ line: 86 ]]
			-- upvalues: httpService (copy), p3 (ref)
			return httpService:JSONEncode(p3)
		end)
		
		return if ok then status else tostring(p3)
	end
end

local _ = function(p4) --[[ line: 96 | named "getVersionNumber" ]]
	return tonumber(p4.version)
end

local function findVersionNote(p5, p6) --[[ line: 100 ]]
	if p5 == nil or typeof(p5.placeVersions) ~= "table" then
		return nil
	end
	for i, v in p5.placeVersions do
		if tonumber(v.version) == p6 then
			return { title = v.title, description = v.description }
		end
	end
	return nil
end

local function fetchVersionNote(p7, p8, p9, p10) --[[ line: 117 ]]
	-- upvalues: findVersionNote (ref), fetchVersionNote (ref)
	return p7.fetchPageHistory(p8, { cursor = p10 }):andThen(function(p11) --[[ line: 123 ]]
		-- upvalues: findVersionNote (copy), p9 (ref), fetchVersionNote (copy), p7 (ref), p8 (ref)
		local var19 = findVersionNote(p11, p9)
		
		return if var19 == nil then if p11.nextCursor == nil or p11.nextCursor == "" then nil else fetchVersionNote(p7, p8, p9, p11.nextCursor) else var19
	end)
end

local function getVersionNote(p12, p13, p14) --[[ line: 135 ]]
	-- upvalues: findVersionNote (ref), promiseModule (ref), fetchVersionNote (ref)
	local var20 = findVersionNote(p12.getHistory(p13).data(false), p14)
	
	return if var20 == nil then fetchVersionNote(p12, p13, p14, nil) else promiseModule.resolve(var20)
end

return {
	canRevert = canRevert,
	getRollbackTargetVersionNumber = getRollbackTargetVersionNumber,
	getFeedbackIcons = getFeedbackIcons,
	rollbackPublishedVersion = function(p15, p16) --[[ line: 145 ]]
		-- upvalues: debug (ref), placeVersionHistoryModule (ref), getVersionNote (ref), httpService (ref), rollbackPlaceWithRetryModule (ref), fFlagEnableTeamTestLua (ref), fFlagBuildNoPublishOnRevertModule (ref), fFlagisPublishOnBuildRevertModule (ref)
		local rollbackTargetVersionNumber
		local universeId = p15.universeId
		local placeId = p15.placeId
		
		if p15.rollbackTargetVersionNumber == nil then
			local publishedVersionNumber = p15.publishedVersionNumber
			rollbackTargetVersionNumber = if publishedVersionNumber == nil or publishedVersionNumber <= 1 then nil else publishedVersionNumber - 1
		else
			rollbackTargetVersionNumber = p15.rollbackTargetVersionNumber
		end
		if placeId == nil or rollbackTargetVersionNumber == nil then
			debug.log("warn", "agent feedback revert missing rollback ids", { feedbackIds = p15 })
			
			if p16 ~= nil and p16.onRevertFailure ~= nil then
				p16.onRevertFailure()
			end
			return
		elseif p16 ~= nil and p16.onRevertStart ~= nil then
			p16.onRevertStart()
		end
		getVersionNote(placeVersionHistoryModule.getPlaceVersionHistoryStore(), placeId, rollbackTargetVersionNumber):catch(function(p19) --[[ line: 165 ]]
			-- upvalues: debug (copy), placeId (ref), rollbackTargetVersionNumber (ref), httpService (copy)
			local var25
			local log = debug.log
			local var22 = "warn"
			local var23 = "agent feedback revert source note load failed"
			local t = {
				placeId = placeId,
				restoredVersion = rollbackTargetVersionNumber
			}
			
			if typeof(p19) == "table" then
				local ok, status = pcall(function() --[[ line: 86 ]]
					-- upvalues: httpService (copy), p19 (ref)
					return httpService:JSONEncode(p19)
				end)
				var25 = if ok then status else tostring(p19)
			end
			t.error = var25
			t.rawError = p19
			log(var22, var23, t)
			
			return nil
		end):andThen(function(p18) --[[ line: 174 ]]
			-- upvalues: debug (copy), placeId (ref), rollbackTargetVersionNumber (ref), rollbackPlaceWithRetryModule (copy), fFlagEnableTeamTestLua (copy), fFlagBuildNoPublishOnRevertModule (copy), fFlagisPublishOnBuildRevertModule (copy)
			if p18 == nil then
				debug.log("info", "agent feedback revert note copy skipped", {
					reason = "source_notes_not_found",
					placeId = placeId,
					restoredVersion = rollbackTargetVersionNumber
				})
			end
			return rollbackPlaceWithRetryModule(placeId, rollbackTargetVersionNumber, {
				debugSource = "agent feedback revert",
				note = p18,
				published = if fFlagEnableTeamTestLua then if fFlagBuildNoPublishOnRevertModule then false else true else fFlagisPublishOnBuildRevertModule
			})
		end):andThen(function() --[[ line: 191 ]]
			-- upvalues: p16 (ref)
			if p16 ~= nil and p16.onRevertSuccess ~= nil then
				p16.onRevertSuccess()
			end
		end):catch(function(p17) --[[ line: 196 ]]
			-- upvalues: httpService (copy), debug (copy), universeId (ref), placeId (ref), rollbackTargetVersionNumber (ref), p16 (ref)
			local var21
			if typeof(p17) == "table" then
				local ok, status = pcall(function() --[[ line: 86 ]]
					-- upvalues: httpService (copy), p17 (ref)
					return httpService:JSONEncode(p17)
				end)
				var21 = if ok then status else tostring(p17)
			end
			debug.log("warn", "agent feedback revert rollback failed", {
				universeId = universeId,
				placeId = placeId,
				versionToRollback = rollbackTargetVersionNumber,
				error = var21,
				rawError = p17
			})
			warn(`[BuildExperience] agent feedback revert rollback failed: {var21}`)
			
			if p16 ~= nil and p16.onRevertFailure ~= nil then
				p16.onRevertFailure()
			end
		end)
	end
}