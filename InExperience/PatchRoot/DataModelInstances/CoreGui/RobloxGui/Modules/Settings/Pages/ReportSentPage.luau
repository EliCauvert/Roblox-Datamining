local coreGuiService = game:GetService("CoreGui")
local playersService = game:GetService("Players")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local corePackagesService = game:GetService("CorePackages")
local modules = coreGuiService:WaitForChild("RobloxGui"):WaitForChild("Modules")
local blockingUtilityModule = require(corePackagesService.Workspace.Packages.BlockingUtility)
local settingsPageFactoryModule = require(modules.Settings.SettingsPageFactory)
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local onBlockButtonActivatedModule = require(script:FindFirstAncestor("Settings").onBlockButtonActivated)
local blockingAnalyticsModule = require(script:FindFirstAncestor("Settings").Analytics.BlockingAnalytics)
local utilityModule = require(modules.Settings.Utility)
local themeModule = require(modules.Settings.Theme)
local create = require(corePackagesService.Workspace.Packages.AppCommonLib).Create
local localPlayer = playersService.LocalPlayer
while not localPlayer do
	playersService.ChildAdded:wait()
	localPlayer = playersService.LocalPlayer
end
local var12 = blockingAnalyticsModule.new(localPlayer.UserId, { EventStream = rbxAnalyticsService })
local var13 = themeModule.textSize(36)
local var14 = themeModule.textSize(24)
local var15 = themeModule.textSize(16)
local var16 = (function()
	-- upvalues: settingsPageFactoryModule (ref), create (ref), themeModule (ref), utilityModule (ref), robloxTranslatorModule (ref), var13 (ref), var14 (ref), var15 (ref)
	local reportSentPage = settingsPageFactoryModule:CreateNewPage()
	reportSentPage.TabHeader = nil
	reportSentPage.PageListLayout.Parent = nil
	reportSentPage.ShouldShowBottomBar = false
	reportSentPage.ShouldShowHubBar = false
	reportSentPage.IsPageClipped = false
	reportSentPage.Page.Name = "ReportSentPage"
	reportSentPage.Page.Size = UDim2.fromScale(1, 0)
	reportSentPage.Page.AutomaticSize = Enum.AutomaticSize.Y
	reportSentPage.Root = create("Frame")({
		BackgroundTransparency = 1,
		Name = "ReportSentContents",
		Size = UDim2.fromScale(1, 1),
		Parent = reportSentPage.Page
	})
	reportSentPage.RootLayout = create("UIListLayout")({
		Name = "RootLayout",
		FillDirection = Enum.FillDirection.Vertical,
		VerticalAlignment = Enum.VerticalAlignment.Center,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		SortOrder = Enum.SortOrder.LayoutOrder,
		Parent = reportSentPage.Root
	})
	
	local function createTextLabel(p0, p1, p2, p3)
		-- upvalues: create (copy), themeModule (copy), reportSentPage (ref)
		return create("TextLabel")({
			BackgroundTransparency = 1,
			TextWrap = true,
			Name = p0,
			LayoutOrder = p3,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = p1,
			TextSize = p2,
			Font = themeModule.font(Enum.Font.SourceSansBold, "Bold"),
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextXAlignment = Enum.TextXAlignment.Center,
			Parent = reportSentPage.Root
		})
	end
	
	local function _(p4, p5, p6, p7)
		-- upvalues: utilityModule (copy), reportSentPage (ref)
		local var23, var24 = utilityModule:MakeStyledButton(p4, p5, UDim2.new(1, 0, 0, 50), p7)
		var23.LayoutOrder = p6
		var23.Parent = reportSentPage.Root
		
		return var23, var24
	end
	
	local function createSpacer(p8, p9)
		-- upvalues: create (copy), reportSentPage (ref)
		return create("Frame")({
			LayoutOrder = p9,
			Name = "Spacer" .. tostring(p9),
			Size = UDim2.fromOffset(0, p8),
			Parent = reportSentPage.Root
		})
	end
	
	reportSentPage.TitleLabel = createTextLabel("TitleLabel", robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Heading.Report.ThanksForReport"), var13, 0)
	reportSentPage.BodyLabel = createTextLabel("BodyLabel", robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Report.ReceivedReportBody"), var14, 1)
	reportSentPage.TopSpacer = createSpacer(10, 2)
	reportSentPage.ActionHeader = createTextLabel("ActionHeader", robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Report.OtherActionsHeader"), var15, 3)
	reportSentPage.ActionHeader.TextXAlignment = Enum.TextXAlignment.Left
	local blockButton, blockButton_1 = utilityModule:MakeStyledButton("BlockButton", robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.Block"), UDim2.new(1, 0, 0, 50), function()
		-- upvalues: reportSentPage (ref)
		reportSentPage:HandleBlock()
	end)
	blockButton.LayoutOrder = 4
	blockButton.Parent = reportSentPage.Root
	reportSentPage.BlockButton = blockButton
	reportSentPage.BlockLabel = blockButton_1
	reportSentPage.MiddleSpacer = createSpacer(20, 6)
	local doneButton, _ = utilityModule:MakeStyledButton("DoneButton", robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Action.Report.Done"), UDim2.new(1, 0, 0, 50), function()
		-- upvalues: reportSentPage (ref)
		reportSentPage:HandleDone()
	end)
	doneButton.LayoutOrder = 7
	doneButton.Parent = reportSentPage.Root
	reportSentPage.DoneButton = doneButton
	
	return reportSentPage
end)()

function var16.UpdateActions(p10)
	-- upvalues: blockingUtilityModule (ref), robloxTranslatorModule (ref)
	if p10.ReportedPlayer then
		p10.TopSpacer.Visible = true
		p10.ActionHeader.Visible = true
		p10.BlockButton.Visible = not blockingUtilityModule:IsPlayerBlockedByUserId(p10.ReportedPlayer.UserId)
		p10.BlockLabel.Text = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Report.BlockDisplayName", {
			DISPLAY_NAME = p10.ReportedPlayer.DisplayName,
			RBX_NAME = p10.ReportedPlayer.Name
		})
		
		return
	end
	p10.TopSpacer.Visible = false
	p10.ActionHeader.Visible = false
	p10.BlockButton.Visible = false
end

function var16.ShowReportedPlayer(p11, p12)
	-- upvalues: var16 (ref)
	p11.ReportedPlayer = p12
	p11:UpdateActions()
	p11.HubRef:SwitchToPage(var16, true)
end

function var16.HandleBlock(p13)
	-- upvalues: onBlockButtonActivatedModule (ref), var12 (ref)
	if p13.ReportedPlayer then
		onBlockButtonActivatedModule(p13.ReportedPlayer, var12)
	end
	p13:HandleDone()
end

function var16.HandleDone(p14)
	p14.HubRef:SetVisibility(false, true)
end

return var16