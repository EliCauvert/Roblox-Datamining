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

function breakpointCompare(p0, p1) --[[ line: 24 ]]
	-- upvalues: standardBreakpointsModule (ref), responsiveModule (ref)
	local keyIndex = standardBreakpointsModule.keyIndex
	
	return if p0 == responsiveModule.DefaultKey or p1 == responsiveModule.DefaultKey or (keyIndex[p0] == nil or keyIndex[p1] == nil) then false else keyIndex[p1] <= keyIndex[p0]
end

function ResponsiveProvider(p2) --[[ line: 32 ]]
	-- upvalues: reactModule (ref), containerRefModule (ref)
	return reactModule.createElement(containerRefModule.Provider, { value = reactModule.useRef(nil) }, p2.children)
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
	ResponsiveContainerFrame = function(p3) --[[ line: 39 ]]
		-- upvalues: reactModule (ref), containerRefModule (ref)
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Visible = false,
			ZIndex = if p3 and p3.ZIndex then p3.ZIndex else -100,
			Size = if p3 and p3.Size then p3.Size else UDim2.new(1, 0, 1, 0),
			ref = reactModule.useContext(containerRefModule)
		})
	end,
	FindFirstAncestorWithTag = findFirstAncestorWithTagModule,
	useBreakpointX = useResponsiveImplModule,
	useBreakpointXOrLarger = function(p4) --[[ line: 62 ]]
		-- upvalues: useResponsiveImplModule (ref)
		return useResponsiveImplModule(function(p5) --[[ line: 63 ]]
			-- upvalues: p4 (ref)
			return breakpointCompare(p5, p4)
		end, nil)
	end,
	useBreakpointXOrSmaller = function(p6) --[[ line: 67 ]]
		-- upvalues: useResponsiveImplModule (ref)
		return useResponsiveImplModule(function(p7) --[[ line: 68 ]]
			-- upvalues: p6 (ref)
			return breakpointCompare(p6, p7)
		end, nil)
	end,
	useBreakpointY = function() --[[ line: 72 ]]
		-- upvalues: useResponsiveImplModule (ref)
		return useResponsiveImplModule(nil, nil, "Y")
	end,
	useBreakpointYOrLarger = function(p8) --[[ line: 75 ]]
		-- upvalues: useResponsiveImplModule (ref)
		return useResponsiveImplModule(function(p9) --[[ line: 76 ]]
			-- upvalues: p8 (ref)
			return breakpointCompare(p9, p8)
		end, nil, "Y")
	end,
	useBreakpointYOrSmaller = function(p10) --[[ line: 80 ]]
		-- upvalues: useResponsiveImplModule (ref)
		return useResponsiveImplModule(function(p11) --[[ line: 81 ]]
			-- upvalues: p10 (ref)
			return breakpointCompare(p10, p11)
		end, nil, "Y")
	end,
	useOrientation = function() --[[ line: 85 ]]
		-- upvalues: useResponsiveImplModule (ref)
		return useResponsiveImplModule(nil, nil, "Orientation")
	end,
	useResponsive = function(p12) --[[ line: 88 ]]
		-- upvalues: useResponsiveImplModule (ref)
		return useResponsiveImplModule(nil, p12)
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