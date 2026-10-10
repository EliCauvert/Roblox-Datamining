local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local chatCardEmphasisPositionContextModule = require(script.Parent.ChatCardEmphasisPositionContext)

return function(p1)
	-- upvalues: reactModule (ref), chatCardEmphasisPositionContextModule (ref)
	local var1 = reactModule.useContext(chatCardEmphasisPositionContextModule)
	
	return reactModule.createElement(chatCardEmphasisPositionContextModule.Provider, {
		value = reactModule.useMemo(function()
			-- upvalues: p1 (ref), var1 (ref)
			return {
				messageOrder = p1.messageOrder or (if var1 then var1.messageOrder else 0),
				segmentOrder = p1.segmentOrder or (if var1 then var1.segmentOrder else 0),
				childOrder = p1.childOrder or 0
			}
		end, { var1, p1.messageOrder, p1.segmentOrder, p1.childOrder })
	}, p1.children)
end