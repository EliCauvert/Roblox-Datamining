local Parent = script:FindFirstAncestor("SocialCommon").Parent
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local UseThemeBackgroundFunction = require(Parent.ThemeBackground).useThemeBackground
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector

return function()
	-- upvalues: UseStyleFunction (copy), UseThemeBackgroundFunction (copy), UseSelectorFunction (copy), ReactModule (copy)
	local UseStyleResult = UseStyleFunction()
	local HasUseThemeBackgroundResult = UseThemeBackgroundFunction() ~= nil
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		ZIndex = 3,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
		BackgroundTransparency = if HasUseThemeBackgroundResult then 1 else UseStyleResult.Theme.BackgroundDefault.Transparency,
		Position = UDim2.new(0, 0, 1, 0),
		Size = UDim2.new(1, 0, 0, (UseSelectorFunction(function(p1)
			return if p1.GlobalGuiInset then p1.GlobalGuiInset.bottom else 0
		end)))
	})
end