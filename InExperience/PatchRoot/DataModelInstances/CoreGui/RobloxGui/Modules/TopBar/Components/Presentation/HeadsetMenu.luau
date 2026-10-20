local CorePackages = game:GetService("CorePackages")
local _ = game:GetService("CoreGui")
local GuiService = game:GetService("GuiService")
local RunService = game:GetService("RunService")
local VRService = game:GetService("VRService")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local SignalsModule = require(CorePackages.Packages.Signals)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local EventConnectionModule = require(script.Parent.Parent.Parent.Parent.Common.EventConnection)
local IsSubjectToDesktopPoliciesFunction = require(CorePackages.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies
local FFlagTopBarSignalizeScreenSize = require(CorePackages.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize
local DisconnectedDialogModule = require(script.DisconnectedDialog)
local HeadsetMenu = RoactModule.PureComponent:extend("HeadsetMenu")
HeadsetMenu.validateProps = TModule.strictInterface({
	screenSize = if FFlagTopBarSignalizeScreenSize then nil else TModule.Vector2,
	vrService = TModule.optional(TModule.union(TModule.instanceOf("VRService"), TModule.table)),
	guiService = TModule.optional(TModule.union(TModule.instanceOf("GuiService"), TModule.table))
})
HeadsetMenu.defaultProps = { vrService = VRService, guiService = GuiService }

function HeadsetMenu.init(p1)
	-- upvalues: IsSubjectToDesktopPoliciesFunction (copy), RunService (copy), FFlagTopBarSignalizeScreenSize (copy), DisplayModule (copy), SignalsModule (copy)
	p1.state = {
		vrDeviceAvailable = false,
		shouldShowDisconnectDialog = false
	}
	
	function p1.restartApp()
		-- upvalues: p1 (copy), IsSubjectToDesktopPoliciesFunction (upval), RunService (upval)
		local NotificationTypeList = p1.props.guiService:GetNotificationTypeList()
		
		if IsSubjectToDesktopPoliciesFunction() then
			if game:GetEngineFeature("EnableLuaControlsRestartApp") then
				p1.props.guiService:BroadcastNotification("", NotificationTypeList.RESTART_APP)
			else
				p1.props.guiService:BroadcastNotification("", NotificationTypeList.NATIVE_EXIT)
			end
		else
			RunService.Heartbeat:Wait()
			game:Shutdown()
		end
		p1:setState({ shouldShowDisconnectDialog = false })
	end
	
	if FFlagTopBarSignalizeScreenSize then
		local GetViewportSizeFunction = DisplayModule.GetDisplayStore(false).getViewportSize
		p1.disposeScreenSize = SignalsModule.createEffect(function(p2)
			-- upvalues: p1 (copy), GetViewportSizeFunction (copy)
			p1:setState({ screenSize = GetViewportSizeFunction(p2) })
		end)
	end
end

function HeadsetMenu.render(p1)
	-- upvalues: RoactModule (copy), EventConnectionModule (copy), DisconnectedDialogModule (copy), FFlagTopBarSignalizeScreenSize (copy)
	return RoactModule.createFragment({
		HeadsetConnection = RoactModule.createElement(EventConnectionModule, {
			event = p1.props.vrService:GetPropertyChangedSignal("VRDeviceAvailable"),
			callback = function()
				-- upvalues: p1 (copy)
				p1:setState({ vrDeviceAvailable = p1.props.vrService.VRDeviceAvailable })
			end
		}, {
			HeadsetDisconnectedDialog = RoactModule.createElement(DisconnectedDialogModule, {
				visible = p1.state.shouldShowDisconnectDialog,
				screenSize = if FFlagTopBarSignalizeScreenSize then p1.state.screenSize else p1.props.screenSize,
				onConfirm = p1.restartApp,
				guiService = p1.props.guiService
			})
		})
	})
end

function HeadsetMenu.didMount(p1)
	p1:setState({ vrDeviceAvailable = p1.props.vrService.VRDeviceAvailable })
end

function HeadsetMenu.willUnmount(p1)
	-- upvalues: FFlagTopBarSignalizeScreenSize (copy)
	if FFlagTopBarSignalizeScreenSize then
		p1.disposeScreenSize()
	end
end

function HeadsetMenu.didUpdate(p1, _, p2)
	if p1.state.vrDeviceAvailable ~= p2.vrDeviceAvailable and not p1.state.vrDeviceAvailable then
		p1:setState({ shouldShowDisconnectDialog = true })
	end
end

if not FFlagTopBarSignalizeScreenSize then
	HeadsetMenu = RoactRoduxModule.connect(function(p1)
		return { screenSize = p1.displayOptions.screenSize }
	end)(HeadsetMenu)
end
return HeadsetMenu