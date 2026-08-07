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
local var3 = nil
local t = {}
t.__index = t

function t.new(p0, p1) --[[ line: 66 ]]
	-- upvalues: t (ref), var3 (write), concurrentRoot (ref)
	local tbl = setmetatable({}, t)
	tbl._internalRoot = var3(p0, concurrentRoot, p1)
	
	return tbl
end

local function _(p2, p3, p4) --[[ line: 73 | named "createBlockingRoot" ]]
	-- upvalues: t (ref), var3 (write)
	local tbl = setmetatable({}, t)
	tbl._internalRoot = var3(p2, p3, p4)
	
	return tbl
end

function t:render(p5) --[[ line: 85 ]]
	-- upvalues: updateContainer (ref)
	updateContainer(p5, self._internalRoot, nil)
end

function t:unmount() --[[ line: 113 ]]
	-- upvalues: flushSync (ref), updateContainer (ref), unmarkContainerAsRoot (ref), flushPassiveEffects (ref)
	local internalRoot = self._internalRoot
	local containerInfo = internalRoot.containerInfo
	flushSync(function() --[[ line: 126 ]]
		-- upvalues: updateContainer (copy), internalRoot (ref), unmarkContainerAsRoot (copy), containerInfo (ref)
		updateContainer(nil, internalRoot, nil, function() --[[ line: 127 ]]
			-- upvalues: unmarkContainerAsRoot (copy), containerInfo (copy)
			unmarkContainerAsRoot(containerInfo)
		end)
	end)
	flushPassiveEffects()
end

var3 = function(p6, p7, p8) --[[ line: 141 ]]
	-- upvalues: createContainer (ref), markContainerAsRoot (ref), enableEagerRootListeners (ref)
	local var8 = p8 ~= nil and p8.hydrate == true
	local var9 = if p8 ~= nil then nil else p8.hydrationOptions
	
	if p8 ~= nil and p8.hydrationOptions ~= nil then
		local _ = p8.hydrationOptions.mutableSources or nil
	end
	local var10 = createContainer(p6, p7, var8, var9)
	markContainerAsRoot(var10.current, p6)
	
	return var10
end

local t_1 = {
	isValidContainer = function(p9) --[[ line: 189 ]]
		return typeof(p9) == "Instance"
	end,
	createRoot = function(p10, p11) --[[ line: 212 ]]
		-- upvalues: invariant (ref), t (ref)
		invariant(typeof(p10) == "Instance", "createRoot(...): Target container is not a Roblox Instance.")
		warnIfReactDOMContainerInDEV(p10)
		
		return t.new(p10, p11)
	end,
	createBlockingRoot = function(p12, p13) --[[ line: 222 ]]
		-- upvalues: invariant (ref), blockingRoot (ref), t (ref), var3 (write)
		invariant(typeof(p12) == "Instance", "createRoot(...): Target container is not a Roblox Instance.")
		warnIfReactDOMContainerInDEV(p12)
		local tbl = setmetatable({}, t)
		tbl._internalRoot = var3(p12, blockingRoot, p13)
		
		return tbl
	end,
	createLegacyRoot = function(p14, p15) --[[ line: 235 ]]
		-- upvalues: legacyRoot (ref), t (ref), var3 (write)
		local tbl = setmetatable({}, t)
		tbl._internalRoot = var3(p14, legacyRoot, p15)
		
		return tbl
	end
}

function warnIfReactDOMContainerInDEV(_) --[[ line: 239 ]]
	-- upvalues: reactGlobalsModule (ref) end

return t_1