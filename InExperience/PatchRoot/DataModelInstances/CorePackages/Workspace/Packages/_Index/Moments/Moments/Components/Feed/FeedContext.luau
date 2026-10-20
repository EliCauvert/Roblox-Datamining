local Parent = script:FindFirstAncestor("Moments").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.Signals)
local _ = require(script.Parent.FeedTypes)
local Context = ReactModule.createContext(nil)

return {
	FeedContext = Context,
	useFeed = function()
		-- upvalues: ReactModule (copy), Context (copy)
		local UseContextResult = ReactModule.useContext(Context)
		
		if UseContextResult == nil then
			error("useFeed must be used within a Feed")
		end
		return UseContextResult
	end,
	useFeedOptional = function()
		-- upvalues: ReactModule (copy), Context (copy)
		return ReactModule.useContext(Context)
	end
}