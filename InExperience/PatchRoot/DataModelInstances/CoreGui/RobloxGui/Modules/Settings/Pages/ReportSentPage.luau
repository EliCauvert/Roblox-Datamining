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
local var1 = blockingAnalyticsModule.new(localPlayer.UserId, { EventStream = rbxAnalyticsService })
local var2 = themeModule.textSize(36)
local var3 = themeModule.textSize(24)
local var4 = themeModule.textSize(16)
local var5 = (function()
	-- upvalues: settingsPageFactoryModule (ref), create (ref), themeModule (ref), utilityModule (ref), robloxTranslatorModule (ref), var2 (ref), var3 (ref), var4 (ref)
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
	
	local function createTextLabel(p1, p2, p3, p4)
		-- upvalues: create (copy), themeModule (copy), reportSentPage (ref)
		return create("TextLabel")({
			BackgroundTransparency = 1,
			TextWrap = true,
			Name = p1,
			LayoutOrder = p4,
			Size = UDim2.fromScale(1, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Text = p2,
			TextSize = p3,
			Font = themeModule.font(Enum.Font.SourceSansBold, "Bold"),
			TextColor3 = Color3.fromRGB(255, 255, 255),
			TextXAlignment = Enum.TextXAlignment.Center,
			Parent = reportSentPage.Root
		})
	end
	
	local function _(p1, p2, p3, p4)
		-- upvalues: utilityModule (copy), reportSentPage (ref)
		local var6, var7 = utilityModule:MakeStyledButton(p1, p2, UDim2.new(1, 0, 0, 50), p4)
		var6.LayoutOrder = p3
		var6.Parent = reportSentPage.Root
		
		return var6, var7
	end
	
	local function createSpacer(p1, p2)
		-- upvalues: create (copy), reportSentPage (ref)
		return create("Frame")({
			LayoutOrder = p2,
			Name = "Spacer" .. tostring(p2),
			Size = UDim2.fromOffset(0, p1),
			Parent = reportSentPage.Root
		})
	end
	
	reportSentPage.TitleLabel = createTextLabel("TitleLabel", robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Heading.Report.ThanksForReport"), var2, 0)
	reportSentPage.BodyLabel = createTextLabel("BodyLabel", robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Report.ReceivedReportBody"), var3, 1)
	reportSentPage.TopSpacer = createSpacer(10, 2)
	reportSentPage.ActionHeader = createTextLabel("ActionHeader", robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Report.OtherActionsHeader"), var4, 3)
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

function var16.UpdateActions(p1)
	-- upvalues: blockingUtilityModule (ref), robloxTranslatorModule (ref)
	if p1.ReportedPlayer then
		p1.TopSpacer.Visible = true
		p1.ActionHeader.Visible = true
		p1.BlockButton.Visible = not blockingUtilityModule:IsPlayerBlockedByUserId(p1.ReportedPlayer.UserId)
		p1.BlockLabel.Text = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Label.Report.BlockDisplayName", {
			DISPLAY_NAME = p1.ReportedPlayer.DisplayName,
			RBX_NAME = p1.ReportedPlayer.Name
		})
		
		return
	end
	p1.TopSpacer.Visible = false
	p1.ActionHeader.Visible = false
	p1.BlockButton.Visible = false
end

function var16.ShowReportedPlayer(p1, p2)
	-- upvalues: var5 (ref)
	p1.ReportedPlayer = p2
	p1:UpdateActions()
	p1.HubRef:SwitchToPage(var5, true)
end

function var16.HandleBlock(p1)
	-- upvalues: onBlockButtonActivatedModule (ref), var1 (ref)
	if p1.ReportedPlayer then
		onBlockButtonActivatedModule(p1.ReportedPlayer, var1)
	end
	p1:HandleDone()
end

function var16.HandleDone(p1)
	p1.HubRef:SetVisibility(false, true)
end

return var5