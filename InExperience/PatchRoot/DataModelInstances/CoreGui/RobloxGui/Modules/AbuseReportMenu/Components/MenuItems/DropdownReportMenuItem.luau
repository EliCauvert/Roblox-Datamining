local abuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local corePackagesService = game:GetService("CorePackages")
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local reactModule = require(corePackagesService.Packages.React)
local appFonts = require(corePackagesService.Workspace.Packages.Style).AppFonts
local dropdownMenu = UIBloxModule.App.Menu.DropdownMenu
local reportMenuItemModule = require(abuseReportMenu.Components.MenuItems.ReportMenuItem)
local useStyle = UIBloxModule.Core.Style.useStyle
local getMenuItemSizingsModule = require(abuseReportMenu.Utility.getMenuItemSizings)
local fFlagHideShortcutsOnReportDropdownModule = require(abuseReportMenu.Flags.FFlagHideShortcutsOnReportDropdown)
local cryoModule = require(corePackagesService.Packages.Cryo)

return function(p1)
	-- upvalues: useStyle (ref), getMenuItemSizingsModule (ref), reactModule (ref), appFonts (ref), dropdownMenu (ref), cryoModule (ref), fFlagHideShortcutsOnReportDropdownModule (ref), reportMenuItemModule (ref)
	local theme = useStyle().Theme
	
	return reactModule.createElement(reportMenuItemModule, {
		label = p1.label,
		layoutOrder = p1.layoutOrder,
		rightComponent = if p1.readonlyValue ~= nil then reactModule.createElement(dropdownMenu, {
			errorState = false,
			showDropShadow = true,
			fixedListHeight = 180,
			placeholder = p1.placeholderText,
			onChange = p1.onSelect,
			height = UDim.new(0, 48),
			screenSize = Vector2.new(2400, 1800),
			cellDatas = cryoModule.List.map(p1.selections, function(p2)
				return { text = p2 }
			end),
			onMenuOpenChange = if fFlagHideShortcutsOnReportDropdownModule then p1.onMenuOpenChange else nil
		}) else reactModule.createElement("TextLabel", {
			TextWrapped = true,
			BackgroundTransparency = 1,
			Text = p1.readonlyValue,
			Font = appFonts.default:getMedium(),
			TextColor3 = theme.TextEmphasis.Color,
			TextTransparency = theme.TextMuted.Transparency,
			TextSize = getMenuItemSizingsModule().DropdownTextSize,
			TextXAlignment = if p1.isSmallPortraitViewport then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, p1.minHeight)
		}),
		menuContainerWidth = p1.menuContainerWidth,
		isSmallPortraitViewport = p1.isSmallPortraitViewport
	})
end