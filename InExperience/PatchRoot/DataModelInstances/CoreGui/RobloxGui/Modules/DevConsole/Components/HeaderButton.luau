local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ConstantsModule = require(script.Parent.Parent.Constants)
local MainWindowHeader = ConstantsModule.Font.MainWindowHeader
local MainWindowHeader1 = ConstantsModule.DefaultFontSize.MainWindowHeader
local Text = ConstantsModule.Color.Text

return function(p1) --[[ Line: 18 | Named "HeaderButton" ]]
	-- upvalues: RoactModule (copy), MainWindowHeader1 (copy), Text (copy), MainWindowHeader (copy)
	local Text1 = p1.text
	local SortfunctionFunction = p1.sortfunction
	
	return RoactModule.createElement("TextButton", {
		Text = Text1,
		TextSize = MainWindowHeader1,
		TextColor3 = Text,
		Font = MainWindowHeader,
		TextXAlignment = Enum.TextXAlignment.Left,
		Size = p1.size,
		Position = p1.pos,
		BackgroundTransparency = 1,
		[RoactModule.Event.Activated] = function() --[[ Line: 35 ]]
			-- upvalues: SortfunctionFunction (copy), Text1 (copy)
			if SortfunctionFunction then
				SortfunctionFunction(Text1)
			end
		end
	})
end