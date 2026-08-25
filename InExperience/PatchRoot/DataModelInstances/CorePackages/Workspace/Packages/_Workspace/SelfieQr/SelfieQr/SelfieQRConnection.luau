local avatarCreationService = game:GetService("AvatarCreationService")
local selfieQr = script:FindFirstAncestor("SelfieQr")
local parent = selfieQr.Parent
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local selfieQRCodeModule = require(selfieQr.SelfieQRCode)
local focusRoot = focusNavigationUtilsModule.FocusRoot
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local useEventConnection = reactUtilsModule.useEventConnection

local var6 = function(p0)
	-- upvalues: reactModule (ref), useEventConnection (ref), avatarCreationService (ref)
	useEventConnection(avatarCreationService.OpenSelfieQRCode, reactModule.useCallback(function(p1, p2)
		-- upvalues: p0 (ref)
		p0.displaySelfieQRCode(true)
		p0.jobData.url = p1
		p0.jobData.jobId = p2
	end))
	
	return reactModule.createElement(reactModule.Fragment, {}, {})
end

return function(_)
	-- upvalues: reactModule (ref), selfieQRCodeModule (ref), var6 (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var7, var8 = reactModule.useState(false)
	local current = reactModule.useRef({ url = "", jobId = "" }).current
	local var9 = if var7 then reactModule.createElement(selfieQRCodeModule, {
		displaySelfieQRCode = var8,
		url = current.url,
		jobId = current.jobId
	}) else nil
	
	return reactModule.createElement(reactModule.Fragment, {}, {
		EventListener = reactModule.createElement(var6, { displaySelfieQRCode = var8, jobData = current }),
		FocusNavigationCoreScriptsWrapper = if var9 ~= nil then nil else reactModule.createElement(focusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, { Dialog = var9 })
	})
end