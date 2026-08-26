local coreGuiService = game:GetService("CoreGui")
local statsUtilsModule = require(coreGuiService.RobloxGui.Modules.Stats.StatsUtils)
local statsAggregatorModule = require(coreGuiService.RobloxGui.Modules.Stats.StatsAggregator)
local getFFlagLazyPerfStatsInitModule = require(coreGuiService.RobloxGui.Modules.Flags.GetFFlagLazyPerfStatsInit)
local t = {}
t.__index = t
t.SecondsBetweenUpdate = 1
t.NumSamplesToKeep = 20
local var1 = nil

function t.getSingleton()
	-- upvalues: var1 (write), t (ref), getFFlagLazyPerfStatsInitModule (ref)
	if var1 == nil then
		var1 = t.__new()
		
		if not getFFlagLazyPerfStatsInitModule() then
			var1:StartListening()
		end
	end
	return var1
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

function t.StartListening(p1)
	for i, v in pairs(p1._statsAggregators) do
		v:StartListening()
	end
end

function t.StopListening(p2)
	for i, v in pairs(p2._statsAggregators) do
		v:StopListening()
	end
end

function t.GetAggregator(p3, p4)
	return p3._statsAggregators[p4]
end

return t