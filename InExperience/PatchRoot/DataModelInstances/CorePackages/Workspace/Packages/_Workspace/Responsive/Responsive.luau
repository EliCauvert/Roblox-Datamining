local responsiveModule = require(script.Responsive)
local reactModule = require(script.Parent.React)
local standardBreakpointsModule = require(script.CommonConfigs.StandardBreakpoints)
local containerRefModule = require(script.Context.ContainerRef)
local findFirstAncestorWithTagModule = require(script.FindFirstAncestorWithTag)
local useResponsiveImplModule = require(script.Hooks.useResponsiveImpl)
local inputModeModule = require(script.InputMode)
local hardwareSafeAreaInsetsModule = require(script.HardwareSafeAreaInsets)
local useDeviceInsetsModule = require(script.Hooks.useDeviceInsets)
local getInputModeStoreModule = require(script.Stores.GetInputModeStore)
local useIsInFullScreenModule = require(script.Hooks.useIsInFullScreen)
local useIsSpatialModule = require(script.Hooks.useIsSpatial)
local useLastInputModule = require(script.Hooks.useLastInput)
local usePreferredInputModule = require(script.Hooks.usePreferredInput)
local getVirtualResolutionScaleModule = require(script.getVirtualResolutionScale)
local getIsCompactTouchModule = require(script.getIsCompactTouch)

function breakpointCompare(p1, p2)
	-- upvalues: standardBreakpointsModule (ref), responsiveModule (ref)
	local keyIndex = standardBreakpointsModule.keyIndex
	
	return if p1 == responsiveModule.DefaultKey or p2 == responsiveModule.DefaultKey or (keyIndex[p1] == nil or keyIndex[p2] == nil) then false else keyIndex[p2] <= keyIndex[p1]
end

function ResponsiveProvider(p1)
	-- upvalues: reactModule (ref), containerRefModule (ref)
	return reactModule.createElement(containerRefModule.Provider, { value = reactModule.useRef(nil) }, p1.children)
end

return {
	HardwareSafeAreaInsets = hardwareSafeAreaInsetsModule,
	useDeviceInsets = useDeviceInsetsModule,
	Keys = standardBreakpointsModule.Enum,
	Input = inputModeModule.Enum,
	BreakpointConfig = standardBreakpointsModule,
	DefaultKey = responsiveModule.DefaultKey,
	ContainerRef = containerRefModule,
	ResponsiveProvider = ResponsiveProvider,
	ResponsiveContainerFrame = function(p1)
		-- upvalues: reactModule (ref), containerRefModule (ref)
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Visible = false,
			ZIndex = if p1 and p1.ZIndex then p1.ZIndex else -100,
			Size = if p1 and p1.Size then p1.Size else UDim2.new(1, 0, 1, 0),
			ref = reactModule.useContext(containerRefModule)
		})
	end,
	FindFirstAncestorWithTag = findFirstAncestorWithTagModule,
	useBreakpointX = useResponsiveImplModule,
	useBreakpointXOrLarger = function(p1)
		-- upvalues: useResponsiveImplModule (ref)
		return useResponsiveImplModule(function(p2)
			-- upvalues: p1 (ref)
			return breakpointCompare(p2, p1)
		end, nil)
	end,
	useBreakpointXOrSmaller = function(p1)
		-- upvalues: useResponsiveImplModule (ref)
		return useResponsiveImplModule(function(p2)
			-- upvalues: p1 (ref)
			return breakpointCompare(p1, p2)
		end, nil)
	end,
	useBreakpointY = function()
		-- upvalues: useResponsiveImplModule (ref)
		return useResponsiveImplModule(nil, nil, "Y")
	end,
	useBreakpointYOrLarger = function(p1)
		-- upvalues: useResponsiveImplModule (ref)
		return useResponsiveImplModule(function(p2)
			-- upvalues: p1 (ref)
			return breakpointCompare(p2, p1)
		end, nil, "Y")
	end,
	useBreakpointYOrSmaller = function(p1)
		-- upvalues: useResponsiveImplModule (ref)
		return useResponsiveImplModule(function(p2)
			-- upvalues: p1 (ref)
			return breakpointCompare(p1, p2)
		end, nil, "Y")
	end,
	useOrientation = function()
		-- upvalues: useResponsiveImplModule (ref)
		return useResponsiveImplModule(nil, nil, "Orientation")
	end,
	useResponsive = function(p1)
		-- upvalues: useResponsiveImplModule (ref)
		return useResponsiveImplModule(nil, p1)
	end,
	usePreferredInput = usePreferredInputModule,
	useLastInput = useLastInputModule,
	useIsInFullScreen = useIsInFullScreenModule,
	useIsSpatial = useIsSpatialModule,
	bindContainer = responsiveModule.bindContainer,
	["jest.config"] = script["jest.config"],
	getVirtualResolutionScale = getVirtualResolutionScaleModule,
	GetInputModeStore = getInputModeStoreModule,
	getIsCompactTouch = getIsCompactTouchModule
}