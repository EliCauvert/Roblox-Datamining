local corePackagesService = game:GetService("CorePackages")
local _ = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
local runService = game:GetService("RunService")
local VRService = game:GetService("VRService")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local tModule = require(corePackagesService.Packages.t)
local signalsModule = require(corePackagesService.Packages.Signals)
local displayModule = require(corePackagesService.Workspace.Packages.Display)
local eventConnectionModule = require(script.Parent.Parent.Parent.Parent.Common.EventConnection)
local isSubjectToDesktopPolicies = require(corePackagesService.Workspace.Packages.SharedFlags).isSubjectToDesktopPolicies
local fFlagTopBarSignalizeScreenSize = require(corePackagesService.Workspace.Packages.CoreGuiCommon).Flags.FFlagTopBarSignalizeScreenSize
local disconnectedDialogModule = require(script.DisconnectedDialog)
local headsetMenu = roactModule.PureComponent:extend("HeadsetMenu")
headsetMenu.validateProps = tModule.strictInterface({
	screenSize = if fFlagTopBarSignalizeScreenSize then nil else tModule.Vector2,
	vrService = tModule.optional(tModule.union(tModule.instanceOf("VRService"), tModule.table)),
	guiService = tModule.optional(tModule.union(tModule.instanceOf("GuiService"), tModule.table))
})
headsetMenu.defaultProps = { vrService = VRService, guiService = guiService }

function headsetMenu.init(p1)
	-- upvalues: isSubjectToDesktopPolicies (ref), runService (ref), fFlagTopBarSignalizeScreenSize (ref), displayModule (ref), signalsModule (ref)
	p1.state = {
		vrDeviceAvailable = false,
		shouldShowDisconnectDialog = false
	}
	
	function p0.restartApp()
		-- upvalues: p1 (ref), isSubjectToDesktopPolicies (copy), runService (copy)
		local notificationTypeList = p1.props.guiService:GetNotificationTypeList()
		
		if not isSubjectToDesktopPolicies() then
			runService.Heartbeat:Wait()
			game:Shutdown()
		elseif game:GetEngineFeature("EnableLuaControlsRestartApp") then
			p1.props.guiService:BroadcastNotification("", notificationTypeList.RESTART_APP)
		else
			p1.props.guiService:BroadcastNotification("", notificationTypeList.NATIVE_EXIT)
		end
		p1:setState({ shouldShowDisconnectDialog = false })
	end
	
	if fFlagTopBarSignalizeScreenSize then
		local getViewportSize = displayModule.GetDisplayStore(false).getViewportSize
		p1.disposeScreenSize = signalsModule.createEffect(function(p2)
			-- upvalues: p1 (ref), getViewportSize (ref)
			p1:setState({ screenSize = getViewportSize(p2) })
		end)
	end
end

function headsetMenu.render(p1)
	-- upvalues: roactModule (ref), eventConnectionModule (ref), disconnectedDialogModule (ref), fFlagTopBarSignalizeScreenSize (ref)
	return roactModule.createFragment({
		HeadsetConnection = roactModule.createElement(eventConnectionModule, {
			event = p1.props.vrService:GetPropertyChangedSignal("VRDeviceAvailable"),
			callback = function()
				-- upvalues: p1 (ref)
				p1:setState({ vrDeviceAvailable = p1.props.vrService.VRDeviceAvailable })
			end
		}, {
			HeadsetDisconnectedDialog = roactModule.createElement(disconnectedDialogModule, {
				visible = p1.state.shouldShowDisconnectDialog,
				screenSize = if fFlagTopBarSignalizeScreenSize then p1.state.screenSize else p1.props.screenSize,
				onConfirm = p1.restartApp,
				guiService = p1.props.guiService
			})
		})
	})
end

function headsetMenu.didMount(p1)
	p1:setState({ vrDeviceAvailable = p1.props.vrService.VRDeviceAvailable })
end

function headsetMenu.willUnmount(p1)
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref)
	if fFlagTopBarSignalizeScreenSize then
		p1.disposeScreenSize()
	end
end

function headsetMenu.didUpdate(p1, _, p2)
	if p1.state.vrDeviceAvailable ~= p2.vrDeviceAvailable and not p1.state.vrDeviceAvailable then
		p1:setState({ shouldShowDisconnectDialog = true })
	end
end

if not fFlagTopBarSignalizeScreenSize then
	headsetMenu = roactRoduxModule.connect(function(p1)
		return { screenSize = p1.displayOptions.screenSize }
	end)(headsetMenu)
end
return headsetMenu