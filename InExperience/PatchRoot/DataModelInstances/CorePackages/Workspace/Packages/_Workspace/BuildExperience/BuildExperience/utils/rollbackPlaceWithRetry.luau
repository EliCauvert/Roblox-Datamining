local parent = script:FindFirstAncestor("BuildExperience").Parent
local httpService = game:GetService("HttpService")
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local placeVersionHistoryModule = require(parent.DataHydration.PlaceVersionHistory)
local promiseModule = require(parent.Promise)
local buildExperienceRollbackPlaceMaxRetries = game:DefineFastInt("BuildExperienceRollbackPlaceMaxRetries", 2)
local buildExperienceRollbackPlaceRetryDelayMs = game:DefineFastInt("BuildExperienceRollbackPlaceRetryDelayMs", 1000)
local debug = creatorAgentChatModule.debug

local function _(p0) --[[ line: 27 | named "formatDebugValue" ]]
	-- upvalues: httpService (ref)
	if typeof(p0) == "table" then
		local ok, status = pcall(function() --[[ line: 29 ]]
			-- upvalues: httpService (copy), p0 (ref)
			return httpService:JSONEncode(p0)
		end)
		
		return if ok then status else tostring(p0)
	end
end

local _ = function(p1) --[[ line: 39 | named "hasVersionNote" ]]
	return if p1.title == nil then p1.description ~= nil else true
end

local _ = function(p2, p3) --[[ line: 43 | named "debugMessage" ]]
	return `{p2.debugSource or "rollback"} {p3}`
end

local function copyVersionNoteAfterRollback(p4, p5, p6, p7, p8, p9) --[[ line: 47 ]]
	-- upvalues: promiseModule (ref), debug (ref), httpService (ref)
	if p8.note == nil then
		return promiseModule.resolve()
	elseif p7.newVersionNumber == nil then
		debug.log("info", `{p8.debugSource or "rollback"} note copy skipped`, {
			reason = "newVersionNumber_nil",
			placeId = p5,
			restoredVersion = p6
		})
		
		return promiseModule.resolve()
	elseif p9 == nil then
		debug.log("info", `{p8.debugSource or "rollback"} note copy skipped`, {
			reason = "source_notes_not_found",
			placeId = p5,
			restoredVersion = p6,
			newVersion = p7.newVersionNumber
		})
		
		return promiseModule.resolve()
	elseif if p9.title == nil then p9.description ~= nil else true then
		local var7 = tostring(p7.newVersionNumber)
		
		return p4.addVersionNote(p5, var7, p9):catch(function(p10) --[[ line: 89 ]]
			-- upvalues: debug (copy), p8 (ref), p5 (ref), p6 (ref), var7 (ref), p9 (ref), httpService (copy)
			local var11
			local log = debug.log
			local var8 = "warn"
			local var9 = `{p8.debugSource or "rollback"} note copy failed`
			local t = {
				placeId = p5,
				restoredVersion = p6,
				newVersion = var7,
				titleLength = if p9.title == nil then nil else #p9.title,
				descriptionLength = if p9.description == nil then nil else #p9.description
			}
			
			if typeof(p10) == "table" then
				local ok, status = pcall(function() --[[ line: 29 ]]
					-- upvalues: httpService (copy), p10 (ref)
					return httpService:JSONEncode(p10)
				end)
				var11 = if ok then status else tostring(p10)
			end
			t.error = var11
			t.rawError = p10
			log(var8, var9, t)
			
			return nil
		end)
	end
	debug.log("info", `{p8.debugSource or "rollback"} note copy skipped`, {
		reason = "source_notes_empty",
		placeId = p5,
		restoredVersion = p6,
		newVersion = p7.newVersionNumber
	})
	
	return promiseModule.resolve()
end

local _ = function(p11, p12) --[[ line: 103 | named "waitForRetry" ]]
	-- upvalues: promiseModule (ref)
	return if p12 == 0 then promiseModule.resolve() else promiseModule.new(function(p13) --[[ line: 108 ]]
		-- upvalues: p12 (ref), p11 (ref)
		task.delay(p12 * p11 / 1000, p13)
	end)
end

return function(p14, p15, p16) --[[ line: 113 | named "rollbackPlaceWithRetry" ]]
	-- upvalues: buildExperienceRollbackPlaceMaxRetries (ref), buildExperienceRollbackPlaceRetryDelayMs (ref), placeVersionHistoryModule (ref), promiseModule (ref), copyVersionNoteAfterRollback (ref)
	p16 = p16 or {}
	local var13 = if p16.retries ~= nil then buildExperienceRollbackPlaceMaxRetries else p16.retries
	local var14 = if p16.retryDelayMs ~= nil then buildExperienceRollbackPlaceRetryDelayMs else p16.retryDelayMs
	local var15 = if p16.published ~= nil then false else p16.published
	local placeVersionHistoryStore = placeVersionHistoryModule.getPlaceVersionHistoryStore()
	
	local function rollbackWithRetry(p17, p18) --[[ line: 128 ]]
		-- upvalues: placeVersionHistoryStore (ref), p14 (ref), p15 (ref), var15 (ref), var13 (ref), promiseModule (copy), var14 (ref), rollbackWithRetry (ref)
		return placeVersionHistoryStore.rollbackPlace(p14, p15, if p18 ~= nil then nil else p18.description, var15):catch(function(p19) --[[ line: 130 ]]
			-- upvalues: p17 (ref), var13 (copy), promiseModule (copy), var14 (copy), rollbackWithRetry (copy), p18 (ref)
			if var13 <= p17 then
				return promiseModule.reject(p19)
			end
			local var19 = p17 + 1
			
			return (if var14 == 0 then promiseModule.resolve() else promiseModule.new(function(p20) --[[ line: 108 ]]
				-- upvalues: var14 (ref), var19 (ref)
				task.delay(var14 * var19 / 1000, p20)
			end)):andThen(function() --[[ line: 136 ]]
				-- upvalues: rollbackWithRetry (copy), var19 (ref), p18 (copy)
				return rollbackWithRetry(var19, p18)
			end)
		end)
	end
	
	local note = p16.note
	local var18 = 0
	
	return placeVersionHistoryStore.rollbackPlace(p14, p15, if note ~= nil then nil else note.description, var15):catch(function(p22) --[[ line: 130 ]]
		-- upvalues: var18 (ref), var13 (ref), promiseModule (copy), var14 (ref), rollbackWithRetry (ref), note (ref)
		if var13 <= var18 then
			return promiseModule.reject(p22)
		end
		local var19 = var18 + 1
		
		return (if var14 == 0 then promiseModule.resolve() else promiseModule.new(function(p23) --[[ line: 108 ]]
			-- upvalues: var14 (ref), var19 (ref)
			task.delay(var14 * var19 / 1000, p23)
		end)):andThen(function() --[[ line: 136 ]]
			-- upvalues: rollbackWithRetry (copy), var19 (ref), note (copy)
			return rollbackWithRetry(var19, note)
		end)
	end):andThen(function(p21) --[[ line: 143 ]]
		-- upvalues: copyVersionNoteAfterRollback (copy), placeVersionHistoryStore (ref), p14 (ref), p15 (ref), p16 (ref), note (ref)
		return copyVersionNoteAfterRollback(placeVersionHistoryStore, p14, p15, p21, p16, note):andThen(function() --[[ line: 145 ]]
			-- upvalues: p21 (ref)
			return p21
		end)
	end)
end