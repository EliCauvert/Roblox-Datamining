local CloudClientOffer = script:FindFirstAncestor("CloudClientOffer")
local PromiseModule = require(CloudClientOffer.Parent.Promise)
local _ = require(CloudClientOffer.CloudClientServiceAdapter)

local function _()
	-- upvalues: PromiseModule (copy)
	local t = {}
	
	return PromiseModule.new(function(Resolve, Reject)
		-- upvalues: t (copy)
		t.resolve = Resolve
		t.reject = Reject
	end), t
end

return function()
	-- upvalues: PromiseModule (copy)
	local EligibilityChecks = {}
	local Reservations = {}
	local ReleasedTokens = {}
	local Tbl = {}
	
	return {
		adapter = {
			checkEligibility = function(p1)
				-- upvalues: PromiseModule (upval), EligibilityChecks (copy)
				local t = {}
				local NewPromise = PromiseModule.new(function(Resolve, Reject)
					-- upvalues: t (copy)
					t.resolve = Resolve
					t.reject = Reject
				end)
				table.insert(EligibilityChecks, { kind = p1.kind, resolve = t.resolve, reject = t.reject })
				
				return NewPromise
			end,
			makeReservation = function(PlaceId, p1)
				-- upvalues: PromiseModule (upval), Reservations (copy)
				local t = {}
				local NewPromise = PromiseModule.new(function(Resolve, Reject)
					-- upvalues: t (copy)
					t.resolve = Resolve
					t.reject = Reject
				end)
				table.insert(Reservations, {
					placeId = PlaceId,
					kind = p1.kind,
					resolve = t.resolve,
					reject = t.reject
				})
				
				return NewPromise
			end,
			releaseReservation = function(p1)
				-- upvalues: ReleasedTokens (copy)
				table.insert(ReleasedTokens, p1)
			end,
			onReservationExpired = function(Key)
				-- upvalues: Tbl (copy)
				Tbl[Key] = true
				
				return {
					Disconnect = function()
						-- upvalues: Tbl (upval), Key (copy)
						Tbl[Key] = nil
					end
				}
			end
		},
		eligibilityChecks = EligibilityChecks,
		reservations = Reservations,
		releasedTokens = ReleasedTokens,
		getExpiredListenerCount = function(): number
			-- upvalues: Tbl (copy)
			local Count = 0
			
			for _ in Tbl do
				Count += 1
			end
			return Count
		end,
		fireReservationExpired = function(p1)
			-- upvalues: Tbl (copy)
			for i in table.clone(Tbl) do
				i(p1)
			end
		end
	}
end