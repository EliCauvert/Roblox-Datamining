local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local DashModule = require(Parent.Dash)
local ReactModule = require(Parent.React)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local GetGridSizeTagModule = require(Foundation.Utility.getGridSizeTag)
local WithDefaultsModule = require(Foundation.Utility.withDefaults)
local config = { size = 1, testId = "--foundation-grid--cell" }

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 26 | Named "GridCell" ]]
	-- upvalues: WithDefaultsModule (copy), config (copy), DashModule (copy), ReactModule (copy), GetGridSizeTagModule (copy), ViewModule (copy)
	local WithDefaultsModuleResult = WithDefaultsModule(p1, config)
	
	return ReactModule.createElement(ViewModule, DashModule.assign(DashModule.omit(WithDefaultsModuleResult, { "size" }), {
		tag = table.concat({
			ReactModule.useMemo(function() --[[ Line: 30 ]]
				-- upvalues: GetGridSizeTagModule (upval), WithDefaultsModuleResult (copy)
				return GetGridSizeTagModule(WithDefaultsModuleResult.size)
			end, { WithDefaultsModuleResult.size }),
			WithDefaultsModuleResult.tag
		}, " "),
		ref = Ref
	}), WithDefaultsModuleResult.children)
end))