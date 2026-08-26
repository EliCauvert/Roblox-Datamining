local corePackagesService = game:GetService("CorePackages")
local getClientReplicatorModule = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local actions = script.Parent.Parent.Parent.Actions
local appendRecentDumpPathModule = require(actions.AppendRecentDumpPath)
local setRCCProfilerStateModule = require(actions.SetRCCProfilerState)
local RCCProfilerDataCompleteListener = roactModule.Component:extend("RCCProfilerDataCompleteListener")

function RCCProfilerDataCompleteListener.didMount(p1)
	-- upvalues: getClientReplicatorModule (ref)
	local var1 = getClientReplicatorModule()
	
	if var1 then
		p1.completeSignal = var1.RCCProfilerDataComplete:Connect(function(p2, p3)
			-- upvalues: p1 (ref)
			if p1.props.waitingForRecording then
				if not p2 then
					warn(p3)
					p1.props.dispatchSetRCCProfilerState(false)
					
					return
				end
				p1.props.dispatchSetRCCProfilerState(false, p3)
				p1.props.dispatchAppendRecentDumpPath(p3)
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

function RCCProfilerDataCompleteListener.render(_)
	return nil
end

return roactRoduxModule.UNSTABLE_connect2(function(p1, _)
	return {
		waitingForRecording = p1.MicroProfiler.waitingForRecording
	}
end, function(p1)
	-- upvalues: appendRecentDumpPathModule (ref), setRCCProfilerStateModule (ref)
	return {
		dispatchAppendRecentDumpPath = function(p2)
			-- upvalues: p1 (ref), appendRecentDumpPathModule (copy)
			p1(appendRecentDumpPathModule(p2))
		end,
		dispatchSetRCCProfilerState = function(value, p2)
			-- upvalues: p1 (ref), setRCCProfilerStateModule (copy)
			p1(setRCCProfilerStateModule(value, p2))
		end
	}
end)(RCCProfilerDataCompleteListener)