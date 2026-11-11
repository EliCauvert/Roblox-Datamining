local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local TModule = require(CorePackages.Packages.t)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local LogoutModule = require(Modules.LuaApp.Thunks.Authentication.Logout)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local LuaLogoutReasonNamesModule = require(Modules.LuaApp.Analytics.Events.Auth.luaLogoutReasonNames)
local FFlagUAppBlockPageUseTextFromGUACModule = require(Modules.LuaApp.Flags.FFlagUAppBlockPageUseTextFromGUAC)
local FFlagUAppBlockPageDisableLogOutFromGUACModule = require(Modules.LuaApp.Flags.FFlagUAppBlockPageDisableLogOutFromGUAC)
local FFlagUAppBlockPageResponsiveLayoutModule = require(Modules.LuaApp.Flags.FFlagUAppBlockPageResponsiveLayout)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local RoactModule = require(Modules.Common.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local FullPageModal = UIBloxModule.App.Dialog.Modal.FullPageModal
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local config = {
	AgeBlock = "CommonUI.Messages.Label.AgeBlock",
	FeatureNotAvailableForAccount = "CommonUI.Messages.Label.FeatureNotAvailableForAccount"
}
local UAppBlockPage = require(CorePackages.Packages.React).PureComponent:extend("UAppBlockPage")
UAppBlockPage.validateProps = TModule.strictInterface({
	screenSize = if FFlagUAppBlockPageResponsiveLayoutModule then TModule.Vector2 else nil,
	logoutWithoutShowConfirmation = TModule.callback,
	shouldDisableLogOut = if FFlagUAppBlockPageDisableLogOutFromGUACModule then TModule.optional(TModule.boolean) else nil,
	uAppBlockPageTextMapKey = TModule.optional(TModule.string),
	guiService = TModule.any,
	networkImpl = TModule.any
})

function getBlockTextLocalizationKeyFromMapKey(p1)
	-- upvalues: config (copy)
	return if p1 == nil or not config[p1] then "CommonUI.Messages.Label.FeatureNotAvailableForAccount" else config[p1]
end

function UAppBlockPage.init(p1)
	-- upvalues: FFlagUAppBlockPageDisableLogOutFromGUACModule (copy)
	function p1.logOut()
		-- upvalues: FFlagUAppBlockPageDisableLogOutFromGUACModule (upval), p1 (copy)
		if not FFlagUAppBlockPageDisableLogOutFromGUACModule or not p1.props.shouldDisableLogOut then
			p1.props.logoutWithoutShowConfirmation(p1.props.networkImpl, p1.props.guiService)
			
			return
		end
	end
end

function UAppBlockPage.render(p1)
	-- upvalues: WithLocalizationModule (copy), FFlagUAppBlockPageUseTextFromGUACModule (copy), WithStyleFunction (copy), RoactModule (copy), FullPageModal (copy), FFlagUAppBlockPageResponsiveLayoutModule (copy), FFlagUAppBlockPageDisableLogOutFromGUACModule (copy), StyledTextLabel (copy)
	return WithLocalizationModule({
		logOutText = "Application.Logout.Action.Logout",
		blockText = if FFlagUAppBlockPageUseTextFromGUACModule then getBlockTextLocalizationKeyFromMapKey(p1.props.uAppBlockPageTextMapKey) else "CommonUI.Messages.Label.AgeBlock"
	})(function(p2)
		-- upvalues: WithStyleFunction (upval), RoactModule (upval), FullPageModal (upval), FFlagUAppBlockPageResponsiveLayoutModule (upval), p1 (copy), FFlagUAppBlockPageDisableLogOutFromGUACModule (upval), StyledTextLabel (upval)
		return WithStyleFunction(function(p3)
			-- upvalues: RoactModule (upval), FullPageModal (upval), FFlagUAppBlockPageResponsiveLayoutModule (upval), p1 (upval), FFlagUAppBlockPageDisableLogOutFromGUACModule (upval), p2 (copy), StyledTextLabel (upval)
			return RoactModule.createElement(FullPageModal, {
				screenSize = if FFlagUAppBlockPageResponsiveLayoutModule then p1.props.screenSize else Vector2.new(1920, 1080),
				marginSize = if FFlagUAppBlockPageResponsiveLayoutModule then nil else 0,
				distanceFromTop = if FFlagUAppBlockPageResponsiveLayoutModule then 37 else 400,
				onCloseClicked = if FFlagUAppBlockPageDisableLogOutFromGUACModule and p1.props.shouldDisableLogOut then nil else p1.logOut,
				buttonStackProps = if FFlagUAppBlockPageDisableLogOutFromGUACModule and p1.props.shouldDisableLogOut then nil else {
					buttons = {
						{
							props = {
								isDisabled = false,
								onActivated = p1.logOut,
								text = p2.logOutText
							}
						}
					}
				}
			}, {
				UIListLayout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					FillDirection = Enum.FillDirection.Vertical
				}),
				TextLabel = RoactModule.createElement(StyledTextLabel, {
					lineHeight = 1,
					automaticSize = Enum.AutomaticSize.Y,
					colorStyle = { Transparency = 0, Color = Color3.new(0, 0, 0) },
					fontStyle = p3.Font.Body,
					size = UDim2.new(1, 0, 0, 0),
					text = p2.blockText,
					textXAlignment = Enum.TextXAlignment.Center,
					textYAlignment = Enum.TextYAlignment.Bottom,
					textWrapped = if FFlagUAppBlockPageResponsiveLayoutModule then true else nil
				})
			})
		end)
	end)
end

local function mapStateToProps(p1)
	return { screenSize = p1.ScreenSize }
end

return RoactServices.connect({
	guiService = AppGuiService,
	networkImpl = RoactNetworkingModule
})((RoactAppPolicy.connect(function(p1, _)
	-- upvalues: FFlagUAppBlockPageDisableLogOutFromGUACModule (copy), FFlagUAppBlockPageUseTextFromGUACModule (copy)
	return {
		shouldDisableLogOut = if FFlagUAppBlockPageDisableLogOutFromGUACModule then p1.getUAppBlockPageShouldDisableLogOut() else nil,
		uAppBlockPageTextMapKey = if FFlagUAppBlockPageUseTextFromGUACModule then p1.getUAppBlockPageTextMapKey() else nil
	}
end)((RoactRoduxModule.connect(if FFlagUAppBlockPageResponsiveLayoutModule then mapStateToProps else function(_, _) end, function(Callback)
	-- upvalues: LogoutModule (copy), LuaLogoutReasonNamesModule (copy)
	return {
		logoutWithoutShowConfirmation = function(p1, p2)
			-- upvalues: Callback (copy), LogoutModule (upval), LuaLogoutReasonNamesModule (upval)
			Callback(LogoutModule(p1, p2, LuaLogoutReasonNamesModule.MoreLogOut))
		end
	}
end)(UAppBlockPage)))))