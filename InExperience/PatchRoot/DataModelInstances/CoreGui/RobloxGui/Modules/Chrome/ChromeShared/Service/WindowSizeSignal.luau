local chromeShared = script:FindFirstAncestor("ChromeShared")
local corePackagesService = game:GetService("CorePackages")
local signal = require(corePackagesService.Workspace.Packages.AppCommonLib).Signal
local _ = require(corePackagesService.Workspace.Packages.Chrome)
local viewportUtilModule = require(chromeShared.Service.ViewportUtil)
local constantsModule = require(chromeShared.Unibar.Constants)
local fFlagChromeWindowSignalConstraintsToggle = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagChromeWindowSignalConstraintsToggle

local function getConstrainedWindowSize(p0, p1, p2) --[[ line: 18 ]]
	-- upvalues: viewportUtilModule (ref), fFlagChromeWindowSignalConstraintsToggle (ref), constantsModule (ref)
	local var6 = viewportUtilModule.mobileDevice:get()
	local var7 = viewportUtilModule.screenSize:get()
	local var8 = var7.X < var7.Y
	local var9 = p0
	local var10 = p1
	
	if var6 and (not fFlagChromeWindowSignalConstraintsToggle or not p2) then
		if var8 then
			var10 = math.min(p1, constantsModule.MAX_HEIGHT_PORTRAIT)
			var9 = math.min(p0, constantsModule.MAX_WIDTH_PORTRAIT)
		elseif not var8 then
			var10 = math.min(p1, constantsModule.MAX_HEIGHT_LANDSCAPE)
			var9 = math.min(p0, constantsModule.MAX_WIDTH_LANDSCAPE)
		end
	end
	return UDim2.new(0, var9, 0, var10)
end

local t = {}
t.__index = t

function t.new(p3, p4, p5, p6) --[[ line: 43 ]]
	-- upvalues: fFlagChromeWindowSignalConstraintsToggle (ref), getConstrainedWindowSize (ref), constantsModule (ref), signal (ref), t (ref)
	return setmetatable({
		_state = if fFlagChromeWindowSignalConstraintsToggle then getConstrainedWindowSize(p3 or constantsModule.DEFAULT_WIDTH, p4 or constantsModule.DEFAULT_HEIGHT, p6 or false) else getConstrainedWindowSize(p3 or constantsModule.DEFAULT_WIDTH, p4 or constantsModule.DEFAULT_HEIGHT),
		_isLarge = p5 or false,
		_ignoreConstraints = if fFlagChromeWindowSignalConstraintsToggle then p6 or false else nil,
		_changeSignal = signal.new()
	}, t)
end

function t:connect(p7) --[[ line: 67 ]]
	return self._changeSignal:connect(p7)
end

function t:requestSize(p8, p9) --[[ line: 72 ]]
	-- upvalues: fFlagChromeWindowSignalConstraintsToggle (ref), getConstrainedWindowSize (ref)
	local var11 = if fFlagChromeWindowSignalConstraintsToggle then getConstrainedWindowSize(p8, p9, self._ignoreConstraints) else getConstrainedWindowSize(p8, p9)
	
	if self._state ~= var11 then
		self._state = var11
		self._changeSignal:fire(var11)
	end
end

function t:toggleIsLarge() --[[ line: 83 ]]
	local var12 = not self._isLarge
	self._isLarge = var12
	self._changeSignal:fire(var12)
end

function t:get() --[[ line: 89 ]]
	return self._state
end

function t:getIsLarge() --[[ line: 93 ]]
	return self._isLarge
end

function t:updateConstraints() --[[ line: 98 ]]
	self:requestSize(self._state.Width.Offset, self._state.Height.Offset)
end

return t