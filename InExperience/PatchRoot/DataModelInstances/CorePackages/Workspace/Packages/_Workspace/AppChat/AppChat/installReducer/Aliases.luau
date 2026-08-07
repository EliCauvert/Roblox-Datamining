local appChat = script:FindFirstAncestor("AppChat")
local llama = require(appChat.Parent.LuaSocialLibrariesDeps).llama
local roduxAliasesModule = require(appChat.Http.RoduxAliases)

local function convertToNewAliasUpdatedActions(p0) --[[ line: 8 ]]
	-- upvalues: roduxAliasesModule (ref)
	local t = {}
	
	for i, v in ipairs(p0) do
		table.insert(t, roduxAliasesModule.Actions.AliasUpdated(tostring(v.targetUserId), v.targetUserTag))
	end
	return t
end

local t = {
	GetAliases_Success = function(p1) --[[ line: 20 ]]
		-- upvalues: convertToNewAliasUpdatedActions (ref)
		return convertToNewAliasUpdatedActions(p1.responseBody)
	end,
	ReceivedAliases = function(p2) --[[ line: 24 ]]
		-- upvalues: convertToNewAliasUpdatedActions (ref)
		return convertToNewAliasUpdatedActions(p2.aliases)
	end
}
local var4 = roduxAliasesModule.installReducer()

return function(p3, p4) --[[ line: 31 ]]
	-- upvalues: t (ref), llama (ref), var4 (ref)
	p3 = p3 or { byUserId = { ShowUserAlias = true } }
	local list = { p4 }
	local type = t[p4.type]
	
	if type then
		list = type(p4)
	end
	return llama.List.reduce(list, var4, p3)
end