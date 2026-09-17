local httpService = game:GetService("HttpService")
local memStorageService = game:GetService("MemStorageService")
local loggingProtocolModule = require(script:FindFirstAncestor("AuthAnalytics").Parent.LoggingProtocol)
local telemetryConfigsModule = require(script.Parent.TelemetryConfigs)

local function getWallClockMillis()
	return DateTime.now().UnixTimestampMillis
end

local function createTimeToLoginTracker(p1, p2, p3, p4)
	-- upvalues: getWallClockMillis (ref), memStorageService (ref), httpService (ref), telemetryConfigsModule (ref)
	p2 = p2 or getWallClockMillis
	p3 = p3 or memStorageService
	p4 = p4 or httpService
	
	local function readPendingAttempt()
		-- upvalues: p3 (ref), p4 (ref)
		local timeToLoginPendingItem = p3:GetItem("TimeToLoginPending")
		
		if timeToLoginPendingItem == nil or timeToLoginPendingItem == "" then
			return nil
		end
		local ok, status = pcall(function()
			-- upvalues: p4 (copy), timeToLoginPendingItem (ref)
			return p4:JSONDecode(timeToLoginPendingItem)
		end)
		
		if not ok or type(status) ~= "table" then
			return nil
		end
		local loginType = status.loginType
		local identifierType = status.identifierType
		local startTimeMillis = status.startTimeMillis
		
		return if type(loginType) == "string" and type(identifierType) == "string" and type(startTimeMillis) == "number" then {
			loginType = loginType,
			identifierType = identifierType,
			startTimeMillis = startTimeMillis,
			twoStepVerification = status.twoStepVerification == true
		} else nil
	end
	
	local function _(p5)
		-- upvalues: p3 (ref), p4 (ref)
		p3:SetItem("TimeToLoginPending", p4:JSONEncode({
			loginType = p5.loginType,
			identifierType = p5.identifierType,
			startTimeMillis = p5.startTimeMillis,
			twoStepVerification = p5.twoStepVerification
		}))
	end
	
	local function cancel()
		-- upvalues: p3 (ref)
		p3:SetItem("TimeToLoginPending", "")
	end
	
	local _ = function(p5)
		-- upvalues: p2 (ref)
		return p2() - p5.startTimeMillis
	end
	
	local _ = function(p5)
		-- upvalues: p2 (ref)
		local var1 = p2() - p5.startTimeMillis
		
		return var1 >= 0 and var1 <= 600000
	end
	
	local _ = function(p5, p6)
		-- upvalues: p1 (ref), telemetryConfigsModule (copy)
		p1:logRobloxTelemetryCounter(telemetryConfigsModule.TimeToLoginInvalidDurationConfig, 1, { loginType = p5.loginType, reason = p6 })
	end
	
	return {
		start = function(p5, p6)
			-- upvalues: readPendingAttempt (ref), p2 (ref), p3 (ref), p4 (ref)
			if p5 == nil or p5 == "" then return end
			local var1 = readPendingAttempt()
			
			if var1 ~= nil then
				local var2 = p2() - var1.startTimeMillis
				
				if var2 >= 0 and var2 <= 600000 then
					return
				end
			end
			local t = {
				twoStepVerification = false,
				loginType = p5,
				identifierType = p6 or "Unknown",
				startTimeMillis = p2()
			}
			p3:SetItem("TimeToLoginPending", p4:JSONEncode({
				loginType = t.loginType,
				identifierType = t.identifierType,
				startTimeMillis = t.startTimeMillis,
				twoStepVerification = t.twoStepVerification
			}))
		end,
		markTwoStepVerification = function()
			-- upvalues: readPendingAttempt (ref), p3 (ref), p4 (ref)
			local var1 = readPendingAttempt()
			
			if var1 == nil or var1.twoStepVerification then
				return
			end
			var1.twoStepVerification = true
			p3:SetItem("TimeToLoginPending", p4:JSONEncode({
				loginType = var1.loginType,
				identifierType = var1.identifierType,
				startTimeMillis = var1.startTimeMillis,
				twoStepVerification = var1.twoStepVerification
			}))
		end,
		cancel = cancel,
		finish = function()
			-- upvalues: readPendingAttempt (ref), p3 (ref), p2 (ref), p1 (ref), telemetryConfigsModule (copy)
			local var1 = readPendingAttempt()
			
			if var1 == nil then return end
			p3:SetItem("TimeToLoginPending", "")
			local var2 = p2() - var1.startTimeMillis
			
			if var2 < 0 then
				p1:logRobloxTelemetryCounter(telemetryConfigsModule.TimeToLoginInvalidDurationConfig, 1, { reason = "negative", loginType = var1.loginType })
				
				return
			elseif var2 > 600000 then
				p1:logRobloxTelemetryCounter(telemetryConfigsModule.TimeToLoginInvalidDurationConfig, 1, { reason = "stale", loginType = var1.loginType })
				
				return
			end
			p1:logRobloxTelemetryStat(telemetryConfigsModule.TimeToLoginStatConfig, math.floor(var2), {
				loginType = var1.loginType,
				identifierType = var1.identifierType,
				twoStepVerification = tostring(var1.twoStepVerification)
			})
		end
	}
end

return {
	create = createTimeToLoginTracker,
	default = createTimeToLoginTracker(loggingProtocolModule.default)
}