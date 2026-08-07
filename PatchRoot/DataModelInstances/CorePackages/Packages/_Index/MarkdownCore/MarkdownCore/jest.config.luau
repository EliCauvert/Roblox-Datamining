-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:47 2026 Pacific Standard Time.

return {
	testMatch = { "**/*.test" },
	testPathIgnorePatterns = { "_Index" },
	setupFilesAfterEnv = { script.Parent.setupJest },
	rootDir = script:FindFirstAncestor("Packages")._Workspace
}