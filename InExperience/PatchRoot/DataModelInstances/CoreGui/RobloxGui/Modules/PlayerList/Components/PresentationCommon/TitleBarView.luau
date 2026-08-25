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

return reactModule.memo(function(p0)
	-- upvalues: t (ref), useLayoutValues (ref), useStyle (ref), reactModule (ref), robloxTranslatorModule (ref), fFlagEnableMobilePlayerListOnConsole (ref), fFlagPlayerListFixLeaderstatsStacking (ref), signalsReactModule (ref), gameTranslatorModule (ref), coreGuiService (ref), corePackagesService (ref)
	local t_1 = {}
	
	for i, v in pairs(t) do
		t_1[i] = if p0[i] ~= nil then p0[i] else v
	end
	for i_1, v_1 in pairs(p0) do
		t_1[i_1] = v_1
	end
	local var11 = useLayoutValues()
	local var12 = useStyle()
	local t_2 = {
		layout = reactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center
		})
	}
	local var14 = if t_1.isSmallTouchDevice then var11.PlayerNameSizeXMobile else t_1.entrySizeX
	local var15 = if t_1.useCustomTextColor then t_1.customTextColor else var12.Theme.TextMuted.Color
	local var16 = if t_1.useCustomTextColor then 0 else var12.Theme.TextMuted.Transparency
	t_2.playersHeader = reactModule.createElement("TextLabel", {
		LayoutOrder = 1,
		BackgroundTransparency = 1,
		Size = UDim2.new(0, var14, 1, 0),
		Text = robloxTranslatorModule:FormatByKey("InGame.PlayerList.Players"),
		TextXAlignment = Enum.TextXAlignment.Left,
		TextYAlignment = Enum.TextYAlignment.Center,
		Font = var12.Font.Footer.Font,
		TextSize = if fFlagEnableMobilePlayerListOnConsole then var11.TitleBarTextSize else var12.Font.BaseSize * var12.Font.Footer.RelativeSize,
		TextTransparency = var16,
		TextColor3 = var15
	}, {
		Padding = reactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, t_1.headerPaddingLeft) })
	})
	local maxLeaderstats = var11.MaxLeaderstats
	
	if fFlagPlayerListFixLeaderstatsStacking then
		for i_2, v_2 in signalsReactModule.useSignalState(t_1.gameStats.getAllData) do
			if maxLeaderstats >= v_2.order(false) then
				t_2["stat_" .. i_2] = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = v_2.order(false) + 1,
					Size = UDim2.new(0, var11.StatEntrySizeX, 1, 0),
					Text = gameTranslatorModule:TranslateGameText(coreGuiService, i_2),
					TextXAlignment = Enum.TextXAlignment.Center,
					TextYAlignment = Enum.TextYAlignment.Center,
					Font = var12.Font.Footer.Font,
					TextSize = if fFlagEnableMobilePlayerListOnConsole then var11.TitleBarTextSize else var12.Font.BaseSize * var12.Font.Footer.RelativeSize,
					TextTransparency = var16,
					TextColor3 = var15,
					TextTruncate = Enum.TextTruncate.AtEnd
				})
			end
		end
	elseif t_1.gameStatsCount and t_1.gameStatsCount > 0 then
		t_1.gameStats.iterateData(function(p1, p2)
			-- upvalues: maxLeaderstats (ref), gameTranslatorModule (copy), coreGuiService (copy), t_2 (ref), reactModule (copy), var11 (ref), var12 (ref), fFlagEnableMobilePlayerListOnConsole (copy), var16 (ref), var15 (ref)
			if maxLeaderstats < p2.order(false) then
				return
			end
			t_2["stat_" .. p1] = reactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = p2.order(false) + 1,
				Size = UDim2.new(0, var11.StatEntrySizeX, 1, 0),
				Text = gameTranslatorModule:TranslateGameText(coreGuiService, p1),
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				Font = var12.Font.Footer.Font,
				TextSize = if fFlagEnableMobilePlayerListOnConsole then var11.TitleBarTextSize else var12.Font.BaseSize * var12.Font.Footer.RelativeSize,
				TextTransparency = var16,
				TextColor3 = var15,
				TextTruncate = Enum.TextTruncate.AtEnd
			})
		end, false)
	end
	local var17 = if t_1.showBackground then if require(corePackagesService.Workspace.Packages.Chrome).Enabled() then var12.Theme.BackgroundUIContrast.Color else var12.Theme.BackgroundContrast.Color else Color3.fromRGB(0, 0, 0)
	local t_3 = {}
	
	if t_1.showDivider then
		t_3.Divider = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Visible = t_1.contentsVisible,
			Size = UDim2.new(1, 0, 0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			AnchorPoint = Vector2.new(0, 1),
			BackgroundTransparency = var12.Theme.Divider.Transparency,
			BackgroundColor3 = var12.Theme.Divider.Color
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
		BackgroundColor3 = var17
	}, t_3)
end)