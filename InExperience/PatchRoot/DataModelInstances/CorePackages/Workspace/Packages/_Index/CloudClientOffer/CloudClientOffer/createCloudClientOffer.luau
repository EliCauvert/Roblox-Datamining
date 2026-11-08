local CloudClientOffer = script:FindFirstAncestor("CloudClientOffer")
local SignalsModule = require(CloudClientOffer.Parent.Signals)
local _ = require(CloudClientOffer.CloudClientServiceAdapter)
local _ = require(CloudClientOffer.CloudClientExperiment)
local _ = require(CloudClientOffer.Stores.GetCloudClientSessionStore.createCloudClientSessionStore)

local function _(p1, p2): string
	return `{p1}/{p2}`
end

return function(p1)
	-- upvalues: SignalsModule (copy)
	local Service = p1.service
	local Experiment = p1.experiment
	local Session = p1.session
	local Candidates = p1.candidates
	local Signal, Signal2 = SignalsModule.createSignal(nil)
	local v1 = nil
	local v2 = nil
	local v3 = nil
	local Count = 0
	local Flag = false
	
	local function _(p2)
		-- upvalues: v2 (ref), v3 (ref), v1 (ref), Signal2 (copy)
		local Callback: (any) -> () = v2
		v2 = nil
		v3 = nil
		
		if v1 ~= nil then
			v1 = nil
			Signal2(nil)
		end
		if Callback ~= nil then
			Callback(p2)
		end
	end
	
	local _ = function()
		-- upvalues: v1 (ref), Service (copy)
		local v4 = v1
		
		if v4 ~= nil then
			Service.releaseReservation(v4.reservationToken)
		end
	end
	
	local function tryCandidate(p2, p3: number, Count1)
		-- upvalues: Flag (ref), Count (ref), Candidates (copy), v2 (ref), v3 (ref), v1 (ref), Signal2 (copy), tryCandidate (copy), Session (copy), Service (copy), Experiment (copy)
		local function _()
			-- upvalues: Flag (upval), Count1 (copy), Count (upval)
			return Flag or Count1 ~= Count
		end
		
		local Candidate = Candidates[p3]
		
		if Candidate == nil then
			local config = { kind = "Local" }
			local Callback: (any) -> () = v2
			v2 = nil
			v3 = nil
			
			if v1 ~= nil then
				v1 = nil
				Signal2(nil)
			end
			if Callback ~= nil then
				Callback(config)
			end
			return
		else
			local function tryNextCandidate()
				-- upvalues: Flag (upval), Count1 (copy), Count (upval), tryCandidate (upval), p2 (copy), p3 (copy)
				if not Flag and Count1 == Count then
					tryCandidate(p2, p3 + 1, Count1)
				end
			end
			
			local Text: string = `{Candidate.kind}/{p2}`
			local config1 = { kind = Candidate.kind }
			
			if not Session.isPlaceRefused(Text) then
				local function onReserved(Result)
					-- upvalues: Flag (upval), Count1 (copy), Count (upval), Service (upval), Candidate (copy), v1 (upval), Signal2 (upval), v3 (upval)
					if Flag or Count1 ~= Count then
						Service.releaseReservation(Result)
						
						return
					end
					local config = { kind = Candidate.kind, reservationToken = Result }
					v1 = config
					Signal2(config)
					local Callback: (any) -> () = v3
					
					if Callback ~= nil then
						Callback(config)
					end
				end
				
				local function onReservationFailed(p4)
					-- upvalues: Flag (upval), Count1 (copy), Count (upval), Session (upval), Text (copy), tryCandidate (upval), p2 (copy), p3 (copy)
					if Flag or Count1 ~= Count then return end
					if p4.kind == "Ineligible" then
						Session.markPlaceRefused(Text)
					end
					if not Flag and Count1 == Count then
						tryCandidate(p2, p3 + 1, Count1)
					end
				end
				
				Service.checkEligibility(config1):andThen(function(Result)
					-- upvalues: Flag (upval), Count1 (copy), Count (upval), tryCandidate (upval), p2 (copy), p3 (copy), Experiment (upval), v2 (upval), v3 (upval), v1 (upval), Signal2 (upval), Service (upval), config1 (copy), onReserved (copy), onReservationFailed (copy)
					if Flag or Count1 ~= Count then return end
					if Result then
						Experiment.logExposure()
						
						if Experiment.isTreatment() then
							Service.makeReservation(p2, config1):andThen(onReserved, onReservationFailed)
							
							return
						end
						local config = { kind = "Local" }
						local Callback: (any) -> () = v2
						v2 = nil
						v3 = nil
						
						if v1 ~= nil then
							v1 = nil
							Signal2(nil)
						end
						if Callback ~= nil then
							Callback(config)
						end
						return
					elseif not Flag and Count1 == Count then
						tryCandidate(p2, p3 + 1, Count1)
					end
				end, tryNextCandidate)
				
				return
			elseif not Flag and Count1 == Count then
				tryCandidate(p2, p3 + 1, Count1)
			end
		end
	end
	
	local OnReservationExpiredResult = Service.onReservationExpired(function(ReservationToken)
		-- upvalues: v1 (ref), Flag (ref), v2 (ref), v3 (ref), Signal2 (copy)
		local v4 = v1
		
		if Flag or v4 == nil or v4.reservationToken ~= ReservationToken then return end
		local config = { kind = "Stay", expired = true }
		local Callback: (any) -> () = v2
		v2 = nil
		v3 = nil
		
		if v1 ~= nil then
			v1 = nil
			Signal2(nil)
		end
		if Callback ~= nil then
			Callback(config)
		end
	end)
	
	return {
		getHeldOffer = Signal,
		request = function(p2, p3, p4): number?
			-- upvalues: Flag (ref), v2 (ref), Count (ref), v3 (ref), tryCandidate (copy)
			if Flag or v2 ~= nil then
				return nil
			else
				Count += 1
				v2 = p3
				v3 = p4
				tryCandidate(p2, 1, Count)
				
				return Count
			end
		end,
		cancel = function(Count1)
			-- upvalues: Flag (ref), Count (ref), v1 (ref), v2 (ref), v3 (ref)
			if not Flag and Count1 == Count and v1 == nil and v2 ~= nil then
				Count += 1
				v2 = nil
				v3 = nil
				
				return
			end
		end,
		accept = function()
			-- upvalues: v1 (ref), Flag (ref), v2 (ref), v3 (ref), Signal2 (copy)
			local Offer = v1
			
			if Flag or Offer == nil then return end
			local config = { kind = "Stream", offer = Offer }
			local Callback: (any) -> () = v2
			v2 = nil
			v3 = nil
			
			if v1 ~= nil then
				v1 = nil
				Signal2(nil)
			end
			if Callback ~= nil then
				Callback(config)
			end
		end,
		decline = function()
			-- upvalues: Flag (ref), v1 (ref), Service (copy), v2 (ref), v3 (ref), Signal2 (copy)
			if Flag or v1 == nil then return end
			local v4 = v1
			
			if v4 ~= nil then
				Service.releaseReservation(v4.reservationToken)
			end
			local config = { kind = "Local" }
			local Callback: (any) -> () = v2
			v2 = nil
			v3 = nil
			
			if v1 ~= nil then
				v1 = nil
				Signal2(nil)
			end
			if Callback ~= nil then
				Callback(config)
			end
		end,
		dismiss = function()
			-- upvalues: Flag (ref), v1 (ref), Service (copy), v2 (ref), v3 (ref), Signal2 (copy)
			if Flag or v1 == nil then return end
			local v4 = v1
			
			if v4 ~= nil then
				Service.releaseReservation(v4.reservationToken)
			end
			local config = { kind = "Stay", expired = false }
			local Callback: (any) -> () = v2
			v2 = nil
			v3 = nil
			
			if v1 ~= nil then
				v1 = nil
				Signal2(nil)
			end
			if Callback ~= nil then
				Callback(config)
			end
		end,
		dispose = function()
			-- upvalues: Flag (ref), v2 (ref), v3 (ref), v1 (ref), Service (copy), OnReservationExpiredResult (copy)
			Flag = true
			v2 = nil
			v3 = nil
			local v4 = v1
			
			if v4 ~= nil then
				Service.releaseReservation(v4.reservationToken)
			end
			v1 = nil
			OnReservationExpiredResult:Disconnect()
		end
	}
end