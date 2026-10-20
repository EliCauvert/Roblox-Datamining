local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(Modules.Common.RoactRodux)
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local AppPageModule = require(Modules.LuaApp.AppPage)
local LogoutModule = require(Modules.LuaApp.Thunks.Authentication.Logout)
local LuaLogoutReasonNamesModule = require(Modules.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames)
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local StartVngVerificationFormModule = require(Modules.LuaApp.Http.Requests.StartVngVerificationForm)
local ValidateVngVerificationFormStatusModule = require(Modules.LuaApp.Http.Requests.ValidateVngVerificationFormStatus)
local VngComplianceLoadingPopupModule = require(Modules.LuaApp.Components.Vng.VngComplianceLoadingPopup)
local VngContactInfoFormWebviewPopup = RoactModule.PureComponent:extend("VngContactInfoFormWebviewPopup")
local Loading = require(CorePackages.Packages.Foundation).Loading
local CloseVngContactInfoFormWebviewPopupModule = require(Modules.LuaApp.Thunks.CloseVngContactInfoFormWebviewPopup)
local GetFFlagUseUpdatedVNGAgreementsWorkflowFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagUseUpdatedVNGAgreementsWorkflow
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil

function VngContactInfoFormWebviewPopup.didMount(p1)
	-- upvalues: StartVngVerificationFormModule (copy)
	local Networking = p1.props.networking
	local GuiService = p1.props.guiService
	local LogoutFunction = p1.props.logout
	local ExitFunction = p1.props.exit
	StartVngVerificationFormModule(Networking):andThen(function(Result)
		-- upvalues: ExitFunction (copy), p1 (copy), Networking (copy), LogoutFunction (copy), GuiService (copy)
		local FormUrl = Result.responseBody.formUrl
		
		if FormUrl then
			p1.props.openWebView(FormUrl, "", Networking, LogoutFunction, GuiService, ExitFunction)
			
			return
		else
			ExitFunction()
		end
	end, function(_)
		-- upvalues: LogoutFunction (copy), Networking (copy), GuiService (copy)
		LogoutFunction(Networking, GuiService)
	end)
end

function windowClosedCallback(Callback1, GuiService, p1, Callback)
	-- upvalues: ValidateVngVerificationFormStatusModule (copy), NotificationTypeModule (copy)
	ValidateVngVerificationFormStatusModule(p1):andThen(function(Result)
		-- upvalues: Callback1 (copy), p1 (copy), GuiService (copy), NotificationTypeModule (upval), Callback (copy)
		if Result.responseBody.completed == false then
			Callback1(p1, GuiService)
			
			return
		else
			GuiService:BroadcastNotification("", NotificationTypeModule.RESTART_LUA_APP)
			Callback()
		end
	end, function()
		-- upvalues: Callback1 (copy), p1 (copy), GuiService (copy)
		Callback1(p1, GuiService)
	end)
end

function VngContactInfoFormWebviewPopup.render(p1)
	-- upvalues: GetFFlagUseUpdatedVNGAgreementsWorkflowFunction (copy), RoactModule (copy), VngComplianceLoadingPopupModule (copy), Loading (copy)
	return if GetFFlagUseUpdatedVNGAgreementsWorkflowFunction() then RoactModule.createElement(VngComplianceLoadingPopupModule, {}) else RoactModule.createElement("Frame", {
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, p1.props.screenSize.Y)
	}, {
		Layout = RoactModule.createElement(Loading, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0)
		})
	})
end

return (RoactServices.connect({
	guiService = AppGuiService,
	networking = RoactNetworkingModule
})((RoactRoduxModule.connect(function(p1)
	return { screenSize = p1.ScreenSize }
end, function(Callback)
	-- upvalues: LogoutModule (copy), LuaLogoutReasonNamesModule (copy), AppPageModule (copy), FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), CloseVngContactInfoFormWebviewPopupModule (copy)
	return {
		logout = function(p1, p2)
			-- upvalues: Callback (copy), LogoutModule (upval), LuaLogoutReasonNamesModule (upval)
			Callback(LogoutModule(p1, p2, LuaLogoutReasonNamesModule.PartnerFormNotComplete))
		end,
		openWebView = function(Detail, Title, p1, p2, p3, p4)
			-- upvalues: AppPageModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			local config = {
				name = AppPageModule.GenericWebPage,
				detail = Detail,
				extraProps = {
					title = Title,
					onClose = function()
						-- upvalues: p2 (copy), p3 (copy), p1 (copy), p4 (copy)
						windowClosedCallback(p2, p3, p1, p4)
					end
				}
			}
			
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(config))
				
				return
			else
				Callback(NavigateDownModule(config))
			end
		end,
		exit = function()
			-- upvalues: Callback (copy), CloseVngContactInfoFormWebviewPopupModule (upval)
			Callback(CloseVngContactInfoFormWebviewPopupModule())
		end
	}
end)(VngContactInfoFormWebviewPopup))))