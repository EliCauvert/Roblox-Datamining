return require(game:GetService("CorePackages").Packages.Rodux).makeActionCreator("SET_MENU_ICON_TOOLTIP_OPEN", function(MenuIconTooltipOpen)
	return { menuIconTooltipOpen = MenuIconTooltipOpen }
end)