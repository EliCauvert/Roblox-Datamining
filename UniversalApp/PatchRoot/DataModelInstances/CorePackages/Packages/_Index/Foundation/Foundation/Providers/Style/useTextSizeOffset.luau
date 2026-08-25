local textSizeOffsetContextModule = require(script.Parent.TextSizeOffsetContext)
local reactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function()
	-- upvalues: reactModule (ref), textSizeOffsetContextModule (ref)
	return reactModule.useContext(textSizeOffsetContextModule)
end