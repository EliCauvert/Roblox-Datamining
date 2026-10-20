local Parent = script:FindFirstAncestor("Achievements").Parent
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local _ = require(Parent.Signal)
local AchievementRulesModule = require(script.Parent.AchievementRules)
local AchievementTelemetryModule = require(script.Parent.AchievementTelemetry)
local AchievementModule = {
	NAMES = require(script.Parent.AchievementConstants).ACHIEVEMENT_NAMES,
	_init = function(p1, AchievementName, p2, AchievementService)
		-- upvalues: AchievementRulesModule (copy)
		p1.achievementService = AchievementService
		p1.achievementName = AchievementName
		p1.achievementRule = AchievementRulesModule[AchievementName]
		p1.achievementAwardedCallbacks = {}
		p1.hasAchieved = nil
		assert(p1.achievementRule, "Achievement rule not found for " .. tostring(AchievementName))
		
		if p1.achievementService:IsAvailable() then
			pcall(function()
				-- upvalues: p1 (copy), AchievementName (copy)
				p1.hasAchieved = p1.achievementService:HasAchieved(AchievementName)
			end)
			
			if p1.hasAchieved == false then
				p1.achievementDataSubscription = p2:subscribe(function(p3)
					-- upvalues: p1 (copy)
					if p1.achievementRule(p3) then
						p1:grantAchievement(p1.achievementName)
					end
				end)
			end
		end
	end,
	grantAchievement = function(p1, AchievementName)
		-- upvalues: LoggingProtocolModule (copy), AchievementTelemetryModule (copy)
		if p1.hasAchieved == false then
			local _, Result = pcall(function()
				-- upvalues: p1 (copy), AchievementName (copy)
				return p1.achievementService:GrantAchievement(AchievementName)
			end)
			LoggingProtocolModule.default:logRobloxTelemetryEvent(AchievementTelemetryModule, nil, {
				achievementName = AchievementName,
				grantedState = tostring(Result)
			})
			
			if Result == true then
				p1.hasAchieved = true
				p1.achievementDataSubscription:unsubscribe()
				
				for _, achievementAwardedCallback in p1.achievementAwardedCallbacks do
					achievementAwardedCallback(AchievementName)
				end
			end
		end
	end,
	registerOnAchievementAwardedListener = function(p2, p3)
		p2.achievementAwardedCallbacks[p3] = p3
		
		return {
			unsubscribe = function()
				-- upvalues: p2 (copy), p3 (copy)
				p2.achievementAwardedCallbacks[p3] = nil
			end
		}
	end
}

function AchievementModule.new(AchievementName, p2, AchievementService)
	-- upvalues: AchievementModule (copy)
	local t = {}
	setmetatable(t, { __index = AchievementModule })
	t:_init(AchievementName, p2, AchievementService)
	
	return t
end

function AchievementModule.newWithRefresher(p2, p3, p4, p5)
	-- upvalues: AchievementModule (copy)
	local NewAchievement = AchievementModule.new(p2, p3, p5)
	
	if NewAchievement.hasAchieved == false then
		p4:start()
		NewAchievement:registerOnAchievementAwardedListener(function()
			-- upvalues: p4 (copy)
			p4:stop()
		end)
	end
	return NewAchievement
end

return AchievementModule