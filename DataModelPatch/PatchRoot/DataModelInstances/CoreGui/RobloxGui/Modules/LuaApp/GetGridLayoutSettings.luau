local ArgCheckModule = require(script.Parent.ArgCheck)
local config = { minimumCardCount = 2, minimumCardWidth = 160 }
local config1 = { minimumCardCount = 1, minimumCardWidth = 330 }

local function getGridLayoutSettingsHelper(p1, p2, p3)
	-- upvalues: ArgCheckModule (copy)
	ArgCheckModule.isNonNegativeNumber(p1, "GetGridLayoutSettings: containerWidth")
	ArgCheckModule.isNonNegativeNumber(p2, "GetGridLayoutSettings: cardPadding")
	ArgCheckModule.isType(p3, "table", "GetGridLayoutSettings: settingsTable")
	local Largest = math.max(p3.minimumCardCount, (math.floor((p1 + p2) / (p3.minimumCardWidth + p2))))
	
	return Largest, (math.floor((p1 - (Largest - 1) * p2) / Largest))
end

return {
	Small = function(p1, p2)
		-- upvalues: getGridLayoutSettingsHelper (copy), config (copy)
		local GridLayoutSettingsHelper, _ = getGridLayoutSettingsHelper(p1, p2, config)
		local NewGridLayoutSettingsHelper = GridLayoutSettingsHelper + 1
		
		return NewGridLayoutSettingsHelper, (math.floor((p1 - (NewGridLayoutSettingsHelper - 1) * p2) / NewGridLayoutSettingsHelper))
	end,
	Medium = function(p1, p2)
		-- upvalues: getGridLayoutSettingsHelper (copy), config (copy)
		return getGridLayoutSettingsHelper(p1, p2, config)
	end,
	Large = function(p1, p2)
		-- upvalues: getGridLayoutSettingsHelper (copy), config1 (copy)
		return getGridLayoutSettingsHelper(p1, p2, config1)
	end
}