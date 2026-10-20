local UtilsModule = require(script.Parent.Parent.utils)
local list = {
	"Home",
	"Charts",
	"Avatar",
	"Party",
	"More"
}
local list1 = {
	{ name = "PlayersTab", label = "People" },
	{ name = "GameSettingsTab", label = "Settings" },
	{ name = "CapturesTab", label = "Captures" },
	{ name = "ReportAbuseTab", label = "Report" },
	{ name = "HelpTab", label = "Help" }
}

local function trySidebarActiveTab(CoreGuiLuaAppScreenGuiSystemBarSystemBarRealSystemBarAnimatedFrameMainFramePrimaryItems)
	-- upvalues: list (copy)
	for i, value in ipairs(list) do
		local Child = CoreGuiLuaAppScreenGuiSystemBarSystemBarRealSystemBarAnimatedFrameMainFramePrimaryItems:FindFirstChild((tostring(i)))
		
		if Child then
			local Contents = Child:FindFirstChild("Contents")
			
			if Contents then
				local Icon = Contents:FindFirstChild("Icon")
				
				if Icon and Icon:IsA("TextLabel") then
					local Success, Result = pcall(function()
						-- upvalues: Icon (copy)
						return Icon.FontFace.Weight
					end)
					
					if Success and Result == Enum.FontWeight.Bold then
						return value
					end
				elseif Icon then
					local Label = Contents:FindFirstChild("Label")
					
					if Label and Label:IsA("TextLabel") then
						local Success1, Result1 = pcall(function()
							-- upvalues: Label (copy)
							return Label.TextColor3
						end)
						
						if Success1 and Result1.R < 0.2 then
							return value
						end
					end
				end
			end
		end
	end
	return nil
end

local function findTitleInInstance(Object, p1: number)
	-- upvalues: findTitleInInstance (copy)
	if p1 > 6 then
		return nil
	end
	if Object.Name == "Title" and (Object:IsA("TextLabel") or Object:IsA("TextButton")) then
		local Success, Result = pcall(function()
			-- upvalues: Object (copy)
			return Object.Text
		end)
		
		if Success and Result and Result ~= "" then
			return Result
		end
	end
	local TitleInInstance = nil
	for _, child in ipairs(Object:GetChildren()) do
		TitleInInstance = findTitleInInstance(child, p1 + 1)
		
		if TitleInInstance then
			return TitleInInstance
		end
	end
	return nil
end

local function getActiveEscTab()
	-- upvalues: UtilsModule (copy), list1 (copy)
	local CoreGuiRobloxGuiSettingsClippingShieldSettingsShieldMenuContainerPageHubBarTabHeaderContainerHubBarContainer = UtilsModule.resolveInstance("CoreGui.RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.Page.HubBar.TabHeaderContainer.HubBarContainer")
	
	if not CoreGuiRobloxGuiSettingsClippingShieldSettingsShieldMenuContainerPageHubBarTabHeaderContainerHubBarContainer then
		return nil
	end
	for _, value in ipairs(list1) do
		local Name = CoreGuiRobloxGuiSettingsClippingShieldSettingsShieldMenuContainerPageHubBarTabHeaderContainerHubBarContainer:FindFirstChild(value.name)
		
		if Name then
			local Underline = Name:FindFirstChild("Underline")
			
			if Underline and Underline:IsA("GuiObject") and Underline.Visible then
				return value.label
			end
		end
	end
	local CoreGuiRobloxGuiSettingsClippingShieldSettingsShieldMenuContainerPagePageViewClipperPageViewPageViewInnerFrame = UtilsModule.resolveInstance("CoreGui.RobloxGui.SettingsClippingShield.SettingsShield.MenuContainer.Page.PageViewClipper.PageView.PageViewInnerFrame")
	
	if CoreGuiRobloxGuiSettingsClippingShieldSettingsShieldMenuContainerPagePageViewClipperPageViewPageViewInnerFrame then
		for _, Gui in ipairs(CoreGuiRobloxGuiSettingsClippingShieldSettingsShieldMenuContainerPagePageViewClipperPageViewPageViewInnerFrame:GetChildren()) do
			if Gui:IsA("GuiObject") and Gui.Visible and Gui.AbsoluteSize.Y > 10 then
				local Name = Gui.Name
				
				if Name == "Players" then
					return "People"
				elseif Name == "Page" then
					return "Settings"
				end
				continue
			end
		end
	end
	return nil
end

