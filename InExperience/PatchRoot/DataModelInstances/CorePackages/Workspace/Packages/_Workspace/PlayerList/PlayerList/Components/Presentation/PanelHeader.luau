local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local IconButton = FoundationModule.IconButton
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local FFlagPlayerListLocalizeGameTextModule = require(Parent.Flags.FFlagPlayerListLocalizeGameText)

return ReactModule.memo(function(p1)
	-- upvalues: FFlagPlayerListLocalizeGameTextModule (copy), UseLocalizationFunction (copy), ReactModule (copy), View (copy), Text (copy), IconButton (copy), FoundationModule (copy)
	local Leaderboard = if FFlagPlayerListLocalizeGameTextModule then UseLocalizationFunction({ leaderboard = "InGame.PlayerList.Leaderboard" }).leaderboard else "Leaderboard"
	
	return ReactModule.createElement(View, {
		tag = "row flex-x-between align-y-center auto-y padding-x-large",
		Size = UDim2.new(1, 0, 0, p1.height),
		LayoutOrder = p1.layoutOrder
	}, {
		Title = ReactModule.createElement(Text, {
			tag = "auto-xy text-label-medium content-emphasis",
			LayoutOrder = 1,
			Text = p1.title or Leaderboard
		}),
		CloseButton = ReactModule.createElement(IconButton, {
			LayoutOrder = 2,
			icon = { name = FoundationModule.Enums.IconName.X },
			size = FoundationModule.Enums.InputSize.XSmall,
			onActivated = p1.onClose,
			isDisabled = p1.isDisabled == true
		})
	})
end)