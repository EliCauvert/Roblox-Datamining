local HttpService = game:GetService("HttpService")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local PromiseModule = require(Parent.Promise)
local PlaceVersionHistoryModule = require(Parent.DataHydration.PlaceVersionHistory)
local _ = require(BuildExperience.Chat.chatTypes)
local FeedbackActionModule = require(script.Parent.FeedbackAction)
local _ = require(script.Parent.UserFeedback)
local RollbackPlaceWithRetryModule = require(BuildExperience.utils.rollbackPlaceWithRetry)
local SendAgentTurnFeedbackModule = require(script.Parent.sendAgentTurnFeedback)
local IconName = require(Parent.Foundation).Enums.IconName
local Debug = require(Parent.DataHydration.CreatorAgentChat).debug

local function _(p1)
	if p1.rollbackTargetVersionNumber == nil then
		local PublishedVersionNumber: number = p1.publishedVersionNumber
		
		return if PublishedVersionNumber == nil or PublishedVersionNumber <= 1 then nil else PublishedVersionNumber - 1
	else
		return p1.rollbackTargetVersionNumber
	end
end

local _ = function(RawError)
	-- upvalues: HttpService (copy)
	if typeof(RawError) == "table" then
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), RawError (copy)
			return HttpService:JSONEncode(RawError)
		end)
		
		if Success then
			return Result
		end
	end
	return (tostring(RawError))
end

local _ = function(p1): number
	return (tonumber(p1.version))
end

local function findVersionNote(DataResult, Number)
	if DataResult == nil or typeof(DataResult.placeVersions) ~= "table" then
		return nil
	end
	for _, placeVersion in DataResult.placeVersions do
		if tonumber(placeVersion.version) == Number then
			return {
				title = placeVersion.title,
				description = placeVersion.description
			}
		end
	end
	return nil
end

local function fetchVersionNote(p1, p2, p3, Cursor)
	-- upvalues: findVersionNote (copy), fetchVersionNote (copy)
	return p1.fetchPageHistory(p2, { cursor = Cursor }):andThen(function(Result)
		-- upvalues: findVersionNote (upval), p3 (copy), fetchVersionNote (upval), p1 (copy), p2 (copy)
		local VersionNote = findVersionNote(Result, p3)
		
		return if VersionNote == nil then if Result.nextCursor == nil or Result.nextCursor == "" then nil else fetchVersionNote(p1, p2, p3, Result.nextCursor) else VersionNote
	end)
end

local function getVersionNote(PlaceVersionHistoryStore, PlaceId, RollbackTargetVersionNumber)
	-- upvalues: findVersionNote (copy), PromiseModule (copy), fetchVersionNote (copy)
	local VersionNote = findVersionNote(PlaceVersionHistoryStore.getHistory(PlaceId).data(false), RollbackTargetVersionNumber)
	
	return if VersionNote == nil then fetchVersionNote(PlaceVersionHistoryStore, PlaceId, RollbackTargetVersionNumber, nil) else PromiseModule.resolve(VersionNote)
end

