local GuiService = game:GetService("GuiService")
local VRService = game:GetService("VRService")
local InputModeModule = require(script.Parent.InputMode)
local Signal = require(script:FindFirstAncestor("Responsive").Parent.AppCommonLib).Signal
local FindFirstAncestorWithTagModule = require(script.Parent.FindFirstAncestorWithTag)
local self = setmetatable({}, { __mode = "k" })
local Module = {}
Module.__index = Module
local Rules = require(script.Parent.CommonConfigs.StandardBreakpoints).rules
local Module1 = {}
Module1.__index = Module1

function Module1.new(List)
	-- upvalues: Module1 (copy)
	local config = {
		_hasSizeRules = false,
		_hasInputRules = false,
		_currentKey = "Default",
		_config = List or {},
		_currentRule = { Key = "Default" }
	}
	local _hasSizeRules = false
	local _hasInputRules = false
	
	for _, value in List do
		_hasSizeRules = _hasSizeRules or (value.minWidth ~= nil or (value.maxWidth ~= nil or (value.minHeight ~= nil or (value.maxHeight ~= nil or value.maxRatio ~= nil))) or value.minRatio ~= nil)
		_hasInputRules = _hasInputRules or (value.preferredInput ~= nil or value.lastInput ~= nil)
	end
	config._hasSizeRules = _hasSizeRules
	config._hasInputRules = _hasInputRules
	
	return (setmetatable(config, Module1))
end

function Module1:hasSizeRules()
	return self._hasSizeRules
end

function Module1:hasInputRules()
	return self._hasInputRules
end

function Module1:currentRule()
	return self._currentRule
end

function Module1:currentKey()
	return self._currentKey
end

function Module1:resolve(p1, p2, PreferredInput, LastInput, Spatial): boolean
	local Key = "Default"
	local _currentRule = {}
	local v1 = p1 / p2
	
	for _, value in self._config do
		if if value.minWidth == nil then if value.maxWidth == nil then if value.minHeight == nil then if value.maxHeight == nil then if value.minRatio == nil then if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial))) else value.minRatio <= v1 and (if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)))) else p2 <= value.maxHeight and (if value.minRatio == nil then if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial))) else value.minRatio <= v1 and (if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial))))) else value.minHeight <= p2 and (if value.maxHeight == nil then if value.minRatio == nil then if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial))) else value.minRatio <= v1 and (if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)))) else p2 <= value.maxHeight and (if value.minRatio == nil then if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial))) else value.minRatio <= v1 and (if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)))))) else p1 <= value.maxWidth and (if value.minHeight == nil then if value.maxHeight == nil then if value.minRatio == nil then if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial))) else value.minRatio <= v1 and (if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)))) else p2 <= value.maxHeight and (if value.minRatio == nil then if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial))) else value.minRatio <= v1 and (if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial))))) else value.minHeight <= p2 and (if value.maxHeight == nil then if value.minRatio == nil then if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial))) else value.minRatio <= v1 and (if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)))) else p2 <= value.maxHeight and (if value.minRatio == nil then if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial))) else value.minRatio <= v1 and (if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial))))))) else value.minWidth <= p1 and (if value.maxWidth == nil then if value.minHeight == nil then if value.maxHeight == nil then if value.minRatio == nil then if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial))) else value.minRatio <= v1 and (if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)))) else p2 <= value.maxHeight and (if value.minRatio == nil then if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial))) else value.minRatio <= v1 and (if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial))))) else value.minHeight <= p2 and (if value.maxHeight == nil then if value.minRatio == nil then if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial))) else value.minRatio <= v1 and (if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)))) else p2 <= value.maxHeight and (if value.minRatio == nil then if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial))) else value.minRatio <= v1 and (if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)))))) else p1 <= value.maxWidth and (if value.minHeight == nil then if value.maxHeight == nil then if value.minRatio == nil then if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial))) else value.minRatio <= v1 and (if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)))) else p2 <= value.maxHeight and (if value.minRatio == nil then if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial))) else value.minRatio <= v1 and (if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial))))) else value.minHeight <= p2 and (if value.maxHeight == nil then if value.minRatio == nil then if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial))) else value.minRatio <= v1 and (if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)))) else p2 <= value.maxHeight and (if value.minRatio == nil then if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial))) else value.minRatio <= v1 and (if value.maxRatio == nil then if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)) else v1 <= value.maxRatio and (if value.preferredInput == nil then if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial) else PreferredInput == value.preferredInput and (if value.lastInput == nil then value.spatial == nil or Spatial == value.spatial else LastInput == value.lastInput and (value.spatial == nil or Spatial == value.spatial)))))))) then
			_currentRule = value
			Key = value.Key
			break
		end
	end
	if Key == self._currentKey then
		return false
	else
		self._currentKey = Key
		self._currentRule = _currentRule
		
		return true
	end
end

function Module.new()
	-- upvalues: VRService (copy), Signal (copy), Module (copy), InputModeModule (copy)
	local config = {
		_layerCollectorSizeConnection = nil,
		_inputModeConnection = nil,
		_vrEnabledConnection = nil,
		_hasInputRules = false,
		_hasSizeRules = false,
		_refCount = 1,
		_vrEnabled = VRService.VREnabled,
		_changed = Signal.new(),
		_absoluteSize = Vector2.zero,
		_configResolvers = { default = {} }
	}
	local self = setmetatable(config, Module)
	config._inputModeConnection = InputModeModule.connect(function()
		-- upvalues: config (copy), self (copy)
		if config._hasInputRules then
			self:resolve()
		end
	end)
	config._vrEnabledConnection = VRService:GetPropertyChangedSignal("VREnabled"):Connect(function()
		-- upvalues: config (copy), VRService (upval), self (copy)
		config._vrEnabled = VRService.VREnabled
		self:resolve()
	end)
	
	return self
