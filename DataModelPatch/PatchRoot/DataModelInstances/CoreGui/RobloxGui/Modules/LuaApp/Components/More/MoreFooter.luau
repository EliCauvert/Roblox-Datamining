local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local FoundationModule = require(CorePackages.Packages.Foundation)
local View = FoundationModule.View
local Text = FoundationModule.Text
local MorePageSettingsModule = require(Modules.LuaApp.Components.More.Config.MorePageSettings)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local AppLinking = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLinking
local OpenExternalBrowserModule = require(Modules.LuaApp.openExternalBrowser)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local GetFFlagEnableGUACControlTOSPPLinksModule = require(Modules.LuaApp.Flags.GetFFlagEnableGUACControlTOSPPLinks)
local ItemType = MorePageSettingsModule.ItemType
local ItemInfo = MorePageSettingsModule.ItemInfo
local MoreFooter = RoactModule.PureComponent:extend("MoreFooter")

function MoreFooter.init(p1)
	-- upvalues: ItemInfo (copy), ItemType (copy)
	function p1.onTermsActivated()
		-- upvalues: p1 (copy), ItemInfo (upval), ItemType (upval)
		p1:navigateToItem(ItemInfo[ItemType.About_Terms])
	end
	
	function p1.onPrivacyActivated()
		-- upvalues: p1 (copy), ItemInfo (upval), ItemType (upval)
		p1:navigateToItem(ItemInfo[ItemType.About_Privacy])
	end
end

function MoreFooter.navigateToItem(p1, p2)
	-- upvalues: GetFFlagEnableGUACControlTOSPPLinksModule (copy), OpenExternalBrowserModule (copy)
	local Url = p2.context.url
	local TitleKey = p2.context.titleKey
	
	if p2.urlGenerator then
		local LocalUserId = p1.props.localUserId
		Url = if GetFFlagEnableGUACControlTOSPPLinksModule() then p2.urlGenerator(LocalUserId, p1.props.appPolicy) else p2.urlGenerator(LocalUserId)
	end
	local Config = if TitleKey then { titleKey = TitleKey } else nil
	local IsFallbackToExternalBrowser: boolean = p1.props.disableWebViewSupport == true and p2.context.fallbackToExternalBrowser == true
	
	if p2.shouldOpenInExternalBrowser and p1.props.shouldUseExternalBrowserForMorePageItem() or IsFallbackToExternalBrowser then
		OpenExternalBrowserModule(p1.props.linking, Url)
		
		return
	else
		p1.props.navigateDown({
			name = p2.context.page,
			detail = Url,
			extraProps = Config
		})
	end
end

function MoreFooter.render(p1)
	-- upvalues: WithLocalizationModule (copy), RoactModule (copy), ReactModule (copy), View (copy), Text (copy)
	return WithLocalizationModule({
		termsText = "CommonUI.Features.Label.Terms",
		privacyText = "CommonUI.Features.Label.Privacy"
	})(function(p2)
		-- upvalues: RoactModule (upval), p1 (copy), ReactModule (upval), View (upval), Text (upval)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, p1.props.height),
			LayoutOrder = p1.props.layoutOrder
		}, {
			Content = ReactModule.createElement(View, {
				tag = "row align-x-center align-y-center gap-xxlarge size-full padding-x-xlarge padding-y-medium"
			}, {
				Terms = ReactModule.createElement(View, {
					tag = "auto-xy",
					LayoutOrder = 1,
					onActivated = p1.onTermsActivated
				}, {
					Label = ReactModule.createElement(Text, {
						tag = "auto-xy text-label-medium content-default",
						Text = p2.termsText
					})
				}),
				Privacy = ReactModule.createElement(View, {
					tag = "auto-xy",
					LayoutOrder = 2,
					onActivated = p1.onPrivacyActivated
				}, {
					Label = ReactModule.createElement(Text, {
						tag = "auto-xy text-label-medium content-default",
						Text = p2.privacyText
					})
				})
			})
		})
	end)
end

return (RoactServices.connect({ linking = AppLinking })((RoactAppPolicy.connect(function(p1)
	-- upvalues: GetFFlagEnableGUACControlTOSPPLinksModule (copy)
	return {
		shouldUseExternalBrowserForMorePageItem = p1.shouldUseExternalBrowserForMorePageItem,
		disableWebViewSupport = not p1.getWebViewSupport(),
		appPolicy = if GetFFlagEnableGUACControlTOSPPLinksModule() then p1 else nil
	}
end)((RoactRoduxModule.connect(function(p1)
	return { localUserId = p1.LocalUserId }
end, function(Callback)
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
end)(MoreFooter))))))