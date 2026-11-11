local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local _ = require(Modules.LuaApp.Components.AbuseReporting.ReportTypes)
local GetThumbnailUrlModule = require(Modules.LuaApp.Components.AbuseReporting.getThumbnailUrl)
local ConstantsModule = require(Modules.LuaApp.Components.AbuseReporting.Constants)
local GetDeepValueFunction = require(CorePackages.Packages.LuaSocialLibrariesDeps).SocialLibraries.config({}).Dictionary.getDeepValue
local GetFFlagLuafiedReportThumbnailFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagLuafiedReportThumbnail

return function(p1)
	-- upvalues: GetFFlagLuafiedReportThumbnailFunction (copy), ConstantsModule (copy), GetThumbnailUrlModule (copy), GetDeepValueFunction (copy)
	return function(p2)
		-- upvalues: GetFFlagLuafiedReportThumbnailFunction (upval), p1 (copy), ConstantsModule (upval), GetThumbnailUrlModule (upval), GetDeepValueFunction (upval)
		if not GetFFlagLuafiedReportThumbnailFunction() then
			return {}
		end
		local ThumbnailUrl = nil
		local DisplayName = nil
		local Username = nil
		local ReportEntryPoint = p1.reportData.reportEntryPoint
		
		if ReportEntryPoint == ConstantsModule.REPORT_ENTRYPOINT.ExperienceDetails then
			local UniverseId = p1.reportData.universeId
			
			if UniverseId then
				local GameDetail = p2.GameDetails[UniverseId]
				ThumbnailUrl = GetThumbnailUrlModule(UniverseId, ReportEntryPoint)
				DisplayName = if GameDetail then GameDetail.name else nil
				Username = if GameDetail and GameDetail.creator then GameDetail.creator.name else nil
			end
		end
		if ReportEntryPoint == ConstantsModule.REPORT_ENTRYPOINT.Profile then
			local ProfileUserId = p1.reportData.profileUserId
			
			if ProfileUserId then
				local DeepValue = GetDeepValueFunction(p2, string.format("Profile.Users.byUserId.%s", ProfileUserId))
				ThumbnailUrl = GetThumbnailUrlModule(ProfileUserId, ReportEntryPoint)
				DisplayName = if DeepValue then DeepValue.displayName else nil
				Username = if DeepValue then DeepValue.username else nil
			end
		end
		if ReportEntryPoint == ConstantsModule.REPORT_ENTRYPOINT.Item then
			local ReportData = p1.reportData
			ThumbnailUrl = GetThumbnailUrlModule(ReportData.itemId, ReportEntryPoint)
			DisplayName = ReportData.itemName
			Username = ReportData.itemCreatorName
		end
		if ReportEntryPoint == ConstantsModule.REPORT_ENTRYPOINT.Chat then
			local UserId = p1.reportData.userId
			
			if UserId then
				local DeepValue = GetDeepValueFunction(p2, string.format("Profile.Users.byUserId.%s", UserId))
				ThumbnailUrl = GetThumbnailUrlModule(UserId, ReportEntryPoint)
				DisplayName = if DeepValue then DeepValue.displayName else nil
				Username = if DeepValue then DeepValue.username else nil
			end
		end
		if DisplayName == nil then
			DisplayName = ""
			warn(ReportEntryPoint, "primary text is unknown")
		end
		if Username == nil then
			Username = ""
			warn(ReportEntryPoint, "secondary text is unknown")
		end
		if ThumbnailUrl == nil then
			warn(ReportEntryPoint, "thumbnail url is unknown")
		end
		return {
			thumbnailUrl = ThumbnailUrl,
			primaryText = DisplayName,
			secondaryText = Username
		}
	end
end