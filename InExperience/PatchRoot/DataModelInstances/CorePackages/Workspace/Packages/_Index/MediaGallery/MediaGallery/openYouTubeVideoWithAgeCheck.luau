local GuiService = game:GetService("GuiService")
local HttpService = game:GetService("HttpService")
local Parent = script:FindFirstAncestor("MediaGallery").Parent
local SetCentralOverlayFunction = require(Parent.CentralOverlay).Actions.SetCentralOverlay
local CentralOverlayType = require(Parent.RobloxAppEnums).CentralOverlayType
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies

return function(p1, p2, Callback: (any) -> (), Callback1) --[[ Line: 19 | Named "openYouTubeVideoWithAgeCheck" ]]
	-- upvalues: HttpService (copy), GuiService (copy), GetAppFeaturePoliciesFunction (copy), SetCentralOverlayFunction (copy), CentralOverlayType (copy)
	if not p1 or #p1 == 0 then return end
	local function doOpen() --[[ Line: 29 ]]
		-- upvalues: p1 (copy), HttpService (upval), p2 (copy), GuiService (upval), Callback1 (copy)
		GuiService:BroadcastNotification(HttpService:JSONEncode({
			animated = true,
			url = `https://www.youtube-nocookie.com/embed/{p1}?autoplay=1&controls=0&modestbranding=1&rel=0&loop=0&cc_load_policy=0&playsinline=0`,
			title = p2 or ""
		}), 23)
		
		if Callback1 then
			Callback1()
		end
	end
	
	if GetAppFeaturePoliciesFunction().getShowYouTubeAgeAlert() then
		Callback(SetCentralOverlayFunction(CentralOverlayType.LeaveRobloxAlert, { continueFunc = doOpen }))
		
		return
	else
		doOpen()
	end
end