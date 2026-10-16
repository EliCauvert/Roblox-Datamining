local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local CorePackages = game:GetService("CorePackages")
local ShareGame = RobloxGui.Modules.Settings.Pages.ShareGame
local ConstantsModule = require(ShareGame.Constants)
local ClearShareInviteLinkFunction = require(CorePackages.Workspace.Packages.NotificationsCommon).ReducerDependencies.ShareLinksRodux.Actions.ClearShareInviteLink
local OpenPageModule = require(ShareGame.Actions.OpenPage)
local ClosePageModule = require(ShareGame.Actions.ClosePage)
local EnabledResult = require(CorePackages.Workspace.Packages.Chrome).Enabled()
local FFlagEnableConsoleExpControls = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local NewPage = require(RobloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
NewPage.TabHeader = nil
NewPage.PageListLayout.Parent = nil
NewPage.ShouldShowBottomBar = false
NewPage.ShouldShowHubBar = false
NewPage.IsPageClipped = false
NewPage.Page.Name = "ShareGameDummy"
NewPage.Page.Size = UDim2.new(1, 0, 0, 0)

function NewPage:ConnectHubToApp(p1, p2) --[[ Line: 37 ]]
	-- upvalues: NewPage (copy), ConstantsModule (copy), OpenPageModule (copy), FFlagEnableConsoleExpControls (copy), EnabledResult (copy), RobloxGui (copy), ClosePageModule (copy)
	NewPage:SetHub(p1)
	p2.store.changed:connect(function(Value, p3) --[[ Line: 40 ]]
		-- upvalues: ConstantsModule (upval), NewPage (upval)
		local Page = Value.Page
		local IsOpen = p3.Page.IsOpen
		
		if Page.Route == ConstantsModule.PageRoute.SHARE_GAME and IsOpen and not Page.IsOpen then
			NewPage.HubRef:PopMenu(nil, true)
		end
	end)
	NewPage.Displayed.Event:Connect(function() --[[ Line: 52 ]]
		-- upvalues: p2 (copy), OpenPageModule (upval), ConstantsModule (upval), FFlagEnableConsoleExpControls (upval), EnabledResult (upval), RobloxGui (upval)
		if not p2.store:getState().Page.IsOpen then
			p2.store:dispatch(OpenPageModule(ConstantsModule.PageRoute.SETTINGS_HUB))
			
			if FFlagEnableConsoleExpControls and EnabledResult then
				require(RobloxGui.Modules.Chrome.Service):setHideShortcutBar("ShareGamePlaceholderPage", true)
			end
		end
	end)
	NewPage.Hidden.Event:Connect(function() --[[ Line: 64 ]]
		-- upvalues: p2 (copy), ClosePageModule (upval), ConstantsModule (upval), FFlagEnableConsoleExpControls (upval), EnabledResult (upval), RobloxGui (upval)
		if p2.store:getState().Page.IsOpen then
			p2.store:dispatch(ClosePageModule(ConstantsModule.PageRoute.SETTINGS_HUB))
			
			if FFlagEnableConsoleExpControls and EnabledResult then
				require(RobloxGui.Modules.Chrome.Service):setHideShortcutBar("ShareGamePlaceholderPage", false)
			end
		end
	end)
	p2.store:dispatch(ClosePageModule(ConstantsModule.PageRoute.SETTINGS_HUB))
end

function NewPage:ClearShareInviteLink(p1) --[[ Line: 81 ]]
	-- upvalues: ClearShareInviteLinkFunction (copy)
	if p1.store:getState().ShareLinks.Invites.ShareInviteLink ~= nil then
		p1.store:dispatch(ClearShareInviteLinkFunction())
	end
end

return NewPage