end

function Module:incRef()
	self._refCount += 1
end

function Module:destroy()
	-- upvalues: self (copy)
	if self._refCount > 1 then
		self._refCount -= 1
		
		return
	end
	if self._layerCollectorSizeConnection then
		self._layerCollectorSizeConnection:Disconnect()
		self._layerCollectorSizeConnection = nil
	end
	if self._inputModeConnection then
		self._inputModeConnection:disconnect()
		self._inputModeConnection = nil
	end
	if self._vrEnabledConnection then
		self._vrEnabledConnection:Disconnect()
		self._vrEnabledConnection = nil
	end
	self._changed = nil
	
	for i, value in self do
		if value == self then
			self[i] = nil
		end
	end
end

function Module:connect(p3)
	if self._changed == nil then
		error("Connecting to dead signal!")
	end
	return self._changed:connect(p3)
end

function Module:currentRule(p3)
	return self._configResolvers[p3 or "default"]:currentRule()
end

function Module:currentKey(p3)
	return self._configResolvers[p3 or "default"]:currentKey()
end

function Module:updateAbsoluteSize(LayerCollector)
	-- upvalues: GuiService (copy)
	local AbsoluteSize = LayerCollector.AbsoluteSize
	
	if LayerCollector:IsA("LayerCollector") then
		local Success, Result = pcall(function()
			-- upvalues: LayerCollector (copy)
			return LayerCollector.IgnoreGuiInset
		end)
		
		if Success and Result then
			local GuiInset, _ = GuiService:GetGuiInset()
			AbsoluteSize += GuiInset
		end
	end
	if AbsoluteSize.X ~= self._absoluteSize.X or AbsoluteSize.Y ~= self._absoluteSize.Y then
		self._absoluteSize = AbsoluteSize
		
		if self._hasSizeRules then
			self:resolve()
		end
	end
end

function Module:resolve()
	-- upvalues: InputModeModule (copy)
	if not self._configResolvers then return end
	local X = self._absoluteSize.X or 1
	local Y = self._absoluteSize.Y or 1
	local PreferredResult = InputModeModule.preferred()
	local LastResult = InputModeModule.last()
	local VrEnabled = self._vrEnabled
	local Flag = false
	
	for _, configResolver in self._configResolvers do
		if configResolver:resolve(X, Y, PreferredResult, LastResult, VrEnabled) then
			Flag = true
		end
	end
	if Flag then
		self._changed:fire()
	end
end

function is_array(Entry): boolean
	return type(Entry) == "table" and Entry[1] ~= nil
end

function Module:setConfig(Default)
	-- upvalues: Module1 (copy)
	if is_array(Default) then
		Default = { default = Default }
	end
	local _hasSizeRules = false
	local _hasInputRules = false
	local _configResolvers = {}
	
	if Default then
		for i, value in Default do
			_configResolvers[i] = Module1.new(value)
			_hasSizeRules = _hasSizeRules or _configResolvers[i]:hasSizeRules()
			_hasInputRules = _hasInputRules or _configResolvers[i]:hasInputRules()
		end
	end
	self._hasInputRules = _hasInputRules
	self._hasSizeRules = _hasSizeRules
	self._configResolvers = _configResolvers
	self:resolve()
end

function Module:setLocalInstance(Key: Instance, Key1)
	-- upvalues: FindFirstAncestorWithTagModule (copy)
	if typeof(Key) ~= "Instance" then
		error("setLocalInstance arg1 expects Instance")
		
		return
	end
	local FirstAncestorWithTagModule = nil
	FirstAncestorWithTagModule = if typeof(Key1) == "string" then FindFirstAncestorWithTagModule(Key, Key1) or Key elseif typeof(Key1) == "Instance" then Key1 else Key:FindFirstAncestorWhichIsA("LayerCollector")
	
	if FirstAncestorWithTagModule == nil then
		FirstAncestorWithTagModule = Key
	end
	if self._layerCollectorSizeConnection then
		self._layerCollectorSizeConnection:Disconnect()
		self._layerCollectorSizeConnection = nil
	end
	if FirstAncestorWithTagModule then
		self._layerCollectorSizeConnection = FirstAncestorWithTagModule:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
			-- upvalues: self (copy), FirstAncestorWithTagModule (ref)
			self:updateAbsoluteSize(FirstAncestorWithTagModule)
		end)
		self:updateAbsoluteSize(FirstAncestorWithTagModule)
	end
end

return {
	DefaultKey = "Default",
	bindContainer = function(Key, p3)
		-- upvalues: self (copy), Module (copy), Rules (copy)
		local SelfEntry = self[Key]
		local v2 = p3 == nil
		
		if v2 and SelfEntry then
			SelfEntry:incRef()
			
			return SelfEntry
		end
		local NewModule = Module.new()
		NewModule:setLocalInstance(Key, Key)
		NewModule:setConfig(p3 or Rules)
		
		if v2 then
			self[Key] = NewModule
		end
		return NewModule
	end
}