local CoreGui = game:GetService("CoreGui")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local GuiService = game:GetService("GuiService")
local AppStorageService = game:GetService("AppStorageService")
local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local T = InGameMenuDependenciesModule.t
local Promise = InGameMenuDependenciesModule.Promise
local FullscreenTitleBar = InGameMenuDependenciesModule.UIBlox.App.Bar.FullscreenTitleBar
local Parent = script.Parent.Parent
local InGameMenuPolicyModule = require(Parent.InGameMenuPolicy)
local OpenEducationalPopupModule = require(Parent.Thunks.OpenEducationalPopup)
local StartLeavingGameModule = require(Parent.Actions.StartLeavingGame)
local ExternalEventConnectionModule = require(Parent.Utility.ExternalEventConnection)
local UserLocalStoreModule = require(Parent.Utility.UserLocalStore)
local GetFIntFullscreenTitleBarTriggerDelayMillisModule = require(Parent.Flags.GetFIntFullscreenTitleBarTriggerDelayMillis)
local GetFFlagFullscreenTitleBarInjectGameServicesModule = require(Parent.Flags.GetFFlagFullscreenTitleBarInjectGameServices)
local GetFFlagFixFullscreenTitleBarPromiseCancelModule = require(Parent.Flags.GetFFlagFixFullscreenTitleBarPromiseCancel)
local FullscreenTitleBar1 = Roact.PureComponent:extend("FullscreenTitleBar")
FullscreenTitleBar1.validateProps = T.strictInterface({
	titleText = T.optional(T.string),
	displayOrder = T.integer,
	isMenuOpen = T.boolean,
	isEducationalPopupEnabled = T.boolean,
	maxDisplayCount = T.integer,
	openEducationalPopup = T.callback,
	startLeavingGame = T.callback,
	userGameSettings = T.optional(T.union(T.Instance, T.table)),
	guiService = T.optional(T.union(T.Instance, T.table)),
	appStorageService = T.optional(T.union(T.Instance, T.table))
})
FullscreenTitleBar1.defaultProps = {
	titleText = "Roblox",
	userGameSettings = UserGameSettings,
	guiService = GuiService,
	appStorageService = AppStorageService
}

function FullscreenTitleBar1.init(p1)
	-- upvalues: GetFFlagFullscreenTitleBarInjectGameServicesModule (copy), UserGameSettings (copy), GuiService (copy), AppStorageService (copy), GetFIntFullscreenTitleBarTriggerDelayMillisModule (copy), Promise (copy), UserLocalStoreModule (copy), GetFFlagFixFullscreenTitleBarPromiseCancelModule (copy)
	p1.userGameSettings = GetFFlagFullscreenTitleBarInjectGameServicesModule() and p1.props.userGameSettings or UserGameSettings
	p1.guiService = GetFFlagFullscreenTitleBarInjectGameServicesModule() and p1.props.guiService or GuiService
	p1.appStorageService = GetFFlagFullscreenTitleBarInjectGameServicesModule() and p1.props.appStorageService or AppStorageService
	p1:setState({
		isTriggered = false,
		fullscreenEnabled = p1.userGameSettings:InFullScreen()
	})
	
	function p1.onFullscreenChanged(FullscreenEnabled)
		-- upvalues: p1 (copy)
		p1:setState({
			isTriggered = false,
			fullscreenEnabled = FullscreenEnabled
		})
	end
	
	function p1.triggerTitleBar()
		-- upvalues: GetFIntFullscreenTitleBarTriggerDelayMillisModule (upval), p1 (copy), Promise (upval)
		local FIntFullscreenTitleBarTriggerDelayMillisModuleRatio = GetFIntFullscreenTitleBarTriggerDelayMillisModule() / 1000
		
		if FIntFullscreenTitleBarTriggerDelayMillisModuleRatio > 0 then
			p1.triggerTitleBarPromise = Promise.delay(FIntFullscreenTitleBarTriggerDelayMillisModuleRatio):andThenCall(function()
				-- upvalues: p1 (upval)
				p1.triggerTitleBarPromise = nil
				
				if not p1.state.isTriggered then
					p1:setState({ isTriggered = true })
				end
			end)
			
			return
		end
		if not p1.state.isTriggered then
			p1:setState({ isTriggered = true })
		end
	end
	
	function p1.cancelTriggerTitleBar()
		-- upvalues: p1 (copy)
		if p1.triggerTitleBarPromise then
			p1.triggerTitleBarPromise:cancel()
			p1.triggerTitleBarPromise = nil
		end
	end
	
	function p1.hideTitleBar()
		-- upvalues: p1 (copy)
		if p1.state.isTriggered then
			p1:setState({ isTriggered = false })
		end
	end
	
	function p1.exitFullscreen()
		-- upvalues: p1 (copy)
		p1.hideTitleBar()
		p1.guiService:ToggleFullscreen()
	end
	
	function p1.closeRoblox()
		-- upvalues: p1 (copy), UserLocalStoreModule (upval)
		p1.hideTitleBar()
		
		if p1.props.isEducationalPopupEnabled then
			p1.props.openEducationalPopup(p1.guiService, UserLocalStoreModule.new(), p1.props.maxDisplayCount)
			
			return
		else
			p1.props.startLeavingGame()
		end
	end
	
	function p1.onDisappear()
		-- upvalues: p1 (copy), GetFFlagFixFullscreenTitleBarPromiseCancelModule (upval), Promise (upval)
		if p1.hideTitleBarPromise then
			if GetFFlagFixFullscreenTitleBarPromiseCancelModule() then
				p1.hideTitleBarPromise:cancel()
			else
				p1.hideTitleBarPromise.cancel()
			end
			p1.hideTitleBarPromise = nil
		end
		p1.hideTitleBarPromise = Promise.delay(0.5):andThenCall(function()
			-- upvalues: p1 (upval)
			p1.hideTitleBarPromise = nil
			p1.hideTitleBar()
		end)
	end
	
	function p1.mouseReenter()
		-- upvalues: p1 (copy)
		if p1.state.isTriggered and p1.hideTitleBarPromise then
			p1.hideTitleBarPromise:cancel()
			p1.hideTitleBarPromise = nil
		end
	end
