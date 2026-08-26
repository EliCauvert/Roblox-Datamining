local sduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local dataHydrationModule = require(sduiSharedUtilities.Parent.DataHydration)
local _ = require(sduiSharedUtilities.SduiIntegrationTypes)

local function collectUniverseIds(p1, p2)
	-- upvalues: collectUniverseIds (ref)
	if type(p1) ~= "table" then return end
	for i, v in p1 do
		if i == "universe_id" and (type(v) == "string" or type(v) == "number") then
			p2[tostring(v)] = true
		elseif type(v) == "table" then
			collectUniverseIds(v, p2)
		end
	end
end

local function prewarmIcons(p3, p4)
	-- upvalues: collectUniverseIds (ref), dataHydrationModule (ref)
	local t = {}
	
	for i, v in p3 do
		collectUniverseIds(v, t)
	end
	local t_1 = {}
	
	for i_1 in t do
		table.insert(t_1, i_1)
	end
	if #t_1 > 0 then
		dataHydrationModule.Game.getGameIconStore(false).getAndFetchGameIcons(t_1, p4)
	end
end

return {
	collectUniverseIds = collectUniverseIds,
	prewarmSmallIcons = function(p5)
		-- upvalues: prewarmIcons (ref), dataHydrationModule (ref)
		prewarmIcons(p5, dataHydrationModule.Game.GameIconSize.Small)
	end,
	prewarmLargeIcons = function(p5)
		-- upvalues: prewarmIcons (ref), dataHydrationModule (ref)
		prewarmIcons(p5, dataHydrationModule.Game.GameIconSize.Large)
	end
}