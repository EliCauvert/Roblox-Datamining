local ChromeShared = script:FindFirstAncestor("ChromeShared")
local CorePackages = game:GetService("CorePackages")
local Signal = require(CorePackages.Workspace.Packages.AppCommonLib).Signal
local _ = require(CorePackages.Workspace.Packages.Chrome)
local ViewportUtilModule = require(ChromeShared.Service.ViewportUtil)
local ConstantsModule = require(ChromeShared.Unibar.Constants)
local FFlagChromeWindowSignalConstraintsToggle = require(CorePackages.Workspace.Packages.SharedFlags).FFlagChromeWindowSignalConstraintsToggle

local function getConstrainedWindowSize(Smallest: number, Smallest1: number, IgnoreConstraints): UDim2 --[[ Line: 18 ]]
	-- upvalues: ViewportUtilModule (copy), FFlagChromeWindowSignalConstraintsToggle (copy), ConstantsModule (copy)
	local GetResult = ViewportUtilModule.screenSize:get()
	local IsXBelow = GetResult.X < GetResult.Y
	local XOffset: number = Smallest
	local YOffset: number = Smallest1
	
	if ViewportUtilModule.mobileDevice:get() and (not FFlagChromeWindowSignalConstraintsToggle or not IgnoreConstraints) then
		if IsXBelow then
			YOffset = math.min(Smallest1, ConstantsModule.MAX_HEIGHT_PORTRAIT)
			XOffset = math.min(Smallest, ConstantsModule.MAX_WIDTH_PORTRAIT)
		elseif not IsXBelow then
			YOffset = math.min(Smallest1, ConstantsModule.MAX_HEIGHT_LANDSCAPE)
			XOffset = math.min(Smallest, ConstantsModule.MAX_WIDTH_LANDSCAPE)
		end
	end
	return UDim2.new(0, XOffset, 0, YOffset)
end

local WindowSizeSignalModule = {}
WindowSizeSignalModule.__index = WindowSizeSignalModule

function WindowSizeSignalModule.new(p1, p2, p3, p4) --[[ Line: 43 ]]
	-- upvalues: FFlagChromeWindowSignalConstraintsToggle (copy), getConstrainedWindowSize (copy), ConstantsModule (copy), Signal (copy), WindowSizeSignalModule (copy)
	return (setmetatable({
		_state = if FFlagChromeWindowSignalConstraintsToggle then getConstrainedWindowSize(p1 or ConstantsModule.DEFAULT_WIDTH, p2 or ConstantsModule.DEFAULT_HEIGHT, p4 or false) else getConstrainedWindowSize(p1 or ConstantsModule.DEFAULT_WIDTH, p2 or ConstantsModule.DEFAULT_HEIGHT),
		_isLarge = p3 or false,
		_ignoreConstraints = if FFlagChromeWindowSignalConstraintsToggle then p4 or false else nil,
		_changeSignal = Signal.new()
	}, WindowSizeSignalModule))
end

function WindowSizeSignalModule:connect(p1) --[[ Line: 67 ]]
	return self._changeSignal:connect(p1)
end

function WindowSizeSignalModule:requestSize(Offset, Offset1) --[[ Line: 72 ]]
	-- upvalues: FFlagChromeWindowSignalConstraintsToggle (copy), getConstrainedWindowSize (copy)
	local ConstrainedWindowSize = if FFlagChromeWindowSignalConstraintsToggle then getConstrainedWindowSize(Offset, Offset1, self._ignoreConstraints) else getConstrainedWindowSize(Offset, Offset1)
	
	if self._state ~= ConstrainedWindowSize then
		self._state = ConstrainedWindowSize
		self._changeSignal:fire(ConstrainedWindowSize)
	end
end

function WindowSizeSignalModule:toggleIsLarge() --[[ Line: 83 ]]
	local NoIsLarge = not self._isLarge
	self._isLarge = NoIsLarge
	self._changeSignal:fire(NoIsLarge)
end

function WindowSizeSignalModule:get() --[[ Line: 89 ]]
	return self._state
end

function WindowSizeSignalModule:getIsLarge() --[[ Line: 93 ]]
	return self._isLarge
end

function WindowSizeSignalModule:updateConstraints() --[[ Line: 98 ]]
	self:requestSize(self._state.Width.Offset, self._state.Height.Offset)
end

return WindowSizeSignalModule