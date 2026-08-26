local reactModule = require(script:FindFirstAncestor("SocialTabsPage").Parent.React)
local socialTabsContextModule = require(script.Parent.SocialTabsContext)

return function()
	-- upvalues: reactModule (ref), socialTabsContextModule (ref)
	local var1 = reactModule.useContext(socialTabsContextModule)
	assert(var1 ~= nil, "useSocialTabsContext must be used within a SocialTabsContext.Provider")
	
	return var1
end