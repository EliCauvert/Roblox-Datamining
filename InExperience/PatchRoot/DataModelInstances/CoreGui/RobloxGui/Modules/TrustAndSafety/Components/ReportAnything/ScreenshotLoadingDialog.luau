local corePackagesService = game:GetService("CorePackages")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local reactModule = require(corePackagesService.Packages.React)
local buttonStack = UIBloxModule.App.Button.ButtonStack
local buttonType = UIBloxModule.App.Button.Enum.ButtonType

return function(p0) --[[ line: 11 | named "ScreenshotLoadingDialog" ]]
	-- upvalues: reactModule (ref), buttonStack (ref), buttonType (ref)
	return reactModule.createElement("Frame", { BackgroundTransparency = 0, Size = UDim2.new(1, 0, 1, 0) }, {
		Buttons = reactModule.createElement(buttonStack, {
			buttons = {
				{
					buttonType = buttonType.PrimarySystem,
					props = {
						text = "This is page 1. Click to go next",
						onActivated = function() --[[ line: 21 ]]
							-- upvalues: p0 (ref)
							p0.onNextPage()
						end
					}
				}
			}
		})
	})
end