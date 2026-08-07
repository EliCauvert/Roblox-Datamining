-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:30:59 2026 Pacific Standard Time.

local parent = script.Parent
local reactModule = require(parent.React)
local reactRobloxModule = require(parent.ReactRoblox)
local sharedModule = require(parent.Shared)
local roactTreeModule = require(script.RoactTree)

return {
	Ref = "ref",
	Children = "children",
	Component = reactModule.Component,
	PureComponent = reactModule.PureComponent,
	createElement = reactModule.createElement,
	createRef = reactModule.createRef,
	forwardRef = reactModule.forwardRef,
	createContext = reactModule.createContext,
	None = reactModule.None,
	mount = roactTreeModule.mount,
	update = roactTreeModule.update,
	unmount = roactTreeModule.unmount,
	createFragment = require(script.createFragment),
	oneChild = require(script.oneChild),
	setGlobalConfig = require(script.setGlobalConfig),
	Portal = require(script.Portal),
	Event = sharedModule.Event,
	Change = sharedModule.Change,
	createBinding = reactModule.createBinding,
	joinBindings = reactModule.joinBindings,
	act = reactRobloxModule.act
}