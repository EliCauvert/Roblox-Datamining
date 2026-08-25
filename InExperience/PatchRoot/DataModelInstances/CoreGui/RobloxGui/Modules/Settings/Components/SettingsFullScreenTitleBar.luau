local corePackagesService = game:GetService("CorePackages")
local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")
local coreGuiService = game:GetService("CoreGui")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local UIBlox = inGameMenuDependenciesModule.UIBlox
local promise = inGameMenuDependenciesModule.Promise
local _ = require(corePackagesService.Packages.Dash)
local t = inGameMenuDependenciesModule.t
local inGameMenu = robloxGui.Modules.InGameMenu
local constantsModule = require(inGameMenu.Resources.Constants)
local fullscreenTitleBar = UIBlox.App.Bar.FullscreenTitleBar
local externalEventConnectionModule = require(inGameMenu.Utility.ExternalEventConnection)
local getDefaultQualityLevel = require(corePackagesService.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel
local renderWithCoreScriptsStyleProviderModule = require(robloxGui.Modules.Common.renderWithCoreScriptsStyleProvider)
local getFIntFullscreenTitleBarTriggerDelayMillisModule = require(inGameMenu.Flags.GetFIntFullscreenTitleBarTriggerDelayMillis)
local settingsFullScreenTitleBar = roact.PureComponent:extend("SettingsFullScreenTitleBar")
settingsFullScreenTitleBar.validateProps = t.strictInterface({
	titleText = t.optional(t.string),
	onClose = t.optional(t.callback),
	_mockFullScreen = t.optional(t.boolean)
})
settingsFullScreenTitleBar.defaultProps = { titleText = "Roblox" }

function settingsFullScreenTitleBar.init(p0)
	p0:setState({ isTriggered = false })
	
	function p0.show()
		-- upvalues: p0 (ref)
		p0:setTriggered(true)
	end
	
	function p0.hide()
		-- upvalues: p0 (ref)
		p0:setTriggered(false)
	end
	
	function p0.cancel()
		-- upvalues: p0 (ref)
		p0:unsetTriggered()
	end
	
	function p0.onFullscreenChanged()
		-- upvalues: p0 (ref)
		p0:unsetTriggered()
		p0:setState({ isTriggered = false })
	end
end

function settingsFullScreenTitleBar.setTriggered(value, p1)
	-- upvalues: userGameSettingsService (ref), promise (ref), getFIntFullscreenTitleBarTriggerDelayMillisModule (ref)
	value:unsetTriggered()
	
	if userGameSettingsService:InFullScreen() or value.props._mockFullScreen then
		value.triggerPromise = promise.delay(getFIntFullscreenTitleBarTriggerDelayMillisModule() / 1000):andThenCall(function()
			-- upvalues: value (ref), p1 (ref)
			value.triggerPromise = nil
			value:setState({ isTriggered = p1 })
		end)
	end
end

function settingsFullScreenTitleBar.unsetTriggered(value)
	if value.triggerPromise then
		value.triggerPromise:cancel()
		value.triggerPromise = nil
	end
end

function settingsFullScreenTitleBar.toggleFullscreen(_)
	-- upvalues: guiService (ref)
	guiService:ToggleFullscreen()
end

function settingsFullScreenTitleBar.leaveGame(_)
	-- upvalues: guiService (ref), runService (ref), getDefaultQualityLevel (ref)
	guiService.SelectedCoreObject = nil
	runService.RenderStepped:Wait()
	runService.RenderStepped:Wait()
	game:Shutdown()
	settings().Rendering.QualityLevel = getDefaultQualityLevel()
end

function settingsFullScreenTitleBar.render(p2)
	-- upvalues: roact (ref), coreGuiService (ref), constantsModule (ref), externalEventConnectionModule (ref), userGameSettingsService (ref), fullscreenTitleBar (ref), renderWithCoreScriptsStyleProviderModule (ref)
	return renderWithCoreScriptsStyleProviderModule({
		FullscreenTitleBar = roact.createElement(roact.Portal, { target = coreGuiService }, {
			InGameFullscreenTitleBarScreen = roact.createElement("ScreenGui", {
				Enabled = true,
				IgnoreGuiInset = true,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
				DisplayOrder = constantsModule.DisplayOrder.FullscreenTitleBar
			}, {
				FullscreenChangedEvent = roact.createElement(externalEventConnectionModule, {
					event = userGameSettingsService.FullscreenChanged,
					callback = p2.onFullscreenChanged
				}),
				TriggerArea = roact.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 1),
					[roact.Event.MouseEnter] = p2.show,
					[roact.Event.MouseLeave] = p2.cancel
				}),
				Bar = roact.createElement(fullscreenTitleBar, {
					title = p2.props.titleText,
					isTriggered = p2.state.isTriggered,
					onDisappear = p2.hide,
					onHover = p2.cancel,
					exitFullscreen = p2.toggleFullscreen,
					closeRoblox = p2.props.onClose or p2.leaveGame
				})
			})
		})
	})
end

function settingsFullScreenTitleBar.willUnmount(p3)
	p3:unsetTriggered()
end

return {
	mount = function(p4, p5, p6)
		-- upvalues: roact (ref), settingsFullScreenTitleBar (ref)
		return roact.mount(roact.createElement(settingsFullScreenTitleBar, p4 or {}), p5, p6)
	end,
	update = function(p7, p8)
		-- upvalues: roact (ref), settingsFullScreenTitleBar (ref)
		return roact.update(p7, roact.createElement(settingsFullScreenTitleBar, p8))
	end,
	unmount = function(p9)
		-- upvalues: roact (ref)
		return roact.unmount(p9)
	end
}