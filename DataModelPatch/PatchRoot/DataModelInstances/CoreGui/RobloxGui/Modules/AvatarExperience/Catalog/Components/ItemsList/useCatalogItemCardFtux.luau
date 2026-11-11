local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local AvatarExperienceCommonModule = require(CorePackages.Workspace.Packages.AvatarExperienceCommon)
local UseDispatchFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useDispatch
local WearTimeConstants = require(CorePackages.Workspace.Packages.AvatarExperienceTimedOptions).WearTimeConstants
local WearTimeFTUXStatusSessionEnum = require(CorePackages.Workspace.Packages.AvatarExperienceCatalog).Enums.WearTimeFTUXStatusSessionEnum
local WearTimeFTUXStatusEnum = AvatarExperienceCommonModule.Components.CatalogItemCard.WearTimeFTUXStatusEnum
local SafeAppStorageService = AvatarExperienceCommonModule.Lib.SafeAppStorageService
local SetCentralOverlayModule = require(Modules.LuaApp.Actions.SetCentralOverlay)
local CloseCentralOverlayModule = require(Modules.LuaApp.Thunks.CloseCentralOverlay)
local CentralOverlayType = require(CorePackages.Workspace.Packages.RobloxAppEnums).CentralOverlayType
local FFlagAXTimedOptionsFTUXModalUseMemStorage = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXTimedOptionsFTUXModalUseMemStorage
local FFlagAXWearTimeSupport = require(CorePackages.Workspace.Packages.SharedFlags).FFlagAXWearTimeSupport
local _ = require(Modules.AvatarExperience.Common.Types)

return function(p1)
	-- upvalues: UseDispatchFunction (copy), FFlagAXWearTimeSupport (copy), FFlagAXTimedOptionsFTUXModalUseMemStorage (copy), ReactModule (copy), SafeAppStorageService (copy), WearTimeConstants (copy), WearTimeFTUXStatusSessionEnum (copy), WearTimeFTUXStatusEnum (copy), SetCentralOverlayModule (copy), CentralOverlayType (copy), CloseCentralOverlayModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	if FFlagAXWearTimeSupport then
		local v1: boolean = p1.itemData ~= nil and (p1.itemData.timedOptions ~= nil and #p1.itemData.timedOptions > 0)
		
		if FFlagAXTimedOptionsFTUXModalUseMemStorage or game:GetEngineFeature("AXWearTimeFTUXTooltipStorageKey") then
			ReactModule.useEffect(function()
				-- upvalues: p1 (copy), v1 (copy), SafeAppStorageService (upval), WearTimeConstants (upval), WearTimeFTUXStatusSessionEnum (upval), FFlagAXTimedOptionsFTUXModalUseMemStorage (upval), WearTimeFTUXStatusEnum (upval), UseDispatchResult (copy), SetCentralOverlayModule (upval), CentralOverlayType (upval), CloseCentralOverlayModule (upval)
				if p1.isSelected and v1 and SafeAppStorageService.getItem(WearTimeConstants.TOOLTIP_FTUX_SESSION_TRACKER_KEY, true) ~= WearTimeFTUXStatusSessionEnum.Shown then
					local Item = SafeAppStorageService.getItem(WearTimeConstants.TOOLTIP_FTUX_APP_STORAGE_KEY, FFlagAXTimedOptionsFTUXModalUseMemStorage)
					
					if Item == WearTimeFTUXStatusEnum.Undefined or Item == WearTimeFTUXStatusEnum.Displayed then
						UseDispatchResult(SetCentralOverlayModule(CentralOverlayType.WearTimeInfoModal, {
							onClose = function()
								-- upvalues: SafeAppStorageService (upval), WearTimeConstants (upval), WearTimeFTUXStatusEnum (upval), FFlagAXTimedOptionsFTUXModalUseMemStorage (upval), UseDispatchResult (upval), CloseCentralOverlayModule (upval)
								SafeAppStorageService.setItem(WearTimeConstants.TOOLTIP_FTUX_APP_STORAGE_KEY, WearTimeFTUXStatusEnum.Dismissed, FFlagAXTimedOptionsFTUXModalUseMemStorage)
								UseDispatchResult(CloseCentralOverlayModule())
							end
						}))
						SafeAppStorageService.setItem(WearTimeConstants.TOOLTIP_FTUX_SESSION_TRACKER_KEY, WearTimeFTUXStatusSessionEnum.Shown, true)
						
						if Item == WearTimeFTUXStatusEnum.Undefined then
							SafeAppStorageService.setItem(WearTimeConstants.TOOLTIP_FTUX_APP_STORAGE_KEY, WearTimeFTUXStatusEnum.Displayed, FFlagAXTimedOptionsFTUXModalUseMemStorage)
							
							return
						end
						if Item == WearTimeFTUXStatusEnum.Displayed then
							SafeAppStorageService.setItem(WearTimeConstants.TOOLTIP_FTUX_APP_STORAGE_KEY, WearTimeFTUXStatusEnum.DisplayedTwice, FFlagAXTimedOptionsFTUXModalUseMemStorage)
						end
					end
				end
			end, { UseDispatchResult, p1.isSelected, v1 })
		end
	end
end