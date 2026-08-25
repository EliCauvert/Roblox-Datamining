local charts = script:FindFirstAncestor("Charts")
local parent = charts.Parent
local promiseModule = require(parent.Promise)
local sduiSharedUtilitiesModule = require(parent.SduiSharedUtilities)
local getSduiApiStore = sduiSharedUtilitiesModule.getSduiApiStore
local getSduiClientPageScope = sduiSharedUtilitiesModule.getSduiClientPageScope
local chartsSortDetailScopeFieldsModule = require(charts.ChartsSortDetailPage.ChartsSortDetailScopeFields)

local function _(p0)
	-- upvalues: getSduiApiStore (ref)
	return not getSduiApiStore().isInFlight(p0)
end

local _ = function(p1, p2)
	-- upvalues: getSduiClientPageScope (ref), chartsSortDetailScopeFieldsModule (ref)
	local var5 = getSduiClientPageScope(p1)
	
	if p2 then
		var5.set(chartsSortDetailScopeFieldsModule.SafeGenre, var5.get(chartsSortDetailScopeFieldsModule.DesiredGenre))
		
		return
	end
	var5.set(chartsSortDetailScopeFieldsModule.DesiredGenre, var5.get(chartsSortDetailScopeFieldsModule.SafeGenre))
end

local function settleGenreRefresh(value, p3)
	-- upvalues: promiseModule (ref), getSduiClientPageScope (ref), chartsSortDetailScopeFieldsModule (ref)
	if typeof(p3) == "table" then
		local var6 = getSduiClientPageScope(value)
		var6.set(chartsSortDetailScopeFieldsModule.SafeGenre, var6.get(chartsSortDetailScopeFieldsModule.DesiredGenre))
		
		return promiseModule.resolve(p3)
	end
	return promiseModule.reject("ChartsSortDetail genre refresh non-table result")
end

return function(p4)
	-- upvalues: getSduiApiStore (ref), getSduiClientPageScope (ref), chartsSortDetailScopeFieldsModule (ref), settleGenreRefresh (ref), promiseModule (ref)
	local configKey = p4.configKey
	local selectedGenre = p4.selectedGenre
	
	if typeof(configKey) ~= "string" or configKey == "" then
		return nil
	elseif typeof(selectedGenre) ~= "string" or selectedGenre == "" then
		return nil
	elseif getSduiApiStore().isInFlight(configKey) then
		getSduiClientPageScope(configKey).set(chartsSortDetailScopeFieldsModule.DesiredGenre, selectedGenre)
		
		return getSduiApiStore().refreshFromApi({ configKey = configKey, loadTimer = p4.loadTimer }):andThen(function(p6)
			-- upvalues: settleGenreRefresh (copy), configKey (ref)
			return settleGenreRefresh(configKey, p6)
		end):catch(function(p5)
			-- upvalues: configKey (ref), getSduiClientPageScope (copy), chartsSortDetailScopeFieldsModule (copy), promiseModule (copy)
			local var7 = getSduiClientPageScope(configKey)
			var7.set(chartsSortDetailScopeFieldsModule.DesiredGenre, var7.get(chartsSortDetailScopeFieldsModule.SafeGenre))
			
			return promiseModule.reject(p5)
		end)
	end
	return nil
end