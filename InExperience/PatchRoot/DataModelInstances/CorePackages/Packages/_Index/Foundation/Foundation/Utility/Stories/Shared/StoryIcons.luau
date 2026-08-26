local foundation = script:FindFirstAncestor("Foundation")
local parent = foundation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local _ = require(parent.React)
local matrixGridModule = require(foundation.Utility.Stories.Shared.MatrixGrid)
local icon = builderIconsModule.Icon
local uiblox = builderIconsModule.Migration.uiblox

local function _(p1)
	-- upvalues: uiblox (ref)
	local var1 = uiblox[p1]
	
	return `{p1} \226\134\146 {var1.name} ({var1.variant})`
end

local t = {}
local t_1 = {
	title = "Builder icon \194\183 Icon component",
	name = icon.RobloxPlus,
	subtitle = icon.RobloxPlus
}
local t_2 = {
	name = "icons/placeholder/placeholderOn_small",
	title = "Migrated legacy string \194\183 Icon component"
}
local placeholderOnSmall = uiblox["icons/placeholder/placeholderOn_small"]
t_2.subtitle = `icons/placeholder/placeholderOn_small \226\134\146 {placeholderOnSmall.name} ({placeholderOnSmall.variant})`
-- Unknown statement at pc 13: <SetList>

return {
	ICON_TYPE_EXAMPLES = t,
	buildIconControlOptions = function(p1)
		-- upvalues: t (ref)
		local list = { "" }
		
		for i, v in t do
			table.insert(list, v.name)
		end
		local var1 = if p1 then p1.additional else nil
		
		if var1 then
			for i_1, v_1 in var1 do
				table.insert(list, v_1)
			end
		end
		return list
	end,
	buildIconTypeMatrixRows = function(p2)
		-- upvalues: t (ref), matrixGridModule (ref)
		local t_1 = {}
		
		for i, v in t do
			table.insert(t_1, {
				label = matrixGridModule.matrixInfoLabel(v.title, v.subtitle),
				cells = p2(v)
			})
		end
		return t_1
	end,
	parseIconControl = function(p3)
		return if p3 == "" then nil else p3
	end
}