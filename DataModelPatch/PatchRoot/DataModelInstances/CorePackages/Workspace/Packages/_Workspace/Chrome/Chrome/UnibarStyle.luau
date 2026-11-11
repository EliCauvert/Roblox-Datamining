local Parent = script:FindFirstAncestor("Chrome").Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local Context = ReactModule.createContext({})

local function UnibarStyleConstants()
	-- upvalues: UseTokensFunction (copy)
	local UseTokensResult = UseTokensFunction()
	
	return {
		ICON_CELL_WIDTH = UseTokensResult.Size.Size_1100,
		ICON_SIZE = UseTokensResult.Size.Size_900,
		UNIBAR_ICON_SIZE = UseTokensResult.Size.Size_800,
		ICON_HIGHLIGHT_SIZE = UDim2.new(0, UseTokensResult.Size.Size_900, 0, UseTokensResult.Size.Size_900),
		ICON_DIVIDER_POSITION = UDim2.new(0, UseTokensResult.Size.Size_50, 0.5, 0),
		ICON_BADGE_OFFSET_X = UseTokensResult.Gap.XXLarge,
		ICON_BADGE_OFFSET_Y = UseTokensResult.Gap.Small,
		MEDIUM_ICON_SIZE = UseTokensResult.Size.Size_700,
		UNIBAR_END_PADDING = UseTokensResult.Padding.XSmall,
		MENU_SUBMENU_PADDING = UseTokensResult.Padding.Small,
		UNIBAR_LEFT_MARGIN = UseTokensResult.Padding.Small,
		SUB_MENU_ROW_HEIGHT = UseTokensResult.Size.Size_1400,
		SUBMENU_CORNER_RADIUS = UseTokensResult.Radius.Medium,
		SUBMENU_PADDING_LEFT = UseTokensResult.Padding.Small,
		SUBMENU_PADDING_RIGHT = UseTokensResult.Padding.Small,
		SUBMENU_ROW_LABEL_FONT = UseTokensResult.Typography.TitleLarge,
		SUBMENU_ROW_PADDING = UseTokensResult.Padding.Small,
		SUBMENU_ROW_CORNER_RADIUS = UseTokensResult.Radius.Medium,
		SUBMENU_BOTTOM_PADDING = UseTokensResult.Padding.XLarge,
		CLOSE_BUTTON_FRAME = UDim2.new(0, UseTokensResult.Size.Size_1100, 0, UseTokensResult.Size.Size_1100),
		WINDOW_DEFAULT_PADDING = UseTokensResult.Padding.Small
	}
end

return {
	Context = Context,
	Provider = function(p1)
		-- upvalues: ReactModule (copy), Context (copy), UnibarStyleConstants (copy)
		return ReactModule.createElement(Context.Provider, { value = UnibarStyleConstants() }, p1.children)
	end,
	use = function()
		-- upvalues: ReactModule (copy), Context (copy)
		local UseContextResult = ReactModule.useContext(Context)
		
		if UseContextResult then
			return UseContextResult
		else
			error("attempt to use UnibarStyleContext with no provider. Add `UnibarStyleContext.Provider` to the React tree and try again")
		end
	end
}