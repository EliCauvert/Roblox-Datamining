local Parent = script:FindFirstAncestor("RobloxAppNavigationCore").Parent
local ReactModule = require(Parent.React)
local NavigationModule = require(Parent.Navigation)
local UseStackScreensFunction = NavigationModule.useStackScreens
local ViewState = NavigationModule.ViewState
local AppStackCardModule = require(script.Parent.AppStackCard)
local DisplayModule = require(Parent.Display)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local FFlagEnableLeftNavOnConsole = require(Parent.SharedFlags).FFlagEnableLeftNavOnConsole
local config = {
	overlayTransparency = 0.7,
	overlayColor3 = Color3.new(0, 0, 0)
}

return function(p1)
	-- upvalues: UseStackScreensFunction (copy), ReactModule (copy), FFlagEnableLeftNavOnConsole (copy), UseSignalStateFunction (copy), DisplayModule (copy), config (copy), AppStackCardModule (copy), ViewState (copy)
	local UseStackScreensResult = UseStackScreensFunction({ navigation = p1.navigation, descriptors = p1.descriptors })
	local UseMemoResult = ReactModule.useMemo(function(): number
		-- upvalues: UseStackScreensResult (copy)
		for i = #UseStackScreensResult, 1, -1 do
			local Descriptor = UseStackScreensResult[i].descriptor
			
			if not Descriptor.options.transparent and not Descriptor.options.overlayEnabled then
				return i
			end
		end
		return 0
	end, { UseStackScreensResult })
	local Elements = {}
	local UseSignalStateResult = if FFlagEnableLeftNavOnConsole then UseSignalStateFunction(DisplayModule.GetDisplayStore().getDeviceSafePadding) else nil
	local UseStackScreensResultEntry = UseStackScreensResult[#UseStackScreensResult]
	
	if UseStackScreensResultEntry then
		local Options = UseStackScreensResultEntry.descriptor.options
		
		if Options.absorbInput == nil or Options.absorbInput then
			Elements.AbsorbInput = ReactModule.createElement("TextButton", {
				Active = true,
				AutoButtonColor = false,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Text = "",
				Selectable = Options.absorbInputSelectable or false,
				Position = if FFlagEnableLeftNavOnConsole then UDim2.fromOffset(0, -UseSignalStateResult.top) else nil,
				Size = if FFlagEnableLeftNavOnConsole then UDim2.new(1, UseSignalStateResult.right, 1, UseSignalStateResult.top + UseSignalStateResult.bottom) else UDim2.fromScale(1, 1),
				ZIndex = #UseStackScreensResult * 2 - 1
			})
		end
		if Options.overlayEnabled then
			Elements.Overlay = ReactModule.createElement("Frame", {
				ClipsDescendants = true,
				BorderSizePixel = 0,
				Position = if FFlagEnableLeftNavOnConsole then UDim2.fromOffset(0, -UseSignalStateResult.top) else nil,
				Size = if FFlagEnableLeftNavOnConsole then UDim2.new(1, UseSignalStateResult.right, 1, UseSignalStateResult.top + UseSignalStateResult.bottom) else UDim2.fromScale(1, 1),
				BackgroundTransparency = Options.overlayTransparency or config.overlayTransparency,
				BackgroundColor3 = config.overlayColor3,
				ZIndex = #UseStackScreensResult * 2 - 1
			})
		end
	end
	for i, value in UseStackScreensResult do
		Elements[value.descriptor.key] = ReactModule.createElement(AppStackCardModule, {
			isActive = i == #UseStackScreensResult,
			descriptor = value.descriptor,
			screenProps = p1.screenProps,
			isVisible = UseMemoResult <= i,
			ZIndex = i * 2,
			onAnimationComplete = function()
				-- upvalues: value (copy), ViewState (upval)
				if value.viewState == ViewState.Opening or value.viewState == ViewState.Opened then
					value.setOpened()
					
					return
				end
				if value.viewState == ViewState.Closing then
					value.setClosed()
				end
			end
		})
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, Elements)
end