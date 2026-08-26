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
local var1 = mappedSignal.new(serviceModule:onIntegrationStatusChanged(), function()
	-- upvalues: serviceModule (ref), constantsModule (ref)
	return serviceModule:isWindowOpen(constantsModule.AVATAR_SWITCHER_ID)
end)
local var2 = if fFlagRemoveAvatarSwitcherIfUnsupported then url.AVATAR_URL .. "v2/avatar/experience/get-experience-avatar-support" else nil
local var3 = if fFlagChromeWindowSignalConstraintsToggle then windowSizeSignalModule.new(844, 754, false, true) else windowSizeSignalModule.new(844, 754, false)
local all = starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.All) or starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.AvatarSwitcher)

local function _()
	-- upvalues: all (write), fFlagRemoveAvatarSwitcherIfUnsupported (ref), serviceModule (ref)
	return if all and not fFlagRemoveAvatarSwitcherIfUnsupported then serviceModule.AvailabilitySignal.Available else serviceModule.AvailabilitySignal.Unavailable
end

local var4 = serviceModule:register({
	label = "Feature.AvatarSwitcher.Heading.SwitchAvatar",
	cachePosition = true,
	draggable = true,
	initialAvailability = if all and not fFlagRemoveAvatarSwitcherIfUnsupported then serviceModule.AvailabilitySignal.Available else serviceModule.AvailabilitySignal.Unavailable,
	id = constantsModule.AVATAR_SWITCHER_ID,
	sideSheetPlacement = sideSheetPlacement.Vertical,
	activated = function(_)
		-- upvalues: serviceModule (ref), constantsModule (ref)
		serviceModule:toggleWindow(constantsModule.AVATAR_SWITCHER_ID)
	end,
	isActivated = var1,
	windowSize = var3,
	components = {
		Icon = function()
			-- upvalues: reactModule (ref), avatarSwitcherIconModule (ref), var1 (ref)
			return reactModule.createElement(avatarSwitcherIconModule, { isActive = var1 })
		end,
		Window = function()
			-- upvalues: reactModule (ref), avatarSwitcherChromeWrapperModule (ref), var3 (ref)
			return reactModule.createElement(avatarSwitcherChromeWrapperModule, {
				maxWindowWidth = 844,
				maxWindowHeight = 754,
				windowSize = var3
			})
		end
	}
})
local var5 = not fFlagRemoveAvatarSwitcherIfUnsupported

local _ = function()
	-- upvalues: all (write), var5 (write), var4 (ref), serviceModule (ref), constantsModule (ref)
	if all and var5 then
		var4.availability:available()
		
		return
	elseif serviceModule:isWindowOpen(constantsModule.AVATAR_SWITCHER_ID) then
		serviceModule:toggleWindow(constantsModule.AVATAR_SWITCHER_ID)
	end
	var4.availability:unavailable()
end

chromeUtilsModule.setCoreGuiAvailability(var4, Enum.CoreGuiType.AvatarSwitcher, function(p1)
	-- upvalues: all (write), var5 (write), var4 (ref), serviceModule (ref), constantsModule (ref)
	all = p1
	
	if all and var5 then
		var4.availability:available()
		
		return
	elseif serviceModule:isWindowOpen(constantsModule.AVATAR_SWITCHER_ID) then
		serviceModule:toggleWindow(constantsModule.AVATAR_SWITCHER_ID)
	end
	var4.availability:unavailable()
end)

if fFlagRemoveAvatarSwitcherIfUnsupported then
	task.spawn(function()
		-- upvalues: httpRbxApiService (ref), var2 (ref), httpService (ref), var5 (write), all (write), var4 (ref), serviceModule (ref), constantsModule (ref)
		if not game:IsLoaded() then
			game.Loaded:Wait()
		end
		local ok, status = pcall(function()
			-- upvalues: httpRbxApiService (copy), var2 (copy), httpService (copy)
			return httpService:JSONDecode(httpRbxApiService:GetAsyncFullUrl(var2))
		end)
		
		if ok and status and status.experienceAvatarSupportType ~= 0 then
			var5 = true
			
			if all then
				var4.availability:available()
				
				return
			elseif serviceModule:isWindowOpen(constantsModule.AVATAR_SWITCHER_ID) then
				serviceModule:toggleWindow(constantsModule.AVATAR_SWITCHER_ID)
			end
			var4.availability:unavailable()
		end
	end)
end
return var4