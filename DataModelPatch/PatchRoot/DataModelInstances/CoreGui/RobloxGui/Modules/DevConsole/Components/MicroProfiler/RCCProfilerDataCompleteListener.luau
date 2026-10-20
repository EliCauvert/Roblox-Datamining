local CorePackages = game:GetService("CorePackages")
local GetClientReplicatorModule = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Actions = script.Parent.Parent.Parent.Actions
local AppendRecentDumpPathModule = require(Actions.AppendRecentDumpPath)
local SetRCCProfilerStateModule = require(Actions.SetRCCProfilerState)
local RCCProfilerDataCompleteListener = require(CorePackages.Packages.Roact).Component:extend("RCCProfilerDataCompleteListener")

function RCCProfilerDataCompleteListener.didMount(p1)
	-- upvalues: GetClientReplicatorModule (copy)
	local ClientReplicatorModule = GetClientReplicatorModule()
	
	if ClientReplicatorModule then
		p1.completeSignal = ClientReplicatorModule.RCCProfilerDataComplete:Connect(function(Success, Message)
			-- upvalues: p1 (copy)
			if p1.props.waitingForRecording then
				if not Success then
					warn(Message)
					p1.props.dispatchSetRCCProfilerState(false)
					
					return
				end
				p1.props.dispatchSetRCCProfilerState(false, Message)
				p1.props.dispatchAppendRecentDumpPath(Message)
			end
		end)
	end
end

function RCCProfilerDataCompleteListener.willUnmount(p1)
	if p1.completeSignal then
		p1.completeSignal:Disconnect()
		p1.completeSignal = nil
	end
end

function RCCProfilerDataCompleteListener:render()
	return nil
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		waitingForRecording = p1.MicroProfiler.waitingForRecording
	}
end, function(Callback)
	-- upvalues: AppendRecentDumpPathModule (copy), SetRCCProfilerStateModule (copy)
	return {
		dispatchAppendRecentDumpPath = function(p1)
			-- upvalues: Callback (copy), AppendRecentDumpPathModule (upval)
			Callback(AppendRecentDumpPathModule(p1))
		end,
		dispatchSetRCCProfilerState = function(p1, p2)
			-- upvalues: Callback (copy), SetRCCProfilerStateModule (upval)
			Callback(SetRCCProfilerStateModule(p1, p2))
		end
	}
end)(RCCProfilerDataCompleteListener)