local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local ConstantsModule = require(script.Parent.Parent.Constants)
local MainWindowHeader = ConstantsModule.Font.MainWindowHeader
local MainWindowHeader1 = ConstantsModule.DefaultFontSize.MainWindowHeader
local Text = ConstantsModule.Color.Text
local UnselectedGray = ConstantsModule.Color.UnselectedGray
local InactiveBox = ConstantsModule.Color.InactiveBox

return function(p1)
	-- upvalues: ReactModule (copy), RoactModule (copy), MainWindowHeader1 (copy), Text (copy), MainWindowHeader (copy), UnselectedGray (copy), InactiveBox (copy)
	local _ = p1.onClicked
	local IsNotBoolean = typeof(p1.enabled) ~= "boolean" or p1.enabled
	
	return RoactModule.createElement("TextButton", {
		Text = p1.text,
		TextSize = MainWindowHeader1,
		TextColor3 = Text,
		Font = MainWindowHeader,
		Size = p1.size,
		Position = p1.pos,
		AutoButtonColor = IsNotBoolean,
		BackgroundColor3 = if IsNotBoolean then UnselectedGray else InactiveBox,
		Active = IsNotBoolean,
		BackgroundTransparency = 0,
		[RoactModule.Event.Activated] = ReactModule.useCallback(function()
			-- upvalues: p1 (copy)
			p1.onClicked(p1.text)
		end, { p1.onClicked, p1.text })
	})
end