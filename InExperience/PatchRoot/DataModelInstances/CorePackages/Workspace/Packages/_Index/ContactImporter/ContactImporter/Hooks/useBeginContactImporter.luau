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

return function(p1)
	-- upvalues: useNavigation (ref), reactModule (ref), useAppPolicy (ref), getDeepValue (ref), enumScreens (ref), fFlagCIDeeplinkEnabledForAll (ref), roactAppExperimentModule (ref), appUserLayers (ref), permissionsProtocol (ref), fFlagAddFriendsPageFAEUpsell (ref), autoPromptStatusModule (ref), default (ref), list (ref), promiseModule (ref), fFlagCiDeprecateFindFriendsModal (ref), settingsRoute (ref), IXPService (ref), messageBusService (ref), realtimeMessageId (ref)
	local var1 = useNavigation()
	local var2, var3 = reactModule.useState(false)
	local var4 = useAppPolicy(function(p2)
		return p2.getContactImporterEnabled()
	end)
	local var5 = if p1 then p1.entryPoint else nil
	local var6 = (getDeepValue(var1, "state.routeName") or {}) == enumScreens.ContactImporter
	local var7 = useAppPolicy(function(p2)
		return p2.getContactImporterEncouraged()
	end)
	local var8 = if not fFlagCIDeeplinkEnabledForAll then roactAppExperimentModule.useUserExperiment({
		appUserLayers.ContactImporterDevicePermissionNeededModalExposure
	}, function(p2)
		-- upvalues: appUserLayers (copy)
		return (p2[appUserLayers.ContactImporterDevicePermissionNeededModalExposure] or {}).systemSettingsDeeplinkEnabled
	end, false) else nil
	local var9 = not var7
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: permissionsProtocol (copy), var3 (ref), var1 (ref), enumScreens (copy), var5 (ref)
		local var11 = p2.status == permissionsProtocol.Status.AUTHORIZED
		var3(var11)
		
		if var11 then
			var1.navigate(enumScreens.ContactsList, { shouldUpdateUserSettings = true, entrypoint = var5 })
		end
	end, { var1, var5 })
	local var11 = reactModule.useCallback(function(p2)
		-- upvalues: permissionsProtocol (copy), var3 (ref), fFlagAddFriendsPageFAEUpsell (copy), autoPromptStatusModule (copy), var7 (ref), default (copy), list (copy), var10 (ref), promiseModule (copy)
		local status = p2.status
		
		if status == permissionsProtocol.Status.AUTHORIZED then
			var3(true)
			
			if fFlagAddFriendsPageFAEUpsell then
				autoPromptStatusModule.setStatus(false)
			end
		elseif status == permissionsProtocol.Status.DENIED then
			if var7 then
				if fFlagAddFriendsPageFAEUpsell then
					local processTime = os.clock()
					default:requestPermissions(list):andThen(function(p3)
						-- upvalues: processTime (ref), permissionsProtocol (copy), autoPromptStatusModule (copy)
						autoPromptStatusModule.setStatus(if os.clock() - processTime < 0.5 then p3.status == permissionsProtocol.Status.AUTHORIZED else true)
						
						return p3
					end):andThen(var10)
				else
					default:requestPermissions(list):andThen(var10)
				end
			elseif fFlagAddFriendsPageFAEUpsell then
				autoPromptStatusModule.setStatus(false)
			end
		elseif fFlagAddFriendsPageFAEUpsell then
			autoPromptStatusModule.setStatus(false)
		end
		return promiseModule.resolve(p2.status)
	end, { var10, var7 })
	local var12 = reactModule.useCallback(function()
		-- upvalues: fFlagCiDeprecateFindFriendsModal (copy), var6 (ref), default (copy), list (copy), permissionsProtocol (copy), var3 (ref), var1 (ref), enumScreens (copy), var5 (ref), settingsRoute (copy), var7 (ref), var2 (ref), fFlagCIDeeplinkEnabledForAll (copy), IXPService (copy), appUserLayers (copy), var8 (write), var9 (ref)
		if fFlagCiDeprecateFindFriendsModal and var6 then
			default:requestPermissions(list):andThen(function(p2)
				-- upvalues: permissionsProtocol (copy), var3 (copy), var1 (copy), enumScreens (copy), var5 (copy), settingsRoute (copy)
				if p2.status == permissionsProtocol.Status.AUTHORIZED then
					var3(true)
					var1.replace(enumScreens.ContactsList, { entrypoint = var5 })
					
					return
				end
				var1.replace(enumScreens.SettingsPermissionInteractiveAlert, { settingsRoute = settingsRoute.Contacts })
			end)
			
			return
		elseif var7 then
			if var2 then
				var1.navigate(enumScreens.ContactsList, { entrypoint = var5 })
				
				return
			elseif not fFlagCIDeeplinkEnabledForAll then
				IXPService:LogUserLayerExposure(appUserLayers.ContactImporterDevicePermissionNeededModalExposure)
			end
			if var8 or fFlagCIDeeplinkEnabledForAll then
				var1.navigate(enumScreens.SettingsPermissionInteractiveAlert, { settingsRoute = settingsRoute.Contacts })
				
				return
			end
			var1.navigate(enumScreens.ContactsRevokedAccessDialog)
			
			return
		elseif var9 then
			default:requestPermissions(list):andThen(function(p2)
				-- upvalues: permissionsProtocol (copy), var1 (copy), enumScreens (copy), var5 (copy), fFlagCIDeeplinkEnabledForAll (copy), IXPService (copy), appUserLayers (copy), var8 (copy), settingsRoute (copy)
				if p2.status == permissionsProtocol.Status.AUTHORIZED then
					var1.navigate(enumScreens.ContactsList, { entrypoint = var5 })
					
					return
				elseif not fFlagCIDeeplinkEnabledForAll then
					IXPService:LogUserLayerExposure(appUserLayers.ContactImporterDevicePermissionNeededModalExposure)
				end
				if var8 or fFlagCIDeeplinkEnabledForAll then
					var1.navigate(enumScreens.SettingsPermissionInteractiveAlert, { settingsRoute = settingsRoute.Contacts })
					
					return
				end
				var1.navigate(enumScreens.ContactsRevokedAccessDialog)
			end)
			
			return
		end
	end, {
		var2, var4, var7, var9, var5, var8
	})
	reactModule.useEffect(function()
		-- upvalues: fFlagAddFriendsPageFAEUpsell (copy), autoPromptStatusModule (copy), default (copy), list (copy), var4 (ref), var7 (ref), var9 (ref), var11 (ref)
		if fFlagAddFriendsPageFAEUpsell then
			autoPromptStatusModule.setStatus(nil)
		end
		local var13 = default:hasPermissions(list)
		
		if var4 and (var7 or var9) then
			var13:andThen(var11)
		elseif fFlagAddFriendsPageFAEUpsell then
			autoPromptStatusModule.setStatus(false)
		end
		return if fFlagAddFriendsPageFAEUpsell then function()
			-- upvalues: autoPromptStatusModule (copy)
			autoPromptStatusModule.setStatus(nil)
		end else nil
	end, { var4, var7, var9 })
	reactModule.useEffect(function()
		-- upvalues: var8 (write), fFlagCIDeeplinkEnabledForAll (copy), messageBusService (copy), realtimeMessageId (copy), default (copy), list (copy), permissionsProtocol (copy), var3 (ref)
		if var8 or fFlagCIDeeplinkEnabledForAll then
			local var13 = messageBusService:Subscribe(realtimeMessageId, function()
				-- upvalues: default (copy), list (copy), permissionsProtocol (copy), var3 (copy)
				default:hasPermissions(list):andThen(function(p2)
					-- upvalues: permissionsProtocol (copy), var3 (copy)
					if p2 and p2.status == permissionsProtocol.Status.AUTHORIZED then
						var3(true)
					end
				end)
			end, false, true)
			
			return function()
				-- upvalues: var13 (ref)
				var13:Disconnect()
			end
		end
		return nil
	end, { var8 })
	
	if not var4 then
		return nil, nil
	elseif var7 or var9 then
		return var2, var12
	end
	return nil, nil
end