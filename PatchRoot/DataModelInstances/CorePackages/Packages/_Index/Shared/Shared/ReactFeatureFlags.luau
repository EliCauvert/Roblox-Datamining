-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:20 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local reactGlobalsModule = require(parent.ReactGlobals)
local safeFlagsModule = require(parent.SafeFlags)

return {
	enableDebugTracing = false,
	enableSchedulingProfiler = safeFlagsModule.createGetFFlag("ReactEnableSchedulingProfiler")() or reactGlobalsModule.__PROFILE__ and reactGlobalsModule.__EXPERIMENTAL__,
	catchYieldingInDEV = reactGlobalsModule.__DEV__ and safeFlagsModule.createGetFFlag("ReactCatchYieldingInDEV")(),
	debugRenderPhaseSideEffectsForStrictMode = reactGlobalsModule.__DEV__,
	replayFailedUnitOfWorkWithInvokeGuardedCallback = reactGlobalsModule.__DEV__,
	warnAboutDeprecatedLifecycles = true,
	enableProfilerTimer = reactGlobalsModule.__PROFILE__,
	enableProfilerCommitHooks = reactGlobalsModule.__PROFILE__,
	enableSchedulerTracing = reactGlobalsModule.__PROFILE__,
	enableSuspenseServerRenderer = reactGlobalsModule.__EXPERIMENTAL__,
	enableBlocksAPI = reactGlobalsModule.__EXPERIMENTAL__,
	enableLazyElements = reactGlobalsModule.__EXPERIMENTAL__,
	enableSchedulerDebugging = false,
	enableFundamentalAPI = false,
	enableScopeAPI = false,
	enableCreateEventHandleAPI = false,
	warnAboutUnmockedScheduler = false,
	enableSuspenseCallback = false,
	warnAboutDefaultPropsOnFunctionComponents = false,
	warnAboutSpreadingKeyToJSX = true,
	enableComponentStackLocations = true,
	enableNewReconciler = true,
	skipUnmountedBoundaries = true,
	deletedTreeCleanUpLevel = safeFlagsModule.createGetFInt("ReactDeletedTreeCleanUpLevel", 1)(),
	enableNewTreeCleanupPath = safeFlagsModule.createGetFFlag("ReactEnableNewTreeCleanupPath", false)(),
	filterInternalStackFrames = reactGlobalsModule.__DEV__ and safeFlagsModule.createGetFFlag("ReactFilterInternalStackFrames")(),
	warnAboutStringRefs = false,
	disableLegacyContext = false,
	disableModulePatternComponents = false,
	warnUnstableRenderSubtreeIntoContainer = false,
	deferRenderPhaseUpdateToNextBatch = false,
	decoupleUpdatePriorityFromScheduler = true,
	enableEagerRootListeners = false,
	enableDoubleInvokingEffects = false
}