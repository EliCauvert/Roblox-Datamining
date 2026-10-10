local t = {
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
	t.BeforeMutationMask = 266
	t.MutationMask = 263326
else
	t.BeforeMutationMask = 778
	t.MutationMask = 1182
end
t.LayoutMask = 164
t.PassiveMask = 520
t.StaticMask = 32768
t.MountLayoutDev = 65536
t.MountPassiveDev = 131072

return t