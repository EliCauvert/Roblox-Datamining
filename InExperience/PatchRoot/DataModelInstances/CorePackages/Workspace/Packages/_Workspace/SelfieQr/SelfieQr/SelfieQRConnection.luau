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

local var1 = function(p1)
	-- upvalues: reactModule (ref), useEventConnection (ref), avatarCreationService (ref)
	useEventConnection(avatarCreationService.OpenSelfieQRCode, reactModule.useCallback(function(p2, p3)
		-- upvalues: p1 (ref)
		p1.displaySelfieQRCode(true)
		p1.jobData.url = p2
		p1.jobData.jobId = p3
	end))
	
	return reactModule.createElement(reactModule.Fragment, {}, {})
end

return function(_)
	-- upvalues: reactModule (ref), selfieQRCodeModule (ref), var1 (ref), focusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref)
	local var2, var3 = reactModule.useState(false)
	local current = reactModule.useRef({ url = "", jobId = "" }).current
	local var4 = if var2 then reactModule.createElement(selfieQRCodeModule, {
		displaySelfieQRCode = var3,
		url = current.url,
		jobId = current.jobId
	}) else nil
	
	return reactModule.createElement(reactModule.Fragment, {}, {
		EventListener = reactModule.createElement(var1, { displaySelfieQRCode = var3, jobData = current }),
		FocusNavigationCoreScriptsWrapper = if var4 ~= nil then nil else reactModule.createElement(focusRoot, {
			isIsolated = true,
			isAutoFocusRoot = true,
			surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.CentralOverlay
		}, { Dialog = var4 })
	})
end