local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local reactModule = require(corePackagesService.Packages.React)
local signalsReactModule = require(corePackagesService.Packages.SignalsReact)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local playerListModule = require(corePackagesService.Workspace.Packages.PlayerList)
local _ = require(corePackagesService.Workspace.Packages.LeaderboardStore)
local gameTranslatorModule = require(robloxGui.Modules.GameTranslator)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local useLayoutValues = playerListModule.Common.useLayoutValues
local useStyle = UIBloxModule.Core.Style.useStyle
local fFlagPlayerListFixLeaderstatsStacking = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagPlayerListFixLeaderstatsStacking
local fFlagEnableMobilePlayerListOnConsole = playerListModule.Flags.FFlagEnableMobilePlayerListOnConsole
local t = {
	showDivider = false,
	showBackground = false,
	backgroundTransparency = 1,
	useCustomTextColor = false,
	headerPaddingLeft = 15,
	customTextColor = Color3.fromRGB(255, 255, 255)
}

return reactModule.memo(function(p1)
	-- upvalues: t (ref), useLayoutValues (ref), useStyle (ref), reactModule (ref), robloxTranslatorModule (ref), fFlagEnableMobilePlayerListOnConsole (ref), fFlagPlayerListFixLeaderstatsStacking (ref), signalsReactModule (ref), gameTranslatorModule (ref), coreGuiService (ref), corePackagesService (ref)
	local t_1 = {}
	
	for i, v in pairs(t) do
		t_1[i] = if p1[i] ~= nil then p1[i] else v
	end
	for i_1, v_1 in pairs(p1) do
		t_1[i_1] = v_1
	end
	local var1 = useLayoutValues()
	local var2 = useStyle()
	local t_2 = {
		layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center
		})
	}
	local var3 = if t_1.isSmallTouchDevice then var1.PlayerNameSizeXMobile else t_1.entrySizeX
	local var4 = if t_1.useCustomTextColor then t_1.customTextColor else var2.Theme.TextMuted.Color
	local var5 = if t_1.useCustomTextColor then 0 else var2.Theme.TextMuted.Transparency
	t_2.playersHeader = reactModule.createElement("TextLabel", {
		LayoutOrder = 1,
		BackgroundTransparency = 1,
		Size = UDim2.new(0, var3, 1, 0),
		Text = robloxTranslatorModule:FormatByKey("InGame.PlayerList.Players"),
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Center,
		Font = var2.Font.Footer.Font,
		TextSize = if fFlagEnableMobilePlayerListOnConsole then var1.TitleBarTextSize else var2.Font.BaseSize * var2.Font.Footer.RelativeSize,
		TextTransparency = var5,
		TextColor3 = var4
	}, {
		Padding = reactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, t_1.headerPaddingLeft) })
	})
	local maxLeaderstats = var1.MaxLeaderstats
	
	if fFlagPlayerListFixLeaderstatsStacking then
		for i_2, v_2 in signalsReactModule.useSignalState(t_1.gameStats.getAllData) do
			if maxLeaderstats >= v_2.order(false) then
				t_2["stat_" .. i_2] = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = v_2.order(false) + 1,
					Size = UDim2.new(0, var1.StatEntrySizeX, 1, 0),
					Text = gameTranslatorModule:TranslateGameText(coreGuiService, i_2),
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center,
					Font = var2.Font.Footer.Font,
					TextSize = if fFlagEnableMobilePlayerListOnConsole then var1.TitleBarTextSize else var2.Font.BaseSize * var2.Font.Footer.RelativeSize,
					TextTransparency = var5,
					TextColor3 = var4,
					TextTruncate = Enum.TextTruncate.AtEnd
				})
			end
		end
	elseif t_1.gameStatsCount and t_1.gameStatsCount > 0 then
		t_1.gameStats.iterateData(function(p2, p3)
			-- upvalues: maxLeaderstats (ref), gameTranslatorModule (copy), coreGuiService (copy), t_2 (ref), reactModule (copy), var1 (ref), var2 (ref), fFlagEnableMobilePlayerListOnConsole (copy), var5 (ref), var4 (ref)
			if maxLeaderstats < p3.order(false) then
				return
			end
			t_2["stat_" .. p1] = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = p3.order(false) + 1,
				Size = UDim2.new(0, var1.StatEntrySizeX, 1, 0),
				Text = gameTranslatorModule:TranslateGameText(coreGuiService, p2),
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Font = var2.Font.Footer.Font,
				TextSize = if fFlagEnableMobilePlayerListOnConsole then var1.TitleBarTextSize else var2.Font.BaseSize * var2.Font.Footer.RelativeSize,
				TextTransparency = var5,
				TextColor3 = var4,
				TextTruncate = Enum.TextTruncate.AtEnd
			})
		end, false)
	end
	local var6 = if t_1.showBackground then if require(corePackagesService.Workspace.Packages.Chrome).Enabled() then var2.Theme.BackgroundUIContrast.Color else var2.Theme.BackgroundContrast.Color else Color3.fromRGB(0, 0, 0)
	local t_3 = {}
	
	if t_1.showDivider then
		t_3.Divider = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Visible = t_1.contentsVisible,
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundTransparency = var2.Theme.Divider.Transparency,
			BackgroundColor3 = var2.Theme.Divider.Color
		})
	end
	t_3.ChildrenFrame = reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Visible = t_1.contentsVisible,
		Position = t_1.showBackground and UDim2.new(0, 0, 0, -2) or UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(1, 0, 1, 0)
	}, t_2)
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = t_1.size,
		LayoutOrder = t_1.layoutOrder,
		BackgroundTransparency = t_1.backgroundTransparency,
		BackgroundColor3 = var6
	}, t_3)
end)