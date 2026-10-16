local AvatarCreationService = game:GetService("AvatarCreationService")
local SelfieQr = script:FindFirstAncestor("SelfieQr")
local Parent = SelfieQr.Parent
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local ReactModule = require(Parent.React)
local SelfieQRCodeModule = require(SelfieQr.SelfieQRCode)
local FocusRoot = FocusNavigationUtilsModule.FocusRoot
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local UseEventConnectionFunction = require(Parent.ReactUtils).useEventConnection

local function v8(p1) --[[ Line: 21 ]]
	-- upvalues: ReactModule (copy), UseEventConnectionFunction (copy), AvatarCreationService (copy)
	UseEventConnectionFunction(AvatarCreationService.OpenSelfieQRCode, (ReactModule.useCallback(function(Url, JobId) --[[ Line: 22 ]]
		-- upvalues: p1 (copy)
		p1.displaySelfieQRCode(true)
		p1.jobData.url = Url
		p1.jobData.jobId = JobId
	end)))
	
	return ReactModule.createElement(ReactModule.Fragment, {}, {})
end

return function(_) --[[ Line: 31 ]]
	-- upvalues: ReactModule (copy), SelfieQRCodeModule (copy), v8 (copy), FocusRoot (copy), FocusNavigableSurfaceIdentifierEnum (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local Current = ReactModule.useRef({ url = "", jobId = "" }).current
	local Element = if UseStateResult then ReactModule.createElement(SelfieQRCodeModule, {
		displaySelfieQRCode = UseStateResult2,
		url = Current.url,
		jobId = Current.jobId
	}) else nil
	
	return ReactModule.createElement(ReactModule.Fragment, {}, {
		EventListener = ReactModule.createElement(v8, { displaySelfieQRCode = UseStateResult2, jobData = Current }),
		FocusNavigationCoreScriptsWrapper = if Element == nil then nil else ReactModule.createElement(FocusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, { Dialog = Element })
	})
end