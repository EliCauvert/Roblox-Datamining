local AppChat = script:FindFirstAncestor("AppChat")
local Llama = require(AppChat.Parent.LuaSocialLibrariesDeps).llama
local RoduxAliasesModule = require(AppChat.Http.RoduxAliases)

local function convertToNewAliasUpdatedActions(Aliases) --[[ Line: 8 ]]
	-- upvalues: RoduxAliasesModule (copy)
	local AliasUpdatedResults = {}
	
	for _, alias in ipairs(Aliases) do
		table.insert(AliasUpdatedResults, RoduxAliasesModule.Actions.AliasUpdated(tostring(alias.targetUserId), alias.targetUserTag))
	end
	return AliasUpdatedResults
end

local config = {
	GetAliases_Success = function(p1) --[[ Line: 20 ]]
		-- upvalues: convertToNewAliasUpdatedActions (copy)
		return (convertToNewAliasUpdatedActions(p1.responseBody))
	end,
	ReceivedAliases = function(p1) --[[ Line: 24 ]]
		-- upvalues: convertToNewAliasUpdatedActions (copy)
		return (convertToNewAliasUpdatedActions(p1.aliases))
	end
}
local InstallReducerResult = RoduxAliasesModule.installReducer()

return function(p1, p2) --[[ Line: 31 ]]
	-- upvalues: config (copy), Llama (copy), InstallReducerResult (copy)
	local P3 = p1 or { byUserId = { ShowUserAlias = true } }
	local list = { p2 }
	local Entry = config[p2.type]
	
	if Entry then
		list = Entry(p2)
	end
	return Llama.List.reduce(list, InstallReducerResult, P3)
end