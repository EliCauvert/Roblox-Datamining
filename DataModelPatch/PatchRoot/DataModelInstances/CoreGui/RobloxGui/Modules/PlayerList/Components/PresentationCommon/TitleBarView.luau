local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local ReactModule = require(CorePackages.Packages.React)
local SignalsReactModule = require(CorePackages.Packages.SignalsReact)
local PlayerListModule = require(CorePackages.Workspace.Packages.PlayerList)
local _ = require(CorePackages.Workspace.Packages.LeaderboardStore)
local GameTranslatorModule = require(CoreGui:WaitForChild("RobloxGui").Modules.GameTranslator)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local UseLayoutValuesFunction = PlayerListModule.Common.useLayoutValues
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local FFlagPlayerListFixLeaderstatsStacking = require(CorePackages.Workspace.Packages.SharedFlags).FFlagPlayerListFixLeaderstatsStacking
local FFlagEnableMobilePlayerListOnConsole = PlayerListModule.Flags.FFlagEnableMobilePlayerListOnConsole
local config = {
	showDivider = false,
	showBackground = false,
	backgroundTransparency = 1,
	useCustomTextColor = false,
	headerPaddingLeft = 15,
	customTextColor = Color3.fromRGB(255, 255, 255)
}

return ReactModule.memo(function(List)
	-- upvalues: config (copy), UseLayoutValuesFunction (copy), UseStyleFunction (copy), ReactModule (copy), RobloxTranslatorModule (copy), FFlagEnableMobilePlayerListOnConsole (copy), FFlagPlayerListFixLeaderstatsStacking (copy), SignalsReactModule (copy), GameTranslatorModule (copy), CoreGui (copy), CorePackages (copy)
	local t = {}
	
	for i, value in pairs(config) do
		t[i] = if List[i] == nil then value else List[i] or value
	end
	for i1, value1 in pairs(List) do
		t[i1] = value1
	end
	local UseLayoutValuesResult = UseLayoutValuesFunction()
	local UseStyleResult = UseStyleFunction()
	local CustomTextColor = t.useCustomTextColor and t.customTextColor or UseStyleResult.Theme.TextMuted.Color
	local Transparency = if t.useCustomTextColor then 0 else UseStyleResult.Theme.TextMuted.Transparency
	local TextLabels = {
		layout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		playersHeader = ReactModule.createElement("TextLabel", {
			LayoutOrder = 1,
			BackgroundTransparency = 1,
			Size = UDim2.new(0, if t.isSmallTouchDevice then UseLayoutValuesResult.PlayerNameSizeXMobile else t.entrySizeX, 1, 0),
			Text = RobloxTranslatorModule:FormatByKey("InGame.PlayerList.Players"),
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			Font = UseStyleResult.Font.Footer.Font,
			TextSize = if FFlagEnableMobilePlayerListOnConsole then UseLayoutValuesResult.TitleBarTextSize else UseStyleResult.Font.BaseSize * UseStyleResult.Font.Footer.RelativeSize,
			TextTransparency = Transparency,
			TextColor3 = CustomTextColor
		}, {
			Padding = ReactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, t.headerPaddingLeft) })
		})
	}
	local MaxLeaderstats = UseLayoutValuesResult.MaxLeaderstats
	
	if FFlagPlayerListFixLeaderstatsStacking then
		for i2, value2 in SignalsReactModule.useSignalState(t.gameStats.getAllData) do
			if MaxLeaderstats >= value2.order(false) then
				TextLabels["stat_" .. i2] = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = value2.order(false) + 1,
					Size = UDim2.new(0, UseLayoutValuesResult.StatEntrySizeX, 1, 0),
					Text = GameTranslatorModule:TranslateGameText(CoreGui, i2),
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center,
					Font = UseStyleResult.Font.Footer.Font,
					TextSize = if FFlagEnableMobilePlayerListOnConsole then UseLayoutValuesResult.TitleBarTextSize else UseStyleResult.Font.BaseSize * UseStyleResult.Font.Footer.RelativeSize,
					TextTransparency = Transparency,
					TextColor3 = CustomTextColor,
					TextTruncate = Enum.TextTruncate.AtEnd
				})
			end
		end
	elseif t.gameStatsCount and t.gameStatsCount > 0 then
		t.gameStats.iterateData(function(Text, p1)
			-- upvalues: MaxLeaderstats (copy), GameTranslatorModule (upval), CoreGui (upval), TextLabels (copy), ReactModule (upval), UseLayoutValuesResult (copy), UseStyleResult (copy), FFlagEnableMobilePlayerListOnConsole (upval), Transparency (copy), CustomTextColor (copy)
			if MaxLeaderstats >= p1.order(false) then
				TextLabels["stat_" .. Text] = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = p1.order(false) + 1,
					Size = UDim2.new(0, UseLayoutValuesResult.StatEntrySizeX, 1, 0),
					Text = GameTranslatorModule:TranslateGameText(CoreGui, Text),
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center,
					Font = UseStyleResult.Font.Footer.Font,
					TextSize = if FFlagEnableMobilePlayerListOnConsole then UseLayoutValuesResult.TitleBarTextSize else UseStyleResult.Font.BaseSize * UseStyleResult.Font.Footer.RelativeSize,
					TextTransparency = Transparency,
					TextColor3 = CustomTextColor,
					TextTruncate = Enum.TextTruncate.AtEnd
				})
				
				return
			end
		end, false)
	end
	local Color = if t.showBackground then if require(CorePackages.Workspace.Packages.Chrome).Enabled() then UseStyleResult.Theme.BackgroundUIContrast.Color else UseStyleResult.Theme.BackgroundContrast.Color else Color3.fromRGB(0, 0, 0)
	local t1 = {}
	
	if t.showDivider then
		t1.Divider = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Visible = t.contentsVisible,
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundTransparency = UseStyleResult.Theme.Divider.Transparency,
			BackgroundColor3 = UseStyleResult.Theme.Divider.Color
		})
	end
	t1.ChildrenFrame = ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Visible = t.contentsVisible,
		Position = t.showBackground and UDim2.new(0, 0, 0, -2) or UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0)
	}, TextLabels)
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = t.size,
		LayoutOrder = t.layoutOrder,
		BackgroundTransparency = t.backgroundTransparency,
		BackgroundColor3 = Color
	}, t1)
end)