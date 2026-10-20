local Parent = script:FindFirstAncestor("StartupStore").Parent
local SignalsModule = require(Parent.Signals)
local SignalsExperimentalModule = require(Parent.SignalsExperimental)
local RetrievalStatus = require(Parent.Http).Enum.RetrievalStatus

local function _(Done): boolean
	-- upvalues: RetrievalStatus (copy)
	return Done == RetrievalStatus.NotStarted or (Done == RetrievalStatus.Fetching or (Done == RetrievalStatus.Failed or Done == RetrievalStatus.Done))
end

local function joinRetrievalStatus(Done, Done1)
	-- upvalues: RetrievalStatus (copy)
	if Done ~= RetrievalStatus.NotStarted and (Done ~= RetrievalStatus.Fetching and (Done ~= RetrievalStatus.Failed and Done ~= RetrievalStatus.Done)) then
		Done = nil
	end
	if Done1 ~= RetrievalStatus.NotStarted and (Done1 ~= RetrievalStatus.Fetching and (Done1 ~= RetrievalStatus.Failed and Done1 ~= RetrievalStatus.Done)) then
		Done1 = nil
	end
	return if Done == nil then Done1 elseif Done1 == nil then Done elseif Done == RetrievalStatus.Failed or Done1 == RetrievalStatus.Failed then RetrievalStatus.Failed elseif Done == RetrievalStatus.NotStarted and Done1 == RetrievalStatus.NotStarted then RetrievalStatus.NotStarted elseif Done == RetrievalStatus.Done and Done1 == RetrievalStatus.Done then RetrievalStatus.Done else RetrievalStatus.Fetching
end

local _ = function()
	-- upvalues: RetrievalStatus (copy)
	return {
		isRefreshFetch = false,
		status = RetrievalStatus.NotStarted
	}
end

return SignalsModule.createComputed(function()
	-- upvalues: SignalsModule (copy), RetrievalStatus (copy), joinRetrievalStatus (copy), SignalsExperimentalModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(true)
	local Signal1, Signal2_1 = SignalsModule.createSignal(RetrievalStatus.NotStarted)
	local Signal3, Signal2_2 = SignalsModule.createSignal({
		isRefreshFetch = false,
		status = RetrievalStatus.NotStarted
	})
	local Signal4, Signal2_3 = SignalsModule.createSignal(RetrievalStatus.NotStarted)
	
	return {
		getPreloading = Signal,
		getHomePageDataStatus = Signal1,
		getGamesPageDataStatus = Signal3,
		getFetchHomePageDataStatusAll = Signal4,
		getAppLoadingStarted = SignalsModule.createComputed(function(p1): boolean
			-- upvalues: Signal3 (copy), Signal1 (copy), Signal4 (copy), joinRetrievalStatus (upval), RetrievalStatus (upval)
			return joinRetrievalStatus(joinRetrievalStatus(Signal3(p1).status, (Signal1(p1))), (Signal4(p1))) ~= RetrievalStatus.NotStarted
		end),
		setPreloading = Signal2,
		setHomePageDataStatus = Signal2_1,
		setGamesPageDataStatus = function(Status, p1)
			-- upvalues: Signal2_2 (copy)
			Signal2_2({ status = Status, isRefreshFetch = p1 or false })
		end,
		setFetchHomePageDataStatusAll = Signal2_3,
		reset = function()
			-- upvalues: SignalsExperimentalModule (upval), Signal2 (copy), Signal2_1 (copy), RetrievalStatus (upval), Signal2_2 (copy), Signal2_3 (copy)
			SignalsExperimentalModule.batch(function()
				-- upvalues: Signal2 (upval), Signal2_1 (upval), RetrievalStatus (upval), Signal2_2 (upval), Signal2_3 (upval)
				Signal2(true)
				Signal2_1(RetrievalStatus.NotStarted)
				Signal2_2({
					isRefreshFetch = false,
					status = RetrievalStatus.NotStarted
				})
				Signal2_3(RetrievalStatus.NotStarted)
			end)
		end
	}
end)