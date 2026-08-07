local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local _ = require(foundation.Enums.DialogSize)
local dialogContextModule = require(script.Parent.DialogContext)

return function() --[[ line: 23 | named "useDialog" ]]
	-- upvalues: reactModule (ref), dialogContextModule (ref)
	return reactModule.useContext(dialogContextModule)
end