local textSizeOffsetContextModule = require(script.Parent.TextSizeOffsetContext)
local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function() --[[ line: 8 | named "useTextSizeOffset" ]]
	-- upvalues: reactModule (ref), textSizeOffsetContextModule (ref)
	return reactModule.useContext(textSizeOffsetContextModule)
end