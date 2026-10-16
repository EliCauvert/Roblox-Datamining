local Parent = script:FindFirstAncestor("Moments").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(script.Parent.Types)

local function noop() --[[ Line: 24 ]] end

local Signal = SignalsModule.createSignal(false)
local Context = ReactModule.createContext({
	analytics = nil,
	store = require(script.Parent.createPagerStore)(),
	getActiveIndex = SignalsModule.createSignal(1),
	getScrollState = SignalsModule.createSignal("Idle"),
	scrollToIndex = noop,
	next = noop,
	previous = noop,
	removeItem = noop
})
local Context1 = ReactModule.createContext({
	index = 0,
	item = nil,
	getIsActive = Signal,
	getIsVisible = Signal
})

return {
	VerticalPagerContext = Context,
	PagerItemContext = Context1,
	useVerticalPager = function() --[[ Line: 61 ]]
		-- upvalues: ReactModule (copy), Context (copy)
		return (ReactModule.useContext(Context))
	end,
	usePagerItem = function() --[[ Line: 75 ]]
		-- upvalues: ReactModule (copy), Context1 (copy)
		return (ReactModule.useContext(Context1))
	end,
	useIsPagerItemActive = function() --[[ Line: 84 ]]
		-- upvalues: ReactModule (copy), Context1 (copy), SignalsReactModule (copy)
		return SignalsReactModule.useSignalState(ReactModule.useContext(Context1).getIsActive)
	end
}