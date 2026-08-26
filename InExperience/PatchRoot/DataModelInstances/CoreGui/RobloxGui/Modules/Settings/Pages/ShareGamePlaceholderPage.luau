local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local corePackagesService = game:GetService("CorePackages")
local shareGame = robloxGui.Modules.Settings.Pages.ShareGame
local constantsModule = require(shareGame.Constants)
local clearShareInviteLink = require(corePackagesService.Workspace.Packages.NotificationsCommon).ReducerDependencies.ShareLinksRodux.Actions.ClearShareInviteLink
local openPageModule = require(shareGame.Actions.OpenPage)
local closePageModule = require(shareGame.Actions.ClosePage)
local var1 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local fFlagEnableConsoleExpControls = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local shareGameDummy = require(robloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
shareGameDummy.TabHeader = nil
shareGameDummy.PageListLayout.Parent = nil
shareGameDummy.ShouldShowBottomBar = false
shareGameDummy.ShouldShowHubBar = false
shareGameDummy.IsPageClipped = false
shareGameDummy.Page.Name = "ShareGameDummy"
shareGameDummy.Page.Size = UDim2.new(1, 0, 0, 0)

function shareGameDummy.ConnectHubToApp(_, p1, p2)
	-- upvalues: shareGameDummy (ref), constantsModule (ref), openPageModule (ref), fFlagEnableConsoleExpControls (ref), var1 (ref), robloxGui (ref), closePageModule (ref)
	shareGameDummy:SetHub(p1)
	p2.store.changed:connect(function(p3, p4)
		-- upvalues: constantsModule (copy), shareGameDummy (copy)
		local page = p3.Page
		
		if page.Route == constantsModule.PageRoute.SHARE_GAME and p4.Page.IsOpen and not page.IsOpen then
			shareGameDummy.HubRef:PopMenu(nil, true)
		end
	end)
	shareGameDummy.Displayed.Event:Connect(function()
		-- upvalues: p2 (ref), openPageModule (copy), constantsModule (copy), fFlagEnableConsoleExpControls (copy), var1 (copy), robloxGui (copy)
		if not p2.store:getState().Page.IsOpen then
			p2.store:dispatch(openPageModule(constantsModule.PageRoute.SETTINGS_HUB))
			
			if fFlagEnableConsoleExpControls and var1 then
				require(robloxGui.Modules.Chrome.Service):setHideShortcutBar("ShareGamePlaceholderPage", true)
			end
		end
	end)
	shareGameDummy.Hidden.Event:Connect(function()
		-- upvalues: p2 (ref), closePageModule (copy), constantsModule (copy), fFlagEnableConsoleExpControls (copy), var1 (copy), robloxGui (copy)
		if p2.store:getState().Page.IsOpen then
			p2.store:dispatch(closePageModule(constantsModule.PageRoute.SETTINGS_HUB))
			
			if fFlagEnableConsoleExpControls and var1 then
				require(robloxGui.Modules.Chrome.Service):setHideShortcutBar("ShareGamePlaceholderPage", false)
			end
		end
	end)
	p2.store:dispatch(closePageModule(constantsModule.PageRoute.SETTINGS_HUB))
end

function shareGameDummy.ClearShareInviteLink(_, p1)
	-- upvalues: clearShareInviteLink (ref)
	if p1.store:getState().ShareLinks.Invites.ShareInviteLink ~= nil then
		p1.store:dispatch(clearShareInviteLink())
	end
end

return shareGameDummy