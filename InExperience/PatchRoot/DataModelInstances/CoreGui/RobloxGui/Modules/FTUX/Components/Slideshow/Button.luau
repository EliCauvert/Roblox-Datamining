local corePackagesService = game:GetService("CorePackages")
local reactModule = require(corePackagesService.Packages.React)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local button = UIBloxModule.App.Button.Button
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local useStyle = UIBloxModule.Core.Style.useStyle
local parent = script.Parent.Parent.Parent
local FTUXSlideshowDataModule = require(parent.Resources.FTUXSlideshowData)
local withLocalization = require(corePackagesService.Workspace.Packages.Localization).withLocalization
local _ = require(parent.Enums.PlatformEnum)
local buttonEnumModule = require(parent.Enums.ButtonEnum)

return function(p0)
	-- upvalues: useStyle (ref), FTUXSlideshowDataModule (ref), withLocalization (ref), buttonType (ref), buttonEnumModule (ref), reactModule (ref), button (ref)
	local font = useStyle().Font
	local increaseCurrentIndex = p0.increaseCurrentIndex
	local button_1 = FTUXSlideshowDataModule[p0.platform][p0.currentIndex].button
	
	return withLocalization({
		skip = "CoreScripts.VRFTUX.Action.Skip",
		next = "CoreScripts.VRFTUX.Action.Next"
	})(function(p1)
		-- upvalues: buttonType (copy), button_1 (ref), buttonEnumModule (copy), reactModule (copy), button (copy), font (ref), increaseCurrentIndex (ref)
		local secondary = buttonType.Secondary
		local skip = p1.skip
		
		if button_1 == buttonEnumModule.NextButton then
			secondary = buttonType.PrimaryContextual
			skip = p1.next
		end
		return reactModule.createElement(button, {
			layoutOrder = 4,
			buttonType = secondary,
			text = skip,
			fontStyle = font.Body,
			size = UDim2.new(1, 0, 0.6, 0),
			onActivated = increaseCurrentIndex
		})
	end)
end