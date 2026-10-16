local CorePackages = game:GetService("CorePackages")
local StarterPlayer = game:GetService("StarterPlayer")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Parent = script.Parent.Parent
local ConstantsModule = require(Parent.Constants)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local FFlagFixEmotesMenuAvailabilityModule = require(Parent.Flags.FFlagFixEmotesMenuAvailability)
local WheelText = RoactModule.PureComponent:extend("WheelText")

function WheelText.getWheelText(p1) --[[ Line: 16 ]]
	-- upvalues: StarterPlayer (copy), FFlagFixEmotesMenuAvailabilityModule (copy), RobloxTranslatorModule (copy), ConstantsModule (copy)
	local CurrentEmotes = p1.props.emotesPage.currentEmotes
	local Locale = p1.props.locale
	local NumberEmotesLoaded = p1.props.emotesPage.numberEmotesLoaded
	
	if next(CurrentEmotes) == nil then
		return if StarterPlayer.UserEmotesEnabled and (FFlagFixEmotesMenuAvailabilityModule or NumberEmotesLoaded == 0) then RobloxTranslatorModule:FormatByKeyForLocale(ConstantsModule.LocalizationKeys.NoEmotesEquipped, Locale) else RobloxTranslatorModule:FormatByKeyForLocale(ConstantsModule.LocalizationKeys.EmotesDisabled, Locale)
	else
		local CurrentEmote = CurrentEmotes[p1.props.emotesWheel.focusedSegmentIndex]
		
		return if CurrentEmote then CurrentEmote else RobloxTranslatorModule:FormatByKeyForLocale(ConstantsModule.LocalizationKeys.SelectAnEmote, Locale)
	end
end

function WheelText.render(p1) --[[ Line: 39 ]]
	-- upvalues: ConstantsModule (copy), RoactModule (copy)
	local Layout = ConstantsModule.Layouts[p1.props.layout]
	
	return RoactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		TextScaled = true,
		ZIndex = 5,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(ConstantsModule.InnerCircleSizeRatio, -ConstantsModule.TextPadding, ConstantsModule.InnerCircleSizeRatio, -ConstantsModule.TextPadding),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Text = p1:getWheelText(),
		TextSize = Layout.MiddleTextSize,
		TextColor3 = ConstantsModule.Colors.White,
		Font = Layout.MiddleTextFont
	}, {
		TextSizeConstraint = RoactModule.createElement("UITextSizeConstraint", { MaxTextSize = Layout.MiddleTextSize })
	})
end

return RoactRoduxModule.connect(function(p1) --[[ Line: 66 | Named "mapStateToProps" ]]
	return {
		emotesWheel = p1.emotesWheel,
		emotesPage = p1.emotesPage,
		layout = p1.layout,
		locale = p1.locale
	}
end, nil)(WheelText)