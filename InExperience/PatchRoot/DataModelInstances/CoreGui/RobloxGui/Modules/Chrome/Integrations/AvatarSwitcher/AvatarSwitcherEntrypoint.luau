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
local fFlagChromeActivatedMappedSignal = sharedFlagsModule.FFlagChromeActivatedMappedSignal
local addAvatarsSwitcherToCoreGUIEngineFeature = game:GetEngineFeature("AddAvatarsSwitcherToCoreGUI")
local var14 = mappedSignal.new(serviceModule:onIntegrationStatusChanged(), function() --[[ line: 27 ]]
	-- upvalues: serviceModule (ref), constantsModule (ref)
	return serviceModule:isWindowOpen(constantsModule.AVATAR_SWITCHER_ID)
end)
local var15 = if fFlagRemoveAvatarSwitcherIfUnsupported then url.AVATAR_URL .. "v2/avatar/experience/get-experience-avatar-support" else nil
local var16 = if fFlagChromeWindowSignalConstraintsToggle then windowSizeSignalModule.new(844, 754, false, true) else windowSizeSignalModule.new(844, 754, false)
local var17 = if addAvatarsSwitcherToCoreGUIEngineFeature then starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.All) or starterGuiService:GetCoreGuiEnabled(Enum.CoreGuiType.AvatarSwitcher) else true

local function _() --[[ line: 49 | named "getInitialAvailability" ]]
	-- upvalues: addAvatarsSwitcherToCoreGUIEngineFeature (ref), var17 (write), fFlagRemoveAvatarSwitcherIfUnsupported (ref), serviceModule (ref)
	return if addAvatarsSwitcherToCoreGUIEngineFeature then if var17 and not fFlagRemoveAvatarSwitcherIfUnsupported then serviceModule.AvailabilitySignal.Available else serviceModule.AvailabilitySignal.Unavailable elseif fFlagRemoveAvatarSwitcherIfUnsupported then serviceModule.AvailabilitySignal.Unavailable else serviceModule.AvailabilitySignal.Available
end

local var18 = serviceModule:register({
	label = "Feature.AvatarSwitcher.Heading.SwitchAvatar",
	cachePosition = true,
	draggable = true,
	initialAvailability = if not addAvatarsSwitcherToCoreGUIEngineFeature then if not addAvatarsSwitcherToCoreGUIEngineFeature then if var17 and not fFlagRemoveAvatarSwitcherIfUnsupported then serviceModule.AvailabilitySignal.Available else serviceModule.AvailabilitySignal.Unavailable elseif fFlagRemoveAvatarSwitcherIfUnsupported then serviceModule.AvailabilitySignal.Unavailable else serviceModule.AvailabilitySignal.Available elseif fFlagRemoveAvatarSwitcherIfUnsupported then serviceModule.AvailabilitySignal.Unavailable else serviceModule.AvailabilitySignal.Available,
	id = constantsModule.AVATAR_SWITCHER_ID,
	sideSheetPlacement = sideSheetPlacement.Vertical,
	activated = function(_) --[[ line: 72 ]]
		-- upvalues: serviceModule (ref), constantsModule (ref)
		serviceModule:toggleWindow(constantsModule.AVATAR_SWITCHER_ID)
	end,
	isActivated = if fFlagChromeActivatedMappedSignal then var14 else function() --[[ line: 77 ]]
		-- upvalues: var14 (ref)
		return var14:get()
	end,
	windowSize = var16,
	components = {
		Icon = function() --[[ line: 84 ]]
			-- upvalues: reactModule (ref), avatarSwitcherIconModule (ref), var14 (ref)
			return reactModule.createElement(avatarSwitcherIconModule, { isActive = var14 })
		end,
		Window = function() --[[ line: 90 ]]
			-- upvalues: reactModule (ref), avatarSwitcherChromeWrapperModule (ref), var16 (ref)
			return reactModule.createElement(avatarSwitcherChromeWrapperModule, {
				maxWindowWidth = 844,
				maxWindowHeight = 754,
				windowSize = var16
			})
		end
	}
})

if addAvatarsSwitcherToCoreGUIEngineFeature then
	local var19 = not fFlagRemoveAvatarSwitcherIfUnsupported
	
	local _ = function() --[[ line: 105 | named "updateAvatarSwitcherAvailability" ]]
		-- upvalues: var17 (write), var19 (write), var18 (ref), serviceModule (ref), constantsModule (ref)
		if var17 and var19 then
			var18.availability:available()
			
			return
		elseif serviceModule:isWindowOpen(constantsModule.AVATAR_SWITCHER_ID) then
			serviceModule:toggleWindow(constantsModule.AVATAR_SWITCHER_ID)
		end
		var18.availability:unavailable()
	end
	
	chromeUtilsModule.setCoreGuiAvailability(var18, Enum.CoreGuiType.AvatarSwitcher, function(p0) --[[ line: 117 ]]
		-- upvalues: var17 (write), var19 (write), var18 (ref), serviceModule (ref), constantsModule (ref)
		var17 = p0
		
		if var17 and var19 then
			var18.availability:available()
			
			return
		elseif serviceModule:isWindowOpen(constantsModule.AVATAR_SWITCHER_ID) then
			serviceModule:toggleWindow(constantsModule.AVATAR_SWITCHER_ID)
		end
		var18.availability:unavailable()
	end)
	
	if fFlagRemoveAvatarSwitcherIfUnsupported then
		task.spawn(function() --[[ line: 124 ]]
			-- upvalues: httpRbxApiService (ref), var15 (ref), httpService (ref), var19 (write), var17 (write), var18 (ref), serviceModule (ref), constantsModule (ref)
			if not game:IsLoaded() then
				game.Loaded:Wait()
			end
			local ok, status = pcall(function() --[[ line: 130 ]]
				-- upvalues: httpRbxApiService (copy), var15 (copy), httpService (copy)
				return httpService:JSONDecode(httpRbxApiService:GetAsyncFullUrl(var15))
			end)
			
			if ok and status and status.experienceAvatarSupportType ~= 0 then
				var19 = true
				
				if var17 then
					var18.availability:available()
					
					return
				elseif serviceModule:isWindowOpen(constantsModule.AVATAR_SWITCHER_ID) then
					serviceModule:toggleWindow(constantsModule.AVATAR_SWITCHER_ID)
				end
				var18.availability:unavailable()
			end
		end)
	end
elseif fFlagRemoveAvatarSwitcherIfUnsupported then
	task.spawn(function() --[[ line: 147 ]]
		-- upvalues: httpRbxApiService (ref), var15 (ref), httpService (ref), var18 (ref)
		if not game:IsLoaded() then
			game.Loaded:Wait()
		end
		local ok, status = pcall(function() --[[ line: 153 ]]
			-- upvalues: httpRbxApiService (copy), var15 (copy), httpService (copy)
			return httpService:JSONDecode(httpRbxApiService:GetAsyncFullUrl(var15))
		end)
		
		if ok and status and status.experienceAvatarSupportType ~= 0 then
			var18.availability:available()
		end
	end)
end
return var18