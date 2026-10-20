local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ArgCheckModule = require(Parent.ArgCheck)
local AppCommonLibModule = require(Parent.AppCommonLib)
local CryoModule = require(Parent.Cryo)
local LocalizationModule = require(Parent.Localization)
local RoactModule = require(Parent.Roact)
local GetTopBarStoreModule = require(AppChat.Stores.GetTopBarStore)
local TopBarContextModule = require(AppChat.TopBarContext)
local FFlagAppChatTopBarSignalsStoreModule = require(AppChat.Flags.FFlagAppChatTopBarSignalsStore)
local FFlagAppChatTopBarConfigDrivenModule = require(AppChat.Flags.FFlagAppChatTopBarConfigDriven)
local UniversalAppPolicyModule = require(Parent.UniversalAppPolicy)
local SocialPoliciesModule = require(Parent.SocialPolicies)
local MockTopBarProvider = RoactModule.Component:extend("MockTopBarProvider")

function MockTopBarProvider.init(p1)
	-- upvalues: FFlagAppChatTopBarSignalsStoreModule (copy), GetTopBarStoreModule (copy), ArgCheckModule (copy), CryoModule (copy)
	if FFlagAppChatTopBarSignalsStoreModule then
		GetTopBarStoreModule(false).resetStore()
	end
	p1.state = { topBar = {} }
	
	function p1.getScreenTopBar(p2)
		-- upvalues: ArgCheckModule (upval), p1 (copy)
		ArgCheckModule.isType(p2, "string", "screen")
		
		return p1.state.topBar[p2] or {}
	end
	
	function p1.setScreenTopBar(p2, p3)
		-- upvalues: ArgCheckModule (upval), FFlagAppChatTopBarSignalsStoreModule (upval), GetTopBarStoreModule (upval), p1 (copy), CryoModule (upval)
		ArgCheckModule.isType(p2, "string", "screen")
		ArgCheckModule.isType(p3, "table", "state")
		
		if FFlagAppChatTopBarSignalsStoreModule then
			GetTopBarStoreModule(false).setScreenTopBar(p2, p3)
		end
		p1:setState(function(p4)
			-- upvalues: CryoModule (upval), p2 (copy), p3 (copy)
			return {
				topBar = CryoModule.Dictionary.join(p4.topBar, {
					[p2] = CryoModule.Dictionary.join(p4.topBar[p2] or {}, p3)
				})
			}
		end)
	end
end

function MockTopBarProvider.render(p1)
	-- upvalues: RoactModule (copy), TopBarContextModule (copy), CryoModule (copy)
	return RoactModule.createElement(TopBarContextModule.Provider, {
		value = CryoModule.Dictionary.join(p1.state.topBar, {
			getScreenTopBar = p1.getScreenTopBar,
			setScreenTopBar = p1.setScreenTopBar
		})
	}, { Element = p1.props[RoactModule.Children] })
end

return function(p1)
	-- upvalues: RoactModule (copy), MockTopBarProvider (copy), FFlagAppChatTopBarConfigDrivenModule (copy), LocalizationModule (copy), AppCommonLibModule (copy), UniversalAppPolicyModule (copy), SocialPoliciesModule (copy)
	local Element = RoactModule.createElement(MockTopBarProvider, {}, p1)
	
	if FFlagAppChatTopBarConfigDrivenModule() then
		Element = RoactModule.createElement(UniversalAppPolicyModule.RoactAppPolicy.Provider, {
			policy = {
				UniversalAppPolicyModule.AppFeaturePolicies,
				SocialPoliciesModule.ChatPolicies
			},
			policyData = {
				ChatHeaderSearch = true,
				ChatHeaderCreateChatGroup = true,
				ChatHeaderNotifications = true,
				EnableWebViewSupport = true
			}
		}, {
			(RoactModule.createElement(LocalizationModule.LocalizationProvider, {
				localization = {
					Format = function(_, p2)
						return p2
					end,
					changed = AppCommonLibModule.Signal.new()
				}
			}, { Element }))
		})
	end
	return Element
end