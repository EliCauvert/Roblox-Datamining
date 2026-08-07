local trustAndSafetyIxp = script:FindFirstAncestor("TrustAndSafetyIxp")
local parent = trustAndSafetyIxp.Parent
local getFFlagReportAnythingAnnotationIXP = require(parent.SharedFlags).GetFFlagReportAnythingAnnotationIXP
local getFStringReportAnythingAnnotationIXPLayerName = require(parent.SharedFlags).GetFStringReportAnythingAnnotationIXPLayerName
local getFFlagForceReportAnythingAnnotationEnabledModule = require(trustAndSafetyIxp.Flags.GetFFlagForceReportAnythingAnnotationEnabled)
local IXPServiceWrapper = require(parent.IxpServiceWrapper).IXPServiceWrapper
local name = require(parent.CoreScriptsInitializer).CoreLogger:new(script.Name)
local t = {}
t.__index = t

function t.new(p0) --[[ line: 19 ]]
	-- upvalues: IXPServiceWrapper (ref), t (ref)
	local t_1 = {
		_initialized = false,
		_ixpInitialized = false,
		_optionalScreenshotEnabled = false,
		_reportAnythingExperienceEnabled = false,
		_reportAnythingAvatarEnabled = false,
		_ixpServiceWrapper = p0 or IXPServiceWrapper,
		_callbacks = {}
	}
	setmetatable(t_1, t)
	
	return t_1
end

function t:getReportAnythingExperienceEnabled() --[[ line: 33 ]]
	-- upvalues: getFFlagForceReportAnythingAnnotationEnabledModule (ref)
	return if getFFlagForceReportAnythingAnnotationEnabledModule() then true else self._reportAnythingExperienceEnabled or self._optionalScreenshotEnabled
end

function t:getReportAnythingAvatarEnabled() --[[ line: 40 ]]
	-- upvalues: getFFlagForceReportAnythingAnnotationEnabledModule (ref)
	return if getFFlagForceReportAnythingAnnotationEnabledModule() then true else self._reportAnythingAvatarEnabled or self._optionalScreenshotEnabled
end

function t:waitForInitialization(p1) --[[ line: 47 ]]
	if self._ixpInitialized then
		p1()
		
		return
	end
	table.insert(self._callbacks, p1)
end

function t:initialize() --[[ line: 55 ]]
	-- upvalues: getFFlagReportAnythingAnnotationIXP (ref), getFStringReportAnythingAnnotationIXPLayerName (ref), name (ref)
	if self._initialized then return end
	self._initialized = true
	
	local function invokeCallbacks() --[[ line: 61 ]]
		-- upvalues: self (ref)
		for i, v in ipairs(self._callbacks) do
			v()
		end
		self._callbacks = {}
	end
	
	if getFFlagReportAnythingAnnotationIXP() then
		task.spawn(function() --[[ line: 74 ]]
			-- upvalues: self (ref), getFStringReportAnythingAnnotationIXPLayerName (copy), name (copy), invokeCallbacks (ref)
			self._ixpServiceWrapper:WaitForInitialization()
			local var6 = self._ixpServiceWrapper:GetLayerData(getFStringReportAnythingAnnotationIXPLayerName())
			
			if var6 then
				self._optionalScreenshotEnabled = var6.OptionalScreenshotEnabled or false
				self._reportAnythingExperienceEnabled = var6.OptionalScreenshotExperience or false
				self._reportAnythingAvatarEnabled = var6.OptionalScreenshotAvatar or false
			end
			name:debug("RA Optional Screenshot enabled (Avatar and/or Experience) or Select In Scene enabled? Both Avatar and Exp: {}, Exp: {}, Avatar: {}, Select in Scene: {}. Invoking {} callbacks.", self._optionalScreenshotEnabled, self._reportAnythingExperienceEnabled, self._reportAnythingAvatarEnabled, self._selectInSceneEnabled, #self._callbacks)
			self._ixpInitialized = true
			invokeCallbacks()
		end)
		
		return
	end
	self._ixpInitialized = true
	invokeCallbacks()
end

t.default = t.new()

return t