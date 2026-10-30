local Parent = script.Parent
local ReactModule = require(Parent.Parent.React)
local GetThemeBackgroundStoreModule = require(Parent.Stores.GetThemeBackgroundStore)
local ThemeBackgroundFillModule = require(Parent.ThemeBackgroundFill)

return function(p1)
	-- upvalues: GetThemeBackgroundStoreModule (copy), ReactModule (copy), ThemeBackgroundFillModule (copy)
	local ThemeBackgroundStoreModule = GetThemeBackgroundStoreModule(false)
	local Image = p1.image
	local BaseColor = p1.baseColor
	ReactModule.useLayoutEffect(function()
		-- upvalues: ThemeBackgroundStoreModule (copy), Image (copy), BaseColor (copy)
		ThemeBackgroundStoreModule.setThemeBackground(if Image then { image = Image, baseColor = BaseColor } else nil)
		
		return function()
			-- upvalues: ThemeBackgroundStoreModule (upval)
			ThemeBackgroundStoreModule.setThemeBackground(nil)
		end
	end, { ThemeBackgroundStoreModule, Image, BaseColor })
	local UseResult = ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: ThemeBackgroundStoreModule (copy)
		if Frame then
			ThemeBackgroundStoreModule.setGeometry({
				position = Frame.AbsolutePosition,
				size = Frame.AbsoluteSize
			})
		end
	end, { ThemeBackgroundStoreModule })
	local Overscan = p1.overscan or 0
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		ThemeBackground = if Image then ReactModule.createElement(ThemeBackgroundFillModule, {
			image = Image,
			baseColor = BaseColor,
			onPageChanged = UseResult,
			Position = UDim2.fromOffset(-Overscan, -Overscan),
			Size = UDim2.new(1, Overscan * 2, 1, Overscan * 2)
		}) else nil,
		Content = ReactModule.createElement(ReactModule.Fragment, nil, p1.children)
	})
end