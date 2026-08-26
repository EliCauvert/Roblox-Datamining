local parent = script:FindFirstAncestor("Chrome").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local var1 = reactModule.createContext({})

local function UnibarStyleConstants()
	-- upvalues: useTokens (ref)
	local var2 = useTokens()
	
	return {
		ICON_CELL_WIDTH = var2.Size.Size_1100,
		ICON_SIZE = var2.Size.Size_900,
		UNIBAR_ICON_SIZE = var2.Size.Size_800,
		ICON_HIGHLIGHT_SIZE = UDim2.new(0, var2.Size.Size_900, 0, var2.Size.Size_900),
		ICON_DIVIDER_POSITION = UDim2.new(0, var2.Size.Size_50, 0.5, 0),
		ICON_BADGE_OFFSET_X = var2.Gap.XXLarge,
		ICON_BADGE_OFFSET_Y = var2.Gap.Small,
		MEDIUM_ICON_SIZE = var2.Size.Size_700,
		UNIBAR_END_PADDING = var2.Padding.XSmall,
		MENU_SUBMENU_PADDING = var2.Padding.Small,
		UNIBAR_LEFT_MARGIN = var2.Padding.Small,
		SUB_MENU_ROW_HEIGHT = var2.Size.Size_1400,
		SUBMENU_CORNER_RADIUS = var2.Radius.Medium,
		SUBMENU_PADDING_LEFT = var2.Padding.Small,
		SUBMENU_PADDING_RIGHT = var2.Padding.Small,
		SUBMENU_ROW_LABEL_FONT = var2.Typography.TitleLarge,
		SUBMENU_ROW_PADDING = var2.Padding.Small,
		SUBMENU_ROW_CORNER_RADIUS = var2.Radius.Medium,
		SUBMENU_BOTTOM_PADDING = var2.Padding.XLarge,
		CLOSE_BUTTON_FRAME = UDim2.new(0, var2.Size.Size_1100, 0, var2.Size.Size_1100),
		WINDOW_DEFAULT_PADDING = var2.Padding.Small
	}
end

return {
	Context = var1,
	Provider = function(p1)
		-- upvalues: reactModule (ref), var1 (ref), UnibarStyleConstants (ref)
		return reactModule.createElement(var1.Provider, { value = UnibarStyleConstants() }, p1.children)
	end,
	use = function()
		-- upvalues: reactModule (ref), var1 (ref)
		local var2 = reactModule.useContext(var1)
		
		if var2 then
			return var2
		end
		error("attempt to use UnibarStyleContext with no provider. Add `UnibarStyleContext.Provider` to the React tree and try again")
	end
}