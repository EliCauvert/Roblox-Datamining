local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local roactModule = require(corePackagesService.Packages.Roact)
local constantsModule = require(script.Parent.Parent.Constants)
local mainWindowHeader = constantsModule.Font.MainWindowHeader
local mainWindowHeader_1 = constantsModule.DefaultFontSize.MainWindowHeader
local text = constantsModule.Color.Text
local unselectedGray = constantsModule.Color.UnselectedGray
local inactiveBox = constantsModule.Color.InactiveBox

return function(p1)
	-- upvalues: reactModule (ref), roactModule (ref), mainWindowHeader_1 (ref), text (ref), mainWindowHeader (ref), unselectedGray (ref), inactiveBox (ref)
	local text_1 = p1.text
	local size = p1.size
	local pos = p1.pos
	local _ = p1.onClicked
	local var1 = if typeof(p1.enabled) == "boolean" then p1.enabled else true
	
	return roactModule.createElement("TextButton", {
		Text = text_1,
		TextSize = mainWindowHeader_1,
		TextColor3 = text,
		Font = mainWindowHeader,
		Size = size,
		Position = pos,
		AutoButtonColor = var1,
		BackgroundColor3 = if var1 then unselectedGray else inactiveBox,
		Active = var1,
		BackgroundTransparency = 0,
		[roactModule.Event.Activated] = reactModule.useCallback(function()
			-- upvalues: p1 (ref)
			p1.onClicked(p1.text)
		end, { p1.onClicked, p1.text })
	})
end