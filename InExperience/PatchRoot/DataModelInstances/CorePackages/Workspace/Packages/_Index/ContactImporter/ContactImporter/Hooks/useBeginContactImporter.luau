local parent = script:FindFirstAncestor("ContactImporter").Parent
local IXPService = game:GetService("IXPService")
local messageBusService = game:GetService("MessageBusService")
local reactModule = require(parent.React)
local useNavigation = require(parent.Navigation).useNavigation
local socialModalsCommonModule = require(parent.SocialModalsCommon)
local promiseModule = require(parent.Promise)
local permissionsProtocol = require(parent.PermissionsProtocol).PermissionsProtocol
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
local roactAppExperimentModule = require(parent.RoactAppExperiment)
local useAppPolicy = require(parent.UniversalAppPolicy).useAppPolicy
local getDeepValue = require(parent.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local default = permissionsProtocol.default
local list = { permissionsProtocol.Permissions.CONTACTS_ACCESS }
local enumScreens = socialModalsCommonModule.EnumScreens
local settingsRoute = require(parent.LinkingProtocol).Enums.SettingsRoute
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagCIDeeplinkEnabledForAll = sharedFlagsModule.FFlagCIDeeplinkEnabledForAll
local fFlagCiDeprecateFindFriendsModal = sharedFlagsModule.FFlagCiDeprecateFindFriendsModal
local fFlagAddFriendsPageFAEUpsell = sharedFlagsModule.FFlagAddFriendsPageFAEUpsell
local autoPromptStatusModule = require(script.Parent.Parent.Signals.autoPromptStatus)
local realtimeMessageId = messageBusService:GetMessageId("Realtime", "appResume")

return function(p0)
	-- upvalues: useNavigation (ref), reactModule (ref), useAppPolicy (ref), getDeepValue (ref), enumScreens (ref), fFlagCIDeeplinkEnabledForAll (ref), roactAppExperimentModule (ref), appUserLayers (ref), permissionsProtocol (ref), fFlagAddFriendsPageFAEUpsell (ref), autoPromptStatusModule (ref), default (ref), list (ref), promiseModule (ref), fFlagCiDeprecateFindFriendsModal (ref), settingsRoute (ref), IXPService (ref), messageBusService (ref), realtimeMessageId (ref)
	local var10 = useNavigation()
	local var11, var12 = reactModule.useState(false)
	local var13 = useAppPolicy(function(p1)
		return p1.getContactImporterEnabled()
	end)
	local var14 = if p0 then p0.entryPoint else nil
	local var15 = (getDeepValue(var10, "state.routeName") or {}) == enumScreens.ContactImporter
	local var16 = useAppPolicy(function(p2)
		return p2.getContactImporterEncouraged()
	end)
	local var17 = if not fFlagCIDeeplinkEnabledForAll then roactAppExperimentModule.useUserExperiment({
		appUserLayers.ContactImporterDevicePermissionNeededModalExposure
	}, function(p3)
		-- upvalues: appUserLayers (copy)
		return (p3[appUserLayers.ContactImporterDevicePermissionNeededModalExposure] or {}).systemSettingsDeeplinkEnabled
	end, false) else nil
	local var18 = not var16
	local var19 = reactModule.useCallback(function(p4)
		-- upvalues: permissionsProtocol (copy), var12 (ref), var10 (ref), enumScreens (copy), var14 (ref)
		local var22 = p4.status == permissionsProtocol.Status.AUTHORIZED
		var12(var22)
		
		if var22 then
			var10.navigate(enumScreens.ContactsList, { shouldUpdateUserSettings = true, entrypoint = var14 })
		end
	end, { var10, var14 })
	local var20 = reactModule.useCallback(function(p5)
		-- upvalues: permissionsProtocol (copy), var12 (ref), fFlagAddFriendsPageFAEUpsell (copy), autoPromptStatusModule (copy), var16 (ref), default (copy), list (copy), var19 (ref), promiseModule (copy)
		local status = p5.status
		
		if status == permissionsProtocol.Status.AUTHORIZED then
			var12(true)
			
			if fFlagAddFriendsPageFAEUpsell then
				autoPromptStatusModule.setStatus(false)
			end
		elseif status == permissionsProtocol.Status.DENIED then
			if var16 then
				if fFlagAddFriendsPageFAEUpsell then
					local processTime = os.clock()
					default:requestPermissions(list):andThen(function(p6)
						-- upvalues: processTime (ref), permissionsProtocol (copy), autoPromptStatusModule (copy)
						autoPromptStatusModule.setStatus(if os.clock() - processTime < 0.5 then p6.status == permissionsProtocol.Status.AUTHORIZED else true)
						
						return p6
					end):andThen(var19)
				else
					default:requestPermissions(list):andThen(var19)
				end
			elseif fFlagAddFriendsPageFAEUpsell then
				autoPromptStatusModule.setStatus(false)
			end
		elseif fFlagAddFriendsPageFAEUpsell then
			autoPromptStatusModule.setStatus(false)
		end
		return promiseModule.resolve(p5.status)
	end, { var19, var16 })
	local var21 = reactModule.useCallback(function()
		-- upvalues: fFlagCiDeprecateFindFriendsModal (copy), var15 (ref), default (copy), list (copy), permissionsProtocol (copy), var12 (ref), var10 (ref), enumScreens (copy), var14 (ref), settingsRoute (copy), var16 (ref), var11 (ref), fFlagCIDeeplinkEnabledForAll (copy), IXPService (copy), appUserLayers (copy), var17 (write), var18 (ref)
		if fFlagCiDeprecateFindFriendsModal and var15 then
			default:requestPermissions(list):andThen(function(p7)
				-- upvalues: permissionsProtocol (copy), var12 (copy), var10 (copy), enumScreens (copy), var14 (copy), settingsRoute (copy)
				if p7.status == permissionsProtocol.Status.AUTHORIZED then
					var12(true)
					var10.replace(enumScreens.ContactsList, { entrypoint = var14 })
					
					return
				end
				var10.replace(enumScreens.SettingsPermissionInteractiveAlert, { settingsRoute = settingsRoute.Contacts })
			end)
			
			return
		elseif var16 then
			if var11 then
				var10.navigate(enumScreens.ContactsList, { entrypoint = var14 })
				
				return
			elseif not fFlagCIDeeplinkEnabledForAll then
				IXPService:LogUserLayerExposure(appUserLayers.ContactImporterDevicePermissionNeededModalExposure)
			end
			if var17 or fFlagCIDeeplinkEnabledForAll then
				var10.navigate(enumScreens.SettingsPermissionInteractiveAlert, { settingsRoute = settingsRoute.Contacts })
				
				return
			end
			var10.navigate(enumScreens.ContactsRevokedAccessDialog)
			
			return
		elseif var18 then
			default:requestPermissions(list):andThen(function(p8)
				-- upvalues: permissionsProtocol (copy), var10 (copy), enumScreens (copy), var14 (copy), fFlagCIDeeplinkEnabledForAll (copy), IXPService (copy), appUserLayers (copy), var17 (copy), settingsRoute (copy)
				if p8.status == permissionsProtocol.Status.AUTHORIZED then
					var10.navigate(enumScreens.ContactsList, { entrypoint = var14 })
					
					return
				elseif not fFlagCIDeeplinkEnabledForAll then
					IXPService:LogUserLayerExposure(appUserLayers.ContactImporterDevicePermissionNeededModalExposure)
				end
				if var17 or fFlagCIDeeplinkEnabledForAll then
					var10.navigate(enumScreens.SettingsPermissionInteractiveAlert, { settingsRoute = settingsRoute.Contacts })
					
					return
				end
				var10.navigate(enumScreens.ContactsRevokedAccessDialog)
			end)
			
			return
		end
	end, {
		var11, var13, var16, var18, var14, var17
	})
	reactModule.useEffect(function()
		-- upvalues: fFlagAddFriendsPageFAEUpsell (copy), autoPromptStatusModule (copy), default (copy), list (copy), var13 (ref), var16 (ref), var18 (ref), var20 (ref)
		if fFlagAddFriendsPageFAEUpsell then
			autoPromptStatusModule.setStatus(nil)
		end
		local var24 = default:hasPermissions(list)
		
		if var13 and (var16 or var18) then
			var24:andThen(var20)
		elseif fFlagAddFriendsPageFAEUpsell then
			autoPromptStatusModule.setStatus(false)
		end
		return if fFlagAddFriendsPageFAEUpsell then function()
			-- upvalues: autoPromptStatusModule (copy)
			autoPromptStatusModule.setStatus(nil)
		end else nil
	end, { var13, var16, var18 })
	reactModule.useEffect(function()
		-- upvalues: var17 (write), fFlagCIDeeplinkEnabledForAll (copy), messageBusService (copy), realtimeMessageId (copy), default (copy), list (copy), permissionsProtocol (copy), var12 (ref)
		if var17 or fFlagCIDeeplinkEnabledForAll then
			local var25 = messageBusService:Subscribe(realtimeMessageId, function()
				-- upvalues: default (copy), list (copy), permissionsProtocol (copy), var12 (copy)
				default:hasPermissions(list):andThen(function(p9)
					-- upvalues: permissionsProtocol (copy), var12 (copy)
					if p9 and p9.status == permissionsProtocol.Status.AUTHORIZED then
						var12(true)
					end
				end)
			end, false, true)
			
			return function()
				-- upvalues: var25 (ref)
				var25:Disconnect()
			end
		end
		return nil
	end, { var17 })
	
	if not var13 then
		return nil, nil
	elseif var16 or var18 then
		return var11, var21
	end
	return nil, nil
end