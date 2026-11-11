local Parent = script:FindFirstAncestor("BuildExperience").Parent
local HttpService = game:GetService("HttpService")
local PlaceVersionHistoryModule = require(Parent.DataHydration.PlaceVersionHistory)
local PromiseModule = require(Parent.Promise)
local BuildExperienceRollbackPlaceMaxRetries = game:DefineFastInt("BuildExperienceRollbackPlaceMaxRetries", 2)
local BuildExperienceRollbackPlaceRetryDelayMs = game:DefineFastInt("BuildExperienceRollbackPlaceRetryDelayMs", 1000)
local Debug = require(Parent.DataHydration.CreatorAgentChat).debug

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

local _ = function(p1): boolean
	return p1.title ~= nil or p1.description ~= nil
end

local _ = function(p1, p2): string
	return `{p1.debugSource or "rollback"} {p2}`
end

local function copyVersionNoteAfterRollback(PlaceVersionHistoryStore, PlaceId, RestoredVersion, p1, p2, Note)
	-- upvalues: PromiseModule (copy), Debug (copy), HttpService (copy)
	if p2.note == nil then
		return PromiseModule.resolve()
	elseif p1.newVersionNumber == nil then
		Debug.log("info", `{p2.debugSource or "rollback"} note copy skipped`, {
			reason = "newVersionNumber_nil",
			placeId = PlaceId,
			restoredVersion = RestoredVersion
		})
		
		return PromiseModule.resolve()
	elseif Note == nil then
		Debug.log("info", `{p2.debugSource or "rollback"} note copy skipped`, {
			reason = "source_notes_not_found",
			placeId = PlaceId,
			restoredVersion = RestoredVersion,
			newVersion = p1.newVersionNumber
		})
		
		return PromiseModule.resolve()
	elseif Note.title ~= nil or Note.description ~= nil then
		local Text = tostring(p1.newVersionNumber)
		
		return PlaceVersionHistoryStore.addVersionNote(PlaceId, Text, Note):catch(function(Err)
			-- upvalues: Debug (upval), p2 (copy), PlaceId (copy), RestoredVersion (copy), Text (copy), Note (copy), HttpService (upval)
			local LogFunction: (any, any, any) -> () = Debug.log
			local v1 = "warn"
			local Message: string = `{p2.debugSource or "rollback"} note copy failed`
			local config = {
				placeId = PlaceId,
				restoredVersion = RestoredVersion,
				newVersion = Text,
				titleLength = if Note.title == nil then nil else #Note.title,
				descriptionLength = if Note.description == nil then nil else #Note.description
			}
			local Text1 = nil
			repeat
				if typeof(Err) == "table" then
					local Success, Result = pcall(function()
						-- upvalues: HttpService (upval), Err (copy)
						return HttpService:JSONEncode(Err)
					end)
					
					if Success then
						Text1 = Result
						break
					end
				end
				Text1 = tostring(Err)
			until true
			config.error = Text1
			config.rawError = Err
			LogFunction(v1, Message, config)
			
			return nil
		end)
	else
		Debug.log("info", `{p2.debugSource or "rollback"} note copy skipped`, {
			reason = "source_notes_empty",
			placeId = PlaceId,
			restoredVersion = RestoredVersion,
			newVersion = p1.newVersionNumber
		})
		
		return PromiseModule.resolve()
	end
end

local _ = function(p1, p2)
	-- upvalues: PromiseModule (copy)
	return if p2 == 0 then PromiseModule.resolve() else PromiseModule.new(function(p3)
		-- upvalues: p2 (copy), p1 (copy)
		task.delay(p2 * p1 / 1000, p3)
	end)
end

