local parent = script:FindFirstAncestor("Achievements").Parent
local loggingProtocolModule = require(parent.LoggingProtocol)
local _ = require(parent.Signal)
local achievementRulesModule = require(script.Parent.AchievementRules)
local achievementTelemetryModule = require(script.Parent.AchievementTelemetry)
local t = {
	NAMES = require(script.Parent.AchievementConstants).ACHIEVEMENT_NAMES,
	_init = function(p1, p2, p3, p4)
		-- upvalues: achievementRulesModule (ref)
		p1.achievementService = p4
		p1.achievementName = p2
		p1.achievementRule = achievementRulesModule[p2]
		p1.achievementAwardedCallbacks = {}
		p1.hasAchieved = nil
		assert(p1.achievementRule, "Achievement rule not found for " .. tostring(p2))
		
		if p1.achievementService:IsAvailable() then
			pcall(function()
				-- upvalues: p1 (ref), p2 (ref)
				p1.hasAchieved = p1.achievementService:HasAchieved(p2)
			end)
			
			if p1.hasAchieved == false then
				p1.achievementDataSubscription = p3:subscribe(function(p5)
					-- upvalues: p1 (ref)
					if p1.achievementRule(p5) then
						p1:grantAchievement(p1.achievementName)
					end
				end)
			end
		end
	end,
	grantAchievement = function(p1, p2)
		-- upvalues: loggingProtocolModule (ref), achievementTelemetryModule (ref)
		if p1.hasAchieved == false then
			local _, status = pcall(function()
				-- upvalues: p1 (ref), p2 (ref)
				return p1.achievementService:GrantAchievement(p2)
			end)
			loggingProtocolModule.default:logRobloxTelemetryEvent(achievementTelemetryModule, nil, { achievementName = p2, grantedState = tostring(status) })
			
			if status == true then
				p1.hasAchieved = true
				p1.achievementDataSubscription:unsubscribe()
				
				for i, v in p1.achievementAwardedCallbacks do
					v(p2)
				end
			end
		end
	end,
	registerOnAchievementAwardedListener = function(p3, p4)
		p3.achievementAwardedCallbacks[p4] = p4
		
		return {
			unsubscribe = function()
				-- upvalues: p3 (ref), p4 (ref)
				p3.achievementAwardedCallbacks[p4] = nil
			end
		}
	end
}

function t.new(p3, p4, p5)
	-- upvalues: t (ref)
	local t_1 = {}
	setmetatable(t_1, { __index = t })
	t_1:_init(p3, p4, p5)
	
	return t_1
end

function t.newWithRefresher(p3, p4, p5, p6)
	-- upvalues: t (ref)
	local var1 = t.new(p3, p4, p6)
	
	if var1.hasAchieved == false then
		p5:start()
		var1:registerOnAchievementAwardedListener(function()
			-- upvalues: p5 (ref)
			p5:stop()
		end)
	end
	return var1
end

return t