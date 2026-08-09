local messageBusService = game:GetService("MessageBusService")
local promiseModule = require(script:FindFirstAncestor("BuildExperience").Parent.Promise)
local buildLiveActivity = game:DefineFastFlag("BuildLiveActivity", false)
local buildLiveActivityCleanup = game:DefineFastFlag("BuildLiveActivityCleanup", false)

local function isUuid(p0) --[[ line: 17 ]]
	if typeof(p0) == "string" then
		local parts = string.split(string.lower(p0), "-")
		
		return #parts == 5 and (#parts[1] == 8 and (#parts[2] == 4 and (#parts[3] == 4 and (#parts[4] == 4 and (#parts[5] == 12 and string.match(table.concat(parts), "^[0-9a-f]+$") ~= nil)))))
	end
	return false
end

local function isPositiveInteger(p1) --[[ line: 31 ]]
	return typeof(p1) == "number" and (p1 > 0 and p1 % 1 == 0)
end

local function _(p2, p3) --[[ line: 35 | named "callNative" ]]
	-- upvalues: messageBusService (ref)
	return pcall(function() --[[ line: 36 ]]
		-- upvalues: messageBusService (copy), p2 (ref), p3 (ref)
		messageBusService:Call(messageBusService:GetMessageId("BuildLiveActivity", p2), p3)
	end)
end

local _ = function(p4, p5) --[[ line: 42 | named "call" ]]
	-- upvalues: buildLiveActivity (ref), messageBusService (ref)
	return buildLiveActivity and pcall(function() --[[ line: 36 ]]
		-- upvalues: messageBusService (copy), p4 (ref), p5 (ref)
		messageBusService:Call(messageBusService:GetMessageId("BuildLiveActivity", p4), p5)
	end)
end

local _ = function(_, _) --[[ line: 46 | named "callCleanup" ]]
	-- upvalues: buildLiveActivity (ref), buildLiveActivityCleanup (ref), messageBusService (ref)
-- FATAL: Failed to generate AST for `callCleanup` function:
runtime : [KeyError] :11990: 30
Traceback:
	runtime : [lunaux]:11990 function decompile_function
	runtime : [lunaux]:1933 function normalize_cfg
	runtime : [lunaux]:1320 function match_weird_patterns
end

