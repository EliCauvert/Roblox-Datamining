local corePackagesService = game:GetService("CorePackages")
local starterPlayerService = game:GetService("StarterPlayer")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local constantsModule = require(script.Parent.Parent.Constants)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local wheelText = roactModule.PureComponent:extend("WheelText")

function wheelText.getWheelText(p0) --[[ line: 15 ]]
	-- upvalues: starterPlayerService (ref), robloxTranslatorModule (ref), constantsModule (ref)
	local currentEmotes = p0.props.emotesPage.currentEmotes
	local locale = p0.props.locale
	local numberEmotesLoaded = p0.props.emotesPage.numberEmotesLoaded
	
	if next(currentEmotes) == nil then
		return if starterPlayerService.UserEmotesEnabled and numberEmotesLoaded == 0 then robloxTranslatorModule:FormatByKeyForLocale(constantsModule.LocalizationKeys.NoEmotesEquipped, locale) else robloxTranslatorModule:FormatByKeyForLocale(constantsModule.LocalizationKeys.EmotesDisabled, locale)
	end
	local focusedSegmentIndex = currentEmotes[p0.props.emotesWheel.focusedSegmentIndex]
	
	return focusedSegmentIndex or robloxTranslatorModule:FormatByKeyForLocale(constantsModule.LocalizationKeys.SelectAnEmote, locale)
end

function wheelText.render(p1) --[[ line: 38 ]]
	-- upvalues: constantsModule (ref), roactModule (ref)
	local layout = constantsModule.Layouts[p1.props.layout]
	
	return roactModule.createElement("TextLabel", {
		BackgroundTransparency = 1,
		TextScaled = true,
		ZIndex = 5,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Size = UDim2.new(constantsModule.InnerCircleSizeRatio, -constantsModule.TextPadding, constantsModule.InnerCircleSizeRatio, -constantsModule.TextPadding),
		Position = UDim2.new(0.5, 0, 0.5, 0),
		Text = p1:getWheelText(),
		TextSize = layout.MiddleTextSize,
		TextColor3 = constantsModule.Colors.White,
		Font = layout.MiddleTextFont
	}, {
		TextSizeConstraint = roactModule.createElement("UITextSizeConstraint", { MaxTextSize = layout.MiddleTextSize })
	})
end

return roactRoduxModule.connect(function(p2) --[[ line: 65 | named "mapStateToProps" ]]
	return {
		emotesWheel = p2.emotesWheel,
		emotesPage = p2.emotesPage,
		layout = p2.layout,
		locale = p2.locale
	}
end, nil)(wheelText)