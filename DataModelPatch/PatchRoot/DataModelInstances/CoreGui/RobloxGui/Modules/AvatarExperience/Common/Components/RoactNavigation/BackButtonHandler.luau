local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local Selectors = require(CorePackages.Workspace.Packages.NavigationRodux).Selectors
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local BackButtonActionModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.BackButtonAction)
local ConnectFakeBackButtonModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.Debug.connectFakeBackButton)
local NavigationUtilsModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.NavigationUtils)
local AxRnBackButton = require(CorePackages.Workspace.Packages.AppDebug).LogTree.logger("ax.rn.backButton")
local GetActiveChildNavigationOptionsSafelyModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.getActiveChildNavigationOptionsSafely)
local ResetNavigationHistoryModule = require(Modules.LuaApp.Thunks.ResetNavigationHistory)
local InstantResetNavigationHistoryModule = require(Modules.LuaApp.Thunks.InstantResetNavigationHistory)
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local WithAvatarRouteModule = require(Modules.AvatarExperience.Common.Components.RoactNavigation.withAvatarRoute)
local _ = require(Modules.AvatarExperience.Common.AvatarExperienceState)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagUseNavigationSelectors = SharedFlagsModule.FFlagUseNavigationSelectors
local FFlagAndroidTVExitWithB = SharedFlagsModule.FFlagAndroidTVExitWithB
local FFlagSignalsNavP3gAvatarExperience = SharedFlagsModule.FFlagSignalsNavP3gAvatarExperience
local AndroidTVExitButtonManager = require(CorePackages.Workspace.Packages.RobloxAppNavigationCore).AndroidTVExitButtonManager
local ReactModule = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local UseSignalState = require(CorePackages.Packages.SignalsReact).useSignalState
local GetLegacyNavigationStore = if FFlagSignalsNavP3gAvatarExperience then require(CorePackages.Workspace.Packages.NavigationRodux).GetLegacyNavigationStore else nil
local BackButtonHandler = require(CorePackages.Packages.Roact).Component:extend("BackButtonHandler")
BackButtonHandler.validateProps = TModule.strictInterface({
	navigation = TModule.table,
	avatarExperienceActive = TModule.boolean,
	resetNavigationHistory = TModule.optional(TModule.callback),
	instantResetNavigationHistory = TModule.optional(TModule.callback),
	avatarRoute = TModule.optional(TModule.table),
	EventForTests = TModule.optional(TModule.table)
})

function BackButtonHandler.init(p1)
	-- upvalues: AxRnBackButton (copy), BackButtonActionModule (copy), AvatarScreen (copy), NavigationUtilsModule (copy), GuiService (copy), NotificationTypeModule (copy), ConnectFakeBackButtonModule (copy)
	p1.backButtonConnection = nil
	p1.tvExitDisconnect = nil
	
	function p1.onBackButtonPressed()
		-- upvalues: p1 (copy), AxRnBackButton (upval), BackButtonActionModule (upval), AvatarScreen (upval), NavigationUtilsModule (upval), GuiService (upval), NotificationTypeModule (upval)
		local Navigation = p1.props.navigation
		local BackButtonAction = p1:getBackButtonAction()
		AxRnBackButton:info("pressed: {}", BackButtonAction)
		
		if BackButtonAction == BackButtonActionModule.GoBack then
			local PrevNavPage = p1.props.avatarRoute.current.params.prevNavPage
			local PrevNavHistory = p1.props.avatarRoute.current.params.prevNavHistory
			
			if not PrevNavPage or not PrevNavHistory then
				NavigationUtilsModule.closeFocusedScreen(Navigation)
				
				return
			end
			if rawget(AvatarScreen, PrevNavPage) then
				Navigation.navigate(PrevNavPage)
				
				return
			else
				p1.props.resetNavigationHistory(PrevNavHistory)
				
				return
			end
		elseif BackButtonAction == BackButtonActionModule.Unhandled then
			GuiService:BroadcastNotification("", NotificationTypeModule.BACK_BUTTON_NOT_CONSUMED)
			
			return
		else
			if BackButtonAction ~= BackButtonActionModule.NoOp then
				AxRnBackButton:warning("Invalid back button action: {}", BackButtonAction)
				
				return
			end
		end
	end
	
	ConnectFakeBackButtonModule(p1.onBackButtonPressed)