return {
	bootstrap = function(p6) --[[ line: 52 ]]
		-- upvalues: buildLiveActivity (ref), buildLiveActivityCleanup (ref), messageBusService (ref)
		local ok
		local t = { isEligible = p6 }
		
		if not buildLiveActivity then
			ok = buildLiveActivityCleanup
			
			if ok then
				local var9 = "bootstrap"
				ok = pcall(function() --[[ line: 36 ]]
					-- upvalues: messageBusService (copy), var9 (ref), t (ref)
					messageBusService:Call(messageBusService:GetMessageId("BuildLiveActivity", var9), t)
				end)
			end
			return ok
		end
	end,
	beginTurn = function(p7, p8) --[[ line: 56 ]]
		-- upvalues: isUuid (ref), buildLiveActivity (ref), messageBusService (ref)
		if not isUuid(p7) or not (typeof(p8) == "number" and (p8 > 0 and p8 % 1 == 0)) then
			return false
		end
		local t = { sessionId = p7, turnId = p8 }
		local ok = buildLiveActivity
		
		if ok then
			local var12 = "beginTurn"
			ok = pcall(function() --[[ line: 36 ]]
				-- upvalues: messageBusService (copy), var12 (ref), t (ref)
				messageBusService:Call(messageBusService:GetMessageId("BuildLiveActivity", var12), t)
			end)
		end
		return ok
	end,
	consume = function(p9, p10, p11, p12) --[[ line: 63 ]]
		-- upvalues: isUuid (ref), buildLiveActivity (ref), messageBusService (ref)
		if not isUuid(p9) or not (typeof(p10) == "number" and (p10 > 0 and p10 % 1 == 0)) or (not (typeof(p11) == "number" and (p11 > 0 and p11 % 1 == 0)) or typeof(p12) ~= "string") or p12 == "" then
			return false
		end
		local t = {
			sessionId = p9,
			turnId = p10,
			sequenceId = p11,
			updateJson = p12
		}
		local ok = buildLiveActivity
		
		if ok then
			local var15 = "consume"
			ok = pcall(function() --[[ line: 36 ]]
				-- upvalues: messageBusService (copy), var15 (ref), t (ref)
				messageBusService:Call(messageBusService:GetMessageId("BuildLiveActivity", var15), t)
			end)
		end
		return ok
	end,
	endTurn = function(p13, p14, p15) --[[ line: 81 ]]
		-- upvalues: isUuid (ref), buildLiveActivity (ref), messageBusService (ref)
		if not isUuid(p13) or not (typeof(p14) == "number" and (p14 > 0 and p14 % 1 == 0)) or p15 ~= "responseReady" and p15 ~= "failed" and p15 ~= "cancelled" then
			return false
		end
		local t = { sessionId = p13, turnId = p14, reason = p15 }
		local ok = buildLiveActivity
		
		if ok then
			local var18 = "endTurn"
			ok = pcall(function() --[[ line: 36 ]]
				-- upvalues: messageBusService (copy), var18 (ref), t (ref)
				messageBusService:Call(messageBusService:GetMessageId("BuildLiveActivity", var18), t)
			end)
		end
		return ok
	end,
	endAll = function() --[[ line: 92 ]]
		-- upvalues: buildLiveActivity (ref), buildLiveActivityCleanup (ref), messageBusService (ref)
		local ok
		local t = {}
		
		if not buildLiveActivity then
			ok = buildLiveActivityCleanup
			
			if ok then
				local var21 = "endAll"
				ok = pcall(function() --[[ line: 36 ]]
					-- upvalues: messageBusService (copy), var21 (ref), t (ref)
					messageBusService:Call(messageBusService:GetMessageId("BuildLiveActivity", var21), t)
				end)
			end
			return ok
		end
	end,
	endAllAndWait = function(p16) --[[ line: 96 ]]
		-- upvalues: buildLiveActivity (ref), buildLiveActivityCleanup (ref), promiseModule (ref), messageBusService (ref)
		return if buildLiveActivity or buildLiveActivityCleanup then promiseModule.race({
			promiseModule.new(function(p17, _) --[[ line: 100 ]]
				-- upvalues: messageBusService (copy)
				if not pcall(function() --[[ line: 101 ]]
					-- upvalues: messageBusService (copy), p17 (ref)
					messageBusService:MakeRequest("BuildLiveActivity", "endAll", {}, function(_) --[[ line: 102 ]]
						-- upvalues: p17 (copy)
						p17(true)
					end, {})
				end) then
					p17(false)
				end
			end),
			promiseModule.delay(p16 or 0.25):andThen(function() --[[ line: 110 ]]
				return false
			end)
		}) else promiseModule.resolve(false)
	end,
	featureFlagDidChange = function(p18) --[[ line: 116 ]]
		-- upvalues: buildLiveActivity (ref), buildLiveActivityCleanup (ref), messageBusService (ref)
		local ok
		local t = { isEnabled = p18 }
		
		if not buildLiveActivity then
			ok = buildLiveActivityCleanup
			
			if ok then
				local var24 = "featureFlagDidChange"
				ok = pcall(function() --[[ line: 36 ]]
					-- upvalues: messageBusService (copy), var24 (ref), t (ref)
					messageBusService:Call(messageBusService:GetMessageId("BuildLiveActivity", var24), t)
				end)
			end
			return ok
		end
	end,
	deepLinkResult = function(p19) --[[ line: 120 ]]
		-- upvalues: buildLiveActivity (ref), messageBusService (ref)
		if p19 ~= "succeeded" and p19 ~= "routeUnavailable" and p19 ~= "inaccessible" then
			return false
		end
		local t = { result = p19 }
		local ok = buildLiveActivity
		
		if ok then
			local var27 = "deepLinkResult"
			ok = pcall(function() --[[ line: 36 ]]
				-- upvalues: messageBusService (copy), var27 (ref), t (ref)
				messageBusService:Call(messageBusService:GetMessageId("BuildLiveActivity", var27), t)
			end)
		end
		return ok
	end,
	isUuid = isUuid,
	isPositiveInteger = isPositiveInteger
}