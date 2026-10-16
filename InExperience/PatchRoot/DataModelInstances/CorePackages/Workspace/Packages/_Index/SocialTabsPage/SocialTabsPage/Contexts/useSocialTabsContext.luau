local ReactModule = require(script:FindFirstAncestor("SocialTabsPage").Parent.React)
local SocialTabsContextModule = require(script.Parent.SocialTabsContext)

return function() --[[ Line: 7 | Named "useSocialTabsContext" ]]
	-- upvalues: ReactModule (copy), SocialTabsContextModule (copy)
	local UseContextResult = ReactModule.useContext(SocialTabsContextModule)
	assert(UseContextResult ~= nil, "useSocialTabsContext must be used within a SocialTabsContext.Provider")
	
	return UseContextResult
end