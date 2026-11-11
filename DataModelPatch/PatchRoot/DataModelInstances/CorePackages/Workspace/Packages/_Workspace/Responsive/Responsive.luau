local ResponsiveModule = require(script.Responsive)
local ReactModule = require(script.Parent.React)
local StandardBreakpointsModule = require(script.CommonConfigs.StandardBreakpoints)
local ContainerRefModule = require(script.Context.ContainerRef)
local FindFirstAncestorWithTagModule = require(script.FindFirstAncestorWithTag)
local UseResponsiveImplModule = require(script.Hooks.useResponsiveImpl)
local InputModeModule = require(script.InputMode)
local HardwareSafeAreaInsetsModule = require(script.HardwareSafeAreaInsets)
local UseDeviceInsetsModule = require(script.Hooks.useDeviceInsets)
local GetInputModeStoreModule = require(script.Stores.GetInputModeStore)
local UseIsInFullScreenModule = require(script.Hooks.useIsInFullScreen)
local UseIsSpatialModule = require(script.Hooks.useIsSpatial)
local UseLastInputModule = require(script.Hooks.useLastInput)
local UsePreferredInputModule = require(script.Hooks.usePreferredInput)
local GetVirtualResolutionScaleModule = require(script.getVirtualResolutionScale)
local GetIsCompactTouchModule = require(script.getIsCompactTouch)

function breakpointCompare(DefaultKey, DefaultKey1): boolean
	-- upvalues: StandardBreakpointsModule (copy), ResponsiveModule (copy)
	local KeyIndex = StandardBreakpointsModule.keyIndex
	
	return DefaultKey ~= ResponsiveModule.DefaultKey and DefaultKey1 ~= ResponsiveModule.DefaultKey and KeyIndex[DefaultKey] ~= nil and KeyIndex[DefaultKey1] ~= nil and KeyIndex[DefaultKey1] <= KeyIndex[DefaultKey]
end

function ResponsiveProvider(p1)
	-- upvalues: ReactModule (copy), ContainerRefModule (copy)
	return ReactModule.createElement(ContainerRefModule.Provider, { value = ReactModule.useRef(nil) }, p1.children)
end

return {
	HardwareSafeAreaInsets = HardwareSafeAreaInsetsModule,
	useDeviceInsets = UseDeviceInsetsModule,
	Keys = StandardBreakpointsModule.Enum,
	Input = InputModeModule.Enum,
	BreakpointConfig = StandardBreakpointsModule,
	DefaultKey = ResponsiveModule.DefaultKey,
	ContainerRef = ContainerRefModule,
	ResponsiveProvider = ResponsiveProvider,
	ResponsiveContainerFrame = function(p1)
		-- upvalues: ReactModule (copy), ContainerRefModule (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Visible = false,
			ZIndex = if p1 and p1.ZIndex then p1.ZIndex else -100,
			Size = if p1 and p1.Size then p1.Size else UDim2.new(1, 0, 1, 0),
			ref = ReactModule.useContext(ContainerRefModule)
		})
	end,
	FindFirstAncestorWithTag = FindFirstAncestorWithTagModule,
	useBreakpointX = UseResponsiveImplModule,
	useBreakpointXOrLarger = function(p1)
		-- upvalues: UseResponsiveImplModule (copy)
		return UseResponsiveImplModule(function(p2)
			-- upvalues: p1 (copy)
			return breakpointCompare(p2, p1)
		end, nil)
	end,
	useBreakpointXOrSmaller = function(p1)
		-- upvalues: UseResponsiveImplModule (copy)
		return UseResponsiveImplModule(function(p2)
			-- upvalues: p1 (copy)
			return breakpointCompare(p1, p2)
		end, nil)
	end,
	useBreakpointY = function()
		-- upvalues: UseResponsiveImplModule (copy)
		return UseResponsiveImplModule(nil, nil, "Y")
	end,
	useBreakpointYOrLarger = function(p1)
		-- upvalues: UseResponsiveImplModule (copy)
		return UseResponsiveImplModule(function(p2)
			-- upvalues: p1 (copy)
			return breakpointCompare(p2, p1)
		end, nil, "Y")
	end,
	useBreakpointYOrSmaller = function(p1)
		-- upvalues: UseResponsiveImplModule (copy)
		return UseResponsiveImplModule(function(p2)
			-- upvalues: p1 (copy)
			return breakpointCompare(p1, p2)
		end, nil, "Y")
	end,
	useOrientation = function()
		-- upvalues: UseResponsiveImplModule (copy)
		return UseResponsiveImplModule(nil, nil, "Orientation")
	end,
	useResponsive = function(p1)
		-- upvalues: UseResponsiveImplModule (copy)
		return UseResponsiveImplModule(nil, p1)
	end,
	usePreferredInput = UsePreferredInputModule,
	useLastInput = UseLastInputModule,
	useIsInFullScreen = UseIsInFullScreenModule,
	useIsSpatial = UseIsSpatialModule,
	bindContainer = ResponsiveModule.bindContainer,
	["jest.config"] = script["jest.config"],
	getVirtualResolutionScale = GetVirtualResolutionScaleModule,
	GetInputModeStore = GetInputModeStoreModule,
	getIsCompactTouch = GetIsCompactTouchModule
}