end

function BackButtonHandler.getBackButtonAction(p1)
	-- upvalues: GetActiveChildNavigationOptionsSafelyModule (copy), BackButtonActionModule (copy)
	return GetActiveChildNavigationOptionsSafelyModule(p1.props.navigation).backButtonAction or BackButtonActionModule.GoBack
end

function BackButtonHandler:render()
	return nil
end

function BackButtonHandler.didMount(p1)
	if p1.props.avatarExperienceActive then
		p1:connectBackButton()
	end
end

function BackButtonHandler.didUpdate(p1, p2, _)
	if p2.avatarExperienceActive ~= p1.props.avatarExperienceActive then
		if p1.props.avatarExperienceActive then
			p1:connectBackButton()
			
			return
		end
		p1:disconnectBackButton()
	end
end

function BackButtonHandler.willUnmount(p1)
	p1:disconnectBackButton()
end

function BackButtonHandler.connectBackButton(p1)
	-- upvalues: AxRnBackButton (copy), GuiService (copy), FFlagAndroidTVExitWithB (copy), AndroidTVExitButtonManager (copy)
	if p1.backButtonConnection then return end
	AxRnBackButton:info("connected")
	pcall(function()
		-- upvalues: p1 (copy), GuiService (upval)
		if p1.props.EventForTests then
			p1.backButtonConnection = p1.props.EventForTests:Connect(p1.onBackButtonPressed)
			
			return
		else
			p1.backButtonConnection = GuiService.ShowLeaveConfirmation:Connect(p1.onBackButtonPressed)
		end
	end)
	
	if FFlagAndroidTVExitWithB then
		p1.tvExitDisconnect = AndroidTVExitButtonManager.register(function()
			-- upvalues: p1 (copy)
			p1:onBackButtonPressed()
		end)
	end
end

function BackButtonHandler.disconnectBackButton(p1)
	-- upvalues: AxRnBackButton (copy), FFlagAndroidTVExitWithB (copy)
	AxRnBackButton:info("disconnected")
	
	if p1.backButtonConnection then
		p1.backButtonConnection:Disconnect()
		p1.backButtonConnection = nil
	end
	if FFlagAndroidTVExitWithB and p1.tvExitDisconnect then
		p1.tvExitDisconnect()
		p1.tvExitDisconnect = nil
	end
end

local function mapStateToProps(p1, _)
	-- upvalues: FFlagUseNavigationSelectors (copy), Selectors (copy), AvatarScreen (copy)
	local SelectCurrentLegacyPageResult = nil
	if FFlagUseNavigationSelectors then
		SelectCurrentLegacyPageResult = Selectors.selectCurrentLegacyPage(p1)
	else
		local History = p1.Navigation.history
		local HistoryEntry = History[#History]
		SelectCurrentLegacyPageResult = HistoryEntry[#HistoryEntry]
	end
	return {
		avatarExperienceActive = SelectCurrentLegacyPageResult.name == AvatarScreen.AvatarExperienceRoot
	}
end

local v1 = if FFlagSignalsNavP3gAvatarExperience then function(p1)
	-- upvalues: GetLegacyNavigationStore (copy), UseSignalState (copy), AvatarScreen (copy), ReactModule (copy), v1 (copy), CryoModule (copy)
	return ReactModule.createElement(v1, CryoModule.Dictionary.union(p1, {
		avatarExperienceActive = UseSignalState(GetLegacyNavigationStore(false).getCurrentPage).name == AvatarScreen.AvatarExperienceRoot
	}))
end else RoactRoduxModule.connect(if FFlagSignalsNavP3gAvatarExperience then nil else mapStateToProps, function(Callback)
	-- upvalues: ResetNavigationHistoryModule (copy), InstantResetNavigationHistoryModule (copy)
	return {
		resetNavigationHistory = function(p1)
			-- upvalues: Callback (copy), ResetNavigationHistoryModule (upval)
			return Callback(ResetNavigationHistoryModule(nil, p1))
		end,
		instantResetNavigationHistory = function(p1)
			-- upvalues: Callback (copy), InstantResetNavigationHistoryModule (upval)
			return Callback(InstantResetNavigationHistoryModule(nil, p1))
		end
	}
end)((WithAvatarRouteModule(BackButtonHandler)))

return v1