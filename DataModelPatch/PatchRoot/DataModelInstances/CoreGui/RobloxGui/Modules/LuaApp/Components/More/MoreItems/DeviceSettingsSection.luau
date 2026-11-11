local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local AppLifecycleObserverService = game:GetService("AppLifecycleObserverService")
local DashModule = require(CorePackages.Packages.Dash)
local ReactModule = require(CorePackages.Packages.React)
local UseCrossPlaySettingsFunction = require(CorePackages.Workspace.Packages.CrossPlay).Hooks.useCrossPlaySettings
local CrossPlayCapabilities = require(CorePackages.Workspace.Packages.UniversalAppPolicy).Enum.CrossPlayCapabilities
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local UseAppPolicyModule = require(Modules.LuaApp.Hooks.useAppPolicy)
local UseEffectOnMountFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.useEffectOnMount
local MoreSectionModule = require(Modules.LuaApp.TenFootUI.MoreComponents.MoreSection)
local MoreStatusButtonModule = require(Modules.LuaApp.TenFootUI.MoreComponents.MoreStatusButton)
local BodyText = require(Modules.LuaApp.TenFootUI.MoreComponents.MoreText).BodyText
local FFlagDontUseCrossPlayGlobalEffect = require(CorePackages.Workspace.Packages.SharedFlags).FFlagDontUseCrossPlayGlobalEffect
local _ = require(script.Parent.Types)

local function _(p1, p2): string
	local Text: string = if p1.isEnabled then "(" .. p2.recommended .. ") " else ""
	
	if p1.isLoading then
		Text ..= p2.loading
		
		return Text
	elseif p1.hasError then
		Text ..= p2.error
		
		return Text
	elseif p1.isEnabled then
		Text ..= p2.enabled
		
		return Text
	else
		return Text .. p2.disabled
	end
end

local _ = function(p1): boolean
	return p1 and (p1.Success and (p1.CanJoinGame and p1.PrivilegeCheckResult == "NoIssue"))
end

local function getPrivilegeStatuses(p1, SystemPrivileges, p2, IsLoading)
	-- upvalues: CrossPlayCapabilities (copy), DashModule (copy)
	local config = {
		[CrossPlayCapabilities.CrossPlatform] = p2.crossPlatform,
		[CrossPlayCapabilities.Multiplayer] = p2.multiplayer,
		[CrossPlayCapabilities.SharedContent] = p2.sharedContent
	}
	
	return DashModule.map(p1, function(p3)
		-- upvalues: SystemPrivileges (copy), IsLoading (copy), p2 (copy), config (copy)
		local SystemPrivilege = SystemPrivileges[p3]
		local IsNoIssue: boolean = SystemPrivilege and (SystemPrivilege.Success and (SystemPrivilege.CanJoinGame and SystemPrivilege.PrivilegeCheckResult == "NoIssue"))
		local IsError: boolean = SystemPrivileges[p3] and SystemPrivileges[p3].PrivilegeCheckResult == "Error"
		
		return {
			label = config[p3],
			status = if IsLoading then p2.loading elseif IsError then p2.error elseif IsNoIssue then p2.allowed else p2.disallowed
		}
	end)
end

local function useCrossPlayStatus(p1)
	-- upvalues: UseCrossPlaySettingsFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), getPrivilegeStatuses (copy), UseEffectOnMountFunction (copy)
	local UseCrossPlaySettingsResult = UseCrossPlaySettingsFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		multiplayer = "Feature.Settings.Label.Multiplayer",
		sharedContent = "Feature.Settings.Label.SharedContent",
		recommended = "Feature.Settings.Label.Recommended",
		enabled = "Feature.Settings.Label.Enabled",
		disabled = "Feature.Settings.Label.Disabled",
		loading = "Feature.Settings.Label.Loading",
		error = "Feature.Settings.Label.Error",
		allowed = "Feature.Settings.Label.Allowed",
		disallowed = "Feature.Settings.Label.Disallowed"
	})
	local Text: string = if UseCrossPlaySettingsResult.isEnabled then "(" .. UseLocalizationResult.recommended .. ") " else ""
	local Text1: string = if UseCrossPlaySettingsResult.isLoading then Text .. UseLocalizationResult.loading elseif UseCrossPlaySettingsResult.hasError then Text .. UseLocalizationResult.error elseif UseCrossPlaySettingsResult.isEnabled then Text .. UseLocalizationResult.enabled else Text .. UseLocalizationResult.disabled
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: getPrivilegeStatuses (upval), p1 (copy), UseCrossPlaySettingsResult (copy), UseLocalizationResult (copy)
		return getPrivilegeStatuses(p1, UseCrossPlaySettingsResult.systemPrivileges, UseLocalizationResult, UseCrossPlaySettingsResult.isLoading)
	end, { UseCrossPlaySettingsResult, p1, UseLocalizationResult })
	UseEffectOnMountFunction(function()
		-- upvalues: UseCrossPlaySettingsResult (copy)
		UseCrossPlaySettingsResult.reload()
	end)
	
	return (ReactModule.useMemo(function()
		-- upvalues: UseCrossPlaySettingsResult (copy), Text1 (copy), UseMemoResult (copy)
		return {
			crossPlaySettings = UseCrossPlaySettingsResult,
			crossPlayStatusText = Text1,
			privilegeStatuses = UseMemoResult
		}
	end, { UseCrossPlaySettingsResult, Text1, UseMemoResult }))
