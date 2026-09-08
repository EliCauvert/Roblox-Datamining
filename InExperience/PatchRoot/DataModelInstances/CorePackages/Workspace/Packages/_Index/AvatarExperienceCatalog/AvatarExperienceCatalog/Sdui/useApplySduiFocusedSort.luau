local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local _ = require(parent.AvatarExperienceRodux)
local logging = require(parent.AppCommonLib).Logging
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local buildFocusedSortWidgetInfoModule = require(script.Parent.buildFocusedSortWidgetInfo)
local hydrateCatalogSortByIdModule = require(script.Parent.hydrateCatalogSortById)

local function buildAlreadyHydratedSet(value)
	if not value then
		return nil
	end
	local t = {}
	
	for i, v in value do
		if typeof(v) == "table" then
			local t_1 = {}
			
			for i_1, v_1 in v do
				if typeof(v_1) == "table" and v_1.failedToHydrate ~= true then
					t_1[tostring(i_1)] = true
				end
			end
			if next(t_1) ~= nil then
				t[tostring(i)] = t_1
			end
		end
	end
	return if next(t) == nil then nil else t
end

return function(p1)
	-- upvalues: useDispatch (ref), reactModule (ref), logging (ref), buildFocusedSortWidgetInfoModule (ref), buildAlreadyHydratedSet (ref), hydrateCatalogSortByIdModule (ref)
	local var1 = useDispatch()
	
	return reactModule.useCallback(function(p2, p3, p4)
		-- upvalues: logging (copy), buildFocusedSortWidgetInfoModule (copy), var1 (ref), p1 (ref), buildAlreadyHydratedSet (copy), hydrateCatalogSortByIdModule (copy)
		if not p3 or p3 == "" then
			logging.warn("useApplySduiFocusedSort: missing context for sortId=" .. tostring(p2 and p2.sortId) .. "; SDUI catalog isn't propagating context to ResultsList. " .. "Verify FFlagAXMigrateAllTabToSduiDev is on.")
			
			return false
		end
		local var2 = buildFocusedSortWidgetInfoModule(p2.sortId, p3, {
			title = p2.title,
			description = p2.description,
			tooltipText = p2.tooltipText
		})
		
		if var2 then
			var1(p1.SetWidgetInfo(var2.widgetInfo, var2.requestId, nil, p3))
			hydrateCatalogSortByIdModule(var1, p4, p1.SetHydratedWidgetData, p1.CatalogWebApi, p2.sortId, if p1.getHydratedWidgetData then buildAlreadyHydratedSet(p1.getHydratedWidgetData()) else nil)
			
			return true
		end
		logging.warn("useApplySduiFocusedSort: synthesizer returned nil for sortId=" .. tostring(p2.sortId) .. " context=" .. tostring(p3))
		
		return false
	end, {
		var1,
		p1.SetWidgetInfo,
		p1.SetHydratedWidgetData,
		p1.CatalogWebApi,
		p1.getHydratedWidgetData
	})
end