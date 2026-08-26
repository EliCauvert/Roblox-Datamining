local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local signalsModule = require(parent.Signals)
local promiseModule = require(parent.Promise)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed
local createHttpStore = require(parent.InternalHttpStore).createHttpStore
local mutedError = require(parent.Loggers).mutedError
local url = require(parent.Http).Url

return function()
	-- upvalues: createSignal (ref), createHttpStore (ref), signalsModule (ref), url (ref), httpService (ref), mutedError (ref), promiseModule (ref), createComputed (ref)
	local var1, var2 = createSignal({
		isTimedOut = false,
		featureName = nil,
		access = nil,
		timeoutAction = nil,
		details = nil,
		error = nil
	})
	local var3 = false
	local var4 = false
	local var5 = createHttpStore()
	local var6 = nil
	local var7 = nil
	local _ = nil
	local t = {}
	
	local function extractTimeoutAction(p1, p2)
		if not p1.features then
			return nil
		end
		for i, v in p1.features do
			if v.featureName == p2 and v.v2Recourses and #v.v2Recourses > 0 then
				local var8 = v.v2Recourses[1]
				
				if var8 and #var8 > 0 then
					local var9 = var8[1]
					
					if var9.timeoutActions and #var9.timeoutActions > 0 then
						return var9.timeoutActions[1]
					end
				end
			end
		end
		return nil
	end
	
	local var10 = nil
	local var11 = signalsModule.createEffect(function(p3)
		-- upvalues: var1 (ref), var10 (write)
		local var12 = var1(p3)
		local var13 = if var12.details and var12.details.endDate then var12.details.endDate elseif var12.timeoutAction and var12.timeoutAction.endTime then var12.timeoutAction.endTime else nil
		
		if not var13 or var13 == "" then return end
		local ok, status = pcall(function()
			-- upvalues: var13 (ref)
			return DateTime.fromIsoDate(var13)
		end)
		
		if not ok or not status then return end
		local var14 = status.UnixTimestamp - DateTime.now().UnixTimestamp
		
		if var14 <= 0 then
			var10()
			
			return
		end
		local delayedThread = task.delay(var14, function()
			-- upvalues: var10 (copy)
			var10()
		end)
		
		return function()
			-- upvalues: delayedThread (ref)
			if delayedThread then
				task.cancel(delayedThread)
			end
		end
	end)
	
	local function fetchTimeoutDetails(p3, p4)
		-- upvalues: var4 (write), url (copy), var5 (ref), var7 (write), signalsModule (copy), httpService (copy), var1 (ref), var2 (ref), mutedError (copy)
		if var4 then
			p4()
			
			return
		end
		var4 = true
		local var12, _ = var5.fetch("TimeoutDetails_" .. p3, {
			Method = "GET",
			Url = string.format("%sv1/not-approved?abuseVector=%s", url.USER_MODERATION_URL, p3)
		})
		
		if var7 then
			var7()
		end
		local function _()
			-- upvalues: var4 (copy), p4 (ref)
			var4 = false
			p4()
		end
		
		var7 = signalsModule.createEffect(function(p5)
			-- upvalues: var12 (ref), httpService (copy), var1 (copy), var2 (copy), var4 (copy), p4 (ref), mutedError (copy)
			local var13 = var12(p5)
			
			if var13.status == "Success" then
				local body = var13.response.Body
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), body (ref)
					return httpService:JSONDecode(body)
				end)
				
				if ok and status then
					local var14 = var1(p5)
					var2({
						error = nil,
						isTimedOut = var14.isTimedOut,
						featureName = var14.featureName,
						access = var14.access,
						timeoutAction = var14.timeoutAction,
						details = status
					})
					var4 = false
					p4()
					
					return
				end
				mutedError("Failed to decode timeout details JSON response")
				local var15 = var1(p5)
				var2({
					details = nil,
					error = "Failed to decode timeout details",
					isTimedOut = var15.isTimedOut,
					featureName = var15.featureName,
					access = var15.access,
					timeoutAction = var15.timeoutAction
				})
				var4 = false
				p4()
				
				return
			elseif var13.status == "Failed" then
				mutedError("Failed to fetch timeout details")
				local var16 = var1(p5)
				var2({
					details = nil,
					error = "Failed to fetch timeout details",
					isTimedOut = var16.isTimedOut,
					featureName = var16.featureName,
					access = var16.access,
					timeoutAction = var16.timeoutAction
				})
				var4 = false
				p4()
			end
		end)
	end
	
	local function resolvePendingFetches()
		-- upvalues: var1 (ref), t (write)
		local var12 = var1(false)
		
		for i, v in t do
			v(var12)
		end
		t = {}
	end
	
	local function doFetchStatus(p3, p4)
		-- upvalues: var3 (write), url (copy), var5 (ref), var6 (write), resolvePendingFetches (ref), signalsModule (copy), httpService (copy), extractTimeoutAction (ref), var2 (ref), fetchTimeoutDetails (ref), mutedError (copy)
		if var3 then return end
		var3 = true
		p3 = p3 or "AvatarChange"
		local var13, _ = var5.fetch("TimeoutStatus_" .. p6, {
			Method = "GET",
			Url = string.format("%saccess-management/v1/feature-access?%s", url.APIS_URL, url:makeQueryString({
				featureNames = p3,
				nameSpace = p4 or "avatar_marketplace/AvatarMarketPlace"
			}))
		})
		
		if var6 then
			var6()
		end
		local function complete()
			-- upvalues: resolvePendingFetches (copy)
			resolvePendingFetches()
		end
		
		var6 = signalsModule.createEffect(function(p5)
			-- upvalues: var13 (ref), httpService (copy), extractTimeoutAction (copy), p3 (ref), var2 (copy), var3 (copy), fetchTimeoutDetails (copy), complete (ref), resolvePendingFetches (copy), mutedError (copy)
			local var14 = var13(p5)
			
			if var14.status == "Success" then
				local body = var14.response.Body
				local ok, status = pcall(function()
					-- upvalues: httpService (copy), body (ref)
					return httpService:JSONDecode(body)
				end)
				
				if not ok or not status then
					mutedError("Failed to decode timeout status JSON response")
					var2({
						isTimedOut = false,
						access = nil,
						timeoutAction = nil,
						details = nil,
						error = "Failed to decode timeout status",
						featureName = p3
					})
					var3 = false
					resolvePendingFetches()
					
					return
				end
				local var15 = extractTimeoutAction(status, p3)
				local var16 = var15 ~= nil
				local access = nil
				
				if status.features then
					for i, v in status.features do
						if v.featureName == p3 then
							access = v.access
							break
						end
					end
				end
				var2({
					details = nil,
					error = nil,
					isTimedOut = var16,
					featureName = p3,
					access = access,
					timeoutAction = var15
				})
				var3 = false
				
				if var16 and var15 then
					fetchTimeoutDetails(var15.featureVector or "avatar_change", complete)
					
					return
				end
				resolvePendingFetches()
				
				return
			elseif var14.status == "Failed" then
				mutedError("Failed to fetch timeout status")
				var2({
					isTimedOut = false,
					access = nil,
					timeoutAction = nil,
					details = nil,
					error = "Failed to fetch timeout status",
					featureName = p3
				})
				var3 = false
				resolvePendingFetches()
			end
		end)
	end
	
	return {
		getStatus = var1,
		getIsTimedOut = createComputed(function(p5)
			-- upvalues: var1 (ref)
			return var1(p5).isTimedOut
		end),
		getTimeoutDetails = createComputed(function(p5)
			-- upvalues: var1 (ref)
			return var1(p5).details
		end),
		fetchStatus = function(p5, p6)
			-- upvalues: doFetchStatus (ref)
			doFetchStatus(p5, p6)
		end,
		fetchStatusAsync = function(p5, p6)
			-- upvalues: promiseModule (copy), t (write), doFetchStatus (ref)
			return promiseModule.new(function(p7)
				-- upvalues: t (copy), doFetchStatus (copy), p5 (ref), p6 (ref)
				table.insert(t, p7)
				doFetchStatus(p5, p6)
			end)
		end,
		setStatus = function(value)
			-- upvalues: var2 (ref)
			var2(value)
		end,
		clearStatus = function()
			-- upvalues: var7 (write), var6 (write), var4 (write), var3 (write), var2 (ref), resolvePendingFetches (ref)
			if var7 then
				var7()
				var7 = nil
			end
			if var6 then
				var6()
				var6 = nil
			end
			var4 = false
			var3 = false
			var2({
				isTimedOut = false,
				featureName = nil,
				access = nil,
				timeoutAction = nil,
				details = nil,
				error = nil
			})
			resolvePendingFetches()
		end,
		effectDispose = var11
	}
end