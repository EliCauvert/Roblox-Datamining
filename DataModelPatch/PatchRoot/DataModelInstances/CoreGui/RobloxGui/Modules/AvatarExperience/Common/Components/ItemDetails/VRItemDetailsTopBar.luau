local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local IconButton = UIBloxModule.App.Button.IconButton
local ReactModule = require(CorePackages.Packages.React)
local HeaderBar = UIBloxModule.App.Bar.HeaderBar
local IconsNavigationPushBack = UIBloxModule.App.ImageSet.Images["icons/navigation/pushBack"]

local function v6(p1)
	-- upvalues: ReactModule (copy), IconButton (copy), IconsNavigationPushBack (copy)
	return ReactModule.createElement(IconButton, {
		anchorPoint = Vector2.new(0, 0),
		icon = IconsNavigationPushBack,
		onActivated = function()
			-- upvalues: p1 (copy)
			p1.closeFocusedScreen(p1.navigation)
		end
	})
end

return function(p1)
	-- upvalues: ReactModule (copy), HeaderBar (copy), v6 (copy)
	return ReactModule.createElement(HeaderBar, {
		backgroundTransparency = 1,
		barHeight = p1.topBarHeight,
		renderLeft = function()
			-- upvalues: ReactModule (upval), v6 (upval), p1 (copy)
			return ReactModule.createElement(v6, {
				navigation = p1.navigation,
				closeFocusedScreen = p1.closeFocusedScreen
			})
		end,
		title = p1.title
	})
end