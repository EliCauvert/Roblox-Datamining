local Parent = script:FindFirstAncestor("Moments").Parent
local _ = require(Parent.Foundation)
local _ = require(Parent.MomentsTypes)
local ReactModule = require(Parent.React)
local Context = ReactModule.createContext(nil)

return {
	CommentsListRowContext = Context,
	useCommentsListRow = function() --[[ Line: 34 ]]
		-- upvalues: ReactModule (copy), Context (copy)
		local UseContextResult = ReactModule.useContext(Context)
		assert(UseContextResult ~= nil, "Comments list rows must render inside CommentsListRowContext")
		
		return UseContextResult
	end
}