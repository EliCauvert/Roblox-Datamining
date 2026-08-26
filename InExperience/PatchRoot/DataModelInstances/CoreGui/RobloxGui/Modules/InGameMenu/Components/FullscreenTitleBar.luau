local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local guiService = game:GetService("GuiService")
local appStorageService = game:GetService("AppStorageService")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local t = inGameMenuDependenciesModule.t
local promise = inGameMenuDependenciesModule.Promise
local fullscreenTitleBar = inGameMenuDependenciesModule.UIBlox.App.Bar.FullscreenTitleBar
local parent = script.Parent.Parent
local inGameMenuPolicyModule = require(parent.InGameMenuPolicy)
local openEducationalPopupModule = require(parent.Thunks.OpenEducationalPopup)
local startLeavingGameModule = require(parent.Actions.StartLeavingGame)
local externalEventConnectionModule = require(parent.Utility.ExternalEventConnection)
local userLocalStoreModule = require(parent.Utility.UserLocalStore)
local getFIntFullscreenTitleBarTriggerDelayMillisModule = require(parent.Flags.GetFIntFullscreenTitleBarTriggerDelayMillis)
local getFFlagFullscreenTitleBarInjectGameServicesModule = require(parent.Flags.GetFFlagFullscreenTitleBarInjectGameServices)
local getFFlagFixFullscreenTitleBarPromiseCancelModule = require(parent.Flags.GetFFlagFixFullscreenTitleBarPromiseCancel)
local fullscreenTitleBar_1 = roact.PureComponent:extend("FullscreenTitleBar")
fullscreenTitleBar_1.validateProps = t.strictInterface({
	titleText = t.optional(t.string),
	displayOrder = t.integer,
	isMenuOpen = t.boolean,
	isEducationalPopupEnabled = t.boolean,
	maxDisplayCount = t.integer,
	openEducationalPopup = t.callback,
	startLeavingGame = t.callback,
	userGameSettings = t.optional(t.union(t.Instance, t.table)),
	guiService = t.optional(t.union(t.Instance, t.table)),
	appStorageService = t.optional(t.union(t.Instance, t.table))
})
fullscreenTitleBar_1.defaultProps = {
	titleText = "Roblox",
	userGameSettings = userGameSettingsService,
	guiService = guiService,
	appStorageService = appStorageService
}

function fullscreenTitleBar_1.init(p1)
	-- upvalues: getFFlagFullscreenTitleBarInjectGameServicesModule (ref), userGameSettingsService (ref), guiService (ref), appStorageService (ref), getFIntFullscreenTitleBarTriggerDelayMillisModule (ref), promise (ref), userLocalStoreModule (ref), getFFlagFixFullscreenTitleBarPromiseCancelModule (ref)
	p1.userGameSettings = if getFFlagFullscreenTitleBarInjectGameServicesModule() then p1.props.userGameSettings else userGameSettingsService
	p1.guiService = if getFFlagFullscreenTitleBarInjectGameServicesModule() then p1.props.guiService else guiService
	p1.appStorageService = if getFFlagFullscreenTitleBarInjectGameServicesModule() then p1.props.appStorageService else appStorageService
	p1:setState({
		isTriggered = false,
		fullscreenEnabled = p1.userGameSettings:InFullScreen()
	})
	
	function p0.onFullscreenChanged(p2)
		-- upvalues: p1 (ref)
		p1:setState({ isTriggered = false, fullscreenEnabled = p2 })
	end
	
	function p0.triggerTitleBar()
		-- upvalues: getFIntFullscreenTitleBarTriggerDelayMillisModule (copy), p1 (ref), promise (copy)
		local var1 = getFIntFullscreenTitleBarTriggerDelayMillisModule() / 1000
		
		if var1 > 0 then
			p1.triggerTitleBarPromise = promise.delay(var1):andThenCall(function()
				-- upvalues: p1 (copy)
				p1.triggerTitleBarPromise = nil
				
				if not p1.state.isTriggered then
					p1:setState({ isTriggered = true })
				end
			end)
			
			return
		elseif not p1.state.isTriggered then
			p1:setState({ isTriggered = true })
		end
	end
	
	function p0.cancelTriggerTitleBar()
		-- upvalues: p1 (ref)
		if p1.triggerTitleBarPromise then
			p1.triggerTitleBarPromise:cancel()
			p1.triggerTitleBarPromise = nil
		end
	end
	
	function p0.hideTitleBar()
		-- upvalues: p1 (ref)
		if p1.state.isTriggered then
			p1:setState({ isTriggered = false })
		end
	end
	
	function p0.exitFullscreen()
		-- upvalues: p1 (ref)
		p1.hideTitleBar()
		p1.guiService:ToggleFullscreen()
	end
	
	function p0.closeRoblox()
		-- upvalues: p1 (ref), userLocalStoreModule (copy)
		p1.hideTitleBar()
		
		if p1.props.isEducationalPopupEnabled then
			p1.props.openEducationalPopup(p1.guiService, userLocalStoreModule.new(), p1.props.maxDisplayCount)
			
			return
		end
		p1.props.startLeavingGame()
	end
	
	function p0.onDisappear()
		-- upvalues: p1 (ref), getFFlagFixFullscreenTitleBarPromiseCancelModule (copy), promise (copy)
		if p1.hideTitleBarPromise then
			if getFFlagFixFullscreenTitleBarPromiseCancelModule() then
				p1.hideTitleBarPromise:cancel()
			else
				p1.hideTitleBarPromise.cancel()
			end
			p1.hideTitleBarPromise = nil
		end
		p1.hideTitleBarPromise = promise.delay(0.5):andThenCall(function()
			-- upvalues: p1 (copy)
			p1.hideTitleBarPromise = nil
			p1.hideTitleBar()
		end)
	end
	
	function p0.mouseReenter()
		-- upvalues: p1 (ref)
		if p1.state.isTriggered and p1.hideTitleBarPromise then
			p1.hideTitleBarPromise:cancel()
			p1.hideTitleBarPromise = nil
		end
	end
