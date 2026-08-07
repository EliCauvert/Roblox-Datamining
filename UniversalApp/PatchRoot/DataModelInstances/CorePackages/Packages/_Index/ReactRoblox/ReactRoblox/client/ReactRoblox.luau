local parent = script.Parent.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local _ = require(parent.Shared)
local _ = require(script.Parent["ReactRobloxHostTypes.roblox"])
local _ = nil
local reactRobloxRootModule = require(script.Parent.ReactRobloxRoot)
reactRobloxRootModule = reactRobloxRootModule.createRoot
local createBlockingRoot = reactRobloxRootModule.createBlockingRoot
local createLegacyRoot = reactRobloxRootModule.createLegacyRoot
local isValidContainer = reactRobloxRootModule.isValidContainer
local unknownModule = require(script.Parent.Parent["ReactReconciler.roblox"])
local batchedUpdates = unknownModule.batchedUpdates
local flushSync = unknownModule.flushSync
local injectIntoDevTools = unknownModule.injectIntoDevTools
local flushPassiveEffects = unknownModule.flushPassiveEffects
local isThisRendererActing = unknownModule.IsThisRendererActing
local createPortal = unknownModule.createPortal
local reactVersion = require(parent.Shared).ReactVersion
local invariant = require(parent.Shared).invariant
local enableNewReconciler = require(parent.Shared).ReactFeatureFlags.enableNewReconciler
local reactRobloxComponentTreeModule = require(script.Parent.ReactRobloxComponentTree)
local getClosestInstanceFromNode = reactRobloxComponentTreeModule.getClosestInstanceFromNode
local t = {
	createPortal = function(p0, p1, p2) --[[ line: 135 ]]
		-- upvalues: invariant (ref), isValidContainer (ref), createPortal (ref)
		invariant(isValidContainer(p1), "Target container is not a Roblox Instance.")
		
		return createPortal(p0, p1, nil, p2)
	end,
	unstable_batchedUpdates = batchedUpdates,
	flushSync = flushSync,
	__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED = {
		Events = {
			getInstanceFromNode = reactRobloxComponentTreeModule.getInstanceFromNode,
			getNodeFromInstance = reactRobloxComponentTreeModule.getNodeFromInstance,
			getFiberCurrentPropsFromNode = reactRobloxComponentTreeModule.getFiberCurrentPropsFromNode,
			flushPassiveEffects = flushPassiveEffects,
			IsThisRendererActing = isThisRendererActing
		}
	},
	version = reactVersion,
	createRoot = reactRobloxRootModule,
	createBlockingRoot = createBlockingRoot,
	createLegacyRoot = createLegacyRoot,
	Event = require(parent.Shared).Event,
	Change = require(parent.Shared).Change,
	Tag = require(parent.Shared).Tag,
	unstable_isNewReconciler = enableNewReconciler,
	act = function(_) --[[ line: 276 ]]
		error("ReactRoblox.act is only available in testing environments, not production. Enable the `__ROACT_17_MOCK_SCHEDULER__` global in your test configuration in order to use `act`.")
	end
}

if reactGlobalsModule.__ROACT_17_MOCK_SCHEDULER__ then
	t.act = unknownModule.act
end
local _ = injectIntoDevTools({
	rendererPackageName = "ReactRoblox",
	findFiberByHostInstance = getClosestInstanceFromNode,
	bundleType = if reactGlobalsModule.__DEV__ then 1 else 0,
	version = reactVersion
})
t.robloxReactProfiling = unknownModule.robloxReactProfiling
t.schedulingProfiler = unknownModule.schedulingProfiler

return t