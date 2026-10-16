local Parent = script.Parent.Parent
local _ = require(script.Parent.ReactInternalTypes)
local _ = require(script.Parent.ReactFiberLane)
local _ = require(script.Parent["ReactFiberSuspenseComponent.new"])
local ResetWorkInProgressVersionsFunction = require(script.Parent["ReactMutableSource.new"]).resetWorkInProgressVersions
local ReactWorkTagsModule = require(script.Parent.ReactWorkTags)
local ReactFiberFlagsModule = require(script.Parent.ReactFiberFlags)
local ReactTypeOfModeModule = require(script.Parent.ReactTypeOfMode)
local ReactFeatureFlags = require(Parent.Shared).ReactFeatureFlags
local EnableSuspenseServerRenderer = ReactFeatureFlags.enableSuspenseServerRenderer
local EnableProfilerTimer = ReactFeatureFlags.enableProfilerTimer
local ReactFiberHostContextNewModule = require(script.Parent["ReactFiberHostContext.new"])
local PopHostContainerFunction = ReactFiberHostContextNewModule.popHostContainer
local PopHostContextFunction = ReactFiberHostContextNewModule.popHostContext
local PopSuspenseContextFunction = require(script.Parent["ReactFiberSuspenseContext.new"]).popSuspenseContext
local ResetHydrationStateFunction = require(script.Parent["ReactFiberHydrationContext.new"]).resetHydrationState
local ReactFiberContextNewModule = require(script.Parent["ReactFiberContext.new"])
local IsContextProviderFunction = ReactFiberContextNewModule.isContextProvider
local PopContextFunction = ReactFiberContextNewModule.popContext
local PopTopLevelContextObjectFunction = ReactFiberContextNewModule.popTopLevelContextObject
local PopProviderFunction = require(script.Parent["ReactFiberNewContext.new"]).popProvider
local PopRenderLanes = nil

local function v13(...) --[[ Line: 47 ]]
	-- upvalues: PopRenderLanes (ref)
	if not PopRenderLanes then
		PopRenderLanes = require(script.Parent["ReactFiberWorkLoop.new"]).popRenderLanes
	end
	return PopRenderLanes(...)
end

local TransferActualDurationFunction = require(script.Parent["ReactProfilerTimer.new"]).transferActualDuration
local InvariantFunction = require(Parent.Shared).invariant

