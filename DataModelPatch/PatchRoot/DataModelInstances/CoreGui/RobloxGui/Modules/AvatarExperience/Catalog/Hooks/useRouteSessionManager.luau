local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local AppSessionService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppSessionService
local AvatarScreen = require(CorePackages.Workspace.Packages.AvatarExperienceNavigation).Enums.AvatarScreen
local SessionType = require(CorePackages.Workspace.Packages.RobloxAppSessionization).SessionType
local UseRoactServiceModule = require(Modules.LuaApp.Hooks.useRoactService)
local MutedErrorModule = require(Modules.LuaApp.mutedError)
local UseOpaqueNameForSessionChange = game:DefineFastFlag("UseOpaqueNameForSessionChange", false)
local MuteSessionServiceErrorUWP = game:DefineFastFlag("MuteSessionServiceErrorUWP", false)
local AXCustomizeSessions3 = game:DefineFastFlag("AXCustomizeSessions3", false)
local config = {
	MARKETPLACE_HOMEPAGE_SESSION = "AvatarExperienceMarketplaceHomepageSession",
	SEARCH_SESSION = "AvatarExperienceSearchSession",
	CUSTOMIZE_SESSION = if AXCustomizeSessions3 then "AvatarExperienceCustomizeSession" else nil
}
local config1 = {
	CATALOG_REQUEST_ID = "avatarCatalogRequestId",
	SEARCH_REQUEST_ID = "avatarSearchRequestId",
	CUSTOMIZE_REQUEST_ID = if AXCustomizeSessions3 then "avatarCustomizeRequestId" else nil
}

local function _(SessionService, Sid)
	if SessionService:SessionExists(Sid) then
		SessionService:RemoveSession(Sid)
	end
end

local _ = function(SessionService, ChildSid, p1)
	-- upvalues: SessionType (copy), HttpService (copy)
	if not SessionService:SessionExists(ChildSid) then
		SessionService:SetSession(SessionType.StructuralIdentifier.Level2a, ChildSid, ChildSid)
		SessionService:SetMetadata(ChildSid, p1, HttpService:GenerateGUID(true))
	end
end

local function processSessionChange(SessionService, p1)
	-- upvalues: UseOpaqueNameForSessionChange (copy), AvatarScreen (copy), config (copy), AXCustomizeSessions3 (copy), config1 (copy), SessionType (copy), HttpService (copy)
	local Name = if UseOpaqueNameForSessionChange then p1.opaque.name else p1.current.name
	
	if Name == AvatarScreen.CatalogSearch then
		local MARKETPLACEHOMEPAGESESSION = config.MARKETPLACE_HOMEPAGE_SESSION
		
		if SessionService:SessionExists(MARKETPLACEHOMEPAGESESSION) then
			SessionService:RemoveSession(MARKETPLACEHOMEPAGESESSION)
		end
		if AXCustomizeSessions3 then
			local CUSTOMIZESESSION = config.CUSTOMIZE_SESSION
			
			if SessionService:SessionExists(CUSTOMIZESESSION) then
				SessionService:RemoveSession(CUSTOMIZESESSION)
			end
		end
		local SEARCHSESSION = config.SEARCH_SESSION
		local SEARCHREQUESTID = config1.SEARCH_REQUEST_ID
		
		if not SessionService:SessionExists(SEARCHSESSION) then
			SessionService:SetSession(SessionType.StructuralIdentifier.Level2a, SEARCHSESSION, SEARCHSESSION)
			SessionService:SetMetadata(SEARCHSESSION, SEARCHREQUESTID, HttpService:GenerateGUID(true))
			
			return
		end
	elseif AXCustomizeSessions3 and (Name == AvatarScreen.AvatarEditor or Name == AvatarScreen.AvatarSwitcher or Name == AvatarScreen.EditEmotes or Name == AvatarScreen.AccessoryAdjustment or Name == AvatarScreen.BodyShape or Name == AvatarScreen.HeadRefinement or Name == AvatarScreen.LayeredClothingSort or Name == AvatarScreen.ColorAdjustment or Name == AvatarScreen.MySharedAvatars or Name == AvatarScreen.LookComposerPage or Name == AvatarScreen.ProfilePictureEditorEmotes or Name == AvatarScreen.ProfilePictureEditorCamera or Name == AvatarScreen.ProfilePictureEditorFinal) then
		local MARKETPLACEHOMEPAGESESSION = config.MARKETPLACE_HOMEPAGE_SESSION
		
		if SessionService:SessionExists(MARKETPLACEHOMEPAGESESSION) then
			SessionService:RemoveSession(MARKETPLACEHOMEPAGESESSION)
		end
		local SEARCHSESSION1 = config.SEARCH_SESSION
		
		if SessionService:SessionExists(SEARCHSESSION1) then
			SessionService:RemoveSession(SEARCHSESSION1)
		end
		local CUSTOMIZESESSION = config.CUSTOMIZE_SESSION
		local CUSTOMIZEREQUESTID = config1.CUSTOMIZE_REQUEST_ID
		
		if not SessionService:SessionExists(CUSTOMIZESESSION) then
			SessionService:SetSession(SessionType.StructuralIdentifier.Level2a, CUSTOMIZESESSION, CUSTOMIZESESSION)
			SessionService:SetMetadata(CUSTOMIZESESSION, CUSTOMIZEREQUESTID, HttpService:GenerateGUID(true))
			
			return
		end
	else
		local SEARCHSESSION = config.SEARCH_SESSION
		
		if SessionService:SessionExists(SEARCHSESSION) then
			SessionService:RemoveSession(SEARCHSESSION)
		end
		if AXCustomizeSessions3 then
			local CUSTOMIZESESSION = config.CUSTOMIZE_SESSION
			
			if SessionService:SessionExists(CUSTOMIZESESSION) then
				SessionService:RemoveSession(CUSTOMIZESESSION)
			end
		end
		local MARKETPLACEHOMEPAGESESSION = config.MARKETPLACE_HOMEPAGE_SESSION
		local CATALOGREQUESTID = config1.CATALOG_REQUEST_ID
		
		if not SessionService:SessionExists(MARKETPLACEHOMEPAGESESSION) then
			SessionService:SetSession(SessionType.StructuralIdentifier.Level2a, MARKETPLACEHOMEPAGESESSION, MARKETPLACEHOMEPAGESESSION)
			SessionService:SetMetadata(MARKETPLACEHOMEPAGESESSION, CATALOGREQUESTID, HttpService:GenerateGUID(true))
		end
	end
end

return function(p1)
	-- upvalues: UseRoactServiceModule (copy), AppSessionService (copy), processSessionChange (copy), MuteSessionServiceErrorUWP (copy), MutedErrorModule (copy), SessionType (copy)
	local UseRoactServiceModuleResult = UseRoactServiceModule(AppSessionService)
	processSessionChange(UseRoactServiceModuleResult, p1)
	
	if MuteSessionServiceErrorUWP and UseRoactServiceModuleResult.isA ~= nil then
		MutedErrorModule("useRouteSessionManager: sessionService is not being redirected to SessionServiceWrapper")
		
		return
	else
		UseRoactServiceModuleResult.SessionChangedSignal:connect(function(Level2a)
			-- upvalues: SessionType (upval), processSessionChange (upval), UseRoactServiceModuleResult (copy), p1 (copy)
			if Level2a == SessionType.StructuralIdentifier.Level2a then
				processSessionChange(UseRoactServiceModuleResult, p1)
			end
		end)
	end
end