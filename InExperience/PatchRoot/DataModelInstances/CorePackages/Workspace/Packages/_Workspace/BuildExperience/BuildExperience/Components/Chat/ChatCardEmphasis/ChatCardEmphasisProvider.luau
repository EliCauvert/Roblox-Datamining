local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local ChatCardEmphasisContextModule = require(script.Parent.ChatCardEmphasisContext)
local CreateChatCardEmphasisStoreModule = require(script.Parent.createChatCardEmphasisStore)

return function(p1)
	-- upvalues: ReactModule (copy), CreateChatCardEmphasisStoreModule (copy), ChatCardEmphasisContextModule (copy)
	return ReactModule.createElement(ChatCardEmphasisContextModule.Provider, {
		value = ReactModule.useMemo(CreateChatCardEmphasisStoreModule, {})
	}, p1.children)
end