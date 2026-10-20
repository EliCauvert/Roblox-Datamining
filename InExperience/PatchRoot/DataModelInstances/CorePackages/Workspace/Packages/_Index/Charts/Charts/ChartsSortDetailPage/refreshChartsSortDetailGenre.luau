local Charts = script:FindFirstAncestor("Charts")
local Parent = Charts.Parent
local PromiseModule = require(Parent.Promise)
local SduiSharedUtilitiesModule = require(Parent.SduiSharedUtilities)
local GetSduiApiStoreFunction = SduiSharedUtilitiesModule.getSduiApiStore
local GetSduiClientPageScopeFunction = SduiSharedUtilitiesModule.getSduiClientPageScope
local ChartsSortDetailScopeFieldsModule = require(Charts.ChartsSortDetailPage.ChartsSortDetailScopeFields)

local function _(p1): boolean
	-- upvalues: GetSduiApiStoreFunction (copy)
	return not GetSduiApiStoreFunction().isInFlight(p1)
end

local _ = function(p1, p2)
	-- upvalues: GetSduiClientPageScopeFunction (copy), ChartsSortDetailScopeFieldsModule (copy)
	local SduiClientPageScope = GetSduiClientPageScopeFunction(p1)
	
	if p2 then
		SduiClientPageScope.set(ChartsSortDetailScopeFieldsModule.SafeGenre, (SduiClientPageScope.get(ChartsSortDetailScopeFieldsModule.DesiredGenre)))
		
		return
	else
		SduiClientPageScope.set(ChartsSortDetailScopeFieldsModule.DesiredGenre, (SduiClientPageScope.get(ChartsSortDetailScopeFieldsModule.SafeGenre)))
	end
end

local function settleGenreRefresh(ConfigKey, p1)
	-- upvalues: PromiseModule (copy), GetSduiClientPageScopeFunction (copy), ChartsSortDetailScopeFieldsModule (copy)
	if typeof(p1) == "table" then
		local SduiClientPageScope = GetSduiClientPageScopeFunction(ConfigKey)
		SduiClientPageScope.set(ChartsSortDetailScopeFieldsModule.SafeGenre, (SduiClientPageScope.get(ChartsSortDetailScopeFieldsModule.DesiredGenre)))
		
		return PromiseModule.resolve(p1)
	else
		return PromiseModule.reject("ChartsSortDetail genre refresh non-table result")
	end
end

return function(p1)
	-- upvalues: GetSduiApiStoreFunction (copy), GetSduiClientPageScopeFunction (copy), ChartsSortDetailScopeFieldsModule (copy), settleGenreRefresh (copy), PromiseModule (copy)
	local ConfigKey = p1.configKey
	local SelectedGenre = p1.selectedGenre
	
	if typeof(ConfigKey) ~= "string" or ConfigKey == "" then
		return nil
	elseif typeof(SelectedGenre) ~= "string" or SelectedGenre == "" then
		return nil
	elseif not GetSduiApiStoreFunction().isInFlight(ConfigKey) then
		GetSduiClientPageScopeFunction(ConfigKey).set(ChartsSortDetailScopeFieldsModule.DesiredGenre, SelectedGenre)
		
		return GetSduiApiStoreFunction().refreshFromApi({ configKey = ConfigKey, loadTimer = p1.loadTimer }):andThen(function(Result)
			-- upvalues: settleGenreRefresh (upval), ConfigKey (copy)
			return settleGenreRefresh(ConfigKey, Result)
		end):catch(function(Err)
			-- upvalues: ConfigKey (copy), GetSduiClientPageScopeFunction (upval), ChartsSortDetailScopeFieldsModule (upval), PromiseModule (upval)
			local SduiClientPageScope = GetSduiClientPageScopeFunction(ConfigKey)
			SduiClientPageScope.set(ChartsSortDetailScopeFieldsModule.DesiredGenre, (SduiClientPageScope.get(ChartsSortDetailScopeFieldsModule.SafeGenre)))
			
			return PromiseModule.reject(Err)
		end)
	else
		return nil
	end
end