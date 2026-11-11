local FetchExperienceStoreProductsModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Thunks.Economy.FetchExperienceStoreProducts)

local function collectUniverseIdsFromState(State)
	local t = {}
	local List = {}
	
	local function _(Key)
		-- upvalues: t (copy), List (copy)
		if type(Key) == "string" and Key ~= "" and not t[Key] then
			t[Key] = true
			table.insert(List, Key)
		end
	end
	
	if State.GameDetailsV2 then
		for i in pairs(State.GameDetailsV2) do
			if type(i) == "string" and i ~= "" and not t[i] then
				t[i] = true
				table.insert(List, i)
			end
		end
	end
	if State.GameDetails then
		for gameDetail in pairs(State.GameDetails) do
			if type(gameDetail) == "string" and gameDetail ~= "" and not t[gameDetail] then
				t[gameDetail] = true
				table.insert(List, gameDetail)
			end
		end
	end
	return List
end

return function(p1)
	-- upvalues: collectUniverseIdsFromState (copy), FetchExperienceStoreProductsModule (copy)
	return function(p2)
		-- upvalues: collectUniverseIdsFromState (upval), FetchExperienceStoreProductsModule (upval), p1 (copy)
		for _, value in ipairs((collectUniverseIdsFromState(p2:getState()))) do
			p2:dispatch(FetchExperienceStoreProductsModule(p1, value))
		end
	end
end