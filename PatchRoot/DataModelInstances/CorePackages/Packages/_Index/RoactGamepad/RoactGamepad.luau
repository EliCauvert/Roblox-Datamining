-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:59 2026 Pacific Standard Time.

return {
	createRefCache = require(script.createRefCache),
	Focusable = require(script.createFocusableCache)(),
	Input = require(script.Input).PublicInterface,
	withFocusController = require(script.withFocusController),
	createFocusController = require(script.FocusController).createPublicApiWrapper,
	useRootFocusController = require(script.useRootFocusController),
	useFocusController = require(script.useFocusController),
	useRefCache = require(script.useRefCache),
	FocusContext = require(script.FocusContext),
	Config = require(script.Config)
}