end

function fullscreenTitleBar_1.render(p1)
	-- upvalues: roact (ref), externalEventConnectionModule (ref), coreGuiService (ref), fullscreenTitleBar (ref)
	return roact.createFragment({
		FullscreenChangedEvent = roact.createElement(externalEventConnectionModule, {
			event = p1.userGameSettings.FullscreenChanged,
			callback = p1.onFullscreenChanged
		}),
		FullscreenTitleBar = roact.createElement(roact.Portal, { target = coreGuiService }, {
			InGameFullscreenTitleBarScreen = roact.createElement("ScreenGui", {
				IgnoreGuiInset = true,
				Enabled = p1.state.fullscreenEnabled,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
				DisplayOrder = p1.props.displayOrder
			}, {
				TriggerArea = roact.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 1),
					[roact.Event.MouseEnter] = p1.triggerTitleBar,
					[roact.Event.MouseLeave] = p1.cancelTriggerTitleBar
				}),
				Bar = roact.createElement(fullscreenTitleBar, {
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

function fullscreenTitleBar_1.didUpdate(p1, p2)
	if not p2.isMenuOpen and p1.props.isMenuOpen then
		p1.hideTitleBar()
	end
end

function fullscreenTitleBar_1.willUnmount(p1)
	if p1.hideTitleBarPromise then
		p1.hideTitleBarPromise:cancel()
	end
	if p1.triggerTitleBarPromise then
		p1.triggerTitleBarPromise:cancel()
	end
end

return roactRodux.UNSTABLE_connect2(function(p1, _)
	return { isMenuOpen = p1.isMenuOpen }
end, function(p1)
	-- upvalues: openEducationalPopupModule (ref), startLeavingGameModule (ref)
	return {
		openEducationalPopup = function(p2, p3, p4)
			-- upvalues: p1 (ref), openEducationalPopupModule (copy)
			return p1(openEducationalPopupModule(p2, p3, p4))
		end,
		startLeavingGame = function()
			-- upvalues: p1 (ref), startLeavingGameModule (copy)
			p1(startLeavingGameModule())
		end
	}
end)(inGameMenuPolicyModule.connect(function(p1, _)
	return {
		isEducationalPopupEnabled = p1.enableEducationalPopup(),
		maxDisplayCount = p1.educationalPopupMaxDisplayCount()
	}
end)(fullscreenTitleBar_1))