local function isHamburgerOpen(): boolean
	-- upvalues: UtilsModule (copy)
	local CoreGuiTopBarAppTopBarAppUnibarLeftFrameUnibarMenuSubMenuHost = UtilsModule.resolveInstance("CoreGui.TopBarApp.TopBarApp.UnibarLeftFrame.UnibarMenu.SubMenuHost")
	
	if not CoreGuiTopBarAppTopBarAppUnibarLeftFrameUnibarMenuSubMenuHost then
		return false
	end
	for _, Gui in ipairs(CoreGuiTopBarAppTopBarAppUnibarLeftFrameUnibarMenuSubMenuHost:GetChildren()) do
		if Gui:IsA("GuiObject") and Gui.Visible and Gui.AbsoluteSize.Y > 0 then
			return true
		end
	end
	return false
end

local function isCapturesOpen(): boolean
	local CoreGui = game:FindFirstChild("CoreGui")
	
	if not CoreGui then
		return false
	end
	local CaptureNotification = CoreGui:FindFirstChild("CaptureNotification")
	
	if CaptureNotification then
		for _, ScreenGui in ipairs(CaptureNotification:GetChildren()) do
			if ScreenGui:IsA("ScreenGui") and ScreenGui.Enabled then
				for _, Gui in ipairs(ScreenGui:GetDescendants()) do
					if Gui:IsA("GuiObject") and Gui.Visible and Gui.AbsoluteSize.Y > 10 then
						return true
					end
				end
			end
		end
	end
	return false
end

