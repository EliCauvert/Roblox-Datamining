local corePackagesService = game:GetService("CorePackages")
local getClientReplicatorModule = require(script.Parent.Parent.Parent.Util.getClientReplicator)
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local actions = script.Parent.Parent.Parent.Actions
local appendRecentDumpPathModule = require(actions.AppendRecentDumpPath)
local setRCCProfilerStateModule = require(actions.SetRCCProfilerState)
local RCCProfilerDataCompleteListener = roactModule.Component:extend("RCCProfilerDataCompleteListener")

function RCCProfilerDataCompleteListener.didMount(p0)
	-- upvalues: getClientReplicatorModule (ref)
	local var7 = getClientReplicatorModule()
	
	if var7 then
		p0.completeSignal = var7.RCCProfilerDataComplete:Connect(function(p1, p2)
			-- upvalues: p0 (ref)
			if p0.props.waitingForRecording then
				if not p1 then
					warn(p2)
					p0.props.dispatchSetRCCProfilerState(false)
					
					return
				end
				p0.props.dispatchSetRCCProfilerState(false, p2)
				p0.props.dispatchAppendRecentDumpPath(p2)
			end
		end)
	end
end

function RCCProfilerDataCompleteListener.willUnmount(p3)
	if p3.completeSignal then
		p3.completeSignal:Disconnect()
		p3.completeSignal = nil
	end
end

function RCCProfilerDataCompleteListener.render(_)
	return nil
end

return roactRoduxModule.UNSTABLE_connect2(function(p4, _)
	return {
		waitingForRecording = p4.MicroProfiler.waitingForRecording
	}
end, function(p5)
	-- upvalues: appendRecentDumpPathModule (ref), setRCCProfilerStateModule (ref)
	return {
		dispatchAppendRecentDumpPath = function(p6)
			-- upvalues: p5 (ref), appendRecentDumpPathModule (copy)
			p5(appendRecentDumpPathModule(p6))
		end,
		dispatchSetRCCProfilerState = function(value, p7)
			-- upvalues: p5 (ref), setRCCProfilerStateModule (copy)
			p5(setRCCProfilerStateModule(value, p7))
		end
	}
end)(RCCProfilerDataCompleteListener)