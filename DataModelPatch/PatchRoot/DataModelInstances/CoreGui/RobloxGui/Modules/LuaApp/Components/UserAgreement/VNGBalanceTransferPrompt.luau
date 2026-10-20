local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local OpenExternalBrowserModule = require(Modules.LuaApp.openExternalBrowser)
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local AppPageModule = require(Modules.LuaApp.AppPage)
local ExtendResult = RoactModule.Component:extend(script.Name)
ExtendResult.defaultProps = {
	anchorPoint = Vector2.new(0.5, 0.5),
	position = UDim2.new(0.5, 0, 0.5, 0)
}

function ExtendResult.init(p1)
	-- upvalues: OpenExternalBrowserModule (copy), UrlBuilderModule (copy), AppPageModule (copy)
	function p1.supportFormActivated(p2)
		-- upvalues: p1 (copy), OpenExternalBrowserModule (upval), UrlBuilderModule (upval), AppPageModule (upval)
		if p1.props.useExternalBrowserForDisclaimerLinks then
			OpenExternalBrowserModule(p1.props.linking, UrlBuilderModule.static.about.support())
			
			return
		else
			p1.props.navigateDown({
				name = AppPageModule.GenericWebPage,
				detail = UrlBuilderModule.static.about.support(),
				extraProps = { title = p2.support }
			})
		end
	end
end

function ExtendResult.render(p1)
	-- upvalues: WithLocalizationModule (copy), WithStyleFunction (copy)
	return WithLocalizationModule({
		title = "CommonUI.UserAgreements.Popup.TransferCurrency.Title",
		message = "CommonUI.UserAgreements.Popup.TransferCurrency.Message",
		button = "CommonUI.UserAgreements.Popup.ContactCustomerSupport",
		support = "Feature.Moderation.Link.SupportForm"
	})(function(p2)
		-- upvalues: WithStyleFunction (upval), p1 (copy)
		return WithStyleFunction(function(p3)
			-- upvalues: p1 (upval), p2 (copy)
			return p1:renderWithProviders(p2, p3)
		end)
	end)
end

function ExtendResult.renderWithProviders(p1, p2, _)
	-- upvalues: RoactModule (copy), InteractiveAlert (copy), ButtonType (copy)
	local Props = p1.props
	
	return RoactModule.createElement(InteractiveAlert, {
		anchorPoint = Props.anchorPoint,
		position = Props.position,
		screenSize = Props.screenSize,
		title = p2.title,
		bodyText = p2.message,
		buttonStackInfo = {
			buttons = {
				{
					buttonType = ButtonType.PrimarySystem,
					props = {
						onActivated = function()
							-- upvalues: p1 (copy), p2 (copy), Props (copy)
							p1.supportFormActivated(p2)
							Props.doneActivated()
						end,
						text = p2.button
					}
				}
			}
		}
	})
end

return (RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy)
	return {
		navigateDown = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(p1))
				
				return
			else
				Callback(NavigateDownModule(p1))
			end
		end
	}
end)((RoactAppPolicy.connect(function(p1)
	return {
		useExternalBrowserForDisclaimerLinks = p1.shouldUseExternalBrowserForDisclaimerLinks()
	}
end)(ExtendResult))))