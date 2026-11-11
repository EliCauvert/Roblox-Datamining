local Parent = script.Parent.Parent.Parent
local _ = require(script.Parent["ReactRobloxHostTypes.roblox"])
local ReactGlobalsModule = require(Parent.ReactGlobals)
local _ = require(Parent.ReactReconciler)
local _ = require(Parent.Shared)
local _ = require(Parent.ReactReconciler)
local ReactRobloxComponentTreeModule = require(script.Parent.ReactRobloxComponentTree)
local MarkContainerAsRootFunction = ReactRobloxComponentTreeModule.markContainerAsRoot
local UnmarkContainerAsRootFunction = ReactRobloxComponentTreeModule.unmarkContainerAsRoot
local ReactReconcilerRobloxModule = require(script.Parent.Parent["ReactReconciler.roblox"])
local CreateContainerFunction = ReactReconcilerRobloxModule.createContainer
local UpdateContainerFunction = ReactReconcilerRobloxModule.updateContainer
local InvariantFunction = require(Parent.Shared).invariant
local EnableEagerRootListeners = require(Parent.Shared).ReactFeatureFlags.enableEagerRootListeners
local FlushSyncFunction = ReactReconcilerRobloxModule.flushSync
local FlushPassiveEffectsFunction = ReactReconcilerRobloxModule.flushPassiveEffects
local BlockingRoot = ReactReconcilerRobloxModule.ReactRootTags.BlockingRoot
local ConcurrentRoot = ReactReconcilerRobloxModule.ReactRootTags.ConcurrentRoot
local LegacyRoot = ReactReconcilerRobloxModule.ReactRootTags.LegacyRoot
local Callback = nil
local Module = {}
Module.__index = Module

function Module.new(p1, p2)
	-- upvalues: Module (copy), Callback (ref), ConcurrentRoot (copy)
	local self = setmetatable({}, Module)
	self._internalRoot = Callback(p1, ConcurrentRoot, p2)
	
	return self
end

local function _(p1, p2, p3)
	-- upvalues: Module (copy), Callback (ref)
	local self = setmetatable({}, Module)
	self._internalRoot = Callback(p1, p2, p3)
	
	return self
end

function Module:render(p1)
	-- upvalues: UpdateContainerFunction (copy)
	UpdateContainerFunction(p1, self._internalRoot, nil)
end

function Module:unmount()
	-- upvalues: FlushSyncFunction (copy), UpdateContainerFunction (copy), UnmarkContainerAsRootFunction (copy), FlushPassiveEffectsFunction (copy)
	local InternalRoot = self._internalRoot
	local ContainerInfo = InternalRoot.containerInfo
	FlushSyncFunction(function()
		-- upvalues: UpdateContainerFunction (upval), InternalRoot (copy), UnmarkContainerAsRootFunction (upval), ContainerInfo (copy)
		UpdateContainerFunction(nil, InternalRoot, nil, function()
			-- upvalues: UnmarkContainerAsRootFunction (upval), ContainerInfo (upval)
			UnmarkContainerAsRootFunction(ContainerInfo)
		end)
	end)
	FlushPassiveEffectsFunction()
end

Callback = function(p1, BlockingRoot, p2)
	-- upvalues: CreateContainerFunction (copy), MarkContainerAsRootFunction (copy), EnableEagerRootListeners (copy)
	local IsHydrate: boolean = p2 ~= nil and p2.hydrate == true
	local HydrationOptions = if p2 == nil then nil else p2.hydrationOptions
	
	if p2 == nil or p2.hydrationOptions == nil or p2.hydrationOptions.mutableSources then
	end
	local Container = CreateContainerFunction(p1, BlockingRoot, IsHydrate, HydrationOptions)
	MarkContainerAsRootFunction(Container.current, p1)
	
	return Container
end

local ReactRobloxRootModule = {
	isValidContainer = function(p1): boolean
		return typeof(p1) == "Instance"
	end,
	createRoot = function(p1, p2)
		-- upvalues: InvariantFunction (copy), Module (copy)
		InvariantFunction(typeof(p1) == "Instance", "createRoot(...): Target container is not a Roblox Instance.")
		warnIfReactDOMContainerInDEV(p1)
		
		return Module.new(p1, p2)
	end,
	createBlockingRoot = function(p1, p2)
		-- upvalues: InvariantFunction (copy), BlockingRoot (copy), Module (copy), Callback (ref)
		InvariantFunction(typeof(p1) == "Instance", "createRoot(...): Target container is not a Roblox Instance.")
		warnIfReactDOMContainerInDEV(p1)
		local self = setmetatable({}, Module)
		self._internalRoot = Callback(p1, BlockingRoot, p2)
		
		return self
	end,
	createLegacyRoot = function(p1, p2)
		-- upvalues: LegacyRoot (copy), Module (copy), Callback (ref)
		local self = setmetatable({}, Module)
		self._internalRoot = Callback(p1, LegacyRoot, p2)
		
		return self
	end
}

function warnIfReactDOMContainerInDEV(_)
	-- upvalues: ReactGlobalsModule (copy)
	local _ = ReactGlobalsModule.__DEV__
end

return ReactRobloxRootModule