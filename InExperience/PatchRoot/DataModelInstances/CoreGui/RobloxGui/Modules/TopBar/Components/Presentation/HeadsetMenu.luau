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

function headsetMenu.init(p0) --[[ line: 37 ]]
	-- upvalues: isSubjectToDesktopPolicies (ref), runService (ref), fFlagTopBarSignalizeScreenSize (ref), displayModule (ref), signalsModule (ref)
	p0.state = {
		vrDeviceAvailable = false,
		shouldShowDisconnectDialog = false
	}
	
	function p0.restartApp() --[[ line: 43 ]]
		-- upvalues: p0 (ref), isSubjectToDesktopPolicies (copy), runService (copy)
		local notificationTypeList = p0.props.guiService:GetNotificationTypeList()
		
		if not isSubjectToDesktopPolicies() then
			runService.Heartbeat:Wait()
			game:Shutdown()
		elseif game:GetEngineFeature("EnableLuaControlsRestartApp") then
			p0.props.guiService:BroadcastNotification("", notificationTypeList.RESTART_APP)
		else
			p0.props.guiService:BroadcastNotification("", notificationTypeList.NATIVE_EXIT)
		end
		p0:setState({ shouldShowDisconnectDialog = false })
	end
	
	if fFlagTopBarSignalizeScreenSize then
		local getViewportSize = displayModule.GetDisplayStore(false).getViewportSize
		p0.disposeScreenSize = signalsModule.createEffect(function(p1) --[[ line: 65 ]]
			-- upvalues: p0 (ref), getViewportSize (ref)
			p0:setState({ screenSize = getViewportSize(p1) })
		end)
	end
end

function headsetMenu.render(p2) --[[ line: 73 ]]
	-- upvalues: roactModule (ref), eventConnectionModule (ref), disconnectedDialogModule (ref), fFlagTopBarSignalizeScreenSize (ref)
	return roactModule.createFragment({
		HeadsetConnection = roactModule.createElement(eventConnectionModule, {
			event = p2.props.vrService:GetPropertyChangedSignal("VRDeviceAvailable"),
			callback = function() --[[ line: 77 ]]
				-- upvalues: p2 (ref)
				p2:setState({ vrDeviceAvailable = p2.props.vrService.VRDeviceAvailable })
			end
		}, {
			HeadsetDisconnectedDialog = roactModule.createElement(disconnectedDialogModule, {
				visible = p2.state.shouldShowDisconnectDialog,
				screenSize = if fFlagTopBarSignalizeScreenSize then p2.state.screenSize else p2.props.screenSize,
				onConfirm = p2.restartApp,
				guiService = p2.props.guiService
			})
		})
	})
end

function headsetMenu.didMount(p3) --[[ line: 93 ]]
	p3:setState({ vrDeviceAvailable = p3.props.vrService.VRDeviceAvailable })
end

function headsetMenu.willUnmount(p4) --[[ line: 99 ]]
	-- upvalues: fFlagTopBarSignalizeScreenSize (ref)
	if fFlagTopBarSignalizeScreenSize then
		p4.disposeScreenSize()
	end
end

function headsetMenu.didUpdate(p5, _, p6) --[[ line: 105 ]]
	if p5.state.vrDeviceAvailable ~= p6.vrDeviceAvailable and not p5.state.vrDeviceAvailable then
		p5:setState({ shouldShowDisconnectDialog = true })
	end
end

if not fFlagTopBarSignalizeScreenSize then
	headsetMenu = roactRoduxModule.connect(function(p7) --[[ line: 116 ]]
		return { screenSize = p7.displayOptions.screenSize }
	end)(headsetMenu)
end
return headsetMenu