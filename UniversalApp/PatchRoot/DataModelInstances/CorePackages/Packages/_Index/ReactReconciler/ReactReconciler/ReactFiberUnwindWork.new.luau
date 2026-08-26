local parent = script.Parent.Parent
local _ = require(script.Parent.ReactInternalTypes)
local _ = require(script.Parent.ReactFiberLane)
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"])
local resetWorkInProgressVersions = require(script.Parent["ReactMutableSource.new"]).resetWorkInProgressVersions
local reactWorkTagsModule = require(script.Parent.ReactWorkTags)
local reactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local reactTypeOfModeModule = require(script.Parent.ReactTypeOfMode)
local reactFeatureFlags = require(parent.Shared).ReactFeatureFlags
local enableSuspenseServerRenderer = reactFeatureFlags.enableSuspenseServerRenderer
local enableProfilerTimer = reactFeatureFlags.enableProfilerTimer
local unknownModule = require(script.Parent["ReactFiberHostContext.new"])
local popHostContainer = unknownModule.popHostContainer
local popHostContext = unknownModule.popHostContext
local popSuspenseContext = require(script.Parent["ReactFiberSuspenseContext.new"]).popSuspenseContext
local resetHydrationState = require(script.Parent["ReactFiberHydrationContext.new"]).resetHydrationState
local unknownModule_1 = require(script.Parent["ReactFiberContext.new"])
local isContextProvider = unknownModule_1.isContextProvider
local popContext = unknownModule_1.popContext
local popTopLevelContextObject = unknownModule_1.popTopLevelContextObject
local popProvider = require(script.Parent["ReactFiberNewContext.new"]).popProvider
local var1 = nil

local var2 = function(...)
	-- upvalues: var1 (write)
	if not var1 then
		var1 = require(script.Parent["ReactFiberWorkLoop.new"]).popRenderLanes
	end
	return var1(...)
end

local transferActualDuration = require(script.Parent["ReactProfilerTimer.new"]).transferActualDuration
local invariant = require(parent.Shared).invariant

local function unwindWork(p1, _)
	-- upvalues: reactWorkTagsModule (ref), isContextProvider (ref), popContext (ref), reactFiberFlagsModule (ref), enableProfilerTimer (ref), reactTypeOfModeModule (ref), transferActualDuration (ref), popHostContainer (ref), popTopLevelContextObject (ref), resetWorkInProgressVersions (ref), invariant (ref), popHostContext (ref), popSuspenseContext (ref), enableSuspenseServerRenderer (ref), resetHydrationState (ref), popProvider (ref), var2 (ref)
	if p1.tag == reactWorkTagsModule.ClassComponent then
		if isContextProvider(p1.type) then
			popContext(p1)
		end
		local flags = p1.flags
		
		if bit32.band(flags, reactFiberFlagsModule.ShouldCapture) == 0 then
			return nil
		end
		p1.flags = bit32.bor(bit32.band(flags, bit32.bnot(reactFiberFlagsModule.ShouldCapture)), reactFiberFlagsModule.DidCapture)
		
		if enableProfilerTimer and bit32.band(p1.mode, reactTypeOfModeModule.ProfileMode) ~= reactTypeOfModeModule.NoMode then
			transferActualDuration(p1)
		end
		return p1
	elseif p1.tag == reactWorkTagsModule.HostRoot then
		popHostContainer(p1)
		popTopLevelContextObject(p1)
		resetWorkInProgressVersions()
		local flags = p1.flags
		invariant(bit32.band(flags, reactFiberFlagsModule.DidCapture) == reactFiberFlagsModule.NoFlags, "The root failed to unmount after an error. This is likely a bug in React. Please file an issue.")
		p1.flags = bit32.bor(bit32.band(flags, bit32.bnot(reactFiberFlagsModule.ShouldCapture)), reactFiberFlagsModule.DidCapture)
		
		return p1
	elseif p1.tag == reactWorkTagsModule.HostComponent then
		popHostContext(p1)
		
		return nil
	elseif p1.tag == reactWorkTagsModule.SuspenseComponent then
		popSuspenseContext(p1)
		
		if enableSuspenseServerRenderer then
			local memoizedState = p1.memoizedState
			
			if memoizedState ~= nil and memoizedState.dehydrated ~= nil then
				invariant(p1.alternate ~= nil, "Threw in newly mounted dehydrated component. This is likely a bug in React. Please file an issue.")
				resetHydrationState()
			end
		end
		local flags = p1.flags
		
		if bit32.band(flags, reactFiberFlagsModule.ShouldCapture) == 0 then
			return nil
		end
		p1.flags = bit32.bor(bit32.band(flags, bit32.bnot(reactFiberFlagsModule.ShouldCapture)), reactFiberFlagsModule.DidCapture)
		
		if enableProfilerTimer and bit32.band(p1.mode, reactTypeOfModeModule.ProfileMode) ~= reactTypeOfModeModule.NoMode then
			transferActualDuration(p1)
		end
		return p1
	elseif p1.tag == reactWorkTagsModule.SuspenseListComponent then
		popSuspenseContext(p1)
		
		return nil
	elseif p1.tag == reactWorkTagsModule.HostPortal then
		popHostContainer(p1)
		
		return nil
	elseif p1.tag == reactWorkTagsModule.ContextProvider then
		popProvider(p1)
		
		return nil
	elseif p1.tag == reactWorkTagsModule.OffscreenComponent or p1.tag == reactWorkTagsModule.LegacyHiddenComponent then
		var2(p1)
		
		return nil
	end
	return nil
end

function unwindInterruptedWork(p1)
	-- upvalues: reactWorkTagsModule (ref), popContext (ref), popHostContainer (ref), popTopLevelContextObject (ref), resetWorkInProgressVersions (ref), popHostContext (ref), popSuspenseContext (ref), popProvider (ref), var2 (ref)
	if p1.tag == reactWorkTagsModule.ClassComponent then
		if (if typeof(p1.type) == "table" then p1.type.childContextTypes else nil) == nil then
			return
		end
		popContext(p1)
		
		return
	elseif p1.tag == reactWorkTagsModule.HostRoot then
		popHostContainer(p1)
		popTopLevelContextObject(p1)
		resetWorkInProgressVersions()
		
		return
	elseif p1.tag == reactWorkTagsModule.HostComponent then
		popHostContext(p1)
		
		return
	elseif p1.tag == reactWorkTagsModule.HostPortal then
		popHostContainer(p1)
		
		return
	elseif p1.tag == reactWorkTagsModule.SuspenseComponent then
		popSuspenseContext(p1)
		
		return
	elseif p1.tag == reactWorkTagsModule.SuspenseListComponent then
		popSuspenseContext(p1)
		
		return
	elseif p1.tag == reactWorkTagsModule.ContextProvider then
		popProvider(p1)
		
		return
	elseif p1.tag == reactWorkTagsModule.OffscreenComponent or p1.tag == reactWorkTagsModule.LegacyHiddenComponent then
		var2(p1)
		
		return
	end
end

return {
	unwindWork = unwindWork,
	unwindInterruptedWork = unwindInterruptedWork
}