local chrome = script:FindFirstAncestor("Chrome")
local corePackagesService = game:GetService("CorePackages")
local partyIconModule = require(script.Parent.PartyIcon)
local serviceModule = require(chrome.Service)
local chromeIntegrationUtilsModule = require(chrome.Integrations.ChromeIntegrationUtils)
local getFStringConnectTooltipLocalStorageKeyModule = require(chrome.Flags.GetFStringConnectTooltipLocalStorageKey)
local localStoreModule = require(chrome.ChromeShared.Service.LocalStore)
local mappedSignal = require(chrome.ChromeShared.Service.ChromeUtils).MappedSignal
local focusUtils = require(corePackagesService.Workspace.Packages.Chrome).FocusUtils
local chromeModule = require(corePackagesService.Workspace.Packages.Chrome)
local inExperienceAppChatModalModule = require(corePackagesService.Workspace.Packages.AppChat.InExperienceAppChatModal)
local mouseIconOverrideService = require(corePackagesService.Workspace.Packages.CoreScriptsCommon).MouseIconOverrideService
local reactModule = require(corePackagesService.Packages.React)
local responsiveModule = require(corePackagesService.Workspace.Packages.Responsive)
local symbol = require(corePackagesService.Workspace.Packages.AppCommonLib).Symbol
local sideSheetPlacement = chromeModule.Enums.SideSheetPlacement
local var11 = mappedSignal.new(inExperienceAppChatModalModule.default.visibilitySignal.Event, function()
	-- upvalues: inExperienceAppChatModalModule (ref)
	return inExperienceAppChatModalModule:getVisible()
end)

return function(p0, p1)
	-- upvalues: serviceModule (ref), sideSheetPlacement (ref), inExperienceAppChatModalModule (ref), chromeIntegrationUtilsModule (ref), responsiveModule (ref), focusUtils (ref), localStoreModule (ref), getFStringConnectTooltipLocalStorageKeyModule (ref), var11 (ref), reactModule (ref), partyIconModule (ref), symbol (ref), mouseIconOverrideService (ref)
	local var12 = serviceModule:register({
		label = "Feature.Squads.Label.Party",
		id = p0,
		sideSheetPlacement = sideSheetPlacement.None,
		activated = function()
			-- upvalues: inExperienceAppChatModalModule (copy), chromeIntegrationUtilsModule (copy), responsiveModule (copy), focusUtils (copy), localStoreModule (copy), getFStringConnectTooltipLocalStorageKeyModule (copy)
			if inExperienceAppChatModalModule:getVisible() then
				inExperienceAppChatModalModule.default:setVisible(false)
			else
				chromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function()
					-- upvalues: responsiveModule (copy), focusUtils (copy), inExperienceAppChatModalModule (copy)
					if responsiveModule.GetInputModeStore(false).getLastInputType(false) == responsiveModule.Input.Directional then
						focusUtils.FocusOffChrome()
					end
					inExperienceAppChatModalModule.default:setVisible(true)
				end)
			end
			localStoreModule.storeForLocalPlayer(getFStringConnectTooltipLocalStorageKeyModule(), true)
		end,
		isActivated = var11,
		components = {
			Icon = function(p2)
				-- upvalues: reactModule (copy), partyIconModule (copy), p0 (ref)
				return reactModule.createElement(partyIconModule, { integrationId = p0, isIconVisible = p2.visible })
			end
		},
		initialAvailability = p1
	})
	local inExperienceRobloxParty = symbol.named("InExperienceRobloxParty")
	inExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p3)
		-- upvalues: mouseIconOverrideService (copy), inExperienceRobloxParty (ref)
		if p3 then
			mouseIconOverrideService.push(inExperienceRobloxParty, Enum.OverrideMouseIconBehavior.ForceShow)
			
			return
		end
		mouseIconOverrideService.pop(inExperienceRobloxParty)
	end)
	
	return var12
end