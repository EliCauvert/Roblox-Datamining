local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local ContextModule = require(script.Parent.Context)

return function() --[[ Line: 7 | Named "useChatPagePadding" ]]
	-- upvalues: ReactModule (copy), ContextModule (copy)
	return ReactModule.useContext(ContextModule)
end