local function rollbackPublishedVersion(FeedbackIds, p1)
	-- upvalues: Debug (copy), PlaceVersionHistoryModule (copy), getVersionNote (copy), HttpService (copy), RollbackPlaceWithRetryModule (copy)
	local UniverseId = FeedbackIds.universeId
	local PlaceId = FeedbackIds.placeId
	local RollbackTargetVersionNumber = nil
	
	if FeedbackIds.rollbackTargetVersionNumber == nil then
		local PublishedVersionNumber: number = FeedbackIds.publishedVersionNumber
		RollbackTargetVersionNumber = if PublishedVersionNumber == nil or PublishedVersionNumber <= 1 then nil else PublishedVersionNumber - 1
	else
		RollbackTargetVersionNumber = FeedbackIds.rollbackTargetVersionNumber
	end
	if PlaceId == nil or RollbackTargetVersionNumber == nil then
		Debug.log("warn", "agent feedback revert missing rollback ids", { feedbackIds = FeedbackIds })
		
		if p1 ~= nil and p1.onRevertFailure ~= nil then
			p1.onRevertFailure()
		end
		return
	else
		if p1 ~= nil and p1.onRevertStart ~= nil then
			p1.onRevertStart()
		end
		getVersionNote(PlaceVersionHistoryModule.getPlaceVersionHistoryStore(), PlaceId, RollbackTargetVersionNumber):catch(function(Err)
			-- upvalues: Debug (upval), PlaceId (copy), RollbackTargetVersionNumber (copy), HttpService (upval)
			local LogFunction: (any, any, any) -> () = Debug.log
			local v1 = "warn"
			local v2 = "agent feedback revert source note load failed"
			local config = {
				placeId = PlaceId,
				restoredVersion = RollbackTargetVersionNumber
			}
			local Text = nil
			repeat
				if typeof(Err) == "table" then
					local Success, Result = pcall(function()
						-- upvalues: HttpService (upval), Err (copy)
						return HttpService:JSONEncode(Err)
					end)
					
					if Success then
						Text = Result
						break
					end
				end
				Text = tostring(Err)
			until true
			config.error = Text
			config.rawError = Err
			LogFunction(v1, v2, config)
			
			return nil
		end):andThen(function(Result)
			-- upvalues: Debug (upval), PlaceId (copy), RollbackTargetVersionNumber (copy), RollbackPlaceWithRetryModule (upval)
			if Result == nil then
				Debug.log("info", "agent feedback revert note copy skipped", {
					reason = "source_notes_not_found",
					placeId = PlaceId,
					restoredVersion = RollbackTargetVersionNumber
				})
			end
			return RollbackPlaceWithRetryModule(PlaceId, RollbackTargetVersionNumber, { debugSource = "agent feedback revert", note = Result })
		end):andThen(function()
			-- upvalues: p1 (copy)
			if p1 ~= nil and p1.onRevertSuccess ~= nil then
				p1.onRevertSuccess()
			end
		end):catch(function(Err)
			-- upvalues: HttpService (upval), Debug (upval), UniverseId (copy), PlaceId (copy), RollbackTargetVersionNumber (copy), p1 (copy)
			local Text = nil
			repeat
				if typeof(Err) == "table" then
					local Success, Result = pcall(function()
						-- upvalues: HttpService (upval), Err (copy)
						return HttpService:JSONEncode(Err)
					end)
					
					if Success then
						Text = Result
						break
					end
				end
				Text = tostring(Err)
			until true
			Debug.log("warn", "agent feedback revert rollback failed", {
				universeId = UniverseId,
				placeId = PlaceId,
				versionToRollback = RollbackTargetVersionNumber,
				error = Text,
				rawError = Err
			})
			warn(`[BuildExperience] agent feedback revert rollback failed: {Text}`)
			
			if p1 ~= nil and p1.onRevertFailure ~= nil then
				p1.onRevertFailure()
			end
		end)
	end
end

return {
	canRevert = function(p1): boolean
		local v1 = false
		
		if p1.placeId ~= nil then
			local RollbackTargetVersionNumber = nil
			if p1.rollbackTargetVersionNumber == nil then
				local PublishedVersionNumber: number = p1.publishedVersionNumber
				RollbackTargetVersionNumber = if PublishedVersionNumber == nil or PublishedVersionNumber <= 1 then nil else PublishedVersionNumber - 1
			else
				RollbackTargetVersionNumber = p1.rollbackTargetVersionNumber
			end
			v1 = RollbackTargetVersionNumber ~= nil
		end
		return v1
	end,
	getFeedbackIcons = function(p1)
		-- upvalues: IconName (copy), FeedbackActionModule (copy)
		local List = {
			{
				iconName = IconName.ThumbUp,
				action = FeedbackActionModule.THUMBS_UP
			},
			{
				iconName = IconName.ThumbDown,
				action = FeedbackActionModule.THUMBS_DOWN
			}
		}
		
		if p1 ~= nil and p1.includeRevert then
			table.insert(List, {
				allowRepeatedActivation = true,
				iconName = IconName.ArrowCurlToLeft,
				action = FeedbackActionModule.REVERT,
				isDisabled = p1.isRevertDisabled
			})
		end
		return List
	end,
	createOnActivated = function(FeedbackIds, p1)
		-- upvalues: SendAgentTurnFeedbackModule (copy), FeedbackActionModule (copy), rollbackPublishedVersion (copy)
		return function(p2)
			-- upvalues: SendAgentTurnFeedbackModule (upval), FeedbackIds (copy), FeedbackActionModule (upval), rollbackPublishedVersion (upval), p1 (copy)
			if p2.isDisabled == true then return end
			SendAgentTurnFeedbackModule(p2.action, FeedbackIds)
			
			if p2.action == FeedbackActionModule.REVERT then
				rollbackPublishedVersion(FeedbackIds, p1)
			end
		end
	end
}