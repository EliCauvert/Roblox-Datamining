local reactModule = require(script:FindFirstAncestor("SocialTabsPage").Parent.React)
local socialTabsContextModule = require(script.Parent.SocialTabsContext)

return function()
	-- upvalues: reactModule (ref), socialTabsContextModule (ref)
	local var2 = reactModule.useContext(socialTabsContextModule)
	assert(var2 ~= nil, "useSocialTabsContext must be used within a SocialTabsContext.Provider")
	
	return var2
end