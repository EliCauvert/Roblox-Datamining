local HttpService = game:GetService("HttpService")
local MemStorageService = game:GetService("MemStorageService")
local TelemetryConfigsModule = require(script.Parent.TelemetryConfigs)

local function getWallClockMillis() --[[ Line: 52 ]]
	return DateTime.now().UnixTimestampMillis
end

local function createTimeToLoginTracker(Default, p1, p2, p3) --[[ Line: 56 ]]
	-- upvalues: getWallClockMillis (copy), MemStorageService (copy), HttpService (copy), TelemetryConfigsModule (copy)
	local Callback = p1 or getWallClockMillis
	local P2 = p2 or MemStorageService
	local P3 = p3 or HttpService
	
	local function readPendingAttempt() --[[ Line: 66 ]]
		-- upvalues: P2 (copy), P3 (copy)
		local TimeToLoginPendingItem = P2:GetItem("TimeToLoginPending")
		
		if TimeToLoginPendingItem == nil or TimeToLoginPendingItem == "" then
			return nil
		end
		local Success, Result = pcall(function() --[[ Line: 72 ]]
			-- upvalues: P3 (upval), TimeToLoginPendingItem (copy)
			return P3:JSONDecode(TimeToLoginPendingItem)
		end)
		
		if Success and type(Result) == "table" then
			local LoginType = Result.loginType
			local IdentifierType = Result.identifierType
			local StartTimeMillis = Result.startTimeMillis
			
			return if type(LoginType) == "string" and type(IdentifierType) == "string" and type(StartTimeMillis) == "number" then {
				loginType = LoginType,
				identifierType = IdentifierType,
				startTimeMillis = StartTimeMillis,
				twoStepVerification = Result.twoStepVerification == true
			} else nil
		else
			return nil
		end
	end
	
	local function _(p4) --[[ Line: 94 | Named "writePendingAttempt" ]]
		-- upvalues: P2 (copy), P3 (copy)
		P2:SetItem("TimeToLoginPending", P3:JSONEncode({
			loginType = p4.loginType,
			identifierType = p4.identifierType,
			startTimeMillis = p4.startTimeMillis,
			twoStepVerification = p4.twoStepVerification
		}))
	end
	
	local _ = function(p4) --[[ Line: 113 | Named "pendingAgeMillis" ]]
		-- upvalues: Callback (copy)
		return Callback() - p4.startTimeMillis
	end
	
	local _ = function(p4, Reason) --[[ Line: 117 | Named "reportInvalidDuration" ]]
		-- upvalues: Default (copy), TelemetryConfigsModule (upval)
		Default:logRobloxTelemetryCounter(TelemetryConfigsModule.TimeToLoginInvalidDurationConfig, 1, { loginType = p4.loginType, reason = Reason })
	end
	
	return {
		start = function(LoginType, p4) --[[ Line: 153 ]]
			-- upvalues: Callback (copy), P2 (copy), P3 (copy)
			if LoginType ~= nil and LoginType ~= "" then
				local config = {
					twoStepVerification = false,
					loginType = LoginType,
					identifierType = p4 or "Unknown",
					startTimeMillis = Callback()
				}
				P2:SetItem("TimeToLoginPending", P3:JSONEncode({
					loginType = config.loginType,
					identifierType = config.identifierType,
					startTimeMillis = config.startTimeMillis,
					twoStepVerification = config.twoStepVerification
				}))
				
				return
			end
		end,
		markTwoStepVerification = function() --[[ Line: 168 ]]
			-- upvalues: readPendingAttempt (copy), P2 (copy), P3 (copy)
			local PendingAttempt = readPendingAttempt()
			
			if PendingAttempt ~= nil and not PendingAttempt.twoStepVerification then
				PendingAttempt.twoStepVerification = true
				P2:SetItem("TimeToLoginPending", P3:JSONEncode({
					loginType = PendingAttempt.loginType,
					identifierType = PendingAttempt.identifierType,
					startTimeMillis = PendingAttempt.startTimeMillis,
					twoStepVerification = PendingAttempt.twoStepVerification
				}))
				
				return
			end
		end,
		cancel = function() --[[ Line: 106 ]]
			-- upvalues: P2 (copy)
			P2:SetItem("TimeToLoginPending", "")
		end,
		finish = function() --[[ Line: 124 ]]
			-- upvalues: readPendingAttempt (copy), P2 (copy), Callback (copy), Default (copy), TelemetryConfigsModule (upval)
			local PendingAttempt = readPendingAttempt()
			
			if PendingAttempt == nil then return end
			P2:SetItem("TimeToLoginPending", "")
			local CallbackResultDelta = Callback() - PendingAttempt.startTimeMillis
			
			if CallbackResultDelta < 0 then
				Default:logRobloxTelemetryCounter(TelemetryConfigsModule.TimeToLoginInvalidDurationConfig, 1, {
					reason = "negative",
					loginType = PendingAttempt.loginType
				})
				
				return
			end
			if CallbackResultDelta > 600000 then
				Default:logRobloxTelemetryCounter(TelemetryConfigsModule.TimeToLoginInvalidDurationConfig, 1, { reason = "stale", loginType = PendingAttempt.loginType })
				
				return
			else
				Default:logRobloxTelemetryStat(TelemetryConfigsModule.TimeToLoginStatConfig, math.floor(CallbackResultDelta), {
					loginType = PendingAttempt.loginType,
					identifierType = PendingAttempt.identifierType,
					twoStepVerification = tostring(PendingAttempt.twoStepVerification)
				})
			end
		end
	}
end

return {
	create = createTimeToLoginTracker,
	default = createTimeToLoginTracker(require(script:FindFirstAncestor("AuthAnalytics").Parent.LoggingProtocol).default)
}