local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local SignalsModule = require(Parent.Signals)
local PromiseModule = require(Parent.Promise)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local CreateHttpStoreFunction = require(Parent.InternalHttpStore).createHttpStore
local MutedErrorFunction = require(Parent.Loggers).mutedError
local Url = require(Parent.Http).Url

return function()
	-- upvalues: CreateSignalFunction (copy), CreateHttpStoreFunction (copy), SignalsModule (copy), Url (copy), HttpService (copy), MutedErrorFunction (copy), PromiseModule (copy), CreateComputedFunction (copy)
	local Signal, Signal2 = CreateSignalFunction({
		isTimedOut = false,
		featureName = nil,
		access = nil,
		timeoutAction = nil,
		details = nil,
		error = nil
	})
	local Flag = false
	local Flag1 = false
	local HttpStore = CreateHttpStoreFunction()
	local Effect: (() -> ())? = nil
	local Effect1: (() -> ())? = nil
	local List = {}
	
	local function extractTimeoutAction(p1, FeatureName)
		if not p1.features then
			return nil
		end
		local V2Recour = nil
		for _, feature in p1.features do
			if feature.featureName == FeatureName and feature.v2Recourses and #feature.v2Recourses > 0 then
				local V2Recours = feature.v2Recourses[1]
				
				if V2Recours and #V2Recours > 0 then
					V2Recour = V2Recours[1]
					
					if V2Recour.timeoutActions and #V2Recour.timeoutActions > 0 then
						return V2Recour.timeoutActions[1]
					end
				end
			end
		end
		return nil
	end
	
	local Callback = nil
	local Effect2 = SignalsModule.createEffect(function(p2)
		-- upvalues: Signal (copy), Callback (ref)
		local SignalResult = Signal(p2)
		local EndDate = if SignalResult.details and SignalResult.details.endDate then SignalResult.details.endDate elseif SignalResult.timeoutAction and SignalResult.timeoutAction.endTime then SignalResult.timeoutAction.endTime else nil
		
		if not EndDate or EndDate == "" then return end
		local Success, Result = pcall(function()
			-- upvalues: EndDate (copy)
			return DateTime.fromIsoDate(EndDate)
		end)
		
		if not Success or not Result then return end
		local UnixTimestampDelta = Result.UnixTimestamp - DateTime.now().UnixTimestamp
		
		if UnixTimestampDelta <= 0 then
			Callback()
			
			return
		end
		local DelayedThread = task.delay(UnixTimestampDelta, function()
			-- upvalues: Callback (upval)
			Callback()
		end)
		
		return function()
			-- upvalues: DelayedThread (copy)
			if DelayedThread then
				task.cancel(DelayedThread)
			end
		end
	end)
	
	local function fetchTimeoutDetails(FeatureVector, Callback: () -> ())
		-- upvalues: Flag1 (ref), Url (upval), HttpStore (copy), Effect1 (ref), SignalsModule (upval), HttpService (upval), Signal (copy), Signal2 (copy), MutedErrorFunction (upval)
		if Flag1 then
			Callback()
			
			return
		end
		Flag1 = true
		local FetchResult, _ = HttpStore.fetch("TimeoutDetails_" .. FeatureVector, {
			Method = "GET",
			Url = string.format("%sv1/not-approved?abuseVector=%s", Url.USER_MODERATION_URL, FeatureVector)
		})
		
		if Effect1 then
			Effect1()
		end
		local function _()
			-- upvalues: Flag1 (upval), Callback (copy)
			Flag1 = false
			Callback()
		end
		
		Effect1 = SignalsModule.createEffect(function(p2)
			-- upvalues: FetchResult (copy), HttpService (upval), Signal (upval), Signal2 (upval), Flag1 (upval), Callback (copy), MutedErrorFunction (upval)
			local Result = FetchResult(p2)
			
			if Result.status == "Success" then
				local Body = Result.response.Body
				local Success, Result1 = pcall(function()
					-- upvalues: HttpService (upval), Body (copy)
					return HttpService:JSONDecode(Body)
				end)
				
				if Success and Result1 then
					local SignalResult = Signal(p2)
					Signal2({
						error = nil,
						isTimedOut = SignalResult.isTimedOut,
						featureName = SignalResult.featureName,
						access = SignalResult.access,
						timeoutAction = SignalResult.timeoutAction,
						details = Result1
					})
					Flag1 = false
					Callback()
					
					return
				else
					MutedErrorFunction("Failed to decode timeout details JSON response")
					local SignalResult = Signal(p2)
					Signal2({
						details = nil,
						error = "Failed to decode timeout details",
						isTimedOut = SignalResult.isTimedOut,
						featureName = SignalResult.featureName,
						access = SignalResult.access,
						timeoutAction = SignalResult.timeoutAction
					})
					Flag1 = false
					Callback()
					
					return
				end
			elseif Result.status == "Failed" then
				MutedErrorFunction("Failed to fetch timeout details")
				local SignalResult = Signal(p2)
				Signal2({
					details = nil,
					error = "Failed to fetch timeout details",
					isTimedOut = SignalResult.isTimedOut,
					featureName = SignalResult.featureName,
					access = SignalResult.access,
					timeoutAction = SignalResult.timeoutAction
				})
				Flag1 = false
				Callback()
			end
		end)
	end
	
	local function resolvePendingFetches()
		-- upvalues: Signal (copy), List (ref)
		local SignalResult = Signal(false)
		
		for _, value in List do
			value(SignalResult)
		end
		List = {}
	end
	
	local function doFetchStatus(p2, p3)
		-- upvalues: Flag (ref), Url (upval), HttpStore (copy), Effect (ref), resolvePendingFetches (copy), SignalsModule (upval), HttpService (upval), extractTimeoutAction (copy), Signal2 (copy), fetchTimeoutDetails (copy), MutedErrorFunction (upval)
		if Flag then return end
		Flag = true
		local P5 = p2 or "AvatarChange"
		local FetchResult, _ = HttpStore.fetch("TimeoutStatus_" .. P5, {
			Method = "GET",
			Url = string.format("%saccess-management/v1/feature-access?%s", Url.APIS_URL, Url:makeQueryString({
				featureNames = P5,
				nameSpace = p3 or "avatar_marketplace/AvatarMarketPlace"
			}))
		})
		
		if Effect then
			Effect()
		end
		local function complete()
			-- upvalues: resolvePendingFetches (upval)
			resolvePendingFetches()
		end
		
		Effect = SignalsModule.createEffect(function(p4)
			-- upvalues: FetchResult (copy), HttpService (upval), extractTimeoutAction (upval), P5 (copy), Signal2 (upval), Flag (upval), fetchTimeoutDetails (upval), complete (copy), resolvePendingFetches (upval), MutedErrorFunction (upval)
			local Result = FetchResult(p4)
			
			if Result.status == "Success" then
				local Body = Result.response.Body
				local Success, Result1 = pcall(function()
					-- upvalues: HttpService (upval), Body (copy)
					return HttpService:JSONDecode(Body)
				end)
				
				if not Success or not Result1 then
					MutedErrorFunction("Failed to decode timeout status JSON response")
					Signal2({
						isTimedOut = false,
						access = nil,
						timeoutAction = nil,
						details = nil,
						error = "Failed to decode timeout status",
						featureName = P5
					})
					Flag = false
					resolvePendingFetches()
					
					return
				end
				local ExtractTimeoutActionResult = extractTimeoutAction(Result1, P5)
				local HasExtractTimeoutActionResult = ExtractTimeoutActionResult ~= nil
				local Access = nil
				
				if Result1.features then
					for _, feature in Result1.features do
						if feature.featureName == P5 then
							Access = feature.access
							break
						end
					end
				end
				Signal2({
					details = nil,
					error = nil,
					isTimedOut = HasExtractTimeoutActionResult,
					featureName = P5,
					access = Access,
					timeoutAction = ExtractTimeoutActionResult
				})
				Flag = false
				
				if HasExtractTimeoutActionResult and ExtractTimeoutActionResult then
					fetchTimeoutDetails(ExtractTimeoutActionResult.featureVector or "avatar_change", complete)
					
					return
				else
					resolvePendingFetches()
					
					return
				end
			elseif Result.status == "Failed" then
				MutedErrorFunction("Failed to fetch timeout status")
				Signal2({
					isTimedOut = false,
					access = nil,
					timeoutAction = nil,
					details = nil,
					error = "Failed to fetch timeout status",
					featureName = P5
				})
				Flag = false
				resolvePendingFetches()
			end
		end)
	end
	
	local function fetchStatus(p4, p5)
		-- upvalues: doFetchStatus (copy)
		doFetchStatus(p4, p5)
	end
	
	local function fetchStatusAsync(p4, p5)
		-- upvalues: PromiseModule (upval), List (ref), doFetchStatus (copy)
		return PromiseModule.new(function(p6)
			-- upvalues: List (upval), doFetchStatus (upval), p4 (copy), p5 (copy)
			table.insert(List, p6)
			doFetchStatus(p4, p5)
		end)
	end
	
	local Computed = CreateComputedFunction(function(p4)
		-- upvalues: Signal (copy)
		return Signal(p4).isTimedOut
	end)
	local Computed1 = CreateComputedFunction(function(p4)
		-- upvalues: Signal (copy)
		return Signal(p4).details
	end)
	
	Callback = function()
		-- upvalues: Effect1 (ref), Effect (ref), Flag1 (ref), Flag (ref), Signal2 (copy), resolvePendingFetches (copy)
		if Effect1 then
			Effect1()
			Effect1 = nil
		end
		if Effect then
			Effect()
			Effect = nil
		end
		Flag1 = false
		Flag = false
		Signal2({
			isTimedOut = false,
			featureName = nil,
			access = nil,
			timeoutAction = nil,
			details = nil,
			error = nil
		})
		resolvePendingFetches()
	end
	
	return {
		getStatus = Signal,
		getIsTimedOut = Computed,
		getTimeoutDetails = Computed1,
		fetchStatus = fetchStatus,
		fetchStatusAsync = fetchStatusAsync,
		setStatus = function(p4)
			-- upvalues: Signal2 (copy)
			Signal2(p4)
		end,
		clearStatus = Callback,
		effectDispose = Effect2
	}
end