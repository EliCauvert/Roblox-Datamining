local guiService = game:GetService("GuiService")
local httpService = game:GetService("HttpService")
local parent = script:FindFirstAncestor("MediaGallery").Parent
local centralOverlayModule = require(parent.CentralOverlay)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local setCentralOverlay = centralOverlayModule.Actions.SetCentralOverlay
local centralOverlayType = robloxAppEnumsModule.CentralOverlayType
local getAppFeaturePolicies = universalAppPolicyModule.getAppFeaturePolicies

return function(p0, p1, p2, p3)
	-- upvalues: httpService (ref), guiService (ref), getAppFeaturePolicies (ref), setCentralOverlay (ref), centralOverlayType (ref)
	if not p0 or #p0 == 0 then return end
	local function doOpen()
		-- upvalues: p0 (ref), httpService (copy), p1 (ref), guiService (copy), p3 (ref)
		guiService:BroadcastNotification(httpService:JSONEncode({
			animated = true,
			url = `https://www.youtube-nocookie.com/embed/{p0}?autoplay=1&controls=0&modestbranding=1&rel=0&loop=0&cc_load_policy=0&playsinline=0`,
			title = p1 or ""
		}), 23)
		
		if p3 then
			p3()
		end
	end
	
	if getAppFeaturePolicies().getShowYouTubeAgeAlert() then
		p2(setCentralOverlay(centralOverlayType.LeaveRobloxAlert, { continueFunc = doOpen }))
		
		return
	end
	doOpen()
end