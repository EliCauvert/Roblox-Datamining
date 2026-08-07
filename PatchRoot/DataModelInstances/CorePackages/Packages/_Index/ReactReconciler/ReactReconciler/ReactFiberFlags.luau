-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:34 2026 Pacific Standard Time.

return {
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
	LifecycleEffectMask = 932,
	HostEffectMask = 2047,
	Incomplete = 2048,
	ShouldCapture = 4096,
	ForceUpdateForLegacySuspense = 16384,
	PassiveStatic = 32768,
	BeforeMutationMask = 778,
	MutationMask = 1182,
	LayoutMask = 164,
	PassiveMask = 520,
	StaticMask = 32768,
	MountLayoutDev = 65536,
	MountPassiveDev = 131072
}