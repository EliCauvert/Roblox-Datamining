local robloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local corePackagesService = game:GetService("CorePackages")
local shareGame = robloxGui.Modules.Settings.Pages.ShareGame
local constantsModule = require(shareGame.Constants)
local clearShareInviteLink = require(corePackagesService.Workspace.Packages.NotificationsCommon).ReducerDependencies.ShareLinksRodux.Actions.ClearShareInviteLink
local openPageModule = require(shareGame.Actions.OpenPage)
local closePageModule = require(shareGame.Actions.ClosePage)
local var5 = require(corePackagesService.Workspace.Packages.Chrome).Enabled()
local fFlagEnableConsoleExpControls = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableConsoleExpControls
local shareGameDummy = require(robloxGui.Modules.Settings.SettingsPageFactory):CreateNewPage()
shareGameDummy.TabHeader = nil
shareGameDummy.PageListLayout.Parent = nil
shareGameDummy.ShouldShowBottomBar = false
shareGameDummy.ShouldShowHubBar = false
shareGameDummy.IsPageClipped = false
shareGameDummy.Page.Name = "ShareGameDummy"
shareGameDummy.Page.Size = UDim2.new(1, 0, 0, 0)

function shareGameDummy.ConnectHubToApp(_, p0, p1) --[[ line: 37 ]]
	-- upvalues: shareGameDummy (ref), constantsModule (ref), openPageModule (ref), fFlagEnableConsoleExpControls (ref), var5 (ref), robloxGui (ref), closePageModule (ref)
	shareGameDummy:SetHub(p0)
	p1.store.changed:connect(function(p2, p3) --[[ line: 40 ]]
		-- upvalues: constantsModule (copy), shareGameDummy (copy)
		local page = p2.Page
		
		if page.Route == constantsModule.PageRoute.SHARE_GAME and p3.Page.IsOpen and not page.IsOpen then
			shareGameDummy.HubRef:PopMenu(nil, true)
		end
	end)
	shareGameDummy.Displayed.Event:Connect(function() --[[ line: 52 ]]
		-- upvalues: p1 (ref), openPageModule (copy), constantsModule (copy), fFlagEnableConsoleExpControls (copy), var5 (copy), robloxGui (copy)
		if not p1.store:getState().Page.IsOpen then
			p1.store:dispatch(openPageModule(constantsModule.PageRoute.SETTINGS_HUB))
			
			if fFlagEnableConsoleExpControls and var5 then
				require(robloxGui.Modules.Chrome.Service):setHideShortcutBar("ShareGamePlaceholderPage", true)
			end
		end
	end)
	shareGameDummy.Hidden.Event:Connect(function() --[[ line: 64 ]]
		-- upvalues: p1 (ref), closePageModule (copy), constantsModule (copy), fFlagEnableConsoleExpControls (copy), var5 (copy), robloxGui (copy)
		if p1.store:getState().Page.IsOpen then
			p1.store:dispatch(closePageModule(constantsModule.PageRoute.SETTINGS_HUB))
			
			if fFlagEnableConsoleExpControls and var5 then
				require(robloxGui.Modules.Chrome.Service):setHideShortcutBar("ShareGamePlaceholderPage", false)
			end
		end
	end)
	p1.store:dispatch(closePageModule(constantsModule.PageRoute.SETTINGS_HUB))
end

function shareGameDummy.ClearShareInviteLink(_, p4) --[[ line: 81 ]]
	-- upvalues: clearShareInviteLink (ref)
	if p4.store:getState().ShareLinks.Invites.ShareInviteLink ~= nil then
		p4.store:dispatch(clearShareInviteLink())
	end
end

return shareGameDummy