local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local CryoModule = require(Parent1.Cryo)
local ReactModule = require(Parent1.React)
local _ = require(Parent.Enums.NavigationType)
local _ = require(Parent.Signal)
local View = require(Parent1.Foundation).View
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseSnapScrollControllerModule = require(Parent.Hooks.useSnapScrollController)
local UseStateFunction = ReactModule.useState

return function(p1)
	-- upvalues: UseStateFunction (copy), UseSnapScrollControllerModule (copy), UseCallbackFunction (copy), UseEffectFunction (copy), ReactModule (copy), CryoModule (copy), View (copy)
	local UseStateResult, UseStateResult2 = UseStateFunction(Vector2.new(0, 0))
	local ItemAbsoluteSize = p1.itemAbsoluteSize or UseStateResult
	local WindowSize = p1.windowSize or 3
	local UseSnapScrollControllerModuleResult, UseSnapScrollControllerModuleResult2, UseSnapScrollControllerModuleResult3, UseSnapScrollControllerModuleResult4, UseSnapScrollControllerModuleResult5 = UseSnapScrollControllerModule(p1.active == nil or p1.active, p1.initialIndex or 1, ItemAbsoluteSize, #p1.contents)
	local UseCallbackResult = UseCallbackFunction(function(Frame)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(Frame.AbsoluteSize)
	end, {})
	UseEffectFunction(function()
		-- upvalues: p1 (copy), UseSnapScrollControllerModuleResult (copy)
		if p1.onIndexChanged then
			p1.onIndexChanged(UseSnapScrollControllerModuleResult)
		end
	end, { UseSnapScrollControllerModuleResult, p1.onIndexChanged })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: CryoModule (upval), p1 (copy), UseSnapScrollControllerModuleResult (copy), WindowSize (copy), ReactModule (upval), View (upval), ItemAbsoluteSize (copy)
		return CryoModule.List.map(p1.contents, function(p2, LayoutOrder)
			-- upvalues: UseSnapScrollControllerModuleResult (upval), WindowSize (upval), ReactModule (upval), View (upval), ItemAbsoluteSize (upval), p1 (upval)
			return if LayoutOrder < UseSnapScrollControllerModuleResult - WindowSize or UseSnapScrollControllerModuleResult + WindowSize < LayoutOrder then ReactModule.createElement(View, {
				tag = "anchor-top-center bg-action-subtle position-top-center",
				key = `PLACEHOLDER-{LayoutOrder}`,
				LayoutOrder = LayoutOrder,
				Size = UDim2.fromOffset(ItemAbsoluteSize.X, ItemAbsoluteSize.Y)
			}) else p1.renderContent(p2, LayoutOrder)
		end)
	end, {
		UseSnapScrollControllerModuleResult,
		ItemAbsoluteSize,
		p1.contents,
		p1.renderContent,
		WindowSize
	})
	UseEffectFunction(function()
		-- upvalues: p1 (copy), UseSnapScrollControllerModuleResult4 (copy)
		if not p1.scrollToIndexSignal then return end
		local ScrollToIndexSignalConnection = p1.scrollToIndexSignal:connect(UseSnapScrollControllerModuleResult4)
		
		return function()
			-- upvalues: ScrollToIndexSignalConnection (copy)
			ScrollToIndexSignalConnection:disconnect()
		end
	end, {
		p1.scrollToIndexSignal,
		UseSnapScrollControllerModuleResult4
	})
	UseEffectFunction(function()
		-- upvalues: p1 (copy), UseSnapScrollControllerModuleResult5 (copy)
		if not p1.triggerNavigationSignal then return end
		local TriggerNavigationSignalConnection = p1.triggerNavigationSignal:connect(UseSnapScrollControllerModuleResult5)
		
		return function()
			-- upvalues: TriggerNavigationSignalConnection (copy)
			TriggerNavigationSignalConnection:disconnect()
		end
	end, {
		p1.triggerNavigationSignal,
		UseSnapScrollControllerModuleResult5
	})
	
	return ReactModule.createElement(View, {
		tag = "anchor-top-center bg-action-subtle position-top-center size-full",
		onAbsoluteSizeChanged = UseCallbackResult,
		ref = UseSnapScrollControllerModuleResult2
	}, {
		MotionView = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "align-x-center anchor-top-center bg-action-subtle col no-clip position-top-center",
			ref = UseSnapScrollControllerModuleResult3,
			Size = UDim2.fromScale(1, #p1.contents)
		}, UseMemoResult)
	})
end