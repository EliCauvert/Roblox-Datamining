local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local ContextModule = require(script.Parent.Context)

return function() --[[ Line: 6 | Named "useChatWideModeFocus" ]]
	-- upvalues: ReactModule (copy), ContextModule (copy)
	return ReactModule.useContext(ContextModule)
end