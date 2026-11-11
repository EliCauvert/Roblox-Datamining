local Modules = game:GetService("CoreGui").RobloxGui.Modules
local LocalizationService = game:GetService("LocalizationService")
local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local PerformFetch = require(CorePackages.Workspace.Packages.Http).PerformFetch
local ConstantsModule = require(Modules.AvatarExperience.Common.Constants)
local ConstantsModule1 = require(Modules.AvatarExperience.AvatarEditor.Constants)
local CatalogConstantsModule = require(Modules.AvatarExperience.Catalog.CatalogConstants)
local UpdateLookDetailsModule = require(Modules.AvatarExperience.Common.Actions.UpdateLookDetails)
local WebApiModule = require(Modules.AvatarExperience.AvatarEditor.Http.WebApi)
local _ = require(Modules.AvatarExperience.Common.Types)
local AvatarWidgetBlockyUtilsModule = require(Modules.AvatarExperience.Common.Util.AvatarWidgetBlockyUtils)
local SendAXCounterV2Function = require(CorePackages.Workspace.Packages.AvatarExperienceAnalytics).sendAXCounterV2
local Localization = require(CorePackages.Workspace.Packages.RobloxAppLocales).Localization
local SetCurrentToastMessageModule = require(Modules.LuaApp.Actions.SetCurrentToastMessage)
local ToastTypeModule = require(Modules.LuaApp.Enum.ToastType)
local RemoveLookModule = require(Modules.AvatarExperience.Common.Actions.RemoveLook)
local AXLookPreviewWarningToasts = game:DefineFastFlag("AXLookPreviewWarningToasts", false)
local FFlagParseHeadShapeFromAPIResponse = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagParseHeadShapeFromAPIResponse

local function translateString(p1, p2)
	-- upvalues: LocalizationService (copy), Localization (copy)
	local RobloxLocaleId = LocalizationService.RobloxLocaleId
	local NewLocalization = Localization.new(RobloxLocaleId)
	NewLocalization:SetLocale(RobloxLocaleId)
	
	return NewLocalization:Format(p1, p2)
end