local function unwindWork(p1, _) --[[ Line: 59 ]]
	-- upvalues: ReactWorkTagsModule (copy), IsContextProviderFunction (copy), PopContextFunction (copy), ReactFiberFlagsModule (copy), EnableProfilerTimer (copy), ReactTypeOfModeModule (copy), TransferActualDurationFunction (copy), PopHostContainerFunction (copy), PopTopLevelContextObjectFunction (copy), ResetWorkInProgressVersionsFunction (copy), InvariantFunction (copy), PopHostContextFunction (copy), PopSuspenseContextFunction (copy), EnableSuspenseServerRenderer (copy), ResetHydrationStateFunction (copy), PopProviderFunction (copy), v13 (copy)
	if p1.tag == ReactWorkTagsModule.ClassComponent then
		if IsContextProviderFunction(p1.type) then
			PopContextFunction(p1)
		end
		local Flags: number = p1.flags
		
		if bit32.band(Flags, ReactFiberFlagsModule.ShouldCapture) == 0 then
			return nil
		end
		p1.flags = bit32.bor(bit32.band(Flags, (bit32.bnot(ReactFiberFlagsModule.ShouldCapture))), ReactFiberFlagsModule.DidCapture)
		
		if EnableProfilerTimer and bit32.band(p1.mode, ReactTypeOfModeModule.ProfileMode) ~= ReactTypeOfModeModule.NoMode then
			TransferActualDurationFunction(p1)
		end
		return p1
	else
		if p1.tag == ReactWorkTagsModule.HostRoot then
			PopHostContainerFunction(p1)
			PopTopLevelContextObjectFunction(p1)
			ResetWorkInProgressVersionsFunction()
			local Flags: number = p1.flags
			InvariantFunction(bit32.band(Flags, ReactFiberFlagsModule.DidCapture) == ReactFiberFlagsModule.NoFlags, "The root failed to unmount after an error. This is likely a bug in React. Please file an issue.")
			p1.flags = bit32.bor(bit32.band(Flags, (bit32.bnot(ReactFiberFlagsModule.ShouldCapture))), ReactFiberFlagsModule.DidCapture)
			
			return p1
		end
		if p1.tag == ReactWorkTagsModule.HostComponent then
			PopHostContextFunction(p1)
			
			return nil
		end
		if p1.tag == ReactWorkTagsModule.SuspenseComponent then
			PopSuspenseContextFunction(p1)
			
			if EnableSuspenseServerRenderer then
				local MemoizedState = p1.memoizedState
				
				if MemoizedState ~= nil and MemoizedState.dehydrated ~= nil then
					InvariantFunction(p1.alternate ~= nil, "Threw in newly mounted dehydrated component. This is likely a bug in React. Please file an issue.")
					ResetHydrationStateFunction()
				end
			end
			local Flags: number = p1.flags
			
			if bit32.band(Flags, ReactFiberFlagsModule.ShouldCapture) == 0 then
				return nil
			end
			p1.flags = bit32.bor(bit32.band(Flags, (bit32.bnot(ReactFiberFlagsModule.ShouldCapture))), ReactFiberFlagsModule.DidCapture)
			
			if EnableProfilerTimer and bit32.band(p1.mode, ReactTypeOfModeModule.ProfileMode) ~= ReactTypeOfModeModule.NoMode then
				TransferActualDurationFunction(p1)
			end
			return p1
		elseif p1.tag == ReactWorkTagsModule.SuspenseListComponent then
			PopSuspenseContextFunction(p1)
			
			return nil
		elseif p1.tag == ReactWorkTagsModule.HostPortal then
			PopHostContainerFunction(p1)
			
			return nil
		elseif p1.tag == ReactWorkTagsModule.ContextProvider then
			PopProviderFunction(p1)
			
			return nil
		elseif p1.tag == ReactWorkTagsModule.OffscreenComponent or p1.tag == ReactWorkTagsModule.LegacyHiddenComponent then
			v13(p1)
			
			return nil
		else
			return nil
		end
	end
end

function unwindInterruptedWork(p1) --[[ Line: 154 ]]
	-- upvalues: ReactWorkTagsModule (copy), PopContextFunction (copy), PopHostContainerFunction (copy), PopTopLevelContextObjectFunction (copy), ResetWorkInProgressVersionsFunction (copy), PopHostContextFunction (copy), PopSuspenseContextFunction (copy), PopProviderFunction (copy), v13 (copy)
	if p1.tag == ReactWorkTagsModule.ClassComponent then
		if (if typeof(p1.type) == "table" then p1.type.childContextTypes else nil) ~= nil then
			PopContextFunction(p1)
			
			return
		end
		return
	elseif p1.tag == ReactWorkTagsModule.HostRoot then
		PopHostContainerFunction(p1)
		PopTopLevelContextObjectFunction(p1)
		ResetWorkInProgressVersionsFunction()
		
		return
	else
		if p1.tag == ReactWorkTagsModule.HostComponent then
			PopHostContextFunction(p1)
			
			return
		end
		if p1.tag == ReactWorkTagsModule.HostPortal then
			PopHostContainerFunction(p1)
			
			return
		end
		if p1.tag == ReactWorkTagsModule.SuspenseComponent then
			PopSuspenseContextFunction(p1)
			
			return
		end
		if p1.tag == ReactWorkTagsModule.SuspenseListComponent then
			PopSuspenseContextFunction(p1)
			
			return
		end
		if p1.tag == ReactWorkTagsModule.ContextProvider then
			PopProviderFunction(p1)
			
			return
		end
		if p1.tag == ReactWorkTagsModule.OffscreenComponent or p1.tag == ReactWorkTagsModule.LegacyHiddenComponent then
			v13(p1)
			
			return
		end
	end
end

return {
	unwindWork = unwindWork,
	unwindInterruptedWork = unwindInterruptedWork
}