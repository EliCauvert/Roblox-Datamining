local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FoundationProvider = FoundationModule.FoundationProvider
local SnackbarDEPRECATED = FoundationModule.Snackbar_DEPRECATED
local Toast = FoundationModule.Toast
local View = FoundationModule.View
local ColorMode = FoundationModule.Enums.ColorMode
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseScreenSizeFunction = MomentsCommonModule.Hooks.useScreenSize
local UseStatusBarHeightFunction = MomentsCommonModule.Hooks.useStatusBarHeight
local UseTokensFunction = FoundationModule.Hooks.useTokens
local SwipeableToastContainerModule = require(Moments.Components.SwipeableToast.SwipeableToastContainer)
local ThumbnailToastModule = require(Moments.Components.ThumbnailToast)
local GetToastStoreModule = require(Moments.Stores.GetToastStore)
local _ = require(Moments.Stores.GetToastStore.createToastStore)
local ConstantsModule = require(Moments.Constants)
local MomentLayoutModule = require(Moments.Components.Feed.Items.Moment.momentLayout)
local UseScreenBottomInsetModule = require(Moments.Hooks.useScreenBottomInset)
local FFlagMomentsEngagementToastsModule = require(Moments.Flags.FFlagMomentsEngagementToasts)
local FFlagMomentsEngagementToastSwipeModule = require(Moments.Flags.FFlagMomentsEngagementToastSwipe)
local FFlagMomentsPostFeedback = require(Parent.SharedFlags).FFlagMomentsPostFeedback

local function ToastItem(p1)
	-- upvalues: ReactModule (copy), SnackbarDEPRECATED (copy), ThumbnailToastModule (copy), Toast (copy)
	local Entry = p1.entry
	local OnDismissFunction = p1.onDismiss
	ReactModule.useEffect(function()
		-- upvalues: Entry (copy), OnDismissFunction (copy)
		local DelayedThread = task.delay(Entry.data.duration or 3, function()
			-- upvalues: OnDismissFunction (upval), Entry (upval)
			OnDismissFunction(Entry.id)
		end)
		
		return function()
			-- upvalues: DelayedThread (copy)
			task.cancel(DelayedThread)
		end
	end, { Entry.id, Entry.data.duration, OnDismissFunction })
	
	if Entry.data.variant == "snackbar" then
		return ReactModule.createElement(SnackbarDEPRECATED, { title = Entry.data.title, LayoutOrder = Entry.id })
	end
	local Thumbnail = Entry.data.thumbnail
	
	if Thumbnail ~= nil and Thumbnail ~= "" then
		return ReactModule.createElement(ThumbnailToastModule, {
			title = Entry.data.title,
			text = Entry.data.text,
			thumbnail = Thumbnail,
			actions = Entry.data.actions,
			LayoutOrder = Entry.id,
			width = p1.toastWidth
		})
	end
	local Actions = nil
	
	if Entry.data.actions ~= nil then
		local List = {}
		
		for _, action in Entry.data.actions do
			table.insert(List, { text = action.text, onActivated = action.onActivated })
		end
		Actions = List
	end
	return ReactModule.createElement(Toast, {
		title = Entry.data.title,
		text = if Entry.data.text == "" then nil else Entry.data.text,
		actions = Actions,
		LayoutOrder = Entry.id,
		width = p1.toastWidth
	})
end

