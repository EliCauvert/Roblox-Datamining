local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local _ = require(parent.Signals)
local _ = require(script.Parent.FeedTypes)
local var1 = reactModule.createContext(nil)

return {
	FeedContext = var1,
	useFeed = function() --[[ line: 60 ]]
		-- upvalues: reactModule (ref), var1 (ref)
		local var2 = reactModule.useContext(var1)
		
		if var2 == nil then
			error("useFeed must be used within a Feed")
		end
		return var2
	end,
	useFeedOptional = function() --[[ line: 72 ]]
		-- upvalues: reactModule (ref), var1 (ref)
		return reactModule.useContext(var1)
	end
}