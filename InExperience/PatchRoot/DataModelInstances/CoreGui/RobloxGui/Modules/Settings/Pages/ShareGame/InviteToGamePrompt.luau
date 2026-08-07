local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local roactModule = require(corePackagesService.Packages.Roact)
local roduxModule = require(corePackagesService.Packages.Rodux)
local modules = robloxGui.Modules
local settings = modules.Settings
local constantsModule = require(modules.Settings.Pages.ShareGame.Constants)
local gameInviteEvents = require(corePackagesService.Workspace.Packages.GameInvite).GameInviteEvents
local shareGame = settings.Pages.ShareGame
local fullModalShareGameComponentModule = require(shareGame.Components.FullModalShareGameComponent)
local appReducerModule = require(shareGame.AppReducer)
local renderWithCoreScriptsStyleProviderModule = require(modules.Common.renderWithCoreScriptsStyleProvider)
local inviteStoreModule = require(shareGame.InviteStore)
local getFFlagEnableSharedInviteStoreModule = require(modules.Flags.GetFFlagEnableSharedInviteStore)
local getFFlagAbuseReportAnalyticsHasLaunchDataModule = require(modules.Settings.Flags.GetFFlagAbuseReportAnalyticsHasLaunchData)
local t = {}
t.__index = t

function t.new(p0) --[[ line: 40 ]]
	-- upvalues: t (ref)
	local t_1 = { isActive = false, mountTarget = p0 }
	setmetatable(t_1, t)
	
	return t_1
end

function t:withSocialServiceAndLocalPlayer(p1, p2) --[[ line: 50 ]]
	self.socialService = p1
	self.localPlayer = p2
	
	return self
end

function t:withAnalytics(p3) --[[ line: 56 ]]
	self.analytics = p3
	
	return self
end

function t:withRequestImpl(p4) --[[ line: 61 ]]
	self.requestImpl = p4
	
	return self
end

function t:_createTree(p5, p6) --[[ line: 66 ]]
	-- upvalues: getFFlagEnableSharedInviteStoreModule (ref), inviteStoreModule (ref), roduxModule (ref), appReducerModule (ref), renderWithCoreScriptsStyleProviderModule (ref), roactModule (ref), fullModalShareGameComponentModule (ref)
	return renderWithCoreScriptsStyleProviderModule({
		FullModalShareGame = roactModule.createElement(fullModalShareGameComponentModule, {
			store = if getFFlagEnableSharedInviteStoreModule() then inviteStoreModule else roduxModule.Store.new(appReducerModule, nil, { roduxModule.thunkMiddleware }),
			isVisible = p5,
			analytics = self.analytics,
			promptMessage = p6 and p6.promptMessage,
			inviteUserId = p6 and p6.inviteUserId,
			inviteMessageId = p6 and p6.inviteMessageId,
			launchData = p6 and p6.launchData,
			isLoading = p6 and p6.isLoading,
			requestImpl = self.requestImpl,
			onAfterClosePage = function(_) --[[ line: 81 ]]
				-- upvalues: self (ref)
				self:hide({})
			end
		})
	})
end

function t:show(p7) --[[ line: 95 ]]
	-- upvalues: constantsModule (ref), gameInviteEvents (ref), getFFlagAbuseReportAnalyticsHasLaunchDataModule (ref), roactModule (ref), contextActionService (ref)
	if self.isActive then return end
	self.isLoading = p7 and p7.isLoading
	self.isActive = not self.isLoading
	
	if p7 then
		self.analytics:sendEvent(if p7.inviteUserId then constantsModule.Triggers.DeveloperSingle else constantsModule.Triggers.DeveloperMultiple, gameInviteEvents.ModalOpened, if getFFlagAbuseReportAnalyticsHasLaunchDataModule() then {
			isLaunchDataProvided = p7.launchData ~= nil and p7.launchData ~= ""
		} else nil)
	end
	if self.instance then
		self.instance = roactModule.update(self.instance, self:_createTree(true, p7))
	else
		self.instance = roactModule.mount(self:_createTree(true, p7), self.mountTarget, "invitePrompt")
	end
	if self.analytics and not self.isLoading then
		self.analytics:inputShareGameEntryPoint()
	end
	contextActionService:BindCoreAction("hideInvitePrompt", function(_, p8, _) --[[ line: 124 ]]
		-- upvalues: self (ref)
		if p8 == Enum.UserInputState.Begin then
			self:hide()
		end
	end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Backspace)
end

function t:hide(_) --[[ line: 131 ]]
	-- upvalues: roactModule (ref), contextActionService (ref), guiService (ref)
	if not self.isActive and not self.isLoading then return end
	self.isLoading = false
	self.isActive = false
	self.instance = roactModule.update(self.instance, self:_createTree(false))
	
	if self.socialService and self.localPlayer then
		self.socialService:InvokeGameInvitePromptClosed(self.localPlayer, {})
	end
	contextActionService:UnbindCoreAction("hideInvitePrompt")
	guiService.SelectedCoreObject = nil
	guiService:RemoveSelectionGroup("invitePrompt")
end

function t:destruct() --[[ line: 148 ]]
	-- upvalues: roactModule (ref)
	if self.instance then
		roactModule.unmount(self.instance)
	end
end

return t