local Players = game:GetService("Players")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui"):WaitForChild("RobloxGui"):WaitForChild("Modules")
local BlockingUtilityModule = require(CorePackages.Workspace.Packages.BlockingUtility)
local SettingsPageFactoryModule = require(Modules.Settings.SettingsPageFactory)
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local OnBlockButtonActivatedModule = require(script:FindFirstAncestor("Settings").onBlockButtonActivated)
local BlockingAnalyticsModule = require(script:FindFirstAncestor("Settings").Analytics.BlockingAnalytics)
local UtilityModule = require(Modules.Settings.Utility)
local ThemeModule = require(Modules.Settings.Theme)
local CreateFunction = require(CorePackages.Workspace.Packages.AppCommonLib).Create
local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
	Players.ChildAdded:wait()
	LocalPlayer = Players.LocalPlayer
end
local NewBlockingAnalytics = BlockingAnalyticsModule.new(LocalPlayer.UserId, { EventStream = RbxAnalyticsService })
local TextSizeResult = ThemeModule.textSize(36)
local TextSizeResult1 = ThemeModule.textSize(24)
local TextSizeResult2 = ThemeModule.textSize(16)
local v1 = (function() --[[ Line: 36 | Named "Initialize" ]]
	-- upvalues: SettingsPageFactoryModule (copy), CreateFunction (copy), ThemeModule (copy), UtilityModule (copy), RobloxTranslatorModule (copy), TextSizeResult (copy), TextSizeResult1 (copy), TextSizeResult2 (copy)
	local NewPage = SettingsPageFactoryModule:CreateNewPage()
	NewPage.TabHeader = nil
	NewPage.PageListLayout.Parent = nil
	NewPage.ShouldShowBottomBar = false
	NewPage.ShouldShowHubBar = false
	NewPage.IsPageClipped = false
	NewPage.Page.Name = "ReportSentPage"
	NewPage.Page.Size = UDim2.fromScale(1, 0)
	NewPage.Page.AutomaticSize = Enum.AutomaticSize.Y
	NewPage.Root = CreateFunction("Frame")({
		BackgroundTransparency = 1,
		Name = "ReportSentContents",
		Size = UDim2.fromScale(1, 1),
		Parent = NewPage.Page
	})
	NewPage.RootLayout = CreateFunction("UIListLayout")({
		Name = "RootLayout",
		FillDirection = Enum.FillDirection.Vertical,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Parent = NewPage.Root
	})
	
	local function createTextLabel(Name, Text, TextSizeResult, LayoutOrder) --[[ Line: 64 ]]
		-- upvalues: CreateFunction (upval), ThemeModule (upval), NewPage (copy)
		return CreateFunction("TextLabel")({
			BackgroundTransparency = 1,
			TextWrap = true,
			Name = Name,
			LayoutOrder = LayoutOrder,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = Text,
			TextSize = TextSizeResult,
			Font = ThemeModule.font(Enum.Font.SourceSansBold, "Bold"),
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextXAlignment = Enum.TextXAlignment.Center,
			Parent = NewPage.Root
		})
	end
	
	local function _(p1, p2, LayoutOrder, p3) --[[ Line: 81 | Named "createButton" ]]
		-- upvalues: UtilityModule (upval), NewPage (copy)
		local StyledButton, StyledButton2 = UtilityModule:MakeStyledButton(p1, p2, UDim2.new(1, 0, 0, 50), p3)
		StyledButton.LayoutOrder = LayoutOrder
		StyledButton.Parent = NewPage.Root
		
		return StyledButton, StyledButton2
	end
	
	local function createSpacer(YOffset, LayoutOrder) --[[ Line: 89 ]]
		-- upvalues: CreateFunction (upval), NewPage (copy)
		return CreateFunction("Frame")({
			LayoutOrder = LayoutOrder,
			Name = "Spacer" .. tostring(LayoutOrder),
			Size = UDim2.fromOffset(0, YOffset),
			Parent = NewPage.Root
		})
	end
	
	NewPage.TitleLabel = createTextLabel("TitleLabel", RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Heading.Report.ThanksForReport"), TextSizeResult, 0)
	NewPage.BodyLabel = createTextLabel("BodyLabel", RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Report.ReceivedReportBody"), TextSizeResult1, 1)
	NewPage.TopSpacer = createSpacer(10, 2)
	NewPage.ActionHeader = createTextLabel("ActionHeader", RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Report.OtherActionsHeader"), TextSizeResult2, 3)
	NewPage.ActionHeader.TextXAlignment = Enum.TextXAlignment.Left
	local BlockButton, BlockButton2 = UtilityModule:MakeStyledButton("BlockButton", RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.Block"), UDim2.new(1, 0, 0, 50), function() --[[ Line: 111 ]]
		-- upvalues: NewPage (copy)
		NewPage:HandleBlock()
	end)
	BlockButton.LayoutOrder = 4
	BlockButton.Parent = NewPage.Root
	NewPage.BlockButton = BlockButton
	NewPage.BlockLabel = BlockButton2
	NewPage.MiddleSpacer = createSpacer(20, 6)
	local DoneButton, _ = UtilityModule:MakeStyledButton("DoneButton", RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.Report.Done"), UDim2.new(1, 0, 0, 50), function() --[[ Line: 118 ]]
		-- upvalues: NewPage (copy)
		NewPage:HandleDone()
	end)
	DoneButton.LayoutOrder = 7
	DoneButton.Parent = NewPage.Root
	NewPage.DoneButton = DoneButton
	
	return NewPage
end)()

function v1.UpdateActions(p1) --[[ Line: 127 ]]
	-- upvalues: BlockingUtilityModule (copy), RobloxTranslatorModule (copy)
	if p1.ReportedPlayer then
		p1.TopSpacer.Visible = true
		p1.ActionHeader.Visible = true
		p1.BlockButton.Visible = not BlockingUtilityModule:IsPlayerBlockedByUserId(p1.ReportedPlayer.UserId)
		p1.BlockLabel.Text = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Report.BlockDisplayName", {
			DISPLAY_NAME = p1.ReportedPlayer.DisplayName,
			RBX_NAME = p1.ReportedPlayer.Name
		})
		
		return
	else
		p1.TopSpacer.Visible = false
		p1.ActionHeader.Visible = false
		p1.BlockButton.Visible = false
	end
end

function v1.ShowReportedPlayer(p1, ReportedPlayer) --[[ Line: 149 ]]
	-- upvalues: v1 (copy)
	p1.ReportedPlayer = ReportedPlayer
	p1:UpdateActions()
	p1.HubRef:SwitchToPage(v1, true)
end

function v1.HandleBlock(p1) --[[ Line: 156 ]]
	-- upvalues: OnBlockButtonActivatedModule (copy), NewBlockingAnalytics (copy)
	if p1.ReportedPlayer then
		OnBlockButtonActivatedModule(p1.ReportedPlayer, NewBlockingAnalytics)
	end
	p1:HandleDone()
end

function v1.HandleDone(p1) --[[ Line: 163 ]]
	p1.HubRef:SetVisibility(false, true)
end

return v1