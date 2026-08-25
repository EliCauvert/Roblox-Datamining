local coreGuiService = game:GetService("CoreGui")
local statsUtilsModule = require(coreGuiService.RobloxGui.Modules.Stats.StatsUtils)
local statsAggregatorModule = require(coreGuiService.RobloxGui.Modules.Stats.StatsAggregator)
local getFFlagLazyPerfStatsInitModule = require(coreGuiService.RobloxGui.Modules.Flags.GetFFlagLazyPerfStatsInit)
local t = {}
t.__index = t
t.SecondsBetweenUpdate = 1
t.NumSamplesToKeep = 20
local var5 = nil

function t.getSingleton()
	-- upvalues: var5 (write), t (ref), getFFlagLazyPerfStatsInitModule (ref)
	if var5 == nil then
		var5 = t.__new()
		
		if not getFFlagLazyPerfStatsInitModule() then
			var5:StartListening()
		end
	end
	return var5
end

function t.__new()
	-- upvalues: t (ref), statsUtilsModule (ref), statsAggregatorModule (ref)
	local t_1 = {}
	setmetatable(t_1, t)
	t_1._statsAggregators = {}
	
	for i, v in ipairs(statsUtilsModule.AllStatTypes) do
		t_1._statsAggregators[v] = statsAggregatorModule.new(v, t.NumSamplesToKeep, t.SecondsBetweenUpdate)
	end
	return t_1
end

function t.StartListening(p0)
	for i, v in pairs(p0._statsAggregators) do
		v:StartListening()
	end
end

function t.StopListening(p1)
	for i, v in pairs(p1._statsAggregators) do
		v:StopListening()
	end
end

function t.GetAggregator(p2, p3)
	return p2._statsAggregators[p3]
end

return t