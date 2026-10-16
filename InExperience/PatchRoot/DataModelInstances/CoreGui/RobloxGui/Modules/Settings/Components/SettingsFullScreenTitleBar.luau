local CorePackages = game:GetService("CorePackages")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local CoreGui = game:GetService("CoreGui")
local RobloxGui = CoreGui:WaitForChild("RobloxGui")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local Promise = InGameMenuDependenciesModule.Promise
local _ = require(CorePackages.Packages.Dash)
local T = InGameMenuDependenciesModule.t
local InGameMenu = RobloxGui.Modules.InGameMenu
local ConstantsModule = require(InGameMenu.Resources.Constants)
local FullscreenTitleBar = InGameMenuDependenciesModule.UIBlox.App.Bar.FullscreenTitleBar
local ExternalEventConnectionModule = require(InGameMenu.Utility.ExternalEventConnection)
local GetDefaultQualityLevelFunction = require(CorePackages.Workspace.Packages.AppCommonLib).GetDefaultQualityLevel
local RenderWithCoreScriptsStyleProviderModule = require(RobloxGui.Modules.Common.renderWithCoreScriptsStyleProvider)
local GetFIntFullscreenTitleBarTriggerDelayMillisModule = require(InGameMenu.Flags.GetFIntFullscreenTitleBarTriggerDelayMillis)
local SettingsFullScreenTitleBar = Roact.PureComponent:extend("SettingsFullScreenTitleBar")
SettingsFullScreenTitleBar.validateProps = T.strictInterface({
	titleText = T.optional(T.string),
	onClose = T.optional(T.callback),
	_mockFullScreen = T.optional(T.boolean)
})
SettingsFullScreenTitleBar.defaultProps = { titleText = "Roblox" }

function SettingsFullScreenTitleBar.init(p1) --[[ Line: 44 ]]
	p1:setState({ isTriggered = false })
	
	function p1.show() --[[ Line: 49 ]]
		-- upvalues: p1 (copy)
		p1:setTriggered(true)
	end
	
	function p1.hide() --[[ Line: 52 ]]
		-- upvalues: p1 (copy)
		p1:setTriggered(false)
	end
	
	function p1.cancel() --[[ Line: 55 ]]
		-- upvalues: p1 (copy)
		p1:unsetTriggered()
	end
	
	function p1.onFullscreenChanged() --[[ Line: 58 ]]
		-- upvalues: p1 (copy)
		p1:unsetTriggered()
		p1:setState({ isTriggered = false })
	end
end

function SettingsFullScreenTitleBar.setTriggered(p1, IsTriggered) --[[ Line: 66 ]]
	-- upvalues: UserGameSettings (copy), Promise (copy), GetFIntFullscreenTitleBarTriggerDelayMillisModule (copy)
	p1:unsetTriggered()
	
	if UserGameSettings:InFullScreen() or p1.props._mockFullScreen then
		p1.triggerPromise = Promise.delay(GetFIntFullscreenTitleBarTriggerDelayMillisModule() / 1000):andThenCall(function() --[[ Line: 69 ]]
			-- upvalues: p1 (copy), IsTriggered (copy)
			p1.triggerPromise = nil
			p1:setState({ isTriggered = IsTriggered })
		end)
	end
end

function SettingsFullScreenTitleBar.unsetTriggered(p1) --[[ Line: 78 ]]
	if p1.triggerPromise then
		p1.triggerPromise:cancel()
		p1.triggerPromise = nil
	end
end

function SettingsFullScreenTitleBar:toggleFullscreen() --[[ Line: 85 ]]
	-- upvalues: GuiService (copy)
	GuiService:ToggleFullscreen()
end

function SettingsFullScreenTitleBar:leaveGame() --[[ Line: 89 ]]
	-- upvalues: GuiService (copy), RunService (copy), GetDefaultQualityLevelFunction (copy)
	GuiService.SelectedCoreObject = nil
	RunService.RenderStepped:Wait()
	RunService.RenderStepped:Wait()
	game:Shutdown()
	settings().Rendering.QualityLevel = GetDefaultQualityLevelFunction()
end

function SettingsFullScreenTitleBar.render(p1) --[[ Line: 103 ]]
	-- upvalues: Roact (copy), CoreGui (copy), ConstantsModule (copy), ExternalEventConnectionModule (copy), UserGameSettings (copy), FullscreenTitleBar (copy), RenderWithCoreScriptsStyleProviderModule (copy)
	return RenderWithCoreScriptsStyleProviderModule({
		FullscreenTitleBar = Roact.createElement(Roact.Portal, { target = CoreGui }, {
			InGameFullscreenTitleBarScreen = Roact.createElement("ScreenGui", {
				Enabled = true,
				IgnoreGuiInset = true,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
				DisplayOrder = ConstantsModule.DisplayOrder.FullscreenTitleBar
			}, {
				FullscreenChangedEvent = Roact.createElement(ExternalEventConnectionModule, {
					event = UserGameSettings.FullscreenChanged,
					callback = p1.onFullscreenChanged
				}),
				TriggerArea = Roact.createElement("Frame", {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Size = UDim2.new(1, 0, 0, 1),
					[Roact.Event.MouseEnter] = p1.show,
					[Roact.Event.MouseLeave] = p1.cancel
				}),
				Bar = Roact.createElement(FullscreenTitleBar, {
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

function SettingsFullScreenTitleBar.willUnmount(p1) --[[ Line: 139 ]]
	p1:unsetTriggered()
end

return {
	mount = function(Element, p1, p2) --[[ Line: 144 ]]
		-- upvalues: Roact (copy), SettingsFullScreenTitleBar (copy)
		return Roact.mount(Roact.createElement(SettingsFullScreenTitleBar, Element or {}), p1, p2)
	end,
	update = function(p1, Element) --[[ Line: 147 ]]
		-- upvalues: Roact (copy), SettingsFullScreenTitleBar (copy)
		return Roact.update(p1, Roact.createElement(SettingsFullScreenTitleBar, Element))
	end,
	unmount = function(p1) --[[ Line: 150 ]]
		-- upvalues: Roact (copy)
		return Roact.unmount(p1)
	end
}