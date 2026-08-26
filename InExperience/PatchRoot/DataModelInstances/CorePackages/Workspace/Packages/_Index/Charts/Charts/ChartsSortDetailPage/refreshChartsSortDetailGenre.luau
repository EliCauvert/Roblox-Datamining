local charts = script:FindFirstAncestor("Charts")
local parent = charts.Parent
local promiseModule = require(parent.Promise)
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local getSduiClientPageScope = sduiSharedUtilitiesModule.getSduiClientPageScope
local chartsSortDetailScopeFieldsModule = require(charts.ChartsSortDetailPage.ChartsSortDetailScopeFields)

local function _(p1)
	-- upvalues: getSduiApiStore (ref)
	return not getSduiApiStore().isInFlight(p1)
end

local _ = function(p1, p2)
	-- upvalues: getSduiClientPageScope (ref), chartsSortDetailScopeFieldsModule (ref)
	local var1 = getSduiClientPageScope(p1)
	
	if p2 then
		var1.set(chartsSortDetailScopeFieldsModule.SafeGenre, var1.get(chartsSortDetailScopeFieldsModule.DesiredGenre))
		
		return
	end
	var1.set(chartsSortDetailScopeFieldsModule.DesiredGenre, var1.get(chartsSortDetailScopeFieldsModule.SafeGenre))
end

local function settleGenreRefresh(value, p1)
	-- upvalues: promiseModule (ref), getSduiClientPageScope (ref), chartsSortDetailScopeFieldsModule (ref)
	if typeof(p1) == "table" then
		local var1 = getSduiClientPageScope(value)
		var1.set(chartsSortDetailScopeFieldsModule.SafeGenre, var1.get(chartsSortDetailScopeFieldsModule.DesiredGenre))
		
		return promiseModule.resolve(p1)
	end
	return promiseModule.reject("ChartsSortDetail genre refresh non-table result")
end

return function(p1)
	-- upvalues: getSduiApiStore (ref), getSduiClientPageScope (ref), chartsSortDetailScopeFieldsModule (ref), settleGenreRefresh (ref), promiseModule (ref)
	local configKey = p1.configKey
	local selectedGenre = p1.selectedGenre
	
	if typeof(configKey) ~= "string" or configKey == "" then
		return nil
	elseif typeof(selectedGenre) ~= "string" or selectedGenre == "" then
		return nil
	elseif getSduiApiStore().isInFlight(configKey) then
		getSduiClientPageScope(configKey).set(chartsSortDetailScopeFieldsModule.DesiredGenre, selectedGenre)
		
		return getSduiApiStore().refreshFromApi({ configKey = configKey, loadTimer = p1.loadTimer }):andThen(function(p2)
			-- upvalues: settleGenreRefresh (copy), configKey (ref)
			return settleGenreRefresh(configKey, p2)
		end):catch(function(p2)
			-- upvalues: configKey (ref), getSduiClientPageScope (copy), chartsSortDetailScopeFieldsModule (copy), promiseModule (copy)
			local var1 = getSduiClientPageScope(configKey)
			var1.set(chartsSortDetailScopeFieldsModule.DesiredGenre, var1.get(chartsSortDetailScopeFieldsModule.SafeGenre))
			
			return promiseModule.reject(p2)
		end)
	end
	return nil
end