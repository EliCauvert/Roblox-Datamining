local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local FoundationModule = require(CorePackages.Packages.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local AppPageModule = require(Modules.LuaApp.AppPage)
local NavigateBackModule = require(Modules.LuaApp.Thunks.NavigateBack)
local NavigateDownModule = require(Modules.LuaApp.Thunks.NavigateDown)
local FFlagSignalsNavP3Dispatch = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSignalsNavP3Dispatch
local NavigationCommands = if FFlagSignalsNavP3Dispatch then require(CorePackages.Workspace.Packages.RobloxAppNavigation).NavigationCommands else nil
local ExtendResult = RoactModule.PureComponent:extend(script.Name)

function ExtendResult.init(p1)
	p1:setState({ challengeDisplayed = false })
end

function ExtendResult.didMount(p1)
	p1.isMounted = true
	p1.props.navigateToChallengeWebView({
		challengeType = p1.props.challengeType,
		challengeParameters = p1.props.challengeParameters,
		onChallengeAbandoned = p1.props.onChallengeAbandoned,
		onChallengeLoadFailed = p1.props.onChallengeLoadFailed,
		onChallengeDisplayed = function()
			-- upvalues: p1 (copy)
			p1:setState({ challengeDisplayed = true })
		end,
		onChallengeUnmounted = function()
			-- upvalues: p1 (copy)
			p1.props.navigateBack()
		end,
		forceWebViewVisible = p1.props.forceWebViewVisible
	})
end

function ExtendResult.willUnmount(p1)
	p1.isMounted = false
end

function ExtendResult.render(p1)
	-- upvalues: RoactModule (copy), Loading (copy), IconSize (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 0.2,
		Active = true,
		Size = UDim2.fromOffset(p1.props.screenSize.X, p1.props.screenSize.Y)
	}, {
		Spinner = RoactModule.createElement(Loading, {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			size = IconSize.Large
		})
	})
end

return (RoactRoduxModule.connect(function(p1, _)
	return { screenSize = p1.ScreenSize }
end, function(Callback)
	-- upvalues: FFlagSignalsNavP3Dispatch (copy), NavigationCommands (copy), NavigateBackModule (copy), AppPageModule (copy), NavigateDownModule (copy)
	return {
		navigateBack = function()
			-- upvalues: FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateBackModule (upval)
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.back(true) else Callback(NavigateBackModule(true))
		end,
		navigateToChallengeWebView = function(ExtraProps)
			-- upvalues: AppPageModule (upval), FFlagSignalsNavP3Dispatch (upval), NavigationCommands (upval), Callback (copy), NavigateDownModule (upval)
			local config = {
				name = AppPageModule.ChallengeHybridWebView,
				extraProps = ExtraProps
			}
			
			return if FFlagSignalsNavP3Dispatch then NavigationCommands.down(NavigationCommands.fromLegacyPage(config), true) else Callback(NavigateDownModule(config, true))
		end
	}
end)(ExtendResult))