local CorePackages = game:GetService("CorePackages")
local MemoizeFunction = require(CorePackages.Workspace.Packages.AppCommonLib).memoize
local RoactModule = require(CorePackages.Packages.Roact)
local CryoModule = require(CorePackages.Packages.Cryo)
local Logger = require(CorePackages.Workspace.Packages.Loggers).Logger
local SocialTabModule = require(script:FindFirstAncestor("SocialTab").SocialTab)
local SocialTabEntryPoint = SocialTabModule.Components.SocialTabEntryPoint
local Context = SocialTabModule.Context
local SocialTabLoader = RoactModule.PureComponent:extend("SocialTabLoader")
SocialTabLoader.defaultProps = {
	receivedCanShowUserAlias = nil,
	showUserAlias = nil,
	renderSocialTab = function(p1)
		-- upvalues: RoactModule (copy), SocialTabEntryPoint (copy), Logger (copy)
		return RoactModule.createElement(SocialTabEntryPoint, {
			isVisible = p1.isVisible,
			parameters = p1.parameters,
			logger = Logger,
			setTabBarVisible = p1.setTabBarVisible,
			signal = p1.signal,
			rnBypassActionSignalSocialTab = p1.rnBypassActionSignalSocialTab,
			androidBackButtonConnection = p1.androidBackButtonConnection,
			closeDrawer = p1.closeDrawer,
			initialRouteName = p1.initialRouteName
		})
	end
}

function SocialTabLoader.init(p1)
	-- upvalues: MemoizeFunction (copy), RoactModule (copy), CryoModule (copy)
	p1.renderSocialTab = MemoizeFunction(function(p2)
		-- upvalues: RoactModule (upval), p1 (copy), CryoModule (upval)
		return RoactModule.createFragment({
			content = RoactModule.createElement(p1.props.renderSocialTab, CryoModule.Dictionary.join(p2 or {}, { closeDrawer = p1.props.closeDrawer }))
		})
	end)
end

function SocialTabLoader.render(p1)
	-- upvalues: RoactModule (copy), Context (copy)
	return RoactModule.createElement(Context.Consumer, { render = p1.renderSocialTab })
end

function SocialTabLoader.didMount(p1)
	p1.props.receivedCanShowUserAlias(p1.props.showUserAlias)
end

function SocialTabLoader.didUpdate(p1, p2)
	if p2.showUserAlias ~= p1.props.showUserAlias then
		p1.props.receivedCanShowUserAlias(p1.props.showUserAlias)
	end
end

return SocialTabLoader