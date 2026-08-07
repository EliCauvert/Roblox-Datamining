-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:51 2026 Pacific Standard Time.

local parent = script.Parent

return {
	projects = {
		require(parent.Components.Tests)["jest.config"],
		require(parent.Thunks.Tests)["jest.config"],
		require(parent.Utils.Tests)["jest.config"]
	}
}