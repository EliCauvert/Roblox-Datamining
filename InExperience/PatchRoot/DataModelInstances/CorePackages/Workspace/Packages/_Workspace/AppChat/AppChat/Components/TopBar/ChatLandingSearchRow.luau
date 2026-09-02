local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local enumScreensModule = require(appChat.EnumScreens)
local getTopBarStoreModule = require(appChat.Stores.GetTopBarStore)
local chatSearchFieldContainerModule = require(script.Parent.ChatSearchField.ChatSearchFieldContainer)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useSignalBinding = signalsReactModule.useSignalBinding
local useSignalState = signalsReactModule.useSignalState

local function getFilterText(p1)
	-- upvalues: getTopBarStoreModule (ref), enumScreensModule (ref)
	return getTopBarStoreModule(p1).getScreenTopBar(enumScreensModule.ChatLanding)(p1).filterText or ""
end

local function getShouldAutoFocus(p1)
	-- upvalues: getTopBarStoreModule (ref), enumScreensModule (ref)
	return getTopBarStoreModule(p1).getScreenTopBar(enumScreensModule.ChatLanding)(p1).shouldAutoFocusCenter or false
end

local function _(p1)
	-- upvalues: enumScreensModule (ref)
	p1(enumScreensModule.ChatLanding, { shouldRenderCenter = false, filterText = "" })
end

local function SearchBackButton(p1)
	-- upvalues: getTopBarStoreModule (ref), reactModule (ref), enumScreensModule (ref), foundationModule (ref)
	local setScreenTopBar = getTopBarStoreModule(false).setScreenTopBar
	
	return reactModule.createElement(foundationModule.IconButton, {
		testId = "ChatLandingSearchBack",
		icon = foundationModule.Enums.IconName.ChevronLargeLeft,
		size = foundationModule.Enums.InputSize.Medium,
		LayoutOrder = p1.LayoutOrder,
		onActivated = reactModule.useCallback(function()
			-- upvalues: setScreenTopBar (ref), enumScreensModule (copy)
			setScreenTopBar(enumScreensModule.ChatLanding, { shouldRenderCenter = false, filterText = "" })
		end, { setScreenTopBar })
	})
end

local function SearchField()
	-- upvalues: getTopBarStoreModule (ref), useSignalBinding (ref), getFilterText (ref), useSignalState (ref), getShouldAutoFocus (ref), reactModule (ref), enumScreensModule (ref), chatSearchFieldContainerModule (ref)
	local setScreenTopBar = getTopBarStoreModule(false).setScreenTopBar
	local var1 = useSignalBinding(getFilterText)
	local var2 = useSignalState(getShouldAutoFocus)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), setScreenTopBar (ref), enumScreensModule (copy)
		if var2 then
			setScreenTopBar(enumScreensModule.ChatLanding, { shouldAutoFocusCenter = false })
		end
	end, { var2, setScreenTopBar })
	
	return reactModule.createElement(chatSearchFieldContainerModule, {
		text = var1,
		shouldAutoFocus = var2,
		onChanged = reactModule.useCallback(function(p1)
			-- upvalues: setScreenTopBar (ref), enumScreensModule (copy)
			setScreenTopBar(enumScreensModule.ChatLanding, { filterText = p1 })
		end, { setScreenTopBar }),
		onExit = reactModule.useCallback(function()
			-- upvalues: setScreenTopBar (ref), enumScreensModule (copy)
			setScreenTopBar(enumScreensModule.ChatLanding, { shouldRenderCenter = false, filterText = "" })
		end, { setScreenTopBar })
	})
end

return function()
	-- upvalues: reactModule (ref), foundationModule (ref), SearchBackButton (ref), SearchField (ref)
	return reactModule.createElement(foundationModule.View, { tag = "row align-y-center gap-small size-full" }, {
		back = reactModule.createElement(SearchBackButton, { LayoutOrder = 1 }),
		field = reactModule.createElement(foundationModule.View, { tag = "grow auto-y", LayoutOrder = 2 }, { input = reactModule.createElement(SearchField) })
	})
end