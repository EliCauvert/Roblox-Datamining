local HttpService = game:GetService("HttpService")
local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local Parent = AvatarExperienceCommon.Parent
local SignalsModule = require(Parent.Signals)
local PromiseModule = require(Parent.Promise)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed
local CreateHttpStoreFunction = require(Parent.InternalHttpStore).createHttpStore
local MutedErrorFunction = require(Parent.Loggers).mutedError
local Url = require(Parent.Http).Url
local GetTimeoutEndTimeModule = require(AvatarExperienceCommon.Utils.getTimeoutEndTime)
local FFlagAXTimeoutAcknowledgementGating = require(Parent.AvatarExperienceFlags).FFlagAXTimeoutAcknowledgementGating

local function _(Text: string): boolean
	return Text ~= nil and (Text ~= "" and string.sub(Text, 1, 5) ~= "0001-")
end

local _ = function(p1): boolean
	local Flag = false
	
	if p1 ~= nil then
		Flag = false
		
		if p1.acknowledgeable == true then
			local AcknowledgedTime: string = p1.acknowledgedTime
			Flag = not (AcknowledgedTime ~= nil and (AcknowledgedTime ~= "" and string.sub(AcknowledgedTime, 1, 5) ~= "0001-"))
		end
	end
	return Flag
end

local function getEndDateTime(p1)
	-- upvalues: GetTimeoutEndTimeModule (copy)
	local TimeoutEndTimeModule = GetTimeoutEndTimeModule(if p1.details then p1.details.endDate else nil, if p1.timeoutAction then p1.timeoutAction.endTime else nil)
	
	if TimeoutEndTimeModule then
		local Success, Result = pcall(function()
			-- upvalues: TimeoutEndTimeModule (copy)
			return DateTime.fromIsoDate(TimeoutEndTimeModule)
		end)
		
		return if Success then Result else nil
	else
		return nil
	end
end

