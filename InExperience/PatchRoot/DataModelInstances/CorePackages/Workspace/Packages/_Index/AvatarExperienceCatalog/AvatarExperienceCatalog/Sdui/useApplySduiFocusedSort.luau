local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local _ = require(parent.AvatarExperienceRodux)
local logging = require(parent.AppCommonLib).Logging
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local buildFocusedSortWidgetInfoModule = require(script.Parent.buildFocusedSortWidgetInfo)
local hydrateCatalogSortByIdModule = require(script.Parent.hydrateCatalogSortById)

local function buildAlreadyHydratedSet(value) --[[ line: 57 ]]
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

return function(p0) --[[ line: 86 | named "useApplySduiFocusedSort" ]]
	-- upvalues: useDispatch (ref), reactModule (ref), logging (ref), buildFocusedSortWidgetInfoModule (ref), buildAlreadyHydratedSet (ref), hydrateCatalogSortByIdModule (ref)
	local var7 = useDispatch()
	
	return reactModule.useCallback(function(p1, p2, p3) --[[ line: 89 ]]
		-- upvalues: logging (copy), buildFocusedSortWidgetInfoModule (copy), var7 (ref), p0 (ref), buildAlreadyHydratedSet (copy), hydrateCatalogSortByIdModule (copy)
		if not p2 or p2 == "" then
			logging.warn("useApplySduiFocusedSort: missing context for sortId=" .. tostring(p1 and p1.sortId) .. "; SDUI catalog isn't propagating context to ResultsList. " .. "Verify FFlagAXMigrateAllTabToSduiDev is on.")
			
			return false
		end
		local var8 = buildFocusedSortWidgetInfoModule(p1.sortId, p2, {
			title = p1.title,
			description = p1.description,
			tooltipText = p1.tooltipText
		})
		
		if var8 then
			var7(p0.SetWidgetInfo(var8.widgetInfo, var8.requestId, nil, p2))
			hydrateCatalogSortByIdModule(var7, p3, p0.SetHydratedWidgetData, p0.CatalogWebApi, p1.sortId, if p0.getHydratedWidgetData then buildAlreadyHydratedSet(p0.getHydratedWidgetData()) else nil)
			
			return true
		end
		logging.warn("useApplySduiFocusedSort: synthesizer returned nil for sortId=" .. tostring(p1.sortId) .. " context=" .. tostring(p2))
		
		return false
	end, {
		var7,
		p0.SetWidgetInfo,
		p0.SetHydratedWidgetData,
		p0.CatalogWebApi,
		p0.getHydratedWidgetData
	})
end