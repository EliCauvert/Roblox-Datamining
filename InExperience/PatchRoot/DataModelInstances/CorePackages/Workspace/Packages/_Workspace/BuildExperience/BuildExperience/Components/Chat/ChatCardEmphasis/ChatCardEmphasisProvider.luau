local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local chatCardEmphasisContextModule = require(script.Parent.ChatCardEmphasisContext)
local createChatCardEmphasisStoreModule = require(script.Parent.createChatCardEmphasisStore)

return function(p1)
	-- upvalues: reactModule (ref), createChatCardEmphasisStoreModule (ref), chatCardEmphasisContextModule (ref)
	return reactModule.createElement(chatCardEmphasisContextModule.Provider, {
		value = reactModule.useMemo(createChatCardEmphasisStoreModule, {})
	}, p1.children)
end