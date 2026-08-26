local parent = script.Parent.Parent.Parent
local _ = require(script.Parent["ReactRobloxHostTypes.roblox"])
local reactGlobalsModule = require(parent.ReactGlobals)
local _ = require(parent.ReactReconciler)
local _ = require(parent.Shared)
local _ = require(parent.ReactReconciler)
local reactRobloxComponentTreeModule = require(script.Parent.ReactRobloxComponentTree)
local markContainerAsRoot = reactRobloxComponentTreeModule.markContainerAsRoot
local unmarkContainerAsRoot = reactRobloxComponentTreeModule.unmarkContainerAsRoot
local unknownModule = require(script.Parent.Parent["ReactReconciler.roblox"])
local createContainer = unknownModule.createContainer
local updateContainer = unknownModule.updateContainer
local invariant = require(parent.Shared).invariant
local enableEagerRootListeners = require(parent.Shared).ReactFeatureFlags.enableEagerRootListeners
local flushSync = unknownModule.flushSync
local flushPassiveEffects = unknownModule.flushPassiveEffects
local blockingRoot = unknownModule.ReactRootTags.BlockingRoot
local concurrentRoot = unknownModule.ReactRootTags.ConcurrentRoot
local legacyRoot = unknownModule.ReactRootTags.LegacyRoot
local var1 = nil
local t = {}
t.__index = t

function t.new(p1, p2)
	-- upvalues: t (ref), var1 (write), concurrentRoot (ref)
	local tbl = setmetatable({}, t)
	tbl._internalRoot = var1(p1, concurrentRoot, p2)
	
	return tbl
end

local function _(p1, p2, p3)
	-- upvalues: t (ref), var1 (write)
	local tbl = setmetatable({}, t)
	tbl._internalRoot = var1(p1, p2, p3)
	
	return tbl
end

function t:render(p1)
	-- upvalues: updateContainer (ref)
	updateContainer(p1, self._internalRoot, nil)
end

function t:unmount()
	-- upvalues: flushSync (ref), updateContainer (ref), unmarkContainerAsRoot (ref), flushPassiveEffects (ref)
	local internalRoot = self._internalRoot
	local containerInfo = internalRoot.containerInfo
	flushSync(function()
		-- upvalues: updateContainer (copy), internalRoot (ref), unmarkContainerAsRoot (copy), containerInfo (ref)
		updateContainer(nil, internalRoot, nil, function()
			-- upvalues: unmarkContainerAsRoot (copy), containerInfo (copy)
			unmarkContainerAsRoot(containerInfo)
		end)
	end)
	flushPassiveEffects()
end

var1 = function(p1, p2, p3)
	-- upvalues: createContainer (ref), markContainerAsRoot (ref), enableEagerRootListeners (ref)
	local var2 = p3 ~= nil and p3.hydrate == true
	local var3 = if p3 ~= nil then nil else p3.hydrationOptions
	
	if p3 ~= nil and p3.hydrationOptions ~= nil then
		local _ = p3.hydrationOptions.mutableSources or nil
	end
	local var4 = createContainer(p1, p2, var2, var3)
	markContainerAsRoot(var4.current, p1)
	
	return var4
end

local t_1 = {
	isValidContainer = function(p1)
		return typeof(p1) == "Instance"
	end,
	createRoot = function(p1, p2)
		-- upvalues: invariant (ref), t (ref)
		invariant(typeof(p1) == "Instance", "createRoot(...): Target container is not a Roblox Instance.")
		warnIfReactDOMContainerInDEV(p1)
		
		return t.new(p1, p2)
	end,
	createBlockingRoot = function(p1, p2)
		-- upvalues: invariant (ref), blockingRoot (ref), t (ref), var1 (write)
		invariant(typeof(p1) == "Instance", "createRoot(...): Target container is not a Roblox Instance.")
		warnIfReactDOMContainerInDEV(p1)
		local tbl = setmetatable({}, t)
		tbl._internalRoot = var1(p1, blockingRoot, p2)
		
		return tbl
	end,
	createLegacyRoot = function(p1, p2)
		-- upvalues: legacyRoot (ref), t (ref), var1 (write)
		local tbl = setmetatable({}, t)
		tbl._internalRoot = var1(p1, legacyRoot, p2)
		
		return tbl
	end
}

function warnIfReactDOMContainerInDEV(_)
	-- upvalues: reactGlobalsModule (ref) end

return t_1