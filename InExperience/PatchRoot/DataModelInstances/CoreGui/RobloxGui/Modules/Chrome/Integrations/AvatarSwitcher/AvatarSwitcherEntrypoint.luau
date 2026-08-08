local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local httpRbxApiService = game:GetService("HttpRbxApiService")
local httpService = game:GetService("HttpService")
local starterGuiService = game:GetService("StarterGui")
local reactModule = require(corePackagesService.Packages.React)
local serviceModule = require(chrome.Service)
local chromeUtilsModule = require(chrome.ChromeShared.Service.ChromeUtils)
local mappedSignal = chromeUtilsModule.MappedSignal
local windowSizeSignalModule = require(chrome.ChromeShared.Service.WindowSizeSignal)
local constantsModule = require(chrome.ChromeShared.Unibar.Constants)
local avatarSwitcherChromeWrapperModule = require(chrome.Integrations.AvatarSwitcher.AvatarSwitcherChromeWrapper)
local avatarSwitcherIconModule = require(chrome.Integrations.AvatarSwitcher.AvatarSwitcherIcon)
local url = require(corePackagesService.Workspace.Packages.Http).Url
local sideSheetPlacement = require(corePackagesService.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local fFlagChromeWindowSignalConstraintsToggle = sharedFlagsModule.FFlagChromeWindowSignalConstraintsToggle
local fFlagRemoveAvatarSwitcherIfUnsupported = sharedFlagsModule.FFlagRemoveAvatarSwitcherIfUnsupported
local var13 = mappedSignal.new(serviceModule:onIntegrationStatusChanged(), function() --[[ line: 25 ]]
	-- upvalues: serviceModule (ref), constantsModule (ref)
	return serviceModule:isWindowOpen(constantsModule.AVATAR_SWITCHER_ID)
end)
local var14 = if fFlagRemoveAvatarSwitcherIfUnsupported then url.AVATAR_URL .. "v2/avatar/experience/get-experience-avatar-support" else nil
local var15 = if fFlagChromeWindowSignalConstraintsToggle then windowSizeSignalModule.new(844, 754, false, true) else windowSizeSignalModule.new(844, 754, false)
local all = starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.All) or starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.AvatarSwitcher)

local function _() --[[ line: 43 | named "getInitialAvailability" ]]
	-- upvalues: all (write), fFlagRemoveAvatarSwitcherIfUnsupported (ref), serviceModule (ref)
	return if all and not fFlagRemoveAvatarSwitcherIfUnsupported then serviceModule.AvailabilitySignal.Available else serviceModule.AvailabilitySignal.Unavailable
end

local var17 = serviceModule:register({
	label = "Feature.AvatarSwitcher.Heading.SwitchAvatar",
	cachePosition = true,
	draggable = true,
	initialAvailability = if all and not fFlagRemoveAvatarSwitcherIfUnsupported then serviceModule.AvailabilitySignal.Available else serviceModule.AvailabilitySignal.Unavailable,
	id = constantsModule.AVATAR_SWITCHER_ID,
	sideSheetPlacement = sideSheetPlacement.Vertical,
	activated = function(_) --[[ line: 55 ]]
		-- upvalues: serviceModule (ref), constantsModule (ref)
		serviceModule:toggleWindow(constantsModule.AVATAR_SWITCHER_ID)
	end,
	isActivated = var13,
	windowSize = var15,
	components = {
		Icon = function() --[[ line: 63 ]]
			-- upvalues: reactModule (ref), avatarSwitcherIconModule (ref), var13 (ref)
			return reactModule.createElement(avatarSwitcherIconModule, { isActive = var13 })
		end,
		Window = function() --[[ line: 69 ]]
			-- upvalues: reactModule (ref), avatarSwitcherChromeWrapperModule (ref), var15 (ref)
			return reactModule.createElement(avatarSwitcherChromeWrapperModule, {
				maxWindowWidth = 844,
				maxWindowHeight = 754,
				windowSize = var15
			})
		end
	}
})
local var18 = not fFlagRemoveAvatarSwitcherIfUnsupported

local _ = function() --[[ line: 83 | named "updateAvatarSwitcherAvailability" ]]
	-- upvalues: all (write), var18 (write), var17 (ref), serviceModule (ref), constantsModule (ref)
	if all and var18 then
		var17.availability:available()
		
		return
	elseif serviceModule:isWindowOpen(constantsModule.AVATAR_SWITCHER_ID) then
		serviceModule:toggleWindow(constantsModule.AVATAR_SWITCHER_ID)
	end
	var17.availability:unavailable()
end

chromeUtilsModule.setCoreGuiAvailability(var17, Enum.CoreGuiType.AvatarSwitcher, function(p0) --[[ line: 95 ]]
	-- upvalues: all (write), var18 (write), var17 (ref), serviceModule (ref), constantsModule (ref)
	all = p0
	
	if all and var18 then
		var17.availability:available()
		
		return
	elseif serviceModule:isWindowOpen(constantsModule.AVATAR_SWITCHER_ID) then
		serviceModule:toggleWindow(constantsModule.AVATAR_SWITCHER_ID)
	end
	var17.availability:unavailable()
end)

if fFlagRemoveAvatarSwitcherIfUnsupported then
	task.spawn(function() --[[ line: 102 ]]
		-- upvalues: httpRbxApiService (ref), var14 (ref), httpService (ref), var18 (write), all (write), var17 (ref), serviceModule (ref), constantsModule (ref)
		if not game:IsLoaded() then
			game.Loaded:Wait()
		end
		local ok, status = pcall(function() --[[ line: 108 ]]
			-- upvalues: httpRbxApiService (copy), var14 (copy), httpService (copy)
			return httpService:JSONDecode(httpRbxApiService:GetAsyncFullUrl(var14))
		end)
		
		if ok and status and status.experienceAvatarSupportType ~= 0 then
			var18 = true
			
			if all then
				var17.availability:available()
				
				return
			elseif serviceModule:isWindowOpen(constantsModule.AVATAR_SWITCHER_ID) then
				serviceModule:toggleWindow(constantsModule.AVATAR_SWITCHER_ID)
			end
			var17.availability:unavailable()
		end
	end)
end
return var17