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

function settingsFullScreenTitleBar.init(p1)
	p1:setState({ isTriggered = false })
	
	function p0.show()
		-- upvalues: p1 (ref)
		p1:setTriggered(true)
	end
	
	function p0.hide()
		-- upvalues: p1 (ref)
		p1:setTriggered(false)
	end
	
	function p0.cancel()
		-- upvalues: p1 (ref)
		p1:unsetTriggered()
	end
	
	function p0.onFullscreenChanged()
		-- upvalues: p1 (ref)
		p1:unsetTriggered()
		p1:setState({ isTriggered = false })
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

function settingsFullScreenTitleBar.render(p1)
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
					callback = p1.onFullscreenChanged
				}),
				TriggerArea = roact.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 1),
					[roact.Event.MouseEnter] = p1.show,
					[roact.Event.MouseLeave] = p1.cancel
				}),
				Bar = roact.createElement(fullscreenTitleBar, {
					title = p1.props.titleText,
					isTriggered = p1.state.isTriggered,
					onDisappear = p1.hide,
					onHover = p1.cancel,
					exitFullscreen = p1.toggleFullscreen,
					closeRoblox = p1.props.onClose or p1.leaveGame
				})
			})
		})
	})
end

function settingsFullScreenTitleBar.willUnmount(p1)
	p1:unsetTriggered()
end

return {
	mount = function(p1, p2, p3)
		-- upvalues: roact (ref), settingsFullScreenTitleBar (ref)
		return roact.mount(roact.createElement(settingsFullScreenTitleBar, p1 or {}), p2, p3)
	end,
	update = function(p1, p2)
		-- upvalues: roact (ref), settingsFullScreenTitleBar (ref)
		return roact.update(p1, roact.createElement(settingsFullScreenTitleBar, p2))
	end,
	unmount = function(p1)
		-- upvalues: roact (ref)
		return roact.unmount(p1)
	end
}