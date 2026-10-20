local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local HttpRbxApiService = game:GetService("HttpRbxApiService")
local HttpService = game:GetService("HttpService")
local StarterGui = game:GetService("StarterGui")
local ReactModule = require(CorePackages.Packages.React)
local ServiceModule = require(Chrome.Service)
local ChromeUtilsModule = require(Chrome.ChromeShared.Service.ChromeUtils)
local WindowSizeSignalModule = require(Chrome.ChromeShared.Service.WindowSizeSignal)
local ConstantsModule = require(Chrome.ChromeShared.Unibar.Constants)
local AvatarSwitcherChromeWrapperModule = require(Chrome.Integrations.AvatarSwitcher.AvatarSwitcherChromeWrapper)
local AvatarSwitcherIconModule = require(Chrome.Integrations.AvatarSwitcher.AvatarSwitcherIcon)
local Url = require(CorePackages.Workspace.Packages.Http).Url
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagChromeWindowSignalConstraintsToggle = SharedFlagsModule.FFlagChromeWindowSignalConstraintsToggle
local FFlagRemoveAvatarSwitcherIfUnsupported = SharedFlagsModule.FFlagRemoveAvatarSwitcherIfUnsupported
local NewResult = ChromeUtilsModule.MappedSignal.new(ServiceModule:onIntegrationStatusChanged(), function()
	-- upvalues: ServiceModule (copy), ConstantsModule (copy)
	return ServiceModule:isWindowOpen(ConstantsModule.AVATAR_SWITCHER_ID)
end)
local Text = if FFlagRemoveAvatarSwitcherIfUnsupported then Url.AVATAR_URL .. "v2/avatar/experience/get-experience-avatar-support" else nil
local NewWindowSizeSignal = if FFlagChromeWindowSignalConstraintsToggle then WindowSizeSignalModule.new(844, 754, false, true) else WindowSizeSignalModule.new(844, 754, false)
local CoreGuiEnabled = StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.All) or StarterGui:GetCoreGuiEnabled(Enum.CoreGuiType.AvatarSwitcher)

local function _()
	-- upvalues: CoreGuiEnabled (ref), FFlagRemoveAvatarSwitcherIfUnsupported (copy), ServiceModule (copy)
	return if CoreGuiEnabled and not FFlagRemoveAvatarSwitcherIfUnsupported then ServiceModule.AvailabilitySignal.Available else ServiceModule.AvailabilitySignal.Unavailable
end

local RegisterResult = ServiceModule:register({
	label = "Feature.AvatarSwitcher.Heading.SwitchAvatar",
	cachePosition = true,
	draggable = true,
	initialAvailability = if CoreGuiEnabled and not FFlagRemoveAvatarSwitcherIfUnsupported then ServiceModule.AvailabilitySignal.Available else ServiceModule.AvailabilitySignal.Unavailable,
	id = ConstantsModule.AVATAR_SWITCHER_ID,
	sideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement.AboveFold,
	activated = function(_)
		-- upvalues: ServiceModule (copy), ConstantsModule (copy)
		ServiceModule:toggleWindow(ConstantsModule.AVATAR_SWITCHER_ID)
	end,
	isActivated = NewResult,
	windowSize = NewWindowSizeSignal,
	components = {
		Icon = function()
			-- upvalues: ReactModule (copy), AvatarSwitcherIconModule (copy), NewResult (copy)
			return ReactModule.createElement(AvatarSwitcherIconModule, { isActive = NewResult })
		end,
		Window = function()
			-- upvalues: ReactModule (copy), AvatarSwitcherChromeWrapperModule (copy), NewWindowSizeSignal (copy)
			return ReactModule.createElement(AvatarSwitcherChromeWrapperModule, {
				maxWindowWidth = 844,
				maxWindowHeight = 754,
				windowSize = NewWindowSizeSignal
			})
		end
	}
})
local NoFFlagRemoveAvatarSwitcherIfUnsupported = not FFlagRemoveAvatarSwitcherIfUnsupported

local _ = function()
	-- upvalues: CoreGuiEnabled (ref), NoFFlagRemoveAvatarSwitcherIfUnsupported (ref), RegisterResult (copy), ServiceModule (copy), ConstantsModule (copy)
	if CoreGuiEnabled and NoFFlagRemoveAvatarSwitcherIfUnsupported then
		RegisterResult.availability:available()
		
		return
	end
	if ServiceModule:isWindowOpen(ConstantsModule.AVATAR_SWITCHER_ID) then
		ServiceModule:toggleWindow(ConstantsModule.AVATAR_SWITCHER_ID)
	end
	RegisterResult.availability:unavailable()
end

ChromeUtilsModule.setCoreGuiAvailability(RegisterResult, Enum.CoreGuiType.AvatarSwitcher, function(p1)
	-- upvalues: CoreGuiEnabled (ref), NoFFlagRemoveAvatarSwitcherIfUnsupported (ref), RegisterResult (copy), ServiceModule (copy), ConstantsModule (copy)
	CoreGuiEnabled = p1
	
	if CoreGuiEnabled and NoFFlagRemoveAvatarSwitcherIfUnsupported then
		RegisterResult.availability:available()
		
		return
	end
	if ServiceModule:isWindowOpen(ConstantsModule.AVATAR_SWITCHER_ID) then
		ServiceModule:toggleWindow(ConstantsModule.AVATAR_SWITCHER_ID)
	end
	RegisterResult.availability:unavailable()
end)

if FFlagRemoveAvatarSwitcherIfUnsupported then
	task.spawn(function()
		-- upvalues: HttpRbxApiService (copy), Text (copy), HttpService (copy), NoFFlagRemoveAvatarSwitcherIfUnsupported (ref), CoreGuiEnabled (ref), RegisterResult (copy), ServiceModule (copy), ConstantsModule (copy)
		if not game:IsLoaded() then
			game.Loaded:Wait()
		end
		local Success, Result = pcall(function()
			-- upvalues: HttpRbxApiService (upval), Text (upval), HttpService (upval)
			return HttpService:JSONDecode((HttpRbxApiService:GetAsyncFullUrl(Text)))
		end)
		
		if Success and Result and Result.experienceAvatarSupportType ~= 0 then
			NoFFlagRemoveAvatarSwitcherIfUnsupported = true
			
			if CoreGuiEnabled and NoFFlagRemoveAvatarSwitcherIfUnsupported then
				RegisterResult.availability:available()
				
				return
			end
			if ServiceModule:isWindowOpen(ConstantsModule.AVATAR_SWITCHER_ID) then
				ServiceModule:toggleWindow(ConstantsModule.AVATAR_SWITCHER_ID)
			end
			RegisterResult.availability:unavailable()
		end
	end)
end
return RegisterResult