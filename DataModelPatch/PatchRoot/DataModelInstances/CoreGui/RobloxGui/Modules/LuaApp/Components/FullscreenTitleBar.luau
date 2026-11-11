local CorePackages = game:GetService("CorePackages")
local CoreGui = game:GetService("CoreGui")
local Modules = CoreGui.RobloxGui.Modules
local RoactModule = require(CorePackages.Packages.Roact)
local PromiseModule = require(CorePackages.Packages.Promise)
local TModule = require(CorePackages.Packages.t)
local CryoModule = require(CorePackages.Packages.Cryo)
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local UseIsInFullScreenFunction = require(CorePackages.Workspace.Packages.Responsive).useIsInFullScreen
local NotificationTypeModule = require(Modules.LuaApp.Enum.NotificationType)
local ScreenGuiWithBlurControlModule = require(Modules.LuaApp.Components.ScreenGuiWithBlurControl)
local FullscreenTitleBar = require(CorePackages.Packages.UIBlox).App.Bar.FullscreenTitleBar
local GetFIntFullscreenTitleBarTriggerDelayMillisModule = require(Modules.LuaApp.Flags.GetFIntFullscreenTitleBarTriggerDelayMillis)
local GetFFlagFixFullscreenTitleBarPromiseCancelModule = require(Modules.LuaApp.Flags.GetFFlagFixFullscreenTitleBarPromiseCancel)
local FullscreenTitleBar1 = RoactModule.PureComponent:extend("FullscreenTitleBar")
FullscreenTitleBar1.validateProps = TModule.strictInterface({
	titleText = TModule.optional(TModule.string),
	displayOrder = TModule.integer,
	isInFullScreen = TModule.boolean,
	guiService = TModule.optional(TModule.union(TModule.Instance, TModule.table))
})
FullscreenTitleBar1.defaultProps = { titleText = "Roblox", displayOrder = 1 }

function FullscreenTitleBar1.init(p1)
	-- upvalues: GetFIntFullscreenTitleBarTriggerDelayMillisModule (copy), PromiseModule (copy), GetFFlagFixFullscreenTitleBarPromiseCancelModule (copy), NotificationTypeModule (copy)
	p1:setState({ isTriggered = false })
	
	function p1.triggerTitleBar()
		-- upvalues: GetFIntFullscreenTitleBarTriggerDelayMillisModule (upval), p1 (copy), PromiseModule (upval)
		local FIntFullscreenTitleBarTriggerDelayMillisModuleRatio = GetFIntFullscreenTitleBarTriggerDelayMillisModule() / 1000
		
		if FIntFullscreenTitleBarTriggerDelayMillisModuleRatio > 0 then
			p1.triggerTitleBarPromise = PromiseModule.delay(FIntFullscreenTitleBarTriggerDelayMillisModuleRatio):andThenCall(function()
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
	
	function p1.onDisappear()
		-- upvalues: p1 (copy), GetFFlagFixFullscreenTitleBarPromiseCancelModule (upval), PromiseModule (upval)
		if p1.hideTitleBarPromise then
			if GetFFlagFixFullscreenTitleBarPromiseCancelModule() then
				p1.hideTitleBarPromise:cancel()
			else
				p1.hideTitleBarPromise.cancel()
			end
			p1.hideTitleBarPromise = nil
		end
		p1.hideTitleBarPromise = PromiseModule.delay(0.5):andThenCall(function()
			-- upvalues: p1 (upval)
			p1.hideTitleBarPromise = nil
			
			if p1.state.isTriggered then
				p1:setState({ isTriggered = false })
			end
		end)
	end
	
	function p1.exitFullscreen()
		-- upvalues: p1 (copy)
		if p1.state.isTriggered then
			p1:setState({ isTriggered = false })
		end
		p1.props.guiService:ToggleFullscreen()
	end
	
	function p1.closeRoblox()
		-- upvalues: p1 (copy), NotificationTypeModule (upval)
		p1.props.guiService:BroadcastNotification("", NotificationTypeModule.NATIVE_EXIT)
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
	-- upvalues: RoactModule (copy), CoreGui (copy), ScreenGuiWithBlurControlModule (copy), FullscreenTitleBar (copy)
	return if p1.props.isInFullScreen then RoactModule.createElement(RoactModule.Portal, { target = CoreGui }, {
		FullscreenTitleBarScreen = RoactModule.createElement(ScreenGuiWithBlurControlModule, {
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling,
			DisplayOrder = p1.props.displayOrder
		}, {
			TriggerArea = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				[RoactModule.Event.MouseEnter] = p1.triggerTitleBar,
				[RoactModule.Event.MouseLeave] = p1.cancelTriggerTitleBar
			}),
			Bar = RoactModule.createElement(FullscreenTitleBar, {
				title = p1.props.titleText,
				isTriggered = p1.state.isTriggered,
				onDisappear = p1.onDisappear,
				onHover = p1.mouseReenter,
				exitFullscreen = p1.exitFullscreen,
				closeRoblox = p1.closeRoblox
			})
		})
	}) else nil
end

function FullscreenTitleBar1.willUnmount(p1)
	if p1.hideTitleBarPromise then
		p1.hideTitleBarPromise:cancel()
	end
	if p1.triggerTitleBarPromise then
		p1.triggerTitleBarPromise:cancel()
	end
end

return function(p1)
	-- upvalues: UseRoactServiceFunction (copy), AppGuiService (copy), UseIsInFullScreenFunction (copy), CryoModule (copy), RoactModule (copy), FullscreenTitleBar1 (copy)
	return RoactModule.createElement(FullscreenTitleBar1, (CryoModule.Dictionary.join(p1, {
		guiService = UseRoactServiceFunction(AppGuiService),
		isInFullScreen = UseIsInFullScreenFunction()
	})))
end