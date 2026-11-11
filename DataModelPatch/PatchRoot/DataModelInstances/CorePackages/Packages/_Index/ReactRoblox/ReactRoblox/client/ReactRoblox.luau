local Parent = script.Parent.Parent.Parent
local ReactGlobalsModule = require(Parent.ReactGlobals)
local _ = require(Parent.Shared)
local _ = require(script.Parent["ReactRobloxHostTypes.roblox"])
local ReactRobloxRootModule = require(script.Parent.ReactRobloxRoot)
local IsValidContainerFunction = ReactRobloxRootModule.isValidContainer
local ReactReconcilerRobloxModule = require(script.Parent.Parent["ReactReconciler.roblox"])
local InjectIntoDevToolsFunction = ReactReconcilerRobloxModule.injectIntoDevTools
local CreatePortalFunction = ReactReconcilerRobloxModule.createPortal
local ReactVersion = require(Parent.Shared).ReactVersion
local InvariantFunction = require(Parent.Shared).invariant
local ReactRobloxComponentTreeModule = require(script.Parent.ReactRobloxComponentTree)
local GetClosestInstanceFromNode = ReactRobloxComponentTreeModule.getClosestInstanceFromNode
local ReactRobloxModule = {
	createPortal = function(p1, p2, p3)
		-- upvalues: InvariantFunction (copy), IsValidContainerFunction (copy), CreatePortalFunction (copy)
		InvariantFunction(IsValidContainerFunction(p2), "Target container is not a Roblox Instance.")
		
		return CreatePortalFunction(p1, p2, nil, p3)
	end,
	unstable_batchedUpdates = ReactReconcilerRobloxModule.batchedUpdates,
	flushSync = ReactReconcilerRobloxModule.flushSync,
	__SECRET_INTERNALS_DO_NOT_USE_OR_YOU_WILL_BE_FIRED = {
		Events = {
			getInstanceFromNode = ReactRobloxComponentTreeModule.getInstanceFromNode,
			getNodeFromInstance = ReactRobloxComponentTreeModule.getNodeFromInstance,
			getFiberCurrentPropsFromNode = ReactRobloxComponentTreeModule.getFiberCurrentPropsFromNode,
			flushPassiveEffects = ReactReconcilerRobloxModule.flushPassiveEffects,
			IsThisRendererActing = ReactReconcilerRobloxModule.IsThisRendererActing
		}
	},
	version = ReactVersion,
	createRoot = ReactRobloxRootModule.createRoot,
	createBlockingRoot = ReactRobloxRootModule.createBlockingRoot,
	createLegacyRoot = ReactRobloxRootModule.createLegacyRoot,
	Event = require(Parent.Shared).Event,
	Change = require(Parent.Shared).Change,
	Tag = require(Parent.Shared).Tag,
	unstable_isNewReconciler = require(Parent.Shared).ReactFeatureFlags.enableNewReconciler,
	act = function(_)
		error("ReactRoblox.act is only available in testing environments, not production. Enable the `__ROACT_17_MOCK_SCHEDULER__` global in your test configuration in order to use `act`.")
	end
}

if ReactGlobalsModule.__ROACT_17_MOCK_SCHEDULER__ then
	ReactRobloxModule.act = ReactReconcilerRobloxModule.act
end
local _ = InjectIntoDevToolsFunction({
	rendererPackageName = "ReactRoblox",
	findFiberByHostInstance = GetClosestInstanceFromNode,
	bundleType = if ReactGlobalsModule.__DEV__ then 1 else 0,
	version = ReactVersion
})
local _ = ReactGlobalsModule.__DEV__
ReactRobloxModule.robloxReactProfiling = ReactReconcilerRobloxModule.robloxReactProfiling
ReactRobloxModule.schedulingProfiler = ReactReconcilerRobloxModule.schedulingProfiler

return ReactRobloxModule