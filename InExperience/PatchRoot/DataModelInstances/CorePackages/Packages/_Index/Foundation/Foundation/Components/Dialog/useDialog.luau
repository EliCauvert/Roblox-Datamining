local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Enums.DialogSize)
local DialogContextModule = require(script.Parent.DialogContext)

return function() --[[ Line: 23 | Named "useDialog" ]]
	-- upvalues: ReactModule (copy), DialogContextModule (copy)
	return ReactModule.useContext(DialogContextModule)
end