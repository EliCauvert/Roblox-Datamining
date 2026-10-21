local HttpService = game:GetService("HttpService")
local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local PromiseModule = require(Parent.Promise)
local PlaceVersionHistoryModule = require(Parent.DataHydration.PlaceVersionHistory)
local _ = require(BuildExperience.Chat.chatTypes)
local FeedbackActionModule = require(script.Parent.FeedbackAction)
local _ = require(script.Parent.UserFeedback)
local GetAgentRollbackRequestStoreModule = require(BuildExperience.Stores.GetAgentRollbackRequestStore)
local IconName = require(Parent.Foundation).Enums.IconName
local Debug = require(Parent.DataHydration.CreatorAgentChat).debug
local BuildAgentRollbackNoteTimeoutSeconds = game:DefineFastInt("BuildAgentRollbackNoteTimeoutSeconds", 5)

local function _(RawError)
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

local function findVersionNote(p1, RollbackTargetVersionNumber)
	if p1 == nil or typeof(p1.placeVersions) ~= "table" then
		return nil
	end
	for _, placeVersion in p1.placeVersions do
		if tonumber(placeVersion.version) == RollbackTargetVersionNumber then
			return {
				title = placeVersion.title,
				description = placeVersion.description
			}
		end
	end
	return nil
end

local function fetchVersionNote(PlaceVersionHistoryStore, PlaceId, RestoredVersion, Cursor, p2: number)
	-- upvalues: PromiseModule (copy), findVersionNote (copy), fetchVersionNote (copy)
	return if p2 <= 0 then PromiseModule.resolve(nil) else PlaceVersionHistoryStore.fetchPageHistory(PlaceId, { cursor = Cursor }):andThen(function(Result)
		-- upvalues: findVersionNote (upval), RestoredVersion (copy), fetchVersionNote (upval), PlaceVersionHistoryStore (copy), PlaceId (copy), p2 (copy)
		local v1 = findVersionNote(Result, RestoredVersion)
		
		return if v1 == nil then if Result.nextCursor == nil or Result.nextCursor == "" then nil else fetchVersionNote(PlaceVersionHistoryStore, PlaceId, RestoredVersion, Result.nextCursor, p2 - 1) else v1
	end)
end

