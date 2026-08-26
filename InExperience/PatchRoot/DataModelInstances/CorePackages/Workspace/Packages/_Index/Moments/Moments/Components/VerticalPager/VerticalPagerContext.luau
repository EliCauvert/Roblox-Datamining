local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.Types)
local createPagerStoreModule = require(script.Parent.createPagerStore)

local function noop() end

local var1 = signalsModule.createSignal(false)
local var2 = reactModule.createContext({
	analytics = nil,
	store = createPagerStoreModule(),
	getActiveIndex = signalsModule.createSignal(1),
	getScrollState = signalsModule.createSignal("Idle"),
	scrollToIndex = noop,
	next = noop,
	previous = noop,
	removeItem = noop
})
local var3 = reactModule.createContext({
	index = 0,
	item = nil,
	getIsActive = var1,
	getIsVisible = var1
})

return {
	VerticalPagerContext = var2,
	PagerItemContext = var3,
	useVerticalPager = function()
		-- upvalues: reactModule (ref), var2 (ref)
		return reactModule.useContext(var2)
	end,
	usePagerItem = function()
		-- upvalues: reactModule (ref), var3 (ref)
		return reactModule.useContext(var3)
	end,
	useIsPagerItemActive = function()
		-- upvalues: reactModule (ref), var3 (ref), signalsReactModule (ref)
		return signalsReactModule.useSignalState(reactModule.useContext(var3).getIsActive)
	end
}