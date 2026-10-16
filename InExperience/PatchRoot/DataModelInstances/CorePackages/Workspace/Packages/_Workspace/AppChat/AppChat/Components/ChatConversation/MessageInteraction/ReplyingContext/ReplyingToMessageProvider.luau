local ReactModule = require(script:FindFirstAncestor("AppChat").Parent.React)
local ReplyingToMessageContextModule = require(script.Parent.ReplyingToMessageContext)
local ReplyingToMessageDispatchContextModule = require(script.Parent.ReplyingToMessageDispatchContext)

return function(p1) --[[ Line: 13 | Named "ReplyingToMessageProvider" ]]
	-- upvalues: ReactModule (copy), ReplyingToMessageContextModule (copy), ReplyingToMessageDispatchContextModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	
	return ReactModule.createElement(ReplyingToMessageContextModule.Provider, { value = UseStateResult }, {
		ReplyingToMessageDispatch = ReactModule.createElement(ReplyingToMessageDispatchContextModule.Provider, { value = UseStateResult2 }, p1.children)
	})
end