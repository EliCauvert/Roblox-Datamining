local CorePackages = game:GetService("CorePackages")
local LocalizationService = game:GetService("LocalizationService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local AppDropdownMenuModule = require(Modules.LuaApp.Components.Common.AppDropdownMenu)
local DateHelper = require(CorePackages.Workspace.Packages.Time).DateHelper
local TimeUnit = require(CorePackages.Workspace.Packages.Time).TimeUnit
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local DateTypeOrder = DateHelper.DateTypeOrder
local config = {
	[Enum.HorizontalAlignment.Left] = Vector2.new(0, 0),
	[Enum.HorizontalAlignment.Center] = Vector2.new(0.5, 0),
	[Enum.HorizontalAlignment.Right] = Vector2.new(1, 0)
}
local config1 = {
	[Enum.HorizontalAlignment.Left] = UDim2.fromScale(0, 0),
	[Enum.HorizontalAlignment.Center] = UDim2.fromScale(0.5, 0),
	[Enum.HorizontalAlignment.Right] = UDim2.fromScale(1, 0)
}

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseLocalizationModule (copy), UseSelectorFunction (copy), ReactModule (copy), TimeUnit (copy), DateHelper (copy), LocalizationService (copy), DateTypeOrder (copy), config (copy), config1 (copy), AppDropdownMenuModule (copy)
	local UseStyleResult = UseStyleFunction()
	local UseLocalizationModuleResult = UseLocalizationModule({
		yearText = "CommonUI.Controls.Label.Year",
		monthText = "CommonUI.Controls.Label.Month",
		dayText = "CommonUI.Controls.Label.Day",
		titleText = p1.titleKey,
		subTitleText = p1.subTitleKey,
		errorText = p1.errorTextKey
	})
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.ScreenSize or Vector2.new(1920, 1080)
	end)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(0)
	local DateTypeOrderEntry = DateTypeOrder[LocalizationService.RobloxLocaleId]
	local DesignTokens = if p1.designTokens then p1.designTokens else {
		dropdownHeight = 72,
		dropdownHorizontalPadding = 36,
		dropdownVerticalPadding = 24,
		dateDropdownWidth = 156,
		textCaptionHeaderSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionHeader.RelativeSize,
		textBodySize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Body.RelativeSize
	}
	local Alignment = p1.alignment or Enum.HorizontalAlignment.Left
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = p1.size,
		AnchorPoint = config[Alignment],
		Position = config1[Alignment],
		LayoutOrder = p1.layoutOrder
	}, {
		ListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, DesignTokens.dropdownVerticalPadding)
		}),
		Title = if p1.titleKey then ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			TextWrapped = true,
			Font = UseStyleResult.Font.CaptionHeader.Font,
			Size = UDim2.fromScale(1, 0),
			Text = UseLocalizationModuleResult.titleText,
			TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
			TextSize = DesignTokens.textCaptionHeaderSize,
			TextTransparency = UseStyleResult.Theme.TextEmphasis.Transparency,
			TextXAlignment = Enum.TextXAlignment.Left,
			AutomaticSize = Enum.AutomaticSize.XY
		}) else nil,
		BirthdayPicker = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 2,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 0, DesignTokens.dropdownHeight)
		}, {
			ListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = if p1.horizontalInnerPadding then p1.horizontalInnerPadding else UDim.new(0, DesignTokens.dropdownHorizontalPadding)
			}),
			YearPicker = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				Size = UDim2.new(0.25, 0, 0, DesignTokens.dropdownHeight),
				LayoutOrder = DateTypeOrderEntry[TimeUnit.Years]
			}, {
				YearDropdownMenu = ReactModule.createElement(AppDropdownMenuModule, {
					showDropShadow = true,
					analyticsContext = "YearDropdownMenu",
					selectionGroupName = "YearDropdownMenu",
					height = UDim.new(0, DesignTokens.dropdownHeight),
					placeholder = UseLocalizationModuleResult.yearText,
					screenSize = UseSelectorResult,
					fixedListHeight = p1.fixedListHeight,
					onChange = ReactModule.useCallback(function(p2)
						-- upvalues: UseStateResult2 (copy), p1 (copy), TimeUnit (upval), UseStateResult1 (copy), UseStateResult3 (copy)
						local Number: number? = tonumber(p2)
						
						if Number then
							UseStateResult2(Number)
						end
						p1.onDateSelected({
							[TimeUnit.Years] = Number,
							[TimeUnit.Months] = UseStateResult1,
							[TimeUnit.Days] = UseStateResult3
						})
					end, { p1.onDateSelected, UseStateResult1, UseStateResult3 }),
					cellDatas = ReactModule.useMemo(function()
						-- upvalues: DateHelper (upval), p1 (copy), TimeUnit (upval)
						local CurrentDate = DateHelper:getCurrentDate()
						local List = {}
						local MaxYear = p1.maxYear or CurrentDate[TimeUnit.Years]
						local MinYear = p1.minYear or MaxYear - 100
						for i = MaxYear, MinYear, -1 do
							table.insert(List, { key = tostring(i), text = tostring(i) })
						end
						return List
					end, { p1.minYear, p1.maxYear })
				})
			}),
			MonthPicker = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				Size = UDim2.new(0.25, 0, 0, DesignTokens.dropdownHeight),
				LayoutOrder = DateTypeOrderEntry[TimeUnit.Months]
			}, {
				MonthDropdownMenu = ReactModule.createElement(AppDropdownMenuModule, {
					showDropShadow = true,
					analyticsContext = "MonthDropdownMenu",
					selectionGroupName = "MonthDropdownMenu",
					height = UDim.new(0, DesignTokens.dropdownHeight),
					placeholder = UseLocalizationModuleResult.monthText,
					screenSize = UseSelectorResult,
					fixedListHeight = p1.fixedListHeight,
					onChange = ReactModule.useCallback(function(p2)
						-- upvalues: UseStateResult2_1 (copy), p1 (copy), TimeUnit (upval), UseStateResult (copy), UseStateResult3 (copy)
						local Number: number? = tonumber(p2)
						
						if Number then
							UseStateResult2_1(Number)
						end
						p1.onDateSelected({
							[TimeUnit.Years] = UseStateResult,
							[TimeUnit.Months] = Number,
							[TimeUnit.Days] = UseStateResult3
						})
					end, { p1.onDateSelected, UseStateResult, UseStateResult3 }),
					cellDatas = ReactModule.useMemo(function()
						local List = {}
						
						for i = 1, 12 do
							table.insert(List, { key = tostring(i), text = tostring(i) })
						end
						return List
					end)
				})
			}),
			DayPicker = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 2,
				Size = UDim2.new(0.25, 0, 0, DesignTokens.dropdownHeight),
				LayoutOrder = DateTypeOrderEntry[TimeUnit.Days]
			}, {
				DayDropdownMenu = ReactModule.createElement(AppDropdownMenuModule, {
					showDropShadow = true,
					analyticsContext = "DayDropdownMenu",
					selectionGroupName = "DayDropdownMenu",
					height = UDim.new(0, DesignTokens.dropdownHeight),
					placeholder = UseLocalizationModuleResult.dayText,
					screenSize = UseSelectorResult,
					fixedListHeight = p1.fixedListHeight,
					onChange = ReactModule.useCallback(function(p2)
						-- upvalues: UseStateResult2_2 (copy), p1 (copy), TimeUnit (upval), UseStateResult (copy), UseStateResult1 (copy)
						local Number: number? = tonumber(p2)
						
						if Number then
							UseStateResult2_2(Number)
						end
						p1.onDateSelected({
							[TimeUnit.Years] = UseStateResult,
							[TimeUnit.Months] = UseStateResult1,
							[TimeUnit.Days] = Number
						})
					end, { p1.onDateSelected, UseStateResult, UseStateResult1 }),
					cellDatas = ReactModule.useMemo(function()
						local List = {}
						
						for i = 1, 31 do
							table.insert(List, { key = tostring(i), text = tostring(i) })
						end
						return List
					end)
				})
			})
		}),
		OptionalTitle = if p1.subTitleKey then ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 3,
			TextWrapped = true,
			Font = UseStyleResult.Font.CaptionHeader.Font,
			Size = UDim2.fromScale(1, 0),
			Text = UseLocalizationModuleResult.subTitleText,
			TextColor3 = UseStyleResult.Theme.TextDefault.Color,
			TextSize = DesignTokens.textBodySize,
			TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
			TextXAlignment = Enum.TextXAlignment.Left,
			AutomaticSize = Enum.AutomaticSize.XY
		}) else nil,
		ErrorTitle = if p1.errorTextKey then ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 4,
			TextWrapped = true,
			Font = UseStyleResult.Font.CaptionHeader.Font,
			Size = UDim2.fromScale(1, 0),
			Text = UseLocalizationModuleResult.errorText,
			TextColor3 = UseStyleResult.Theme.Alert.Color,
			TextSize = DesignTokens.textBodySize,
			TextTransparency = UseStyleResult.Theme.Alert.Transparency,
			TextXAlignment = Enum.TextXAlignment.Left,
			AutomaticSize = Enum.AutomaticSize.XY
		}) else nil
	})
end