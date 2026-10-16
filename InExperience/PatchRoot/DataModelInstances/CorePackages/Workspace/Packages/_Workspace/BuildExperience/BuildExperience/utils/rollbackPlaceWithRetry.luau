local parent = script:FindFirstAncestor("BuildExperience").Parent
local httpService = game:GetService("HttpService")
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local placeVersionHistoryModule = require(parent.DataHydration.PlaceVersionHistory)
local promiseModule = require(parent.Promise)
local buildExperienceRollbackPlaceMaxRetries = game:DefineFastInt("BuildExperienceRollbackPlaceMaxRetries", 2)
local buildExperienceRollbackPlaceRetryDelayMs = game:DefineFastInt("BuildExperienceRollbackPlaceRetryDelayMs", 1000)
local debug = creatorAgentChatModule.debug

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
	return if p1.title == nil then p1.description ~= nil else true
end

local _ = function(p1, p2)
	return `{p1.debugSource or "rollback"} {p2}`
end

local function copyVersionNoteAfterRollback(p1, p2, p3, p4, p5, p6)
	-- upvalues: promiseModule (ref), debug (ref), httpService (ref)
	if p5.note == nil then
		return promiseModule.resolve()
	elseif p4.newVersionNumber == nil then
		debug.log("info", `{p5.debugSource or "rollback"} note copy skipped`, {
			reason = "newVersionNumber_nil",
			placeId = p2,
			restoredVersion = p3
		})
		
		return promiseModule.resolve()
	elseif p6 == nil then
		debug.log("info", `{p5.debugSource or "rollback"} note copy skipped`, {
			reason = "source_notes_not_found",
			placeId = p2,
			restoredVersion = p3,
			newVersion = p4.newVersionNumber
		})
		
		return promiseModule.resolve()
	elseif if p6.title == nil then p6.description ~= nil else true then
		local var1 = tostring(p4.newVersionNumber)
		
		return p1.addVersionNote(p2, var1, p6):catch(function(p7)
			-- upvalues: debug (copy), p5 (ref), p2 (ref), p3 (ref), var1 (ref), p6 (ref), httpService (copy)
			local var2
			local log = debug.log
			local var3 = "warn"
			local var4 = `{p5.debugSource or "rollback"} note copy failed`
			local t = {
				placeId = p2,
				restoredVersion = p3,
				newVersion = var1,
				titleLength = if p6.title == nil then nil else #p6.title,
				descriptionLength = if p6.description == nil then nil else #p6.description
			}
			
			if typeof(p7) == "table" then
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), p7 (ref)
					return httpService:JSONEncode(p7)
				end)
				var2 = if ok then status else tostring(p7)
			end
			t.error = var2
			t.rawError = p7
			log(var3, var4, t)
			
			return nil
		end)
	end
	debug.log("info", `{p5.debugSource or "rollback"} note copy skipped`, {
		reason = "source_notes_empty",
		placeId = p2,
		restoredVersion = p3,
		newVersion = p4.newVersionNumber
	})
	
	return promiseModule.resolve()
end

local _ = function(p1, p2)
	-- upvalues: promiseModule (ref)
	return if p2 == 0 then promiseModule.resolve() else promiseModule.new(function(p3)
		-- upvalues: p2 (ref), p1 (ref)
		task.delay(p2 * p1 / 1000, p3)
	end)
end

return function(p1, p2, p3)
	-- upvalues: buildExperienceRollbackPlaceMaxRetries (ref), buildExperienceRollbackPlaceRetryDelayMs (ref), placeVersionHistoryModule (ref), promiseModule (ref), copyVersionNoteAfterRollback (ref)
	p3 = p3 or {}
	local var1 = if p3.retries ~= nil then buildExperienceRollbackPlaceMaxRetries else p3.retries
	local var2 = if p3.retryDelayMs ~= nil then buildExperienceRollbackPlaceRetryDelayMs else p3.retryDelayMs
	local var3 = if p3.published ~= nil then false else p3.published
	local placeVersionHistoryStore = placeVersionHistoryModule.getPlaceVersionHistoryStore()
	
	local function rollbackWithRetry(p4, p5)
		-- upvalues: placeVersionHistoryStore (ref), p1 (ref), p2 (ref), var3 (ref), var1 (ref), promiseModule (copy), var2 (ref), rollbackWithRetry (ref)
		return placeVersionHistoryStore.rollbackPlace(p1, p2, if p5 ~= nil then nil else p5.description, var3):catch(function(p6)
			-- upvalues: p4 (ref), var1 (copy), promiseModule (copy), var2 (copy), rollbackWithRetry (copy), p5 (ref)
			if var1 <= p4 then
				return promiseModule.reject(p6)
			end
			local var4 = p4 + 1
			
			return (if var2 == 0 then promiseModule.resolve() else promiseModule.new(function(p7)
				-- upvalues: var2 (ref), var4 (ref)
				task.delay(var2 * var4 / 1000, p7)
			end)):andThen(function()
				-- upvalues: rollbackWithRetry (copy), var4 (ref), p5 (copy)
				return rollbackWithRetry(var4, p5)
			end)
		end)
	end
	
	local note = p3.note
	local var4 = 0
	
	return placeVersionHistoryStore.rollbackPlace(p1, p2, if note ~= nil then nil else note.description, var3):catch(function(p4)
		-- upvalues: var4 (ref), var1 (ref), promiseModule (copy), var2 (ref), rollbackWithRetry (ref), note (ref)
		if var1 <= var4 then
			return promiseModule.reject(p4)
		end
		local var5 = var4 + 1
		
		return (if var2 == 0 then promiseModule.resolve() else promiseModule.new(function(p5)
			-- upvalues: var2 (ref), var5 (ref)
			task.delay(var2 * var5 / 1000, p5)
		end)):andThen(function()
			-- upvalues: rollbackWithRetry (copy), var5 (ref), note (copy)
			return rollbackWithRetry(var5, note)
		end)
	end):andThen(function(p4)
		-- upvalues: copyVersionNoteAfterRollback (copy), placeVersionHistoryStore (ref), p1 (ref), p2 (ref), p3 (ref), note (ref)
		return copyVersionNoteAfterRollback(placeVersionHistoryStore, p1, p2, p4, p3, note):andThen(function()
			-- upvalues: p4 (ref)
			return p4
		end)
	end)
end