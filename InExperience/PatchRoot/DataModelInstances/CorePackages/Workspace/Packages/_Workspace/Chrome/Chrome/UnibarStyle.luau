local parent = script:FindFirstAncestor("Chrome").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local var1 = reactModule.createContext({})

local function UnibarStyleConstants()
	-- upvalues: useTokens (ref)
	local var3 = useTokens()
	
	return {
		ICON_CELL_WIDTH = var3.Size.Size_1100,
		ICON_SIZE = var3.Size.Size_900,
		UNIBAR_ICON_SIZE = var3.Size.Size_800,
		ICON_HIGHLIGHT_SIZE = UDim2.new(0, var3.Size.Size_900, 0, var3.Size.Size_900),
		ICON_DIVIDER_POSITION = UDim2.new(0, var3.Size.Size_50, 0.5, 0),
		ICON_BADGE_OFFSET_X = var3.Gap.XXLarge,
		ICON_BADGE_OFFSET_Y = var3.Gap.Small,
		MEDIUM_ICON_SIZE = var3.Size.Size_700,
		UNIBAR_END_PADDING = var3.Padding.XSmall,
		MENU_SUBMENU_PADDING = var3.Padding.Small,
		UNIBAR_LEFT_MARGIN = var3.Padding.Small,
		SUB_MENU_ROW_HEIGHT = var3.Size.Size_1400,
		SUBMENU_CORNER_RADIUS = var3.Radius.Medium,
		SUBMENU_PADDING_LEFT = var3.Padding.Small,
		SUBMENU_PADDING_RIGHT = var3.Padding.Small,
		SUBMENU_ROW_LABEL_FONT = var3.Typography.TitleLarge,
		SUBMENU_ROW_PADDING = var3.Padding.Small,
		SUBMENU_ROW_CORNER_RADIUS = var3.Radius.Medium,
		SUBMENU_BOTTOM_PADDING = var3.Padding.XLarge,
		CLOSE_BUTTON_FRAME = UDim2.new(0, var3.Size.Size_1100, 0, var3.Size.Size_1100),
		WINDOW_DEFAULT_PADDING = var3.Padding.Small
	}
end

return {
	Context = var1,
	Provider = function(p0)
		-- upvalues: reactModule (ref), var1 (ref), UnibarStyleConstants (ref)
		return reactModule.createElement(var1.Provider, { value = UnibarStyleConstants() }, p0.children)
	end,
	use = function()
		-- upvalues: reactModule (ref), var1 (ref)
		local var4 = reactModule.useContext(var1)
		
		if var4 then
			return var4
		end
		error("attempt to use UnibarStyleContext with no provider. Add `UnibarStyleContext.Provider` to the React tree and try again")
	end
}