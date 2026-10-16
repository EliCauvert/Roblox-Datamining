local Foundation = script:FindFirstAncestor("Foundation")
local Parent = Foundation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local _ = require(Parent.React)
local MatrixGridModule = require(Foundation.Utility.Stories.Shared.MatrixGrid)
local Icon = BuilderIconsModule.Icon
local Uiblox = BuilderIconsModule.Migration.uiblox

local function _(p1): string --[[ Line: 16 | Named "formatMigratedLegacySubtitle" ]]
	-- upvalues: Uiblox (copy)
	local UibloxEntry = Uiblox[p1]
	
	return `{p1} → {UibloxEntry.name} ({UibloxEntry.variant})`
end

local IconsPlaceholderPlaceholderOnSmall = Uiblox["icons/placeholder/placeholderOn_small"]
local list = {
	{
		title = "Builder icon · Icon component",
		name = Icon.RobloxPlus,
		subtitle = Icon.RobloxPlus
	},
	{
		name = "icons/placeholder/placeholderOn_small",
		title = "Migrated legacy string · Icon component",
		subtitle = `icons/placeholder/placeholderOn_small → {IconsPlaceholderPlaceholderOnSmall.name} ({IconsPlaceholderPlaceholderOnSmall.variant})`
	},
	{
		name = "icons/menu/clothing/limited_on",
		title = "Non-migrated legacy string · Image component",
		subtitle = "icons/menu/clothing/limited_on"
	}
}

return {
	ICON_TYPE_EXAMPLES = list,
	buildIconControlOptions = function(p1) --[[ Line: 51 ]]
		-- upvalues: list (copy)
		local List = { "" }
		
		for _, value in list do
			table.insert(List, value.name)
		end
		local Additional = if p1 then p1.additional else nil
		
		if Additional then
			for _, value1 in Additional do
				table.insert(List, value1)
			end
		end
		return List
	end,
	buildIconTypeMatrixRows = function(Callback) --[[ Line: 72 ]]
		-- upvalues: list (copy), MatrixGridModule (copy)
		local List = {}
		
		for _, value in list do
			table.insert(List, {
				label = MatrixGridModule.matrixInfoLabel(value.title, value.subtitle),
				cells = Callback(value)
			})
		end
		return List
	end,
	parseIconControl = function(p2) --[[ Line: 65 ]]
		return if p2 == "" then nil else p2
	end
}