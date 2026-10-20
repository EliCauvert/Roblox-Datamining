return {
	testMatch = { "**/*.test" },
	testPathIgnorePatterns = { "_Index" },
	setupFilesAfterEnv = { script.Parent.setupJest },
	rootDir = script:FindFirstAncestor("Packages")._Workspace
}