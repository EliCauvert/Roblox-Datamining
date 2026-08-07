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

function fullscreenTitleBar_1.init(p0) --[[ line: 55 ]]
	-- upvalues: getFFlagFullscreenTitleBarInjectGameServicesModule (ref), userGameSettingsService (ref), guiService (ref), appStorageService (ref), getFIntFullscreenTitleBarTriggerDelayMillisModule (ref), promise (ref), userLocalStoreModule (ref), getFFlagFixFullscreenTitleBarPromiseCancelModule (ref)
	p0.userGameSettings = if getFFlagFullscreenTitleBarInjectGameServicesModule() then p0.props.userGameSettings else userGameSettingsService
	p0.guiService = if getFFlagFullscreenTitleBarInjectGameServicesModule() then p0.props.guiService else guiService
	p0.appStorageService = if getFFlagFullscreenTitleBarInjectGameServicesModule() then p0.props.appStorageService else appStorageService
	p0:setState({
		isTriggered = false,
		fullscreenEnabled = p0.userGameSettings:InFullScreen()
	})
	
	function p0.onFullscreenChanged(p1) --[[ line: 67 ]]
		-- upvalues: p0 (ref)
		p0:setState({ isTriggered = false, fullscreenEnabled = p1 })
	end
	
	function p0.triggerTitleBar() --[[ line: 74 ]]
		-- upvalues: getFIntFullscreenTitleBarTriggerDelayMillisModule (copy), p0 (ref), promise (copy)
		local var15 = getFIntFullscreenTitleBarTriggerDelayMillisModule() / 1000
		
		if var15 > 0 then
			p0.triggerTitleBarPromise = promise.delay(var15):andThenCall(function() --[[ line: 77 ]]
				-- upvalues: p0 (copy)
				p0.triggerTitleBarPromise = nil
				
				if not p0.state.isTriggered then
					p0:setState({ isTriggered = true })
				end
			end)
			
			return
		elseif not p0.state.isTriggered then
			p0:setState({ isTriggered = true })
		end
	end
	
	function p0.cancelTriggerTitleBar() --[[ line: 94 ]]
		-- upvalues: p0 (ref)
		if p0.triggerTitleBarPromise then
			p0.triggerTitleBarPromise:cancel()
			p0.triggerTitleBarPromise = nil
		end
	end
	
	function p0.hideTitleBar() --[[ line: 101 ]]
		-- upvalues: p0 (ref)
		if p0.state.isTriggered then
			p0:setState({ isTriggered = false })
		end
	end
	
	function p0.exitFullscreen() --[[ line: 109 ]]
		-- upvalues: p0 (ref)
		p0.hideTitleBar()
		p0.guiService:ToggleFullscreen()
	end
	
	function p0.closeRoblox() --[[ line: 114 ]]
		-- upvalues: p0 (ref), userLocalStoreModule (copy)
		p0.hideTitleBar()
		
		if p0.props.isEducationalPopupEnabled then
			p0.props.openEducationalPopup(p0.guiService, userLocalStoreModule.new(), p0.props.maxDisplayCount)
			
			return
		end
		p0.props.startLeavingGame()
	end
	
	function p0.onDisappear() --[[ line: 125 ]]
		-- upvalues: p0 (ref), getFFlagFixFullscreenTitleBarPromiseCancelModule (copy), promise (copy)
		if p0.hideTitleBarPromise then
			if getFFlagFixFullscreenTitleBarPromiseCancelModule() then
				p0.hideTitleBarPromise:cancel()
			else
				p0.hideTitleBarPromise.cancel()
			end
			p0.hideTitleBarPromise = nil
		end
		p0.hideTitleBarPromise = promise.delay(0.5):andThenCall(function() --[[ line: 135 ]]
			-- upvalues: p0 (copy)
			p0.hideTitleBarPromise = nil
			p0.hideTitleBar()
		end)
	end
	
	function p0.mouseReenter() --[[ line: 141 ]]
		-- upvalues: p0 (ref)
		if p0.state.isTriggered and p0.hideTitleBarPromise then
			p0.hideTitleBarPromise:cancel()
			p0.hideTitleBarPromise = nil
		end
	end
end

function fullscreenTitleBar_1.render(p2) --[[ line: 149 ]]
	-- upvalues: roact (ref), externalEventConnectionModule (ref), coreGuiService (ref), fullscreenTitleBar (ref)
	return roact.createFragment({
		FullscreenChangedEvent = roact.createElement(externalEventConnectionModule, {
			event = p2.userGameSettings.FullscreenChanged,
			callback = p2.onFullscreenChanged
		}),
		FullscreenTitleBar = roact.createElement(roact.Portal, { target = coreGuiService }, {
			InGameFullscreenTitleBarScreen = roact.createElement("ScreenGui", {
				IgnoreGuiInset = true,
				Enabled = p2.state.fullscreenEnabled,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
				DisplayOrder = p2.props.displayOrder
			}, {
				TriggerArea = roact.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 1),
					[roact.Event.MouseEnter] = p2.triggerTitleBar,
					[roact.Event.MouseLeave] = p2.cancelTriggerTitleBar
				}),
				Bar = roact.createElement(fullscreenTitleBar, {
					title = p2.props.titleText,
					isTriggered = p2.state.isTriggered,
					onDisappear = p2.onDisappear,
					onHover = p2.mouseReenter,
					exitFullscreen = p2.exitFullscreen,
					closeRoblox = p2.closeRoblox
				})
			})
		})
	})
end

function fullscreenTitleBar_1.didUpdate(p3, p4) --[[ line: 184 ]]
	if not p4.isMenuOpen and p3.props.isMenuOpen then
		p3.hideTitleBar()
	end
end

function fullscreenTitleBar_1.willUnmount(p5) --[[ line: 190 ]]
	if p5.hideTitleBarPromise then
		p5.hideTitleBarPromise:cancel()
	end
	if p5.triggerTitleBarPromise then
		p5.triggerTitleBarPromise:cancel()
	end
end

return roactRodux.UNSTABLE_connect2(function(p7, _) --[[ line: 207 ]]
	return { isMenuOpen = p7.isMenuOpen }
end, function(p8) --[[ line: 211 ]]
	-- upvalues: openEducationalPopupModule (ref), startLeavingGameModule (ref)
	return {
		openEducationalPopup = function(p9, p10, p11) --[[ line: 213 ]]
			-- upvalues: p8 (ref), openEducationalPopupModule (copy)
			return p8(openEducationalPopupModule(p9, p10, p11))
		end,
		startLeavingGame = function() --[[ line: 216 ]]
			-- upvalues: p8 (ref), startLeavingGameModule (copy)
			p8(startLeavingGameModule())
		end
	}
end)(inGameMenuPolicyModule.connect(function(p6, _) --[[ line: 200 ]]
	return {
		isEducationalPopupEnabled = p6.enableEducationalPopup(),
		maxDisplayCount = p6.educationalPopupMaxDisplayCount()
	}
end)(fullscreenTitleBar_1))