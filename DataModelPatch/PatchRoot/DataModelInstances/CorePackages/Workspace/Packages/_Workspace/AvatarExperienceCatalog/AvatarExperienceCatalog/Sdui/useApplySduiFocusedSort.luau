local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.AvatarExperienceRodux)
local Logging = require(Parent.AppCommonLib).Logging
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local BuildFocusedSortWidgetInfoModule = require(script.Parent.buildFocusedSortWidgetInfo)
local HydrateCatalogSortByIdModule = require(script.Parent.hydrateCatalogSortById)

local function buildAlreadyHydratedSet(HydratedWidgetData)
	if not HydratedWidgetData then
		return nil
	end
	local t = {}
	
	for i, value in HydratedWidgetData do
		if typeof(value) == "table" then
			local t1 = {}
			
			for i1, value1 in value do
				if typeof(value1) == "table" and value1.failedToHydrate ~= true then
					t1[tostring(i1)] = true
				end
			end
			if next(t1) ~= nil then
				t[tostring(i)] = t1
			end
		end
	end
	return if next(t) == nil then nil else t
end

return function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), Logging (copy), BuildFocusedSortWidgetInfoModule (copy), buildAlreadyHydratedSet (copy), HydrateCatalogSortByIdModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	
	return ReactModule.useCallback(function(p2, p3, p4): boolean
		-- upvalues: Logging (upval), BuildFocusedSortWidgetInfoModule (upval), UseDispatchResult (copy), p1 (copy), buildAlreadyHydratedSet (upval), HydrateCatalogSortByIdModule (upval)
		if not p3 or p3 == "" then
			Logging.warn("useApplySduiFocusedSort: missing context for sortId=" .. tostring(p2 and p2.sortId) .. "; SDUI catalog isn't propagating context to ResultsList. " .. "Verify FFlagAXMigrateAllTabToSduiDev is on.")
			
			return false
		end
		local FocusedSortWidgetInfoModule = BuildFocusedSortWidgetInfoModule(p2.sortId, p3, {
			title = p2.title,
			description = p2.description,
			tooltipText = p2.tooltipText
		})
		
		if FocusedSortWidgetInfoModule then
			UseDispatchResult(p1.SetWidgetInfo(FocusedSortWidgetInfoModule.widgetInfo, FocusedSortWidgetInfoModule.requestId, nil, p3))
			HydrateCatalogSortByIdModule(UseDispatchResult, p4, p1.SetHydratedWidgetData, p1.CatalogWebApi, p2.sortId, if p1.getHydratedWidgetData then buildAlreadyHydratedSet(p1.getHydratedWidgetData()) else nil)
			
			return true
		else
			Logging.warn("useApplySduiFocusedSort: synthesizer returned nil for sortId=" .. tostring(p2.sortId) .. " context=" .. tostring(p3))
			
			return false
		end
	end, {
		UseDispatchResult,
		p1.SetWidgetInfo,
		p1.SetHydratedWidgetData,
		p1.CatalogWebApi,
		p1.getHydratedWidgetData
	})
end