local function BottomToastStack(p2)
	-- upvalues: UseDeviceInsetsFunction (copy), UseTokensFunction (copy), UseScreenBottomInsetModule (copy), MomentLayoutModule (copy), ReactModule (copy), View (copy), ConstantsModule (copy), FoundationProvider (copy), ColorMode (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local UseScreenBottomInsetModuleResult = UseScreenBottomInsetModule()
	
	return ReactModule.createElement(View, {
		tag = "position-bottom-center anchor-bottom-center size-full-0 auto-y",
		ZIndex = ConstantsModule.ZIndex.Toasts,
		padding = {
			bottom = UDim.new(0, UseScreenBottomInsetModuleResult + MomentLayoutModule.getInfoBottomGap(UseTokensResult, UseScreenBottomInsetModuleResult, UseDeviceInsetsResult.bottom) + UseTokensResult.Padding.Large - UseTokensResult.Padding.Medium),
			left = UDim.new(0, UseDeviceInsetsResult.left + UseTokensResult.Padding.Large),
			right = UDim.new(0, UseDeviceInsetsResult.right + UseTokensResult.Padding.Large)
		}
	}, {
		DarkScope = ReactModule.createElement(FoundationProvider, { colorMode = ColorMode.Dark }, {
			Stack = ReactModule.createElement(View, { tag = "col align-x-center gap-small size-full-0 auto-y" }, p2.children)
		})
	})
end

local function BelowHeaderToastStack(p2)
	-- upvalues: UseDeviceInsetsFunction (copy), UseTokensFunction (copy), UseStatusBarHeightFunction (copy), ReactModule (copy), View (copy), ConstantsModule (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(View, {
		tag = "col gap-small position-top-center anchor-top-center auto-xy",
		ZIndex = ConstantsModule.ZIndex.Toasts,
		padding = {
			top = UDim.new(0, UseStatusBarHeightFunction() + UseTokensResult.Size.Size_1400 + UseTokensResult.Padding.Small),
			left = UDim.new(0, UseDeviceInsetsResult.left + UseTokensResult.Padding.Large),
			right = UDim.new(0, UseDeviceInsetsResult.right + UseTokensResult.Padding.Large)
		}
	}, p2.children)
end

local function PlacedToastStacks(p2)
	-- upvalues: UseDeviceInsetsFunction (copy), UseTokensFunction (copy), ReactModule (copy), ToastItem (copy), View (copy), ConstantsModule (copy), BottomToastStack (copy), BelowHeaderToastStack (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local Elements = {}
	local Children = {}
	local Children1 = {}
	local Flag = false
	local Flag1 = false
	
	for _, toast in p2.toasts do
		local Element = ReactModule.createElement(ToastItem, {
			entry = toast,
			onDismiss = p2.onDismiss,
			toastWidth = p2.toastWidth
		})
		
		if toast.data.placement == "bottom" then
			Flag = true
			Children["Toast_" .. tostring(toast.id)] = Element
		elseif toast.data.placement == "belowHeader" then
			Flag1 = true
			Children1["Toast_" .. tostring(toast.id)] = Element
		else
			Elements["Toast_" .. tostring(toast.id)] = Element
		end
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Top = ReactModule.createElement(View, {
			tag = "col gap-small position-top-center anchor-top-center auto-xy",
			ZIndex = ConstantsModule.ZIndex.Toasts,
			padding = {
				top = UDim.new(0, UseDeviceInsetsResult.top + UseTokensResult.Padding.Large),
				left = UDim.new(0, UseDeviceInsetsResult.left + UseTokensResult.Padding.Large),
				right = UDim.new(0, UseDeviceInsetsResult.right + UseTokensResult.Padding.Large)
			}
		}, Elements),
		Bottom = if Flag then ReactModule.createElement(BottomToastStack, { children = Children }) else nil,
		BelowHeader = if Flag1 then ReactModule.createElement(BelowHeaderToastStack, { children = Children1 }) else nil
	})
end

local function noop() end

local function SwipeToastCard(p3)
	-- upvalues: ReactModule (copy), SnackbarDEPRECATED (copy), noop (copy), ThumbnailToastModule (copy), Toast (copy)
	local Data = p3.entry.data
	
	if Data.variant == "snackbar" then
		return ReactModule.createElement(SnackbarDEPRECATED, { title = Data.title })
	end
	local Actions = nil
	
	if Data.actions ~= nil then
		local List = {}
		
		for _, action in Data.actions do
			table.insert(List, {
				text = action.text,
				onActivated = if p3.isExiting then noop else action.onActivated
			})
		end
		Actions = List
	end
	local Thumbnail = Data.thumbnail
	
	if Thumbnail ~= nil and Thumbnail ~= "" then
		return ReactModule.createElement(ThumbnailToastModule, {
			title = Data.title,
			text = Data.text,
			thumbnail = Thumbnail,
			actions = Actions,
			width = p3.toastWidth
		})
	end
	local Actions1 = nil
	
	if Actions ~= nil then
		local List = {}
		
		for _, action1 in Actions do
			table.insert(List, { text = action1.text, onActivated = action1.onActivated })
		end
		Actions1 = List
	end
	return ReactModule.createElement(Toast, {
		title = Data.title,
		text = if Data.text == "" then nil else Data.text,
		actions = Actions1,
		width = p3.toastWidth
	})
end

local function SwipeToastLayer(p4)
	-- upvalues: UseTokensFunction (copy), UseStatusBarHeightFunction (copy), ReactModule (copy), SwipeableToastContainerModule (copy), SwipeToastCard (copy), ConstantsModule (copy)
	local UseTokensResult = UseTokensFunction()
	local NewUseStatusBarHeightResult = UseStatusBarHeightFunction() + UseTokensResult.Size.Size_1400 + UseTokensResult.Padding.Small
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.zero)
	local UseRefResult = ReactModule.useRef({})
	local _, UseStateResult2_1 = ReactModule.useState(0)
	local t = {}
	
	for _, entry in p4.entries do
		t[entry.id] = true
	end
	local t1 = {}
	
	for _, value in UseRefResult.current do
		t1[value.id] = true
	end
	for _, entry1 in p4.entries do
		if not t1[entry1.id] then
			table.insert(UseRefResult.current, entry1)
		end
	end
	local UseResult = ReactModule.useCallback(function(Id)
		-- upvalues: UseRefResult (copy), UseStateResult2_1 (copy)
		local Current = {}
		
		for _, value in UseRefResult.current do
			if value.id ~= Id then
				table.insert(Current, value)
			end
		end
		UseRefResult.current = Current
		UseStateResult2_1(function(p5: number): number
			return p5 + 1
		end)
	end, {})
	local UseResult1 = ReactModule.useCallback(function(Frame)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize)
	end, {})
	local Elements = {}
	
	if UseStateResult.X > 0 then
		for _, Entry in UseRefResult.current do
			local Id = Entry.id
			local Inverted = not t[Id]
			Elements["Toast_" .. tostring(Id)] = ReactModule.createElement(SwipeableToastContainerModule, {
				card = ReactModule.createElement(SwipeToastCard, {
					entry = Entry,
					toastWidth = p4.toastWidth,
					isExiting = Inverted
				}),
				width = p4.toastWidth.Offset,
				hostSize = UseStateResult,
				restTop = NewUseStatusBarHeightResult,
				duration = Entry.data.duration or 3,
				isExiting = Inverted,
				onDismiss = function()
					-- upvalues: p4 (copy), Id (copy)
					p4.onDismiss(Id)
				end,
				onExited = function()
					-- upvalues: UseResult (copy), Id (copy)
					UseResult(Id)
				end
			})
		end
	end
	return ReactModule.createElement("Frame", {
		Size = UDim2.fromScale(1, 1),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ZIndex = ConstantsModule.ZIndex.Toasts,
		[ReactModule.Change.AbsoluteSize] = UseResult1
	}, Elements)
