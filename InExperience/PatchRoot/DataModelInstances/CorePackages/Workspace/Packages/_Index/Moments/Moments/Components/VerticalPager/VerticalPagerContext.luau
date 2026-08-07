local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.Types)
local createPagerStoreModule = require(script.Parent.createPagerStore)

local function noop() --[[ line: 24 ]] end

local var5 = signalsModule.createSignal(false)
local var6 = reactModule.createContext({
	analytics = nil,
	store = createPagerStoreModule(),
	getActiveIndex = signalsModule.createSignal(1),
	getScrollState = signalsModule.createSignal("Idle"),
	scrollToIndex = noop,
	next = noop,
	previous = noop,
	removeItem = noop
})
local var7 = reactModule.createContext({
	index = 0,
	item = nil,
	getIsActive = var5,
	getIsVisible = var5
})

return {
	VerticalPagerContext = var6,
	PagerItemContext = var7,
	useVerticalPager = function() --[[ line: 61 ]]
		-- upvalues: reactModule (ref), var6 (ref)
		return reactModule.useContext(var6)
	end,
	usePagerItem = function() --[[ line: 75 ]]
		-- upvalues: reactModule (ref), var7 (ref)
		return reactModule.useContext(var7)
	end,
	useIsPagerItemActive = function() --[[ line: 84 ]]
		-- upvalues: reactModule (ref), var7 (ref), signalsReactModule (ref)
		return signalsReactModule.useSignalState(reactModule.useContext(var7).getIsActive)
	end
}