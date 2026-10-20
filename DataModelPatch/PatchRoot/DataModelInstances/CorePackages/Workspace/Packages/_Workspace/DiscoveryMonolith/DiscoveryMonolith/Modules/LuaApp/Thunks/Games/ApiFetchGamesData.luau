local DiscoveryMonolith = script:FindFirstAncestor("DiscoveryMonolith")
local Parent = DiscoveryMonolith.Parent
local TopicInfosReducer = require(Parent.TopicInfosRodux).TopicInfosReducer
local GameSortGroups = require(Parent.DiscoveryTypes).GameSortGroups
local PromiseModule = require(Parent.Promise)
local PromiseUtilities = require(Parent.AppCommonLib).Utils.PromiseUtilities
local ApiFetchGamesInSortModule = require(DiscoveryMonolith.Modules.LuaApp.Thunks.Games.ApiFetchGamesInSort)

return function(p1, p2, p3, p4, p5)
	-- upvalues: GameSortGroups (copy), TopicInfosReducer (copy), ApiFetchGamesInSortModule (copy), PromiseModule (copy), PromiseUtilities (copy)
	if not p2 then
		p2 = GameSortGroups.Games
	end
	assert(p2, "not nil")
	
	return function(p6)
		-- upvalues: p3 (copy), p2 (ref), p5 (copy), TopicInfosReducer (upval), ApiFetchGamesInSortModule (upval), p1 (copy), p4 (copy), PromiseModule (upval), PromiseUtilities (upval)
		local DispatchResults = {}
		local State = p6:getState()
		
		if p3 then
			if State.Personalization[TopicInfosReducer.key][p3] then
				table.insert(DispatchResults, (p6:dispatch(ApiFetchGamesInSortModule(p1, State.Personalization[TopicInfosReducer.key][p3], nil, p4))))
			else
				PromiseModule.reject()
			end
		else
			local CountSorts = #State.GameSortGroups[p2].sorts
			
			if p5 ~= nil then
				CountSorts = math.min(p5, CountSorts)
			end
			for i = 1, CountSorts do
				table.insert(DispatchResults, (p6:dispatch(ApiFetchGamesInSortModule(p1, State.Personalization[TopicInfosReducer.key][State.GameSortGroups[p2].sorts[i]], nil, p4))))
			end
		end
		return PromiseUtilities.Batch(DispatchResults)
	end
end