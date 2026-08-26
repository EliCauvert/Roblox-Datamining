local appChat = script:FindFirstAncestor("AppChat")
local llama = require(appChat.Parent.LuaSocialLibrariesDeps).llama
local roduxAliasesModule = require(appChat.Http.RoduxAliases)

local function convertToNewAliasUpdatedActions(p1)
	-- upvalues: roduxAliasesModule (ref)
	local t = {}
	
	for i, v in ipairs(p1) do
		table.insert(t, roduxAliasesModule.Actions.AliasUpdated(tostring(v.targetUserId), v.targetUserTag))
	end
	return t
end

local t = {
	GetAliases_Success = function(p2)
		-- upvalues: convertToNewAliasUpdatedActions (ref)
		return convertToNewAliasUpdatedActions(p2.responseBody)
	end,
	ReceivedAliases = function(p2)
		-- upvalues: convertToNewAliasUpdatedActions (ref)
		return convertToNewAliasUpdatedActions(p2.aliases)
	end
}
local var1 = roduxAliasesModule.installReducer()

return function(p2, p3)
	-- upvalues: t (ref), llama (ref), var1 (ref)
	p2 = p2 or { byUserId = { ShowUserAlias = true } }
	local list = { p3 }
	local type = t[p3.type]
	
	if type then
		list = type(p3)
	end
	return llama.List.reduce(list, var1, p2)
end