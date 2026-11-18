local RecycledInlineLayout = script:FindFirstAncestor("RecycledInlineLayout")
local Parent = RecycledInlineLayout.Parent
local ReactModule = require(Parent.React)
local ViewRecyclerReactModule = require(Parent.ViewRecyclerReact)
local ViewTypesModule = require(RecycledInlineLayout.Adapter.ViewTypes)

local function _(p1)
	-- upvalues: ReactModule (copy), ViewTypesModule (copy)
	return ReactModule.useMemo(function()
		-- upvalues: p1 (copy), ViewTypesModule (upval)
		return if p1 == nil then nil else function(p2)
			-- upvalues: p1 (upval), ViewTypesModule (upval)
			if p2.kind == "poolChanged" then
				p1({
					type = "pool",
					action = p2.action,
					kind = ViewTypesModule.getName(p2.itemViewType) or "row"
				})
			end
		end
	end, { p1 })
end

return {
	RecyclingScope = function(p1)
		-- upvalues: ReactModule (copy), ViewRecyclerReactModule (copy), ViewTypesModule (copy)
		local DiagnosticsFunction = p1.__diagnostics
		
		return ReactModule.createElement(ViewRecyclerReactModule.RecyclingScope, {
			maxPoolSize = p1.maxPoolSize or 32,
			diagnostics = ReactModule.useMemo(function()
				-- upvalues: DiagnosticsFunction (copy), ViewTypesModule (upval)
				return if DiagnosticsFunction == nil then nil else function(p2)
					-- upvalues: DiagnosticsFunction (upval), ViewTypesModule (upval)
					if p2.kind == "poolChanged" then
						DiagnosticsFunction({
							type = "pool",
							action = p2.action,
							kind = ViewTypesModule.getName(p2.itemViewType) or "row"
						})
					end
				end
			end, { DiagnosticsFunction })
		}, p1.children)
	end
}