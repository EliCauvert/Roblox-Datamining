local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local signalsModule = require(parent.Signals)
local promiseModule = require(parent.Promise)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local createHttpStore = require(parent.InternalHttpStore).createHttpStore
local mutedError = require(parent.Loggers).mutedError
local url = require(parent.Http).Url

return function() --[[ line: 88 | named "createTimeoutStatusStore" ]]
	-- upvalues: createSignal (ref), createHttpStore (ref), signalsModule (ref), url (ref), httpService (ref), mutedError (ref), promiseModule (ref), createComputed (ref)
	local var3, var4 = createSignal({
		isTimedOut = false,
		featureName = nil,
		access = nil,
		timeoutAction = nil,
		details = nil,
		error = nil
	})
	local var5 = false
	local var6 = false
	local var7 = createHttpStore()
	local var8 = nil
	local var9 = nil
	local _ = nil
	local t = {}
	
	local function extractTimeoutAction(p0, p1) --[[ line: 107 ]]
		if not p0.features then
			return nil
		end
		for i, v in p0.features do
			if v.featureName == p1 and v.v2Recourses and #v.v2Recourses > 0 then
				local var17 = v.v2Recourses[1]
				
				if var17 and #var17 > 0 then
					local var18 = var17[1]
					
					if var18.timeoutActions and #var18.timeoutActions > 0 then
						return var18.timeoutActions[1]
					end
				end
			end
		end
		return nil
	end
	
	local var12 = nil
	local var13 = signalsModule.createEffect(function(p2) --[[ line: 131 ]]
		-- upvalues: var3 (ref), var12 (write)
		local var19 = var3(p2)
		local var20 = if var19.details and var19.details.endDate then var19.details.endDate elseif var19.timeoutAction and var19.timeoutAction.endTime then var19.timeoutAction.endTime else nil
		
		if not var20 or var20 == "" then return end
		local ok, status = pcall(function() --[[ line: 145 ]]
			-- upvalues: var20 (ref)
			return DateTime.fromIsoDate(var20)
		end)
		
		if not ok or not status then return end
		local var21 = status.UnixTimestamp - DateTime.now().UnixTimestamp
		
		if var21 <= 0 then
			var12()
			
			return
		end
		local delayedThread = task.delay(var21, function() --[[ line: 163 ]]
			-- upvalues: var12 (copy)
			var12()
		end)
		
		return function() --[[ line: 168 ]]
			-- upvalues: delayedThread (ref)
			if delayedThread then
				task.cancel(delayedThread)
			end
		end
	end)
	
	local function fetchTimeoutDetails(p3, p4) --[[ line: 176 ]]
		-- upvalues: var6 (write), url (copy), var7 (ref), var9 (write), signalsModule (copy), httpService (copy), var3 (ref), var4 (ref), mutedError (copy)
		if var6 then
			p4()
			
			return
		end
		var6 = true
		local var23, _ = var7.fetch("TimeoutDetails_" .. p3, {
			Method = "GET",
			Url = string.format("%sv1/not-approved?abuseVector=%s", url.USER_MODERATION_URL, p3)
		})
		
		if var9 then
			var9()
		end
		local function _() --[[ line: 196 | named "complete" ]]
			-- upvalues: var6 (copy), p4 (ref)
			var6 = false
			p4()
		end
		
		var9 = signalsModule.createEffect(function(p5) --[[ line: 201 ]]
			-- upvalues: var23 (ref), httpService (copy), var3 (copy), var4 (copy), var6 (copy), p4 (ref), mutedError (copy)
			local var24 = var23(p5)
			
			if var24.status == "Success" then
				local body = var24.response.Body
				local ok, status = pcall(function() --[[ line: 205 ]]
					-- upvalues: httpService (copy), body (ref)
					return httpService:JSONDecode(body)
				end)
				
				if ok and status then
					local var25 = var3(p5)
					var4({
						error = nil,
						isTimedOut = var25.isTimedOut,
						featureName = var25.featureName,
						access = var25.access,
						timeoutAction = var25.timeoutAction,
						details = status
					})
					var6 = false
					p4()
					
					return
				end
				mutedError("Failed to decode timeout details JSON response")
				local var26 = var3(p5)
				var4({
					details = nil,
					error = "Failed to decode timeout details",
					isTimedOut = var26.isTimedOut,
					featureName = var26.featureName,
					access = var26.access,
					timeoutAction = var26.timeoutAction
				})
				var6 = false
				p4()
				
				return
			elseif var24.status == "Failed" then
				mutedError("Failed to fetch timeout details")
				local var27 = var3(p5)
				var4({
					details = nil,
					error = "Failed to fetch timeout details",
					isTimedOut = var27.isTimedOut,
					featureName = var27.featureName,
					access = var27.access,
					timeoutAction = var27.timeoutAction
				})
				var6 = false
				p4()
			end
		end)
	end
	
	local function resolvePendingFetches() --[[ line: 251 ]]
		-- upvalues: var3 (ref), t (write)
		local var28 = var3(false)
		
		for i, v in t do
			v(var28)
		end
		t = {}
	end
	
	local function doFetchStatus(p6, p7) --[[ line: 259 ]]
		-- upvalues: var5 (write), url (copy), var7 (ref), var8 (write), resolvePendingFetches (ref), signalsModule (copy), httpService (copy), extractTimeoutAction (ref), var4 (ref), fetchTimeoutDetails (ref), mutedError (copy)
		if var5 then return end
		var5 = true
		p6 = p6 or "AvatarChange"
		local var30, _ = var7.fetch("TimeoutStatus_" .. p6, {
			Method = "GET",
			Url = string.format("%saccess-management/v1/feature-access?%s", url.APIS_URL, url:makeQueryString({
				featureNames = p6,
				nameSpace = p7 or "avatar_marketplace/AvatarMarketPlace"
			}))
		})
		
		if var8 then
			var8()
		end
		local function complete() --[[ line: 288 ]]
			-- upvalues: resolvePendingFetches (copy)
			resolvePendingFetches()
		end
		
		var8 = signalsModule.createEffect(function(p8) --[[ line: 292 ]]
			-- upvalues: var30 (ref), httpService (copy), extractTimeoutAction (copy), p6 (ref), var4 (copy), var5 (copy), fetchTimeoutDetails (copy), complete (ref), resolvePendingFetches (copy), mutedError (copy)
			local var32 = var30(p8)
			
			if var32.status == "Success" then
				local body = var32.response.Body
				local ok, status = pcall(function() --[[ line: 296 ]]
					-- upvalues: httpService (copy), body (ref)
					return httpService:JSONDecode(body)
				end)
				
				if not ok or not status then
					mutedError("Failed to decode timeout status JSON response")
					var4({
						isTimedOut = false,
						access = nil,
						timeoutAction = nil,
						details = nil,
						error = "Failed to decode timeout status",
						featureName = p6
					})
					var5 = false
					resolvePendingFetches()
					
					return
				end
				local var33 = extractTimeoutAction(status, p6)
				local var34 = var33 ~= nil
				local access = nil
				
				if status.features then
					for i, v in status.features do
						if v.featureName == p6 then
							access = v.access
							break
						end
					end
				end
				var4({
					details = nil,
					error = nil,
					isTimedOut = var34,
					featureName = p6,
					access = access,
					timeoutAction = var33
				})
				var5 = false
				
				if var34 and var33 then
					fetchTimeoutDetails(var33.featureVector or "avatar_change", complete)
					
					return
				end
				resolvePendingFetches()
				
				return
			elseif var32.status == "Failed" then
				mutedError("Failed to fetch timeout status")
				var4({
					isTimedOut = false,
					access = nil,
					timeoutAction = nil,
					details = nil,
					error = "Failed to fetch timeout status",
					featureName = p6
				})
				var5 = false
				resolvePendingFetches()
			end
		end)
	end
	
	return {
		getStatus = var3,
		getIsTimedOut = createComputed(function(p9) --[[ line: 373 ]]
			-- upvalues: var3 (ref)
			return var3(p9).isTimedOut
		end),
		getTimeoutDetails = createComputed(function(p10) --[[ line: 377 ]]
			-- upvalues: var3 (ref)
			return var3(p10).details
		end),
		fetchStatus = function(p11, p12) --[[ line: 361 ]]
			-- upvalues: doFetchStatus (ref)
			doFetchStatus(p11, p12)
		end,
		fetchStatusAsync = function(p13, p14) --[[ line: 365 ]]
			-- upvalues: promiseModule (copy), t (write), doFetchStatus (ref)
			return promiseModule.new(function(p15) --[[ line: 366 ]]
				-- upvalues: t (copy), doFetchStatus (copy), p13 (ref), p14 (ref)
				table.insert(t, p15)
				doFetchStatus(p13, p14)
			end)
		end,
		setStatus = function(value) --[[ line: 382 ]]
			-- upvalues: var4 (ref)
			var4(value)
		end,
		clearStatus = function() --[[ line: 388 ]]
			-- upvalues: var9 (write), var8 (write), var6 (write), var5 (write), var4 (ref), resolvePendingFetches (ref)
			if var9 then
				var9()
				var9 = nil
			end
			if var8 then
				var8()
				var8 = nil
			end
			var6 = false
			var5 = false
			var4({
				isTimedOut = false,
				featureName = nil,
				access = nil,
				timeoutAction = nil,
				details = nil,
				error = nil
			})
			resolvePendingFetches()
		end,
		effectDispose = var13
	}
end