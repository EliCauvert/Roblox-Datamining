local ChromeShared = script:FindFirstAncestor("ChromeShared")
local CorePackages = game:GetService("CorePackages")
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local _ = require(CorePackages.Workspace.Packages.Chrome)
local ViewportUtilModule = require(ChromeShared.Service.ViewportUtil)
local ConstantsModule = require(ChromeShared.Unibar.Constants)
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagChromeWindowSignalConstraintsToggle = SharedFlagsModule.FFlagChromeWindowSignalConstraintsToggle
local FFlagKeepSideSheetOpenBesideMenu = SharedFlagsModule.FFlagKeepSideSheetOpenBesideMenu

local function getConstrainedWindowSize(XOffset1: number, YOffset1: number, IgnoreConstraints): UDim2
	-- upvalues: ViewportUtilModule (copy), FFlagChromeWindowSignalConstraintsToggle (copy), ConstantsModule (copy)
	local GetResult = ViewportUtilModule.screenSize:get()
	local IsXBelow = GetResult.X < GetResult.Y
	local XOffset: number = XOffset1
	local YOffset: number = YOffset1
	
	if ViewportUtilModule.mobileDevice:get() and (not FFlagChromeWindowSignalConstraintsToggle or not IgnoreConstraints) then
		if IsXBelow then
			YOffset = math.min(YOffset1, ConstantsModule.MAX_HEIGHT_PORTRAIT)
			XOffset = math.min(XOffset1, ConstantsModule.MAX_WIDTH_PORTRAIT)
		elseif not IsXBelow then
			YOffset = math.min(YOffset1, ConstantsModule.MAX_HEIGHT_LANDSCAPE)
			XOffset = math.min(XOffset1, ConstantsModule.MAX_WIDTH_LANDSCAPE)
		end
	end
	return UDim2.new(0, XOffset, 0, YOffset)
end

local WindowSizeSignalModule = {}
WindowSizeSignalModule.__index = WindowSizeSignalModule

function WindowSizeSignalModule.new(p1, p2, p3, p4)
	-- upvalues: FFlagChromeWindowSignalConstraintsToggle (copy), getConstrainedWindowSize (copy), ConstantsModule (copy), Signal (copy), WindowSizeSignalModule (copy)
	return (setmetatable({
		_state = if FFlagChromeWindowSignalConstraintsToggle then getConstrainedWindowSize(p1 or ConstantsModule.DEFAULT_WIDTH, p2 or ConstantsModule.DEFAULT_HEIGHT, p4 or false) else getConstrainedWindowSize(p1 or ConstantsModule.DEFAULT_WIDTH, p2 or ConstantsModule.DEFAULT_HEIGHT),
		_isLarge = p3 or false,
		_ignoreConstraints = if FFlagChromeWindowSignalConstraintsToggle then p4 or false else nil,
		_changeSignal = Signal.new()
	}, WindowSizeSignalModule))
end

function WindowSizeSignalModule:connect(p1)
	return self._changeSignal:connect(p1)
end

function WindowSizeSignalModule:requestSize(XOffset, YOffset, Enabled)
	-- upvalues: FFlagKeepSideSheetOpenBesideMenu (copy), FFlagChromeWindowSignalConstraintsToggle (copy), getConstrainedWindowSize (copy)
	if FFlagKeepSideSheetOpenBesideMenu then
		self._requestIgnoreConstraints = Enabled == true
	end
	local _UDim2 = if FFlagKeepSideSheetOpenBesideMenu and Enabled == true then UDim2.new(0, XOffset, 0, YOffset) elseif FFlagChromeWindowSignalConstraintsToggle then getConstrainedWindowSize(XOffset, YOffset, self._ignoreConstraints) else getConstrainedWindowSize(XOffset, YOffset)
	
	if self._state ~= _UDim2 then
		self._state = _UDim2
		self._changeSignal:fire(_UDim2)
	end
end

function WindowSizeSignalModule:toggleIsLarge()
	local NoIsLarge = not self._isLarge
	self._isLarge = NoIsLarge
	self._changeSignal:fire(NoIsLarge)
end

function WindowSizeSignalModule:get()
	return self._state
end

function WindowSizeSignalModule:getIsLarge()
	return self._isLarge
end

function WindowSizeSignalModule:updateConstraints()
	-- upvalues: FFlagKeepSideSheetOpenBesideMenu (copy)
	self:requestSize(self._state.Width.Offset, self._state.Height.Offset, if FFlagKeepSideSheetOpenBesideMenu then self._requestIgnoreConstraints else nil)
end

return WindowSizeSignalModule