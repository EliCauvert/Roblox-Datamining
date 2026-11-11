local Chrome = script:FindFirstAncestor("Chrome")
local CorePackages = game:GetService("CorePackages")
local PartyIconModule = require(script.Parent.PartyIcon)
local ServiceModule = require(Chrome.Service)
local ChromeIntegrationUtilsModule = require(Chrome.Integrations.ChromeIntegrationUtils)
local GetFStringConnectTooltipLocalStorageKeyModule = require(Chrome.Flags.GetFStringConnectTooltipLocalStorageKey)
local LocalStoreModule = require(Chrome.ChromeShared.Service.LocalStore)
local MappedSignal = require(Chrome.ChromeShared.Service.ChromeUtils).MappedSignal
local FocusUtils = require(CorePackages.Workspace.Packages.Chrome).FocusUtils
local InExperienceAppChatModalModule = require(CorePackages.Workspace.Packages.AppChat.InExperienceAppChatModal)
local MouseIconOverrideService = require(CorePackages.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local ReactModule = require(CorePackages.Packages.React)
local ResponsiveModule = require(CorePackages.Workspace.Packages.Responsive)
local Symbol = require(CorePackages.Workspace.Packages.AppCommonLib).Symbol
local SideSheetPlacement = require(CorePackages.Workspace.Packages.Chrome).Enums.SideSheetPlacement
local ConnectIntegrationCheckForDirectionalInput = game:DefineFastFlag("ConnectIntegrationCheckForDirectionalInput", false)
local FFlagChromeActivatedMappedSignal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagChromeActivatedMappedSignal
local NewMappedSignal = if FFlagChromeActivatedMappedSignal then MappedSignal.new(InExperienceAppChatModalModule.default.visibilitySignal.Event, function()
	-- upvalues: InExperienceAppChatModalModule (copy)
	return InExperienceAppChatModalModule:getVisible()
end) else nil

return function(Id, InitialAvailability)
	-- upvalues: ServiceModule (copy), SideSheetPlacement (copy), InExperienceAppChatModalModule (copy), ChromeIntegrationUtilsModule (copy), ConnectIntegrationCheckForDirectionalInput (copy), ResponsiveModule (copy), FocusUtils (copy), LocalStoreModule (copy), GetFStringConnectTooltipLocalStorageKeyModule (copy), FFlagChromeActivatedMappedSignal (copy), NewMappedSignal (copy), ReactModule (copy), PartyIconModule (copy), Symbol (copy), MouseIconOverrideService (copy)
	local RegisterResult = ServiceModule:register({
		label = "Feature.Squads.Label.Party",
		id = Id,
		sideSheetPlacement = SideSheetPlacement.None,
		activated = function()
			-- upvalues: InExperienceAppChatModalModule (upval), ChromeIntegrationUtilsModule (upval), ConnectIntegrationCheckForDirectionalInput (upval), ResponsiveModule (upval), FocusUtils (upval), LocalStoreModule (upval), GetFStringConnectTooltipLocalStorageKeyModule (upval)
			if InExperienceAppChatModalModule:getVisible() then
				InExperienceAppChatModalModule.default:setVisible(false)
			else
				ChromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function()
					-- upvalues: ConnectIntegrationCheckForDirectionalInput (upval), ResponsiveModule (upval), FocusUtils (upval), InExperienceAppChatModalModule (upval)
					if not ConnectIntegrationCheckForDirectionalInput then
						FocusUtils.FocusOffChrome(function()
							-- upvalues: InExperienceAppChatModalModule (upval)
							InExperienceAppChatModalModule.default:setVisible(true)
						end)
						
						return
					end
					if ResponsiveModule.GetInputModeStore(false).getLastInputType(false) == ResponsiveModule.Input.Directional then
						FocusUtils.FocusOffChrome()
					end
					InExperienceAppChatModalModule.default:setVisible(true)
				end)
			end
			LocalStoreModule.storeForLocalPlayer(GetFStringConnectTooltipLocalStorageKeyModule(), true)
		end,
		isActivated = if FFlagChromeActivatedMappedSignal then NewMappedSignal else function()
			-- upvalues: InExperienceAppChatModalModule (upval)
			return InExperienceAppChatModalModule:getVisible()
		end,
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