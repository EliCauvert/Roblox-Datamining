local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local TModule = require(CorePackages.Packages.t)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local Button = UIBloxModule.App.Button.Button
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local MoreSwitchAccount = RoactModule.PureComponent:extend("MoreSwitchAccount")
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactAnalyticsAuthEventsModule = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local OpenAccountSwitcherModule = require(Modules.LuaApp.Thunks.Authentication.OpenAccountSwitcher)
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local GetFFlagUIBloxUseFoundationButtonFunction = require(CorePackages.Workspace.Packages.SharedFlags).UIBlox.GetFFlagUIBloxUseFoundationButton
MoreSwitchAccount.validateProps = TModule.strictInterface({
	buttonHeight = TModule.integer,
	buttonMaxWidth = TModule.integer,
	item = TModule.table,
	layoutOrder = TModule.optional(TModule.integer),
	position = TModule.optional(TModule.UDim2),
	navigateDown = TModule.callback,
	navigateBack = TModule.callback,
	guiService = TModule.union(TModule.Instance, TModule.table),
	networkImpl = TModule.callback,
	willActivate = TModule.optional(TModule.callback),
	authAnalytics = TModule.table,
	showAccountSwitcher = TModule.callback,
	appPolicy = TModule.optional(TModule.table),
	omniRecommendationsRequest = TModule.optional(TModule.callback),
	enableFoundationDesign = TModule.optional(TModule.boolean),
	enableSignedOutAccounts = TModule.optional(TModule.boolean),
	showLoginRevamp = TModule.optional(TModule.boolean)
})

function MoreSwitchAccount.init(p1)
	-- upvalues: EventStreamConstantsModule (copy)
	local Item = p1.props.item
	
	function p1.navigateDown()
		-- upvalues: p1 (copy), Item (copy)
		p1.props.navigateDown({ name = Item.context.page })
	end
	
	p1.mounted = false
	p1.state = { isButtonDisabled = false }
	
	function p1.onActivated()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
		if p1.state.isButtonDisabled then return end
		p1:setState({ isButtonDisabled = true })
		p1.props.authAnalytics.reportAuthButtonClick(EventStreamConstantsModule.Context.MorePage, EventStreamConstantsModule.Button.SwitchAccounts)
		p1.props.showAccountSwitcher(p1.props.networkImpl, p1.props.authAnalytics, p1.props.appPolicy, p1.props.omniRecommendationsRequest, p1.props.enableFoundationDesign, p1.props.enableSignedOutAccounts, p1.props.showLoginRevamp)
		
		if p1.props.willActivate then
			p1.props.willActivate()
		end
		task.delay(0.25, function()
			-- upvalues: p1 (upval)
			if p1.mounted then
				p1:setState({ isButtonDisabled = false })
			end
		end)
	end
end

function MoreSwitchAccount.didMount(p1)
	p1.mounted = true
end

function MoreSwitchAccount.willUnmount(p1)
	p1.mounted = false
end

function MoreSwitchAccount.render(p1)
	-- upvalues: WithLocalizationModule (copy), RoactModule (copy), Button (copy), ButtonType (copy), GetFFlagUIBloxUseFoundationButtonFunction (copy)
	local ButtonHeight = p1.props.buttonHeight
	local ButtonMaxWidth = p1.props.buttonMaxWidth
	local LayoutOrder = p1.props.layoutOrder
	local Position = p1.props.position
	
	return WithLocalizationModule({
		switchAccountText = "Authentication.AccountSwitch.Heading.SwitchAccount",
		addAccountText = "Authentication.AccountSwitch.Action.AddAccount",
		maxAccountsReachedText = "Authentication.AccountSwitch.Label.AccountLimitReached.2"
	})(function(p2)
		-- upvalues: RoactModule (upval), Position (copy), LayoutOrder (copy), ButtonHeight (copy), ButtonMaxWidth (copy), Button (upval), ButtonType (upval), p1 (copy), GetFFlagUIBloxUseFoundationButtonFunction (upval)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Position = Position,
			LayoutOrder = LayoutOrder,
			Size = UDim2.new(1, 0, 0, ButtonHeight)
		}, {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			SwitchAccountButtonFrame = RoactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
				UISizeConstraint = RoactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(ButtonMaxWidth, ButtonHeight) }),
				SwitchAccountButton = RoactModule.createElement(Button, {
					isDisabled = false,
					isLoading = false,
					buttonType = ButtonType.Secondary,
					onActivated = p1.onActivated,
					size = UDim2.new(1, 0, if GetFFlagUIBloxUseFoundationButtonFunction() then 0 else 1, if GetFFlagUIBloxUseFoundationButtonFunction() then ButtonHeight else 0),
					text = p2.switchAccountText
				})
			})
		})
	end)
end

return RoactServices.connect({
	guiService = AppGuiService,
	networkImpl = RoactNetworkingModule,
	authAnalytics = RoactAnalyticsAuthEventsModule
})((RoactAppPolicy.connect(function(AppPolicy, _)
	return { appPolicy = AppPolicy }
end)((RoactRoduxModule.connect(function(_, _)
	return {}
end, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateDownModule (copy), NavigateBackModule (copy), OpenAccountSwitcherModule (copy), EventStreamConstantsModule (copy)
	return {
		navigateDown = function(p1)
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.down(NavigationCommands.fromLegacyPage(p1))
				
				return
			else
				Callback(NavigateDownModule(p1))
			end
		end,
		navigateBack = function()
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateBackModule (upval)
			if FFlagSignalsNavP3Dispatch then
				NavigationCommands.back()
				
				return
			else
				Callback(NavigateBackModule())
			end
		end,
		showAccountSwitcher = function(p1, p2, p3, p4, p5, p6, p7)
			-- upvalues: Callback (copy), OpenAccountSwitcherModule (upval), EventStreamConstantsModule (upval)
			Callback(OpenAccountSwitcherModule(true, p1, EventStreamConstantsModule.Origin.MoreMenu, p2, p3, p4, p5, p6, p7))
		end
	}
end)(MoreSwitchAccount)))))