local function getOpenOverlayWindows()
	local WindowHosts = {}
	local CoreGui = game:FindFirstChild("CoreGui")
	
	if not CoreGui then
		return WindowHosts
	end
	for _, child in ipairs(CoreGui:GetChildren()) do
		if child.Name:match("^WindowHost:") then
			local WindowFrame = child:FindFirstChild("WindowFrame")
			
			if WindowFrame and WindowFrame:IsA("GuiObject") and WindowFrame.Visible and WindowFrame.AbsoluteSize.X > 0 and WindowFrame.AbsoluteSize.Y > 0 then
				WindowHosts[#WindowHosts + 1] = child.Name:gsub("^WindowHost:", "")
			end
		end
	end
	return WindowHosts
end

local function callUniversalApp(): string
	-- upvalues: UtilsModule (copy), trySidebarActiveTab (copy), findTitleInInstance (copy)
	local List = {}
	local CoreGuiLuaAppScreenGuiSystemBarSystemBarRealSystemBarAnimatedFrameMainFramePrimaryItems = UtilsModule.resolveInstance("CoreGui.LuaAppScreenGui.SystemBar.SystemBar.RealSystemBar.AnimatedFrame.MainFrame.PrimaryItems")
	List[#List + 1] = "Active tab: " .. (CoreGuiLuaAppScreenGuiSystemBarSystemBarRealSystemBarAnimatedFrameMainFramePrimaryItems and trySidebarActiveTab(CoreGuiLuaAppScreenGuiSystemBarSystemBarRealSystemBarAnimatedFrameMainFramePrimaryItems) or "unknown")
	local CoreGuiLuaAppScreenGuiRNAppContainerNavigatorViewFocusRootFocusRootScene = UtilsModule.resolveInstance("CoreGui.LuaAppScreenGui.RNAppContainer.NavigatorView.FocusRoot.FocusRoot.Scene")
	
	if CoreGuiLuaAppScreenGuiRNAppContainerNavigatorViewFocusRootFocusRootScene then
		local TopBar = CoreGuiLuaAppScreenGuiRNAppContainerNavigatorViewFocusRootFocusRootScene:FindFirstChild("TopBar") or CoreGuiLuaAppScreenGuiRNAppContainerNavigatorViewFocusRootFocusRootScene:FindFirstChild("TopBarMorePage")
		
		if TopBar then
			local TitleInInstance = findTitleInInstance(TopBar, 0)
			
			if TitleInInstance then
				List[#List + 1] = "Page title: \"" .. TitleInInstance .. "\""
			end
		end
	end
	local CoreGuiLuaAppScreenGuiRNAppContainerNavigatorViewFocusRootScene = UtilsModule.resolveInstance("CoreGui.LuaAppScreenGui.RNAppContainer.NavigatorView.FocusRoot.Scene")
	
	if CoreGuiLuaAppScreenGuiRNAppContainerNavigatorViewFocusRootScene then
		for _, Gui in ipairs(CoreGuiLuaAppScreenGuiRNAppContainerNavigatorViewFocusRootScene:GetChildren()) do
			if Gui:IsA("GuiObject") and Gui.Visible then
				if Gui.Name == "ExperienceDetailsPage" then
					local Title = Gui:FindFirstChild("Title", true)
					local Text = ""
					
					if Title and (Title:IsA("TextLabel") or Title:IsA("TextButton")) then
						local Success, Result = pcall(function()
							-- upvalues: Title (copy)
							return Title.Text
						end)
						
						if Success and typeof(Result) == "string" then
							Text = Result
						end
					end
					List[#List + 1] = "Sub-page: ExperienceDetailsPage \"" .. Text:sub(1, 60) .. "\""
				elseif Gui.Name == "TopBar" then
					if Gui:FindFirstChild("Navigation", true) then
						List[#List + 1] = "Has back button: true"
					end
					local CenterContent = Gui:FindFirstChild("centerContent", true)
					
					if CenterContent and (CenterContent:IsA("TextLabel") or CenterContent:IsA("TextButton")) then
						local Success1, Result1 = pcall(function()
							-- upvalues: CenterContent (copy)
							return CenterContent.Text
						end)
						
						if Success1 and Result1 and Result1 ~= "" then
							List[#List + 1] = "Sub-page title: \"" .. Result1 .. "\""
						end
					end
				end
			end
		end
	end
	local CoreGuiPortalUIForOverlay = UtilsModule.resolveInstance("CoreGui.PortalUIForOverlay")
	
	if CoreGuiPortalUIForOverlay then
		for _, Gui1 in ipairs(CoreGuiPortalUIForOverlay:GetChildren()) do
			if Gui1:IsA("GuiObject") and Gui1.Visible and Gui1.AbsoluteSize.X > 0 then
				List[#List + 1] = "Overlay open: PortalUIForOverlay has visible content"
				break
			end
		end
	end
	local CoreGuiScreenGui = UtilsModule.resolveInstance("CoreGui.ScreenGui")
	
	if CoreGuiScreenGui then
		local TextButtonOverlayBackground = CoreGuiScreenGui:FindFirstChild("TextButtonOverlayBackground", true)
		
		if TextButtonOverlayBackground and TextButtonOverlayBackground:IsA("GuiObject") and TextButtonOverlayBackground.Visible then
			List[#List + 1] = "Overlay open: Notifications panel"
		end
	end
	return if #List == 0 then "Could not determine current page state" else table.concat(List, "\n")
end

local function callInExperience(): string
	-- upvalues: UtilsModule (copy), getActiveEscTab (copy), isHamburgerOpen (copy), isCapturesOpen (copy), getOpenOverlayWindows (copy)
	local List = { "Context: In-Experience" }
	
	if UtilsModule.isVisibleAtPath("CoreGui.RobloxGui.SettingsClippingShield.SettingsShield") then
		List[#List + 1] = "ESC menu: open"
		List[#List + 1] = "Active tab: " .. (getActiveEscTab() or "unknown")
	else
		List[#List + 1] = "ESC menu: closed"
	end
	if isHamburgerOpen() then
		List[#List + 1] = "Hamburger menu: open"
	end
	if UtilsModule.isVisibleAtPath("CoreGui.PlayerList.Children") then
		List[#List + 1] = "Leaderboard: visible"
	end
	if UtilsModule.isVisibleAtPath("CoreGui.RobloxGui.Backpack.Inventory") then
		List[#List + 1] = "Backpack inventory: open"
	end
	if UtilsModule.isVisibleAtPath("CoreGui.RobloxGui.EmotesMenu.Children.Main.EmotesWheel") then
		List[#List + 1] = "Emotes menu: open"
	end
	if isCapturesOpen() then
		List[#List + 1] = "Captures toolbar: visible"
	end
	for _, value in ipairs((getOpenOverlayWindows())) do
		List[#List + 1] = "Overlay window: " .. value
	end
	return table.concat(List, "\n")
end

return {
	description = "Identify the current UI state. Auto-detects Universal App (sidebar tab, page title, overlays) vs In-Experience (ESC menu, hamburger, leaderboard, overlays).",
	params = {},
	call = function(_)
		-- upvalues: UtilsModule (copy), callInExperience (copy), callUniversalApp (copy)
		return if UtilsModule.isInExperienceContext() then callInExperience() else callUniversalApp()
	end
}