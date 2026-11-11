local TextSizeOffsetContextModule = require(script.Parent.TextSizeOffsetContext)
local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function()
	-- upvalues: ReactModule (copy), TextSizeOffsetContextModule (copy)
	return ReactModule.useContext(TextSizeOffsetContextModule)
end