return function()
	-- upvalues: CreateSignalFunction (copy), CreateHttpStoreFunction (copy), SignalsModule (copy), FFlagAXTimeoutAcknowledgementGating (copy), Url (copy), HttpService (copy), MutedErrorFunction (copy), PromiseModule (copy), CreateComputedFunction (copy), getEndDateTime (copy)
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
	local Count = 0
	
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
	
	local Callback1 = nil
	local Callback = nil
	local Effect2 = SignalsModule.createEffect(function(p2)
		-- upvalues: Signal (copy), FFlagAXTimeoutAcknowledgementGating (upval), Callback (ref), Callback1 (ref)
		local SignalResult = Signal(p2)
		local EndDate = if SignalResult.details and SignalResult.details.endDate then SignalResult.details.endDate elseif SignalResult.timeoutAction and SignalResult.timeoutAction.endTime then SignalResult.timeoutAction.endTime else nil
		
		if not EndDate or EndDate == "" then return end
		local Success, Result = pcall(function()
			-- upvalues: EndDate (copy)
			return DateTime.fromIsoDate(EndDate)
		end)
		
		if not Success or not Result then return end
		local _DateTime = DateTime.now()
		local UnixTimestampDelta = Result.UnixTimestamp - _DateTime.UnixTimestamp
		
		if FFlagAXTimeoutAcknowledgementGating and SignalResult.requiresAcknowledgement then
			local UnixTimestampMillisDelta = Result.UnixTimestampMillis - _DateTime.UnixTimestampMillis
			
			if UnixTimestampMillisDelta <= 0 then return end
			local DelayedThread = task.delay(UnixTimestampMillisDelta / 1000 + 1, function()
				-- upvalues: Callback (upval), SignalResult (copy)
				Callback(SignalResult.featureName)
			end)
			
			return function()
				-- upvalues: DelayedThread (copy)
				task.cancel(DelayedThread)
			end
		elseif UnixTimestampDelta <= 0 then
			Callback1()
			
			return
		else
			local DelayedThread1 = task.delay(UnixTimestampDelta, function()
				-- upvalues: Callback1 (upval)
				Callback1()
			end)
			
			return function()
				-- upvalues: DelayedThread1 (copy)
				if DelayedThread1 then
					task.cancel(DelayedThread1)
				end
			end
		end
	end)
	
	local function fetchTimeoutDetails(FeatureVector, Callback: () -> ())
		-- upvalues: Flag1 (ref), Url (upval), HttpStore (copy), Effect1 (ref), SignalsModule (upval), HttpService (upval), Signal (copy), Signal2 (copy), FFlagAXTimeoutAcknowledgementGating (upval), MutedErrorFunction (upval)
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
			-- upvalues: FetchResult (copy), HttpService (upval), Signal (upval), Signal2 (upval), FFlagAXTimeoutAcknowledgementGating (upval), Flag1 (upval), Callback (copy), MutedErrorFunction (upval)
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
						details = Result1,
						requiresAcknowledgement = if FFlagAXTimeoutAcknowledgementGating then SignalResult.requiresAcknowledgement else nil
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
						timeoutAction = SignalResult.timeoutAction,
						requiresAcknowledgement = if FFlagAXTimeoutAcknowledgementGating then SignalResult.requiresAcknowledgement else nil
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
					timeoutAction = SignalResult.timeoutAction,
					requiresAcknowledgement = if FFlagAXTimeoutAcknowledgementGating then SignalResult.requiresAcknowledgement else nil
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
	
	local function doFetchStatus(p2, p3, p4, Callback)
		-- upvalues: Flag (ref), FFlagAXTimeoutAcknowledgementGating (upval), Url (upval), Count (ref), Effect1 (ref), Flag1 (ref), HttpStore (copy), Effect (ref), resolvePendingFetches (copy), Signal (copy), Signal2 (copy), SignalsModule (upval), HttpService (upval), extractTimeoutAction (copy), fetchTimeoutDetails (copy), MutedErrorFunction (upval)
		if Flag and (not FFlagAXTimeoutAcknowledgementGating or not p4) then return end
		Flag = true
		local P7 = p2 or "AvatarChange"
		local Formatted = string.format("%saccess-management/v1/feature-access?%s", Url.APIS_URL, Url:makeQueryString({
			featureNames = P7,
			nameSpace = p3 or "avatar_marketplace/AvatarMarketPlace"
		}))
		local Text = "TimeoutStatus_" .. P7
		
		if FFlagAXTimeoutAcknowledgementGating and p4 then
			Count += 1
			Text ..= "_" .. tostring(Count)
			
			if Effect1 then
				Effect1()
				Effect1 = nil
			end
			Flag1 = false
		end
		local FetchResult, _ = HttpStore.fetch(Text, { Method = "GET", Url = Formatted })
		
		if Effect then
			Effect()
		end
		local function complete()
			-- upvalues: resolvePendingFetches (upval)
			resolvePendingFetches()
		end
		
		local function _(p5)
			-- upvalues: Callback (copy)
			if Callback then
				Callback(p5)
			end
		end
		
		local function keepStatusWithError(p5)
			-- upvalues: Signal (upval), Signal2 (upval), P7 (copy)
			local SignalResult = Signal(false)
			Signal2({
				isTimedOut = SignalResult.isTimedOut,
				featureName = SignalResult.featureName or P7,
				access = SignalResult.access,
				timeoutAction = SignalResult.timeoutAction,
				details = SignalResult.details,
				error = p5,
				requiresAcknowledgement = SignalResult.requiresAcknowledgement
			})
		end
		
		Effect = SignalsModule.createEffect(function(p5)
			-- upvalues: FetchResult (copy), HttpService (upval), extractTimeoutAction (upval), P7 (copy), Signal2 (upval), FFlagAXTimeoutAcknowledgementGating (upval), Flag (upval), Callback (copy), fetchTimeoutDetails (upval), complete (copy), resolvePendingFetches (upval), MutedErrorFunction (upval), keepStatusWithError (copy)
			local Result = FetchResult(p5)
			
			if Result.status == "Success" then
				local Body = Result.response.Body
				local Success, Result1 = pcall(function()
					-- upvalues: HttpService (upval), Body (copy)
					return HttpService:JSONDecode(Body)
				end)
				
				if Success and Result1 then
					local ExtractTimeoutActionResult = extractTimeoutAction(Result1, P7)
					local HasExtractTimeoutActionResult = ExtractTimeoutActionResult ~= nil
					local Access = nil
					
					if Result1.features then
						for _, feature in Result1.features do
							if feature.featureName == P7 then
								Access = feature.access
								break
							end
						end
					end
					local config = {
						details = nil,
						error = nil,
						isTimedOut = HasExtractTimeoutActionResult,
						featureName = P7,
						access = Access,
						timeoutAction = ExtractTimeoutActionResult
					}
					local RequiresAcknowledgement = nil
					
					if FFlagAXTimeoutAcknowledgementGating then
						RequiresAcknowledgement = false
						
						if ExtractTimeoutActionResult ~= nil then
							RequiresAcknowledgement = false
							
							if ExtractTimeoutActionResult.acknowledgeable == true then
								local AcknowledgedTime: string = ExtractTimeoutActionResult.acknowledgedTime
								RequiresAcknowledgement = not (AcknowledgedTime ~= nil and (AcknowledgedTime ~= "" and string.sub(AcknowledgedTime, 1, 5) ~= "0001-"))
							end
						end
					else
						RequiresAcknowledgement = nil
					end
					config.requiresAcknowledgement = RequiresAcknowledgement
					Signal2(config)
					Flag = false
					
					if FFlagAXTimeoutAcknowledgementGating and Callback then
						Callback(true)
					end
					if HasExtractTimeoutActionResult and ExtractTimeoutActionResult then
						fetchTimeoutDetails(ExtractTimeoutActionResult.featureVector or "avatar_change", complete)
						
						return
					else
						resolvePendingFetches()
						
						return
					end
				else
					MutedErrorFunction("Failed to decode timeout status JSON response")
					
					if not FFlagAXTimeoutAcknowledgementGating then
						Signal2({
							isTimedOut = false,
							access = nil,
							timeoutAction = nil,
							details = nil,
							error = "Failed to decode timeout status",
							featureName = P7
						})
						Flag = false
						resolvePendingFetches()
						
						return
					end
					keepStatusWithError("Failed to decode timeout status")
					Flag = false
					resolvePendingFetches()
					
					if Callback then
						Callback(false)
					end
					return
				end
			elseif Result.status == "Failed" then
				MutedErrorFunction("Failed to fetch timeout status")
				
				if FFlagAXTimeoutAcknowledgementGating then
					keepStatusWithError("Failed to fetch timeout status")
					Flag = false
					resolvePendingFetches()
					
					if Callback then
						Callback(false)
					end
					return
				else
					Signal2({
						isTimedOut = false,
						access = nil,
						timeoutAction = nil,
						details = nil,
						error = "Failed to fetch timeout status",
						featureName = P7
					})
					Flag = false
					resolvePendingFetches()
				end
			end
		end)
	end
	
	local function fetchStatus(p5, p6)
		-- upvalues: doFetchStatus (copy)
		doFetchStatus(p5, p6)
	end
	
	local function fetchStatusAsync(p5, p6)
		-- upvalues: PromiseModule (upval), List (ref), doFetchStatus (copy)
		return PromiseModule.new(function(p7)
			-- upvalues: List (upval), doFetchStatus (upval), p5 (copy), p6 (copy)
			table.insert(List, p7)
			doFetchStatus(p5, p6)
		end)
	end
	
	Callback = function(FeatureName, p5)
		-- upvalues: doFetchStatus (copy)
		local Count = 3
		
		local function attempt()
			-- upvalues: doFetchStatus (upval), FeatureName (copy), p5 (copy), Count (ref), attempt (copy)
			doFetchStatus(FeatureName, p5, true, function(p6)
				-- upvalues: Count (upval), attempt (upval)
				if not p6 and Count > 0 then
					Count -= 1
					task.defer(attempt)
				end
			end)
		end
		
		doFetchStatus(FeatureName, p5, true, function(p6)
			-- upvalues: Count (ref), attempt (copy)
			if not p6 and Count > 0 then
				Count -= 1
				task.defer(attempt)
			end
		end)
	end
	
	local Computed = CreateComputedFunction(function(p5)
		-- upvalues: Signal (copy)
		return Signal(p5).isTimedOut
	end)
	local Computed1 = CreateComputedFunction(function(p5)
		-- upvalues: Signal (copy)
		return Signal(p5).details
	end)
	
	Callback1 = function()
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
		refreshStatus = Callback,
		setStatus = function(p5)
			-- upvalues: Signal2 (copy)
			Signal2(p5)
		end,
		clearStatus = Callback1,
		clearStatusIfServed = function(): boolean
			-- upvalues: Signal (copy), getEndDateTime (upval), Callback1 (ref)
			local SignalResult = Signal(false)
			local EndDateTime = getEndDateTime(SignalResult)
			
			if SignalResult.isTimedOut and EndDateTime and DateTime.now().UnixTimestampMillis >= EndDateTime.UnixTimestampMillis then
				Callback1()
				
				return true
			else
				return false
			end
		end,
		effectDispose = Effect2
	}
end