end

function FullscreenTitleBar1.render(p1)
	-- upvalues: Roact (copy), ExternalEventConnectionModule (copy), CoreGui (copy), FullscreenTitleBar (copy)
	return Roact.createFragment({
		FullscreenChangedEvent = Roact.createElement(ExternalEventConnectionModule, {
			event = p1.userGameSettings.FullscreenChanged,
			callback = p1.onFullscreenChanged
		}),
		FullscreenTitleBar = Roact.createElement(Roact.Portal, { target = CoreGui }, {
			InGameFullscreenTitleBarScreen = Roact.createElement("ScreenGui", {
				IgnoreGuiInset = true,
				Enabled = p1.state.fullscreenEnabled,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
				DisplayOrder = p1.props.displayOrder
			}, {
				TriggerArea = Roact.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 1),
					[Roact.Event.MouseEnter] = p1.triggerTitleBar,
					[Roact.Event.MouseLeave] = p1.cancelTriggerTitleBar
				}),
				Bar = Roact.createElement(FullscreenTitleBar, {
					title = p1.props.titleText,
					isTriggered = p1.state.isTriggered,
					onDisappear = p1.onDisappear,
					onHover = p1.mouseReenter,
					exitFullscreen = p1.exitFullscreen,
					closeRoblox = p1.closeRoblox
				})
			})
		})
	})
end

function FullscreenTitleBar1.didUpdate(p1, p2)
	if not p2.isMenuOpen and p1.props.isMenuOpen then
		p1.hideTitleBar()
	end
end

function FullscreenTitleBar1.willUnmount(p1)
	if p1.hideTitleBarPromise then
		p1.hideTitleBarPromise:cancel()
	end
	if p1.triggerTitleBarPromise then
		p1.triggerTitleBarPromise:cancel()
	end
end

return RoactRodux.UNSTABLE_connect2(function(p1, _)
	return { isMenuOpen = p1.isMenuOpen }
end, function(Callback)
	-- upvalues: OpenEducationalPopupModule (copy), StartLeavingGameModule (copy)
	return {
		openEducationalPopup = function(p1, p2, p3)
			-- upvalues: Callback (copy), OpenEducationalPopupModule (upval)
			return Callback(OpenEducationalPopupModule(p1, p2, p3))
		end,
		startLeavingGame = function()
			-- upvalues: Callback (copy), StartLeavingGameModule (upval)
			Callback(StartLeavingGameModule())
		end
	}
end)((InGameMenuPolicyModule.connect(function(p1, _)
	return {
		isEducationalPopupEnabled = p1.enableEducationalPopup(),
		maxDisplayCount = p1.educationalPopupMaxDisplayCount()
	}
end)(FullscreenTitleBar1)))