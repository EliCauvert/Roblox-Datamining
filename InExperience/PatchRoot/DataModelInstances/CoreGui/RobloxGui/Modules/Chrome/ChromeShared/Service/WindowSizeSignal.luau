local chromeShared = script:FindFirstAncestor("ChromeShared")
local corePackagesService = game:GetService("CorePackages")
local signal = require(corePackagesService.Workspace.Packages.AppCommonLib).Signal
local _ = require(corePackagesService.Workspace.Packages.Chrome)
local viewportUtilModule = require(chromeShared.Service.ViewportUtil)
local constantsModule = require(chromeShared.Unibar.Constants)
local fFlagChromeWindowSignalConstraintsToggle = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagChromeWindowSignalConstraintsToggle

local function getConstrainedWindowSize(p1, p2, p3)
	-- upvalues: viewportUtilModule (ref), fFlagChromeWindowSignalConstraintsToggle (ref), constantsModule (ref)
	local var1 = viewportUtilModule.mobileDevice:get()
	local var2 = viewportUtilModule.screenSize:get()
	local var3 = var2.X < var2.Y
	local var4 = p1
	local var5 = p2
	
	if var1 and (not fFlagChromeWindowSignalConstraintsToggle or not p3) then
		if var3 then
			var5 = math.min(p2, constantsModule.MAX_HEIGHT_PORTRAIT)
			var4 = math.min(p1, constantsModule.MAX_WIDTH_PORTRAIT)
		elseif not var3 then
			var5 = math.min(p2, constantsModule.MAX_HEIGHT_LANDSCAPE)
			var4 = math.min(p1, constantsModule.MAX_WIDTH_LANDSCAPE)
		end
	end
	return UDim2.new(0, var4, 0, var5)
end

local t = {}
t.__index = t

function t.new(p1, p2, p3, p4)
	-- upvalues: fFlagChromeWindowSignalConstraintsToggle (ref), getConstrainedWindowSize (ref), constantsModule (ref), signal (ref), t (ref)
	return setmetatable({
		_state = if fFlagChromeWindowSignalConstraintsToggle then getConstrainedWindowSize(p1 or constantsModule.DEFAULT_WIDTH, p2 or constantsModule.DEFAULT_HEIGHT, p4 or false) else getConstrainedWindowSize(p1 or constantsModule.DEFAULT_WIDTH, p2 or constantsModule.DEFAULT_HEIGHT),
		_isLarge = p3 or false,
		_ignoreConstraints = if fFlagChromeWindowSignalConstraintsToggle then p4 or false else nil,
		_changeSignal = signal.new()
	}, t)
end

function t:connect(p1)
	return self._changeSignal:connect(p1)
end

function t:requestSize(p1, p2)
	-- upvalues: fFlagChromeWindowSignalConstraintsToggle (ref), getConstrainedWindowSize (ref)
	local var1 = if fFlagChromeWindowSignalConstraintsToggle then getConstrainedWindowSize(p1, p2, self._ignoreConstraints) else getConstrainedWindowSize(p1, p2)
	
	if self._state ~= var1 then
		self._state = var1
		self._changeSignal:fire(var1)
	end
end

function t:toggleIsLarge()
	local var1 = not self._isLarge
	self._isLarge = var1
	self._changeSignal:fire(var1)
end

function t:get()
	return self._state
end

function t:getIsLarge()
	return self._isLarge
end

function t:updateConstraints()
	self:requestSize(self._state.Width.Offset, self._state.Height.Offset)
end

return t