local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ReactModule = require(CorePackages.Packages.React)
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType

return function(p1)
	-- upvalues: ReactModule (copy), ButtonStack (copy), ButtonType (copy)
	return ReactModule.createElement("Frame", { BackgroundTransparency = 0, Size = UDim2.new(1, 0, 1, 0) }, {
		Buttons = ReactModule.createElement(ButtonStack, {
			buttons = {
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						text = "This is page 1. Click to go next",
						onActivated = function()
							-- upvalues: p1 (copy)
							p1.onNextPage()
						end
					}
				}
			}
		})
	})
end