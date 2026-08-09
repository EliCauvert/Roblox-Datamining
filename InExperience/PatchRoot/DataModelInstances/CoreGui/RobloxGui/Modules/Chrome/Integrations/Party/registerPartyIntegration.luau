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
local sharedFlagsModule = require(corePackagesService.Workspace.Packages.SharedFlags)
local symbol = require(corePackagesService.Workspace.Packages.AppCommonLib).Symbol
local sideSheetPlacement = chromeModule.Enums.SideSheetPlacement
local connectIntegrationCheckForDirectionalInput = game:DefineFastFlag("ConnectIntegrationCheckForDirectionalInput", false)
local fFlagChromeActivatedMappedSignal = sharedFlagsModule.FFlagChromeActivatedMappedSignal
local var13 = if fFlagChromeActivatedMappedSignal then mappedSignal.new(inExperienceAppChatModalModule.default.visibilitySignal.Event, function() --[[ line: 31 ]]
	-- upvalues: inExperienceAppChatModalModule (ref)
	return inExperienceAppChatModalModule:getVisible()
end) else nil

return function(p0, p1) --[[ line: 36 ]]
	-- upvalues: serviceModule (ref), sideSheetPlacement (ref), inExperienceAppChatModalModule (ref), chromeIntegrationUtilsModule (ref), connectIntegrationCheckForDirectionalInput (ref), responsiveModule (ref), focusUtils (ref), localStoreModule (ref), getFStringConnectTooltipLocalStorageKeyModule (ref), fFlagChromeActivatedMappedSignal (ref), var13 (ref), reactModule (ref), partyIconModule (ref), symbol (ref), mouseIconOverrideService (ref)
	local var14 = serviceModule:register({
		label = "Feature.Squads.Label.Party",
		id = p0,
		sideSheetPlacement = sideSheetPlacement.None,
		activated = function() --[[ line: 41 ]]
			-- upvalues: inExperienceAppChatModalModule (copy), chromeIntegrationUtilsModule (copy), connectIntegrationCheckForDirectionalInput (copy), responsiveModule (copy), focusUtils (copy), localStoreModule (copy), getFStringConnectTooltipLocalStorageKeyModule (copy)
			if inExperienceAppChatModalModule:getVisible() then
				inExperienceAppChatModalModule.default:setVisible(false)
			else
				chromeIntegrationUtilsModule.dismissRobloxMenuAndRun(function() --[[ line: 45 ]]
					-- upvalues: connectIntegrationCheckForDirectionalInput (copy), responsiveModule (copy), focusUtils (copy), inExperienceAppChatModalModule (copy)
					if not connectIntegrationCheckForDirectionalInput then
						focusUtils.FocusOffChrome(function() --[[ line: 53 ]]
							-- upvalues: inExperienceAppChatModalModule (copy)
							inExperienceAppChatModalModule.default:setVisible(true)
						end)
						
						return
					elseif responsiveModule.GetInputModeStore(false).getLastInputType(false) == responsiveModule.Input.Directional then
						focusUtils.FocusOffChrome()
					end
					inExperienceAppChatModalModule.default:setVisible(true)
				end)
			end
			localStoreModule.storeForLocalPlayer(getFStringConnectTooltipLocalStorageKeyModule(), true)
		end,
		isActivated = if fFlagChromeActivatedMappedSignal then var13 else function() --[[ line: 63 ]]
			-- upvalues: inExperienceAppChatModalModule (copy)
			return inExperienceAppChatModalModule:getVisible()
		end,
		components = {
			Icon = function(p2) --[[ line: 67 ]]
				-- upvalues: reactModule (copy), partyIconModule (copy), p0 (ref)
				return reactModule.createElement(partyIconModule, { integrationId = p0, isIconVisible = p2.visible })
			end
		},
		initialAvailability = p1
	})
	local inExperienceRobloxParty = symbol.named("InExperienceRobloxParty")
	inExperienceAppChatModalModule.default.visibilitySignal.Event:Connect(function(p3) --[[ line: 79 ]]
		-- upvalues: mouseIconOverrideService (copy), inExperienceRobloxParty (ref)
		if p3 then
			mouseIconOverrideService.push(inExperienceRobloxParty, Enum.OverrideMouseIconBehavior.ForceShow)
			
			return
		end
		mouseIconOverrideService.pop(inExperienceRobloxParty)
	end)
	
	return var14
end