local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local dataHydrationModule = require(sduiSharedUtilities.Parent.DataHydration)
local _ = require(sduiSharedUtilities.SduiIntegrationTypes)

local function collectUniverseIds(p0, p1) --[[ line: 16 ]]
	-- upvalues: collectUniverseIds (ref)
	if type(p0) ~= "table" then return end
	for i, v in p0 do
		if i == "universe_id" and (type(v) == "string" or type(v) == "number") then
			p1[tostring(v)] = true
		elseif type(v) == "table" then
			collectUniverseIds(v, p1)
		end
	end
end

local function prewarmIcons(p2, p3) --[[ line: 41 ]]
	-- upvalues: collectUniverseIds (ref), dataHydrationModule (ref)
	local t = {}
	
	for i, v in p2 do
		collectUniverseIds(v, t)
	end
	local t_1 = {}
	
	for i_1 in t do
		table.insert(t_1, i_1)
	end
	if #t_1 > 0 then
		dataHydrationModule.Game.getGameIconStore(false).getAndFetchGameIcons(t_1, p3)
	end
end

return {
	collectUniverseIds = collectUniverseIds,
	prewarmSmallIcons = function(p4) --[[ line: 56 ]]
		-- upvalues: prewarmIcons (ref), dataHydrationModule (ref)
		prewarmIcons(p4, dataHydrationModule.Game.GameIconSize.Small)
	end,
	prewarmLargeIcons = function(p5) --[[ line: 60 ]]
		-- upvalues: prewarmIcons (ref), dataHydrationModule (ref)
		prewarmIcons(p5, dataHydrationModule.Game.GameIconSize.Large)
	end
}