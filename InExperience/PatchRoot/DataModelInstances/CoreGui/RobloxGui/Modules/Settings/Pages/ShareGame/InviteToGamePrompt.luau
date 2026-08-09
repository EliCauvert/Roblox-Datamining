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

function t:_createTree(p4, p5) --[[ line: 61 ]]
	-- upvalues: getFFlagEnableSharedInviteStoreModule (ref), inviteStoreModule (ref), roduxModule (ref), appReducerModule (ref), renderWithCoreScriptsStyleProviderModule (ref), roactModule (ref), fullModalShareGameComponentModule (ref)
	return renderWithCoreScriptsStyleProviderModule({
		FullModalShareGame = roactModule.createElement(fullModalShareGameComponentModule, {
			store = if getFFlagEnableSharedInviteStoreModule() then inviteStoreModule else roduxModule.Store.new(appReducerModule, nil, { roduxModule.thunkMiddleware }),
			isVisible = p4,
			analytics = self.analytics,
			promptMessage = p5 and p5.promptMessage,
			inviteUserId = p5 and p5.inviteUserId,
			inviteMessageId = p5 and p5.inviteMessageId,
			launchData = p5 and p5.launchData,
			isLoading = p5 and p5.isLoading,
			onAfterClosePage = function(_) --[[ line: 75 ]]
				-- upvalues: self (ref)
				self:hide({})
			end
		})
	})
end

function t:show(p6) --[[ line: 89 ]]
	-- upvalues: constantsModule (ref), gameInviteEvents (ref), getFFlagAbuseReportAnalyticsHasLaunchDataModule (ref), roactModule (ref), contextActionService (ref)
	if self.isActive then return end
	self.isLoading = p6 and p6.isLoading
	self.isActive = not self.isLoading
	
	if p6 then
		self.analytics:sendEvent(if p6.inviteUserId then constantsModule.Triggers.DeveloperSingle else constantsModule.Triggers.DeveloperMultiple, gameInviteEvents.ModalOpened, if getFFlagAbuseReportAnalyticsHasLaunchDataModule() then {
			isLaunchDataProvided = p6.launchData ~= nil and p6.launchData ~= ""
		} else nil)
	end
	if self.instance then
		self.instance = roactModule.update(self.instance, self:_createTree(true, p6))
	else
		self.instance = roactModule.mount(self:_createTree(true, p6), self.mountTarget, "invitePrompt")
	end
	if self.analytics and not self.isLoading then
		self.analytics:inputShareGameEntryPoint()
	end
	contextActionService:BindCoreAction("hideInvitePrompt", function(_, p7, _) --[[ line: 118 ]]
		-- upvalues: self (ref)
		if p7 == Enum.UserInputState.Begin then
			self:hide()
		end
	end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Backspace)
end

function t:hide(_) --[[ line: 125 ]]
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

function t:destruct() --[[ line: 142 ]]
	-- upvalues: roactModule (ref)
	if self.instance then
		roactModule.unmount(self.instance)
	end
end

return t