return function(p1)
	-- upvalues: PerformFetch (copy), FFlagParseHeadShapeFromAPIResponse (copy), RemoveLookModule (copy), ConstantsModule (copy), WebApiModule (copy), AXLookPreviewWarningToasts (copy), SetCurrentToastMessageModule (copy), ToastTypeModule (copy), CatalogConstantsModule (copy), ConstantsModule1 (copy), AvatarWidgetBlockyUtilsModule (copy), translateString (copy), UpdateLookDetailsModule (copy), HttpService (copy), SendAXCounterV2Function (copy)
	return PerformFetch.Single("PreviewLook", function(p2)
		-- upvalues: FFlagParseHeadShapeFromAPIResponse (upval), RemoveLookModule (upval), ConstantsModule (upval), WebApiModule (upval), p1 (copy), AXLookPreviewWarningToasts (upval), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), CatalogConstantsModule (upval), ConstantsModule1 (upval), AvatarWidgetBlockyUtilsModule (upval), translateString (upval), UpdateLookDetailsModule (upval), HttpService (upval), SendAXCounterV2Function (upval)
		local State = p2:getState()
		local BodyColor3s = State.AvatarExperience.AvatarEditor.Character.BodyColor3s
		local AvatarScales = State.AvatarExperience.AvatarEditor.Character.AvatarScales
		local List = {}
		
		for _, equippedAsset in State.AvatarExperience.AvatarEditor.Character.EquippedAssets do
			for Id, Meta in equippedAsset do
				local config = { id = Id }
				
				if Meta.isLayered or FFlagParseHeadShapeFromAPIResponse and Meta.headShape ~= nil then
					config.meta = { order = Meta.order, version = tonumber(Meta.version) }
					
					if FFlagParseHeadShapeFromAPIResponse then
						config.meta.headShape = Meta.headShape
					end
				end
				table.insert(List, config)
			end
		end
		p2:dispatch(RemoveLookModule(ConstantsModule.DraftLookId))
		
		return WebApiModule.GetPreviewLook(p1, List):andThen(function(Result): boolean?
			-- upvalues: AXLookPreviewWarningToasts (upval), p2 (copy), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), State (copy), ConstantsModule (upval), CatalogConstantsModule (upval), ConstantsModule1 (upval), AvatarScales (copy), AvatarWidgetBlockyUtilsModule (upval), translateString (upval), BodyColor3s (copy), UpdateLookDetailsModule (upval)
			if AXLookPreviewWarningToasts then
				local Warnings = Result and (Result.responseBody and Result.responseBody.warnings)
				
				if Warnings then
					for _, warning in Warnings do
						p2:dispatch(SetCurrentToastMessageModule({
							isLocalized = true,
							toastMessage = warning.errorDescription,
							toastType = ToastTypeModule.InformationMessage
						}))
					end
				end
			end
			local Look = if Result and Result.responseBody then Result.responseBody.look else nil
			
			if not Look then return end
			local LocalUserId = State.LocalUserId
			local User = State.Users[LocalUserId]
			local config = {
				lookType = ConstantsModule.LookType.Avatar,
				totalValue = Look.totalValue,
				totalPrice = Look.totalPrice,
				curator = if User then {
					type = CatalogConstantsModule.CreatorType.User,
					id = tonumber(LocalUserId),
					name = User.displayName,
					hasVerifiedBadge = User.hasVerifiedBadge
				} else nil,
				lookAssetInfos = {},
				lookBundleInfos = {},
				avatarProperties = {
					bodyColor3s = {},
					playerAvatarType = ConstantsModule1.AvatarType.R15,
					scale = AvatarScales
				},
				displayProperties = { backgroundType = "None" }
			}
			local List = {}
			
			for _, item in Look.items do
				if item.itemType == ConstantsModule.ItemType.Asset then
					item.id = tostring(item.id)
					config.lookAssetInfos[item.id] = item
				elseif item.itemType == ConstantsModule.ItemType.Bundle then
					item.id = tostring(item.id)
					config.lookBundleInfos[item.id] = item
					
					if List then
						table.insert(List, item)
					end
				end
			end
			if List then
				local BlockyLookDetailItem = AvatarWidgetBlockyUtilsModule.buildBlockyLookDetailItem(List, translateString)
				
				if BlockyLookDetailItem ~= nil then
					config.lookBundleInfos[BlockyLookDetailItem.id] = BlockyLookDetailItem
				end
			end
			for i, bodyColor3 in BodyColor3s do
				config.avatarProperties.bodyColor3s[i] = bodyColor3:ToHex()
			end
			p2:dispatch(UpdateLookDetailsModule(ConstantsModule.DraftLookId, config))
			
			return true
		end):catch(function(Err): boolean
			-- upvalues: HttpService (upval), p2 (copy), SetCurrentToastMessageModule (upval), ToastTypeModule (upval), SendAXCounterV2Function (upval), ConstantsModule (upval), ConstantsModule1 (upval)
			warn("Failed to create draft look", Err)
			local Success, Result = pcall(function()
				-- upvalues: Err (copy), HttpService (upval)
				return Err.Body and (Err.Body ~= "" and HttpService:JSONDecode(Err.Body))
			end)
			
			if Success and Result and Result.errorDescription then
				p2:dispatch(SetCurrentToastMessageModule({
					isLocalized = true,
					toastMessage = Result.errorDescription,
					toastType = ToastTypeModule.InformationMessage
				}))
				SendAXCounterV2Function(ConstantsModule.Counter.LookComposer.PreviewLook, { errorCode = Result.errorCode })
			elseif Success and Result and Result.errorCode then
				SendAXCounterV2Function(ConstantsModule.Counter.LookComposer.PreviewLook, { errorCode = Result.errorCode })
				p2:dispatch(SetCurrentToastMessageModule({
					isLocalized = false,
					toastMessage = ConstantsModule1.AvatarShareErrorMessagesKeys[Result.errorCode] or "Feature.Avatar.Generic.Error",
					toastType = ToastTypeModule.InformationMessage
				}))
			else
				SendAXCounterV2Function(ConstantsModule.Counter.LookComposer.PreviewLook, { errorCode = "none" })
			end
			return false
		end)
	end)
end