end

local function SwipeToastOverlay(p5)
	-- upvalues: ReactModule (copy), PlacedToastStacks (copy), SwipeToastLayer (copy)
	local Toasts = {}
	local Entries = {}
	
	for _, toast in p5.toasts do
		table.insert(if toast.data.placement == "belowHeader" then Entries else Toasts, toast)
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Stacks = if #Toasts > 0 then ReactModule.createElement(PlacedToastStacks, {
			toasts = Toasts,
			onDismiss = p5.onDismiss,
			toastWidth = p5.toastWidth
		}) else nil,
		SwipeLayer = ReactModule.createElement(SwipeToastLayer, {
			entries = Entries,
			onDismiss = p5.onDismiss,
			toastWidth = p5.toastWidth
		})
	})
end

return function()
	-- upvalues: GetToastStoreModule (copy), SignalsReactModule (copy), UseDeviceInsetsFunction (copy), UseScreenSizeFunction (copy), UseTokensFunction (copy), ReactModule (copy), FFlagMomentsEngagementToastsModule (copy), FFlagMomentsEngagementToastSwipeModule (copy), SwipeToastOverlay (copy), FFlagMomentsPostFeedback (copy), PlacedToastStacks (copy), ToastItem (copy), View (copy), ConstantsModule (copy)
	local ToastStoreModule = GetToastStoreModule(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(ToastStoreModule.getToasts)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseTokensResult = UseTokensFunction()
	local UseResult = ReactModule.useCallback(function(p6)
		-- upvalues: ToastStoreModule (copy)
		ToastStoreModule.dismissToast(p6)
	end, { ToastStoreModule.dismissToast })
	
	if FFlagMomentsEngagementToastsModule and FFlagMomentsEngagementToastSwipeModule then
		return ReactModule.createElement(SwipeToastOverlay, {
			toasts = UseSignalStateResult,
			onDismiss = UseResult,
			toastWidth = UDim.new(0, (math.min(400, UseScreenSizeResult.X - 40)))
		})
	end
	if #UseSignalStateResult == 0 then
		return nil
	end
	local _UDim = UDim.new(0, (math.min(400, UseScreenSizeResult.X - 40)))
	
	if FFlagMomentsPostFeedback or FFlagMomentsEngagementToastsModule then
		return ReactModule.createElement(PlacedToastStacks, {
			toasts = UseSignalStateResult,
			onDismiss = UseResult,
			toastWidth = _UDim
		})
	end
	local Elements = {}
	
	for _, Entry in UseSignalStateResult do
		Elements["Toast_" .. tostring(Entry.id)] = ReactModule.createElement(ToastItem, { entry = Entry, onDismiss = UseResult, toastWidth = _UDim })
	end
	return ReactModule.createElement(View, {
		tag = "col gap-small position-top-center anchor-top-center auto-xy",
		ZIndex = ConstantsModule.ZIndex.Toasts,
		padding = {
			top = UDim.new(0, UseDeviceInsetsResult.top + UseTokensResult.Padding.Large),
			left = UDim.new(0, UseDeviceInsetsResult.left + UseTokensResult.Padding.Large),
			right = UDim.new(0, UseDeviceInsetsResult.right + UseTokensResult.Padding.Large)
		}
	}, Elements)
end