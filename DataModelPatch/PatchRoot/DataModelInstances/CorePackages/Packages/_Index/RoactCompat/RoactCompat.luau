local Parent = script.Parent
local ReactModule = require(Parent.React)
local SharedModule = require(Parent.Shared)
local RoactTreeModule = require(script.RoactTree)

return {
	Ref = "ref",
	Children = "children",
	Component = ReactModule.Component,
	PureComponent = ReactModule.PureComponent,
	createElement = ReactModule.createElement,
	createRef = ReactModule.createRef,
	forwardRef = ReactModule.forwardRef,
	createContext = ReactModule.createContext,
	None = ReactModule.None,
	mount = RoactTreeModule.mount,
	update = RoactTreeModule.update,
	unmount = RoactTreeModule.unmount,
	createFragment = require(script.createFragment),
	oneChild = require(script.oneChild),
	setGlobalConfig = require(script.setGlobalConfig),
	Portal = require(script.Portal),
	Event = SharedModule.Event,
	Change = SharedModule.Change,
	createBinding = ReactModule.createBinding,
	joinBindings = ReactModule.joinBindings,
	act = require(Parent.ReactRoblox).act
}