return {
	canRevert = function(p2): boolean
		local v1 = false
		
		if p2.placeId ~= nil then
			local RollbackTargetVersionNumber = nil
			if p2.rollbackTargetVersionNumber == nil then
				local PublishedVersionNumber: number = p2.publishedVersionNumber
				RollbackTargetVersionNumber = if PublishedVersionNumber == nil or PublishedVersionNumber <= 1 then nil else PublishedVersionNumber - 1
			else
				RollbackTargetVersionNumber = p2.rollbackTargetVersionNumber
			end
			v1 = RollbackTargetVersionNumber ~= nil
		end
		return v1
	end,
	getRollbackTargetVersionNumber = function(p2)
		if p2.rollbackTargetVersionNumber == nil then
			local PublishedVersionNumber: number = p2.publishedVersionNumber
			
			return if PublishedVersionNumber == nil or PublishedVersionNumber <= 1 then nil else PublishedVersionNumber - 1
		else
			return p2.rollbackTargetVersionNumber
		end
	end,
	getFeedbackIcons = function(p2)
		-- upvalues: IconName (copy), FeedbackActionModule (copy)
		local List = {}
		
		if p2 ~= nil and p2.includeCopy then
			table.insert(List, {
				iconName = p2.copyIconName or IconName.TwoStackedSquares,
				action = FeedbackActionModule.COPY,
				testId = p2.copyTestId
			})
		end
		local IsRatingDisabled = if p2 == nil then nil else p2.isRatingDisabled
		table.insert(List, {
			iconName = IconName.ThumbUp,
			action = FeedbackActionModule.THUMBS_UP,
			isDisabled = IsRatingDisabled
		})
		table.insert(List, {
			iconName = IconName.ThumbDown,
			action = FeedbackActionModule.THUMBS_DOWN,
			isDisabled = IsRatingDisabled
		})
		
		if p2 ~= nil and p2.includeRevert then
			table.insert(List, {
				allowRepeatedActivation = true,
				iconName = IconName.ArrowCurlToLeft,
				action = FeedbackActionModule.REVERT,
				isDisabled = p2.isRevertDisabled
			})
		end
		return List
	end,
	requestAgentRollback = function(FeedbackIds)
		-- upvalues: Debug (copy), PromiseModule (copy), GetAgentRollbackRequestStoreModule (copy), PlaceVersionHistoryModule (copy), findVersionNote (copy), fetchVersionNote (copy), BuildAgentRollbackNoteTimeoutSeconds (copy), HttpService (copy)
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
			
			return PromiseModule.reject("agent_rollback_missing_ids")
		end
		local AgentRollbackRequestStoreModule = GetAgentRollbackRequestStoreModule(false)
		local BeginRequestResult, BeginRequestResult2 = AgentRollbackRequestStoreModule.beginRequest({ universeId = FeedbackIds.universeId, placeId = PlaceId })
		
		if BeginRequestResult ~= nil then
			local PlaceVersionHistoryStore = PlaceVersionHistoryModule.getPlaceVersionHistoryStore()
			local v1 = 3
			PlaceVersionHistoryStore.fetchPageHistory(PlaceId, { cursor = nil }):andThen(function(Result)
				-- upvalues: findVersionNote (upval), RollbackTargetVersionNumber (copy), fetchVersionNote (upval), PlaceVersionHistoryStore (copy), PlaceId (copy), v1 (copy)
				local v2 = findVersionNote(Result, RollbackTargetVersionNumber)
				
				return if v2 == nil then if Result.nextCursor == nil or Result.nextCursor == "" then nil else fetchVersionNote(PlaceVersionHistoryStore, PlaceId, RollbackTargetVersionNumber, Result.nextCursor, v1 - 1) else v2
			end):timeout(BuildAgentRollbackNoteTimeoutSeconds):catch(function(Err)
				-- upvalues: Debug (upval), PlaceId (copy), RollbackTargetVersionNumber (copy), HttpService (upval)
				local LogFunction: (any, any, any) -> () = Debug.log
				local v2 = "warn"
				local v3 = "agent feedback revert source note load failed"
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
				LogFunction(v2, v3, config)
				
				return nil
			end):andThen(function(Result)
				-- upvalues: AgentRollbackRequestStoreModule (copy), BeginRequestResult (copy), RollbackTargetVersionNumber (copy)
				AgentRollbackRequestStoreModule.setRequestData(BeginRequestResult, {
					versionNumber = RollbackTargetVersionNumber,
					noteTitle = if Result == nil then nil else Result.title,
					noteDescription = if Result == nil then nil else Result.description
				})
			end):catch(function(Err)
				-- upvalues: Debug (upval), PlaceId (copy), RollbackTargetVersionNumber (copy), HttpService (upval), AgentRollbackRequestStoreModule (copy), BeginRequestResult (copy)
				local LogFunction: (any, any, any) -> () = Debug.log
				local v2 = "warn"
				local v3 = "agent feedback revert request preparation failed"
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
				LogFunction(v2, v3, config)
				AgentRollbackRequestStoreModule.failRequest(BeginRequestResult)
			end)
		end
		return BeginRequestResult2:catch(function(Err)
			-- upvalues: Debug (upval), PlaceId (copy), RollbackTargetVersionNumber (copy), HttpService (upval)
			local LogFunction: (any, any, any) -> () = Debug.log
			local v2 = "warn"
			local v3 = "agent feedback revert request failed"
			local config = {
				placeId = PlaceId,
				versionToRollback = RollbackTargetVersionNumber
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
			LogFunction(v2, v3, config)
			error(Err)
		end)
	end
}