end

local _ = function(p1, p2, p3)
	-- upvalues: DashModule (copy)
	return DashModule.reduce(p2, function(IsNoIssue, p4): boolean
		-- upvalues: p3 (copy)
		local IsNoIssue1: boolean = IsNoIssue
		
		if IsNoIssue1 then
			local v1 = p3[p4]
			IsNoIssue1 = v1 and (v1.Success and (v1.CanJoinGame and v1.PrivilegeCheckResult == "NoIssue"))
		end
		return IsNoIssue1
	end, p1.isEnabled)
end

return function(p1)
	-- upvalues: UseAppPolicyModule (copy), UseLocalizationFunction (copy), useCrossPlayStatus (copy), FFlagDontUseCrossPlayGlobalEffect (copy), ReactModule (copy), AppLifecycleObserverService (copy), DashModule (copy), MoreStatusButtonModule (copy), BodyText (copy), MoreSectionModule (copy)
	local UseAppPolicyModuleResult = UseAppPolicyModule(function(p2)
		return p2.getPlatformAccountName()
	end)
	local UseLocalizationResult = UseLocalizationFunction({
		crossPlatform = "Feature.Settings.Label.CrossPlatform",
		crossPlatformDescription = "Feature.Settings.Description.CrossPlatform",
		platformAccountSettingsSuccess = {
			"Feature.Settings.Description.PlatformAccountSettingsSuccess",
			platform = UseAppPolicyModuleResult
		},
		platformAccountSettings = {
			"Feature.Settings.Heading.PlatformAccountSettings",
			platform = UseAppPolicyModuleResult
		}
	})
	local UseAppPolicyModuleResult1 = UseAppPolicyModule(function(p2)
		return (p2.getCrossPlayCapabilities())
	end)
	local UseCrossPlayStatusResult = useCrossPlayStatus(UseAppPolicyModuleResult1)
	local CrossPlaySettings = UseCrossPlayStatusResult.crossPlaySettings
	local CrossPlayStatusText = UseCrossPlayStatusResult.crossPlayStatusText
	local PrivilegeStatuses = UseCrossPlayStatusResult.privilegeStatuses
	
	if FFlagDontUseCrossPlayGlobalEffect then
		ReactModule.useEffect(function()
			-- upvalues: AppLifecycleObserverService (upval), CrossPlaySettings (copy)
			local OnBecomeActiveConnection = AppLifecycleObserverService.OnBecomeActive:Connect(function()
				-- upvalues: CrossPlaySettings (upval)
				CrossPlaySettings.reload()
			end)
			
			return function()
				-- upvalues: OnBecomeActiveConnection (copy)
				OnBecomeActiveConnection:Disconnect()
			end
		end, { CrossPlaySettings })
	end
	local SystemPrivileges = CrossPlaySettings.systemPrivileges
	
	return ReactModule.createElement(MoreSectionModule, {
		layoutOrder = p1.layoutOrder,
		withDivider = p1.withDivider,
		title = UseLocalizationResult.platformAccountSettings
	}, DashModule.append({
		ReactModule.createElement(MoreStatusButtonModule, {
			layoutOrder = 1,
			title = UseLocalizationResult.crossPlatform,
			status = CrossPlayStatusText,
			isDisabled = CrossPlaySettings.isLoading,
			onActivated = CrossPlaySettings.toggle
		}),
		ReactModule.createElement(BodyText, {
			layoutOrder = 2,
			text = UseLocalizationResult.crossPlatformDescription
		})
	}, DashModule.map(PrivilegeStatuses, function(p2, p3: number)
		-- upvalues: ReactModule (upval), MoreStatusButtonModule (upval), CrossPlaySettings (copy)
		return ReactModule.createElement(MoreStatusButtonModule, {
			layoutOrder = p3 + 2,
			title = p2.label,
			status = p2.status,
			onActivated = CrossPlaySettings.invokeSystemUi
		})
	end), {
		if DashModule.reduce(UseAppPolicyModuleResult1, function(IsNoIssue, p2): boolean
			-- upvalues: SystemPrivileges (copy)
			local IsNoIssue1: boolean = IsNoIssue
			
			if IsNoIssue1 then
				local v1 = SystemPrivileges[p2]
				IsNoIssue1 = v1 and (v1.Success and (v1.CanJoinGame and v1.PrivilegeCheckResult == "NoIssue"))
			end
			return IsNoIssue1
		end, CrossPlaySettings.isEnabled) then ReactModule.createElement(BodyText, {
			layoutOrder = 10,
			text = UseLocalizationResult.platformAccountSettingsSuccess
		}) else nil
	}))
end