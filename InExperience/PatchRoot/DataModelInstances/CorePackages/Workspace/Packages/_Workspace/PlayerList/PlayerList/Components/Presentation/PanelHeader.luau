local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local iconButton = foundationModule.IconButton
local useLocalization = require(parent_1.Localization).Hooks.useLocalization
local fFlagPlayerListLocalizeGameTextModule = require(parent.Flags.FFlagPlayerListLocalizeGameText)

return reactModule.memo(function(p0) --[[ line: 13 | named "PanelHeader" ]]
	-- upvalues: fFlagPlayerListLocalizeGameTextModule (ref), useLocalization (ref), reactModule (ref), view (ref), text (ref), iconButton (ref), foundationModule (ref)
	return reactModule.createElement(view, {
		tag = "row flex-x-between align-y-center auto-y padding-x-large",
		Size = UDim2.new(1, 0, 0, p0.height),
		LayoutOrder = p0.layoutOrder
	}, {
		Title = reactModule.createElement(text, {
			tag = "auto-xy text-label-medium content-emphasis",
			LayoutOrder = 1,
			Text = p0.title or (if fFlagPlayerListLocalizeGameTextModule then useLocalization({ leaderboard = "InGame.PlayerList.Leaderboard" }).leaderboard else "Leaderboard")
		}),
		CloseButton = reactModule.createElement(iconButton, {
			LayoutOrder = 2,
			icon = { name = foundationModule.Enums.IconName.X },
			size = foundationModule.Enums.InputSize.XSmall,
			onActivated = p0.onClose,
			isDisabled = p0.isDisabled == true
		})
	})
end)