local parent = script:FindFirstAncestor("Achievements").Parent
local loggingProtocolModule = require(parent.LoggingProtocol)
local _ = require(parent.Signal)
local achievementRulesModule = require(script.Parent.AchievementRules)
local achievementTelemetryModule = require(script.Parent.AchievementTelemetry)
local t = {
	NAMES = require(script.Parent.AchievementConstants).ACHIEVEMENT_NAMES,
	_init = function(p0, p1, p2, p3)
		-- upvalues: achievementRulesModule (ref)
		p0.achievementService = p3
		p0.achievementName = p1
		p0.achievementRule = achievementRulesModule[p1]
		p0.achievementAwardedCallbacks = {}
		p0.hasAchieved = nil
		assert(p0.achievementRule, "Achievement rule not found for " .. tostring(p1))
		
		if p0.achievementService:IsAvailable() then
			pcall(function()
				-- upvalues: p0 (ref), p1 (ref)
				p0.hasAchieved = p0.achievementService:HasAchieved(p1)
			end)
			
			if p0.hasAchieved == false then
				p0.achievementDataSubscription = p2:subscribe(function(p4)
					-- upvalues: p0 (ref)
					if p0.achievementRule(p4) then
						p0:grantAchievement(p0.achievementName)
					end
				end)
			end
		end
	end,
	grantAchievement = function(p5, p6)
		-- upvalues: loggingProtocolModule (ref), achievementTelemetryModule (ref)
		if p5.hasAchieved == false then
			local _, status = pcall(function()
				-- upvalues: p5 (ref), p6 (ref)
				return p5.achievementService:GrantAchievement(p6)
			end)
			loggingProtocolModule.default:logRobloxTelemetryEvent(achievementTelemetryModule, nil, { achievementName = p6, grantedState = tostring(status) })
			
			if status == true then
				p5.hasAchieved = true
				p5.achievementDataSubscription:unsubscribe()
				
				for i, v in p5.achievementAwardedCallbacks do
					v(p6)
				end
			end
		end
	end,
	registerOnAchievementAwardedListener = function(p7, p8)
		p7.achievementAwardedCallbacks[p8] = p8
		
		return {
			unsubscribe = function()
				-- upvalues: p7 (ref), p8 (ref)
				p7.achievementAwardedCallbacks[p8] = nil
			end
		}
	end
}

function t.new(p9, p10, p11)
	-- upvalues: t (ref)
	local t_1 = {}
	setmetatable(t_1, { __index = t })
	t_1:_init(p9, p10, p11)
	
	return t_1
end

function t.newWithRefresher(p12, p13, p14, p15)
	-- upvalues: t (ref)
	local var5 = t.new(p12, p13, p15)
	
	if var5.hasAchieved == false then
		p14:start()
		var5:registerOnAchievementAwardedListener(function()
			-- upvalues: p14 (ref)
			p14:stop()
		end)
	end
	return var5
end

return t