local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local roactModule = require(corePackagesService.Packages.Roact)
local constantsModule = require(script.Parent.Parent.Constants)
local mainWindowHeader = constantsModule.Font.MainWindowHeader
local mainWindowHeader_1 = constantsModule.DefaultFontSize.MainWindowHeader
local text = constantsModule.Color.Text
local unselectedGray = constantsModule.Color.UnselectedGray
local inactiveBox = constantsModule.Color.InactiveBox

return function(p0)
	-- upvalues: reactModule (ref), roactModule (ref), mainWindowHeader_1 (ref), text (ref), mainWindowHeader (ref), unselectedGray (ref), inactiveBox (ref)
	local text_1 = p0.text
	local size = p0.size
	local pos = p0.pos
	local _ = p0.onClicked
	local var4 = if typeof(p0.enabled) == "boolean" then p0.enabled else true
	
	return roactModule.createElement("TextButton", {
		Text = text_1,
		TextSize = mainWindowHeader_1,
		TextColor3 = text,
		Font = mainWindowHeader,
		Size = size,
		Position = pos,
		AutoButtonColor = var4,
		BackgroundColor3 = if var4 then unselectedGray else inactiveBox,
		Active = var4,
		BackgroundTransparency = 0,
		[roactModule.Event.Activated] = reactModule.useCallback(function()
			-- upvalues: p0 (ref)
			p0.onClicked(p0.text)
		end, { p0.onClicked, p0.text })
	})
end