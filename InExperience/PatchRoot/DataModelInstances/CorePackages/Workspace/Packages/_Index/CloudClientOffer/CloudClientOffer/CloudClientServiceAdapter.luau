local CloudClientOffer = script:FindFirstAncestor("CloudClientOffer")
local PromiseModule = require(CloudClientOffer.Parent.Promise)
local FFlagLuaAppCloudClientSyncOfferEligibilityModule = require(CloudClientOffer.Flags.FFlagLuaAppCloudClientSyncOfferEligibility)

local function parseReservationError(p1)
	local Text = tostring(p1)
	local Match: string? = string.match(Text, "Ineligible:%s*(%w+)")
	
	return if Match then { kind = "Ineligible", reason = Match } else {
		kind = "Unavailable",
		reason = string.match(Text, "Unavailable:%s*(%w+)") or "Unknown"
	}
end

local function createCloudClientServiceAdapter(p1)
	-- upvalues: PromiseModule (copy), FFlagLuaAppCloudClientSyncOfferEligibilityModule (copy), parseReservationError (copy)
	return {
		checkEligibility = function(p2)
			-- upvalues: PromiseModule (upval), FFlagLuaAppCloudClientSyncOfferEligibilityModule (upval), p1 (copy), parseReservationError (upval)
			return PromiseModule.new(function(Callback: (any) -> (), Callback1: (any) -> ())
				-- upvalues: FFlagLuaAppCloudClientSyncOfferEligibilityModule (upval), p1 (upval), p2 (copy), parseReservationError (upval)
				local Success, Result = pcall(function()
					-- upvalues: FFlagLuaAppCloudClientSyncOfferEligibilityModule (upval), p1 (upval), p2 (upval)
					return if FFlagLuaAppCloudClientSyncOfferEligibilityModule then p1:CheckOfferEligibility(p2.kind) else p1:CheckOfferEligibilityAsync(p2.kind)
				end)
				
				if Success then
					Callback(Result == true)
					
					return
				else
					Callback1((parseReservationError(Result)))
				end
			end)
		end,
		makeReservation = function(p2, p3)
			-- upvalues: PromiseModule (upval), p1 (copy), parseReservationError (upval)
			return PromiseModule.new(function(Callback1: (any) -> (), Callback: (any) -> ())
				-- upvalues: p2 (copy), p1 (upval), p3 (copy), parseReservationError (upval)
				local Number: number? = tonumber(p2)
				
				if Number == nil then
					Callback({ kind = "Unavailable", reason = "InvalidPlaceId" })
					
					return
				end
				local Success, Result = pcall(function()
					-- upvalues: p1 (upval), Number (copy), p3 (upval)
					return p1:MakeOfferReservationAsync(Number, p3.kind)
				end)
				
				if Success and type(Result) == "string" and Result ~= "" then
					Callback1(Result)
					
					return
				else
					Callback((parseReservationError(Result)))
				end
			end)
		end,
		releaseReservation = function(p2)
			-- upvalues: p1 (copy)
			pcall(function()
				-- upvalues: p1 (upval), p2 (copy)
				p1:ReleaseReservation(p2)
			end)
		end,
		onReservationExpired = function(Callback)
			-- upvalues: p1 (copy)
			local Success, Result = pcall(function()
				-- upvalues: p1 (upval), Callback (copy)
				return p1.ReservationExpired:Connect(Callback)
			end)
			
			return if Success then Result else { Disconnect = function() end }
		end
	}
end

return {
	createCloudClientServiceAdapter = createCloudClientServiceAdapter,
	getCloudClientServiceAdapter = function()
		-- upvalues: createCloudClientServiceAdapter (copy)
		local Success, Result = pcall(function()
			return game:GetService("CloudClientService")
		end)
		
		return (createCloudClientServiceAdapter(if Success then Result else nil))
	end,
	parseReservationError = parseReservationError
}