return function(PlaceId, RestoredVersion, p1)
	-- upvalues: BuildExperienceRollbackPlaceMaxRetries (copy), BuildExperienceRollbackPlaceRetryDelayMs (copy), PlaceVersionHistoryModule (copy), PromiseModule (copy), copyVersionNoteAfterRollback (copy)
	local P16 = p1 or {}
	local BuildExperienceRollbackPlaceMaxRetries1 = if P16.retries == nil then BuildExperienceRollbackPlaceMaxRetries else P16.retries
	local BuildExperienceRollbackPlaceRetryDelayMs1 = if P16.retryDelayMs == nil then BuildExperienceRollbackPlaceRetryDelayMs else P16.retryDelayMs
	local NoPublished = P16.published == nil or P16.published
	local PlaceVersionHistoryStore = PlaceVersionHistoryModule.getPlaceVersionHistoryStore()
	
	local function rollbackWithRetry(p2, p3)
		-- upvalues: PlaceVersionHistoryStore (copy), PlaceId (copy), RestoredVersion (copy), NoPublished (copy), BuildExperienceRollbackPlaceMaxRetries1 (copy), PromiseModule (upval), BuildExperienceRollbackPlaceRetryDelayMs1 (copy), rollbackWithRetry (copy)
		return PlaceVersionHistoryStore.rollbackPlace(PlaceId, RestoredVersion, if p3 == nil then nil else p3.description, NoPublished):catch(function(Err)
			-- upvalues: p2 (copy), BuildExperienceRollbackPlaceMaxRetries1 (upval), PromiseModule (upval), BuildExperienceRollbackPlaceRetryDelayMs1 (upval), rollbackWithRetry (upval), p3 (copy)
			if BuildExperienceRollbackPlaceMaxRetries1 <= p2 then
				return PromiseModule.reject(Err)
			else
				local v1 = p2 + 1
				
				return (if BuildExperienceRollbackPlaceRetryDelayMs1 == 0 then PromiseModule.resolve() else PromiseModule.new(function(p4)
					-- upvalues: BuildExperienceRollbackPlaceRetryDelayMs1 (copy), v1 (copy)
					task.delay(BuildExperienceRollbackPlaceRetryDelayMs1 * v1 / 1000, p4)
				end)):andThen(function()
					-- upvalues: rollbackWithRetry (upval), v1 (copy), p3 (upval)
					return rollbackWithRetry(v1, p3)
				end)
			end
		end)
	end
	
	local Note = P16.note
	local v1 = 0
	
	return PlaceVersionHistoryStore.rollbackPlace(PlaceId, RestoredVersion, if Note == nil then nil else Note.description, NoPublished):catch(function(Err)
		-- upvalues: v1 (copy), BuildExperienceRollbackPlaceMaxRetries1 (copy), PromiseModule (upval), BuildExperienceRollbackPlaceRetryDelayMs1 (copy), rollbackWithRetry (copy), Note (copy)
		if BuildExperienceRollbackPlaceMaxRetries1 <= v1 then
			return PromiseModule.reject(Err)
		else
			local v2 = v1 + 1
			
			return (if BuildExperienceRollbackPlaceRetryDelayMs1 == 0 then PromiseModule.resolve() else PromiseModule.new(function(p2)
				-- upvalues: BuildExperienceRollbackPlaceRetryDelayMs1 (copy), v2 (copy)
				task.delay(BuildExperienceRollbackPlaceRetryDelayMs1 * v2 / 1000, p2)
			end)):andThen(function()
				-- upvalues: rollbackWithRetry (upval), v2 (copy), Note (upval)
				return rollbackWithRetry(v2, Note)
			end)
		end
	end):andThen(function(Result)
		-- upvalues: copyVersionNoteAfterRollback (upval), PlaceVersionHistoryStore (copy), PlaceId (copy), RestoredVersion (copy), P16 (copy), Note (copy)
		return copyVersionNoteAfterRollback(PlaceVersionHistoryStore, PlaceId, RestoredVersion, Result, P16, Note):andThen(function()
			-- upvalues: Result (copy)
			return Result
		end)
	end)
end