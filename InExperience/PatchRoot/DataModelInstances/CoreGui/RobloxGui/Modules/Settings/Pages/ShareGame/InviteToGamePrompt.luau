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

function t.new(p1)
	-- upvalues: t (ref)
	local t_1 = { isActive = false, mountTarget = p1 }
	setmetatable(t_1, t)
	
	return t_1
end

function t:withSocialServiceAndLocalPlayer(p1, p2)
	self.socialService = p1
	self.localPlayer = p2
	
	return self
end

function t:withAnalytics(p1)
	self.analytics = p1
	
	return self
end

function t:withRequestImpl(p1)
	self.requestImpl = p1
	
	return self
end

function t:_createTree(p1, p2)
	-- upvalues: getFFlagEnableSharedInviteStoreModule (ref), inviteStoreModule (ref), roduxModule (ref), appReducerModule (ref), renderWithCoreScriptsStyleProviderModule (ref), roactModule (ref), fullModalShareGameComponentModule (ref)
	return renderWithCoreScriptsStyleProviderModule({
		FullModalShareGame = roactModule.createElement(fullModalShareGameComponentModule, {
			store = if getFFlagEnableSharedInviteStoreModule() then inviteStoreModule else roduxModule.Store.new(appReducerModule, nil, { roduxModule.thunkMiddleware }),
			isVisible = p1,
			analytics = self.analytics,
			promptMessage = p2 and p2.promptMessage,
			inviteUserId = p2 and p2.inviteUserId,
			inviteMessageId = p2 and p2.inviteMessageId,
			launchData = p2 and p2.launchData,
			isLoading = p2 and p2.isLoading,
			requestImpl = self.requestImpl,
			onAfterClosePage = function(_)
				-- upvalues: self (ref)
				self:hide({})
			end
		})
	})
end

function t:show(p1)
	-- upvalues: constantsModule (ref), gameInviteEvents (ref), getFFlagAbuseReportAnalyticsHasLaunchDataModule (ref), roactModule (ref), contextActionService (ref)
	if self.isActive then return end
	self.isLoading = p1 and p1.isLoading
	self.isActive = not self.isLoading
	
	if p1 then
		self.analytics:sendEvent(if p1.inviteUserId then constantsModule.Triggers.DeveloperSingle else constantsModule.Triggers.DeveloperMultiple, gameInviteEvents.ModalOpened, if getFFlagAbuseReportAnalyticsHasLaunchDataModule() then {
			isLaunchDataProvided = p1.launchData ~= nil and p1.launchData ~= ""
		} else nil)
	end
	if self.instance then
		self.instance = roactModule.update(self.instance, self:_createTree(true, p1))
	else
		self.instance = roactModule.mount(self:_createTree(true, p1), self.mountTarget, "invitePrompt")
	end
	if self.analytics and not self.isLoading then
		self.analytics:inputShareGameEntryPoint()
	end
	contextActionService:BindCoreAction("hideInvitePrompt", function(_, p2, _)
		-- upvalues: self (ref)
		if p2 == Enum.UserInputState.Begin then
			self:hide()
		end
	end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Backspace)
end

function t:hide(_)
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

function t:destruct()
	-- upvalues: roactModule (ref)
	if self.instance then
		roactModule.unmount(self.instance)
	end
end

return t