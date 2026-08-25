local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local constantsModule = require(script.Parent.Parent.Constants)
local mainWindowHeader = constantsModule.Font.MainWindowHeader
local mainWindowHeader_1 = constantsModule.DefaultFontSize.MainWindowHeader
local text = constantsModule.Color.Text

return function(p0)
	-- upvalues: roactModule (ref), mainWindowHeader_1 (ref), text (ref), mainWindowHeader (ref)
	local text_1 = p0.text
	local sortfunction = p0.sortfunction
	
	return roactModule.createElement("TextButton", {
		Text = text_1,
		TextSize = mainWindowHeader_1,
		TextColor3 = text,
		Font = mainWindowHeader,
		TextXAlignment = Enum.TextXAlignment.Left,
		Size = p0.size,
		Position = p0.pos,
		BackgroundTransparency = 1,
		[roactModule.Event.Activated] = function()
			-- upvalues: sortfunction (ref), text_1 (ref)
			if sortfunction then
				sortfunction(text_1)
			end
		end
	})
end