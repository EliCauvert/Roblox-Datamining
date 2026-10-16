local ReactFiberFlagsModule = {
	NoFlags = 0,
	PerformedWork = 1,
	Placement = 2,
	Update = 4,
	PlacementAndUpdate = 6,
	Deletion = 8,
	ContentReset = 16,
	Callback = 32,
	DidCapture = 64,
	Ref = 128,
	Snapshot = 256,
	Passive = 512,
	PassiveUnmountPendingDev = 8192,
	Hydrating = 1024,
	HydratingAndUpdate = 1028,
	HostUpdate = 262144,
	LifecycleEffectMask = 932,
	HostEffectMask = 2047,
	Incomplete = 2048,
	ShouldCapture = 4096,
	ForceUpdateForLegacySuspense = 16384,
	PassiveStatic = 32768
}

if require(script.Parent.Parent.Shared).ReactFeatureFlags.enableCommitTraversalTrims then
	ReactFiberFlagsModule.BeforeMutationMask = 266
	ReactFiberFlagsModule.MutationMask = 263326
else
	ReactFiberFlagsModule.BeforeMutationMask = 778
	ReactFiberFlagsModule.MutationMask = 1182
end
ReactFiberFlagsModule.LayoutMask = 164
ReactFiberFlagsModule.PassiveMask = 520
ReactFiberFlagsModule.StaticMask = 32768
ReactFiberFlagsModule.MountLayoutDev = 65536
ReactFiberFlagsModule.MountPassiveDev = 131072

return ReactFiberFlagsModule