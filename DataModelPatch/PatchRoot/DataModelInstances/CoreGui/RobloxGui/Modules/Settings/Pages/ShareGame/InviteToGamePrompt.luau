local CorePackages = game:GetService("CorePackages")
local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoduxModule = require(CorePackages.Packages.Rodux)
local Modules = game:GetService("CoreGui"):WaitForChild("RobloxGui").Modules
local ConstantsModule = require(Modules.Settings.Pages.ShareGame.Constants)
local GameInviteEvents = require(CorePackages.Workspace.Packages.GameInvite).GameInviteEvents
local ShareGame = Modules.Settings.Pages.ShareGame
local FullModalShareGameComponentModule = require(ShareGame.Components.FullModalShareGameComponent)
local AppReducerModule = require(ShareGame.AppReducer)
local RenderWithCoreScriptsStyleProviderModule = require(Modules.Common.renderWithCoreScriptsStyleProvider)
local InviteStoreModule = require(ShareGame.InviteStore)
local GetFFlagEnableSharedInviteStoreModule = require(Modules.Flags.GetFFlagEnableSharedInviteStore)
local GetFFlagAbuseReportAnalyticsHasLaunchDataModule = require(Modules.Settings.Flags.GetFFlagAbuseReportAnalyticsHasLaunchData)
local InviteToGamePromptModule = {}
InviteToGamePromptModule.__index = InviteToGamePromptModule

function InviteToGamePromptModule.new(MountTarget)
	-- upvalues: InviteToGamePromptModule (copy)
	local config = { isActive = false, mountTarget = MountTarget }
	setmetatable(config, InviteToGamePromptModule)
	
	return config
end

function InviteToGamePromptModule:withSocialServiceAndLocalPlayer(SocialService, LocalPlayer)
	self.socialService = SocialService
	self.localPlayer = LocalPlayer
	
	return self
end

function InviteToGamePromptModule:withAnalytics(Analytics)
	self.analytics = Analytics
	
	return self
end

function InviteToGamePromptModule:withRequestImpl(RequestImpl)
	self.requestImpl = RequestImpl
	
	return self
end

function InviteToGamePromptModule:_createTree(IsVisible, p1)
	-- upvalues: GetFFlagEnableSharedInviteStoreModule (copy), InviteStoreModule (copy), RoduxModule (copy), AppReducerModule (copy), RenderWithCoreScriptsStyleProviderModule (copy), RoactModule (copy), FullModalShareGameComponentModule (copy)
	return RenderWithCoreScriptsStyleProviderModule({
		FullModalShareGame = RoactModule.createElement(FullModalShareGameComponentModule, {
			store = if GetFFlagEnableSharedInviteStoreModule() then InviteStoreModule else RoduxModule.Store.new(AppReducerModule, nil, { RoduxModule.thunkMiddleware }),
			isVisible = IsVisible,
			analytics = self.analytics,
			promptMessage = p1 and p1.promptMessage,
			inviteUserId = p1 and p1.inviteUserId,
			inviteMessageId = p1 and p1.inviteMessageId,
			launchData = p1 and p1.launchData,
			isLoading = p1 and p1.isLoading,
			requestImpl = self.requestImpl,
			onAfterClosePage = function(_)
				-- upvalues: self (copy)
				self:hide({})
			end
		})
	})
end

function InviteToGamePromptModule:show(p1)
	-- upvalues: ConstantsModule (copy), GameInviteEvents (copy), GetFFlagAbuseReportAnalyticsHasLaunchDataModule (copy), RoactModule (copy), ContextActionService (copy)
	if self.isActive then return end
	self.isLoading = p1 and p1.isLoading
	self.isActive = not self.isLoading
	
	if p1 then
		local IsNotLaunchDataMatch: boolean = p1.launchData ~= nil and p1.launchData ~= ""
		self.analytics:sendEvent(if p1.inviteUserId then ConstantsModule.Triggers.DeveloperSingle else ConstantsModule.Triggers.DeveloperMultiple, GameInviteEvents.ModalOpened, if GetFFlagAbuseReportAnalyticsHasLaunchDataModule() then { isLaunchDataProvided = IsNotLaunchDataMatch } else nil)
	end
	if self.instance then
		self.instance = RoactModule.update(self.instance, self:_createTree(true, p1))
	else
		self.instance = RoactModule.mount(self:_createTree(true, p1), self.mountTarget, "invitePrompt")
	end
	if self.analytics and not self.isLoading then
		self.analytics:inputShareGameEntryPoint()
	end
	ContextActionService:BindCoreAction("hideInvitePrompt", function(_, UserInputState, _)
		-- upvalues: self (copy)
		if UserInputState == Enum.UserInputState.Begin then
			self:hide()
		end
	end, false, Enum.KeyCode.ButtonB, Enum.KeyCode.Backspace)
end

function InviteToGamePromptModule:hide(_)
	-- upvalues: RoactModule (copy), ContextActionService (copy), GuiService (copy)
	if not self.isActive and not self.isLoading then return end
	self.isLoading = false
	self.isActive = false
	self.instance = RoactModule.update(self.instance, self:_createTree(false))
	
	if self.socialService and self.localPlayer then
		self.socialService:InvokeGameInvitePromptClosed(self.localPlayer, {})
	end
	ContextActionService:UnbindCoreAction("hideInvitePrompt")
	GuiService.SelectedCoreObject = nil
	GuiService:RemoveSelectionGroup("invitePrompt")
end

function InviteToGamePromptModule:destruct()
	-- upvalues: RoactModule (copy)
	if self.instance then
		RoactModule.unmount(self.instance)
	end
end

return InviteToGamePromptModule