local AbuseReportMenu = script:FindFirstAncestor("AbuseReportMenu")
local CorePackages = game:GetService("CorePackages")
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ReactModule = require(CorePackages.Packages.React)
local AppFonts = require(CorePackages.Workspace.Packages.Style).AppFonts
local DropdownMenu = UIBloxModule.App.Menu.DropdownMenu
local ReportMenuItemModule = require(AbuseReportMenu.Components.MenuItems.ReportMenuItem)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local GetMenuItemSizingsModule = require(AbuseReportMenu.Utility.getMenuItemSizings)
local FFlagHideShortcutsOnReportDropdownModule = require(AbuseReportMenu.Flags.FFlagHideShortcutsOnReportDropdown)
local CryoModule = require(CorePackages.Packages.Cryo)

return function(p1) --[[ Line: 29 | Named "DropdownReportMenuItem" ]]
	-- upvalues: UseStyleFunction (copy), GetMenuItemSizingsModule (copy), ReactModule (copy), AppFonts (copy), DropdownMenu (copy), CryoModule (copy), FFlagHideShortcutsOnReportDropdownModule (copy), ReportMenuItemModule (copy)
	local Theme = UseStyleFunction().Theme
	local MenuItemSizingsModule = GetMenuItemSizingsModule()
	
	return ReactModule.createElement(ReportMenuItemModule, {
		label = p1.label,
		layoutOrder = p1.layoutOrder,
		rightComponent = if p1.readonlyValue == nil then ReactModule.createElement(DropdownMenu, {
			errorState = false,
			showDropShadow = true,
			fixedListHeight = 180,
			placeholder = p1.placeholderText,
			onChange = p1.onSelect,
			height = UDim.new(0, 48),
			screenSize = Vector2.new(2400, 1800),
			cellDatas = CryoModule.List.map(p1.selections, function(Text) --[[ Line: 58 ]]
				return { text = Text }
			end),
			onMenuOpenChange = if FFlagHideShortcutsOnReportDropdownModule then p1.onMenuOpenChange else nil
		}) else ReactModule.createElement("TextLabel", {
			TextWrapped = true,
			BackgroundTransparency = 1,
			Text = p1.readonlyValue,
			Font = AppFonts.default:getMedium(),
			TextColor3 = Theme.TextEmphasis.Color,
			TextTransparency = Theme.TextMuted.Transparency,
			TextSize = MenuItemSizingsModule.DropdownTextSize,
			TextXAlignment = if p1.isSmallPortraitViewport then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, p1.minHeight)
		}),
		menuContainerWidth = p1.menuContainerWidth,
		isSmallPortraitViewport = p1.isSmallPortraitViewport
	})
end