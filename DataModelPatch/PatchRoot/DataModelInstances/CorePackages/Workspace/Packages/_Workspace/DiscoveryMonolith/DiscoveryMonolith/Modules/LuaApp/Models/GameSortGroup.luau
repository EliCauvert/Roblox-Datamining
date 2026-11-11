local GameSortGroupModule = {
	new = function()
		return { sorts = {}, pageId = "" }
	end
}

function GameSortGroupModule.mock()
	-- upvalues: GameSortGroupModule (copy)
	local NewGameSortGroup = GameSortGroupModule.new()
	NewGameSortGroup.sorts = {}
	NewGameSortGroup.pageId = "73261389094"
	
	return NewGameSortGroup
end

return GameSortGroupModule