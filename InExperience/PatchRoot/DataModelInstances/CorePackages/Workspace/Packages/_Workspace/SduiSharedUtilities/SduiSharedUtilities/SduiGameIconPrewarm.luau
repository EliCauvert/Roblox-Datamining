local SduiSharedUtilities = script:FindFirstAncestor("SduiSharedUtilities")
local DataHydrationModule = require(SduiSharedUtilities.Parent.DataHydration)
local _ = require(SduiSharedUtilities.SduiIntegrationTypes)

local function collectUniverseIds(List, p1)
	-- upvalues: collectUniverseIds (copy)
	if type(List) ~= "table" then return end
	for i, value in List do
		if i == "universe_id" and (type(value) == "string" or type(value) == "number") then
			p1[tostring(value)] = true
		elseif type(value) == "table" then
			collectUniverseIds(value, p1)
		end
	end
end

local function prewarmIcons(List, Large)
	-- upvalues: collectUniverseIds (copy), DataHydrationModule (copy)
	local t = {}
	
	for _, value in List do
		collectUniverseIds(value, t)
	end
	local List1 = {}
	
	for i in t do
		table.insert(List1, i)
	end
	if #List1 > 0 then
		DataHydrationModule.Game.getGameIconStore(false).getAndFetchGameIcons(List1, Large)
	end
end

return {
	collectUniverseIds = collectUniverseIds,
	prewarmSmallIcons = function(p2)
		-- upvalues: prewarmIcons (copy), DataHydrationModule (copy)
		prewarmIcons(p2, DataHydrationModule.Game.GameIconSize.Small)
	end,
	prewarmLargeIcons = function(p2)
		-- upvalues: prewarmIcons (copy), DataHydrationModule (copy)
		prewarmIcons(p2, DataHydrationModule.Game.GameIconSize.Large)
	end
}