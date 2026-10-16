local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local ChatCardEmphasisPositionContextModule = require(script.Parent.ChatCardEmphasisPositionContext)

return function(p1) --[[ Line: 14 | Named "ChatCardEmphasisPositionProvider" ]]
	-- upvalues: ReactModule (copy), ChatCardEmphasisPositionContextModule (copy)
	local UseContextResult = ReactModule.useContext(ChatCardEmphasisPositionContextModule)
	
	return ReactModule.createElement(ChatCardEmphasisPositionContextModule.Provider, {
		value = ReactModule.useMemo(function() --[[ Line: 16 ]]
			-- upvalues: p1 (copy), UseContextResult (copy)
			return {
				messageOrder = p1.messageOrder or (if UseContextResult then UseContextResult.messageOrder else 0),
				segmentOrder = p1.segmentOrder or (if UseContextResult then UseContextResult.segmentOrder else 0),
				childOrder = p1.childOrder or 0
			}
		end, {
			UseContextResult,
			p1.messageOrder,
			p1.segmentOrder,
			p1.childOrder
		})
	}, p1.children)
end