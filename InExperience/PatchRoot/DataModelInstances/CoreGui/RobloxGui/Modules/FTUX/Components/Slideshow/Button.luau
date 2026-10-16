local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local Parent = script.Parent.Parent.Parent
local FTUXSlideshowDataModule = require(Parent.Resources.FTUXSlideshowData)
local WithLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).withLocalization
local _ = require(Parent.Enums.PlatformEnum)
local ButtonEnumModule = require(Parent.Enums.ButtonEnum)

return function(p1) --[[ Line: 23 | Named "SlideshowButton" ]]
	-- upvalues: UseStyleFunction (copy), FTUXSlideshowDataModule (copy), WithLocalizationFunction (copy), ButtonType (copy), ButtonEnumModule (copy), ReactModule (copy), Button (copy)
	local _Font = UseStyleFunction().Font
	local IncreaseCurrentIndex = p1.increaseCurrentIndex
	local Button1 = FTUXSlideshowDataModule[p1.platform][p1.currentIndex].button
	
	return WithLocalizationFunction({
		skip = "CoreScripts.VRFTUX.Action.Skip",
		next = "CoreScripts.VRFTUX.Action.Next"
	})(function(p2) --[[ Line: 36 ]]
		-- upvalues: ButtonType (upval), Button1 (copy), ButtonEnumModule (upval), ReactModule (upval), Button (upval), _Font (copy), IncreaseCurrentIndex (copy)
		local Secondary = ButtonType.Secondary
		local Skip = p2.skip
		
		if Button1 == ButtonEnumModule.NextButton then
			Secondary = ButtonType.PrimaryContextual
			Skip = p2.next
		end
		return ReactModule.createElement(Button, {
			layoutOrder = 4,
			buttonType = Secondary,
			text = Skip,
			fontStyle = _Font.Body,
			size = UDim2.new(1, 0, 0.6, 0),
			onActivated = IncreaseCurrentIndex
		})
	end)
end