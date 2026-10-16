local TrustAndSafetyIxp = script:FindFirstAncestor("TrustAndSafetyIxp")
local Parent = TrustAndSafetyIxp.Parent
local GetFFlagReportAnythingAnnotationIXPFunction = require(Parent.SharedFlags).GetFFlagReportAnythingAnnotationIXP
local GetFStringReportAnythingAnnotationIXPLayerNameFunction = require(Parent.SharedFlags).GetFStringReportAnythingAnnotationIXPLayerName
local GetFFlagForceReportAnythingAnnotationEnabledModule = require(TrustAndSafetyIxp.Flags.GetFFlagForceReportAnythingAnnotationEnabled)
local IXPServiceWrapper = require(Parent.IxpServiceWrapper).IXPServiceWrapper
local NewResult = require(Parent.CoreScriptsInitializer).CoreLogger:new(script.Name)
local TrustAndSafetyIXPManager = {}
TrustAndSafetyIXPManager.__index = TrustAndSafetyIXPManager

function TrustAndSafetyIXPManager.new(p1) --[[ Line: 19 ]]
	-- upvalues: IXPServiceWrapper (copy), TrustAndSafetyIXPManager (copy)
	local config = {
		_initialized = false,
		_ixpInitialized = false,
		_optionalScreenshotEnabled = false,
		_reportAnythingExperienceEnabled = false,
		_reportAnythingAvatarEnabled = false,
		_ixpServiceWrapper = p1 or IXPServiceWrapper,
		_callbacks = {}
	}
	setmetatable(config, TrustAndSafetyIXPManager)
	
	return config
end

function TrustAndSafetyIXPManager.getReportAnythingExperienceEnabled(p1) --[[ Line: 33 ]]
	-- upvalues: GetFFlagForceReportAnythingAnnotationEnabledModule (copy)
	return if GetFFlagForceReportAnythingAnnotationEnabledModule() then true else p1._reportAnythingExperienceEnabled or p1._optionalScreenshotEnabled
end

function TrustAndSafetyIXPManager.getReportAnythingAvatarEnabled(p1) --[[ Line: 40 ]]
	-- upvalues: GetFFlagForceReportAnythingAnnotationEnabledModule (copy)
	return if GetFFlagForceReportAnythingAnnotationEnabledModule() then true else p1._reportAnythingAvatarEnabled or p1._optionalScreenshotEnabled
end

function TrustAndSafetyIXPManager:waitForInitialization(Callback: () -> ()) --[[ Line: 47 ]]
	if self._ixpInitialized then
		Callback()
		
		return
	else
		table.insert(self._callbacks, Callback)
	end
end

function TrustAndSafetyIXPManager:initialize() --[[ Line: 55 ]]
	-- upvalues: GetFFlagReportAnythingAnnotationIXPFunction (copy), GetFStringReportAnythingAnnotationIXPLayerNameFunction (copy), NewResult (copy)
	if self._initialized then return end
	self._initialized = true
	
	local function invokeCallbacks() --[[ Line: 61 ]]
		-- upvalues: self (copy)
		for _, callback in ipairs(self._callbacks) do
			callback()
		end
		self._callbacks = {}
	end
	
	if GetFFlagReportAnythingAnnotationIXPFunction() then
		task.spawn(function() --[[ Line: 74 ]]
			-- upvalues: self (copy), GetFStringReportAnythingAnnotationIXPLayerNameFunction (upval), NewResult (upval), invokeCallbacks (copy)
			self._ixpServiceWrapper:WaitForInitialization()
			local LayerData = self._ixpServiceWrapper:GetLayerData(GetFStringReportAnythingAnnotationIXPLayerNameFunction())
			
			if LayerData then
				self._optionalScreenshotEnabled = LayerData.OptionalScreenshotEnabled or false
				self._reportAnythingExperienceEnabled = LayerData.OptionalScreenshotExperience or false
				self._reportAnythingAvatarEnabled = LayerData.OptionalScreenshotAvatar or false
			end
			NewResult:debug("RA Optional Screenshot enabled (Avatar and/or Experience) or Select In Scene enabled? Both Avatar and Exp: {}, Exp: {}, Avatar: {}, Select in Scene: {}. Invoking {} callbacks.", self._optionalScreenshotEnabled, self._reportAnythingExperienceEnabled, self._reportAnythingAvatarEnabled, self._selectInSceneEnabled, #self._callbacks)
			self._ixpInitialized = true
			invokeCallbacks()
		end)
		
		return
	else
		self._ixpInitialized = true
		invokeCallbacks()
	end
end

TrustAndSafetyIXPManager.default = TrustAndSafetyIXPManager.new()

return TrustAndSafetyIXPManager