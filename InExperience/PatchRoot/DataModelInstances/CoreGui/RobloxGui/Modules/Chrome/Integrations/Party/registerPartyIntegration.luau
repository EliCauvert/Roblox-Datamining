local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local PartyIconModule = require(script.Parent.PartyIcon)
local ServiceModule = require(Chrome.Service)
local ChromeIntegrationUtilsModule = require(Chrome.Integrations.ChromeIntegrationUtils)
local GetFStringConnectTooltipLocalStorageKeyModule = require(Chrome.Flags.GetFStringConnectTooltipLocalStorageKey)
local LocalStoreModule = require(Chrome.ChromeShared.Service.LocalStore)
local FocusUtils = require(CorePackages.Workspace.Packages.Chrome).FocusUtils
local InExperienceAppChatModalModule = require(CorePackages.Workspace.Packages.AppChat.InExperienceAppChatModal)
local MouseIconOverrideService = require(CorePackages.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local ReactModule = require(CorePackages.Packages.React)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local Symbol = require(CorePackages.Workspace.Packages.AppCommonLib).Symbol
local ChatEntryPointNames = require(CorePackages.Workspace.Packages.SocialCommon).Enums.ChatEntryPointNames
local FFlagAppChatDistinctUnibarEntryPoint = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAppChatDistinctUnibarEntryPoint
local SideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local NewResult = require(Chrome.ChromeShared.Service.ChromeUtils).MappedSignal.new(InExperienceAppChatModalModule.default.visibilitySignal.Event, function()
	-- upvalues: InExperienceAppChatModalModule (copy)
	return InExperienceAppChatModalModule:getVisible()
end)

return function(Id, InitialAvailability)
	-- upvalues: ServiceModule (copy), SideSheetPlacement (copy), InExperienceAppChatModalModule (copy), ChromeIntegrationUtilsModule (copy), ResponsiveModule (copy), FocusUtils (copy), FFlagAppChatDistinctUnibarEntryPoint (copy), ChatEntryPointNames (copy), LocalStoreModule (copy), GetFStringConnectTooltipLocalStorageKeyModule (copy), NewResult (copy), ReactModule (copy), PartyIconModule (copy), Symbol (copy), MouseIconOverrideService (copy)
	local RegisterResult = ServiceModule:register({
		label = "Feature.Squads.Label.Party",
		id = Id,
		sideSheetPlacement = SideSheetPlacement.None,
		activated = function()
			-- upvalues: InExperienceAppChatModalModule (upval), ChromeIntegrationUtilsModule (upval), ResponsiveModule (upval), FocusUtils (upval), FFlagAppChatDistinctUnibarEntryPoint (upval), ChatEntryPointNames (upval), LocalStoreModule (upval), GetFStringConnectTooltipLocalStorageKeyModule (upval)
			if InExperienceAppChatModalModule:getVisible() then
				InExperienceAppChatModalModule.default:setVisible(false)
			else
				ChromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function()
					-- upvalues: ResponsiveModule (upval), FocusUtils (upval), FFlagAppChatDistinctUnibarEntryPoint (upval), InExperienceAppChatModalModule (upval), ChatEntryPointNames (upval)
					if ResponsiveModule.GetInputModeStore(false).getLastInputType(false) == ResponsiveModule.Input.Directional then
						FocusUtils.FocusOffChrome()
					end
					if FFlagAppChatDistinctUnibarEntryPoint then
						InExperienceAppChatModalModule.default:setVisible(true, ChatEntryPointNames.ChromeUnibar)
						
						return
					else
						InExperienceAppChatModalModule.default:setVisible(true)
					end
				end)
			end
			LocalStoreModule.storeForLocalPlayer(GetFStringConnectTooltipLocalStorageKeyModule(), true)
		end,
		isActivated = NewResult,
		components = {
			Icon = function(p1)
				-- upvalues: ReactModule (upval), PartyIconModule (upval), Id (copy)
				return ReactModule.createElement(PartyIconModule, { integrationId = Id, isIconVisible = p1.visible })
			end
		},
		initialAvailability = InitialAvailability
	})
	local InExperienceRobloxParty = Symbol.named("InExperienceRobloxParty")
	InExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p1)
		-- upvalues: MouseIconOverrideService (upval), InExperienceRobloxParty (copy)
		if p1 then
			MouseIconOverrideService.push(InExperienceRobloxParty, Enum.OverrideMouseIconBehavior.ForceShow)
			
			return
		else
			MouseIconOverrideService.pop(InExperienceRobloxParty)
		end
	end)
	
	return RegisterResult
end