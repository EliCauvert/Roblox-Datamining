local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local _ = require(Foundation.Enums.HeaderBarSlot)
local Context = ReactModule.createContext({ testId = "" })

return {
	Context = Context,
	Provider = function(p1)
		-- upvalues: ReactModule (copy), Context (copy)
		return ReactModule.createElement(Context.Provider, {
			value = ReactModule.useMemo(function()
				-- upvalues: p1 (copy)
				return {
					testId = p1.testId,
					slot = p1.slot,
					leadingWidth = p1.leadingWidth,
					trailingWidth = p1.trailingWidth,
					onSideWidthChanged = p1.onSideWidthChanged
				}
			end, {
				p1.testId,
				p1.slot,
				p1.leadingWidth,
				p1.trailingWidth,
				p1.onSideWidthChanged
			})
		}, p1.children)
	end
}