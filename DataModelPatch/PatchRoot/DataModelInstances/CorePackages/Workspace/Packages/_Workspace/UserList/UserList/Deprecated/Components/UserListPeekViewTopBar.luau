local Parent = script:FindFirstAncestor("UserList").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTopBarHeightFunction = require(Parent.RobloxAppHooks).useTopBarHeight
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local View = FoundationModule.View
local IconButton = FoundationModule.IconButton

return function(p1)
	-- upvalues: UseSelectorFunction (copy), UseTopBarHeightFunction (copy), ReactModule (copy), View (copy), IconButton (copy)
	return ReactModule.createElement(View, {
		tag = "bg-surface-100",
		Active = true,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(0, 0, 0, (UseTopBarHeightFunction()))
	}, {
		LeftNavigationButton = ReactModule.createElement(IconButton, {
			BackgroundTransparency = 1,
			icon = "icons/navigation/close",
			Position = UDim2.new(0, 15, 0, (UseSelectorFunction(function(p2)
				return p2.TopBar.statusBarHeight
			end))),
			onActivated = ReactModule.useCallback(function()
				-- upvalues: p1 (copy)
				p1.navigateBack()
			end, { p1.navigateBack })
		})
	})
end