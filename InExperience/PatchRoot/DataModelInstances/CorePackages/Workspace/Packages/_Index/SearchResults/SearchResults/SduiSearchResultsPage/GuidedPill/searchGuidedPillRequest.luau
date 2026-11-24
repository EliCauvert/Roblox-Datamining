local Parent = script:FindFirstAncestor("SearchResults").Parent
local PromiseModule = require(Parent.Promise)
local GetSduiClientPageScopeFunction = require(Parent.SduiCoreSystem).getSduiClientPageScope
local GetSduiApiStoreFunction = require(Parent.SduiSharedUtilities).getSduiApiStore
local SduiSearchGuidedPillScopeModule = require(script.Parent.SduiSearchGuidedPillScope)
local Fields = SduiSearchGuidedPillScopeModule.Fields

local function _(p1)
	-- upvalues: GetSduiApiStoreFunction (copy)
	return GetSduiApiStoreFunction().isInFlight(p1)
end

local _ = function(p1)
	return if p1 == nil or p1 == "" then nil else p1
end

local function readBoundSuggestions(Suggestions)
	local List = {}
	
	if Suggestions == nil then
		return List
	end
	for _, suggestion in Suggestions do
		local Id = suggestion.id
		local Text = if Id == nil or Id == "" then nil else Id
		local DisplayName = suggestion.displayName
		local DisplayName1 = if DisplayName == nil or DisplayName == "" then nil else DisplayName
		
		if Text ~= nil and string.match(Text, "^sug_%d+$") and DisplayName1 ~= nil then
			table.insert(List, { id = Text, query = DisplayName1 })
		end
	end
	return List
end

local _ = function(p1, Id, p2): boolean
	-- upvalues: SduiSearchGuidedPillScopeModule (copy)
	if Id == "orig" then
		return true
	end
	local SuggestionsForRequest = SduiSearchGuidedPillScopeModule.getSuggestionsForRequest(p1)
	local SuggestionsForRequest1 = if SuggestionsForRequest == nil then p2 else SuggestionsForRequest
	for _, value in SuggestionsForRequest1 do
		if value.id == Id then
			return true
		end
	end
	return false
end

local _ = function(p3, p4, p5)
	-- upvalues: GetSduiClientPageScopeFunction (copy), Fields (copy)
	local SduiClientPageScope = GetSduiClientPageScopeFunction(p3)
	
	if SduiClientPageScope.get(Fields.SelectedPill) ~= p4 then return end
	SduiClientPageScope.set(Fields.SelectedPill, p5)
	
	if p5 == nil then
		SduiClientPageScope.set(Fields.Suggestions, nil)
	end
end

return {
	tapPill = function(p3)
		-- upvalues: GetSduiApiStoreFunction (copy), readBoundSuggestions (copy), GetSduiClientPageScopeFunction (copy), SduiSearchGuidedPillScopeModule (copy), Fields (copy), PromiseModule (copy)
		local ConfigKey = p3.configKey
		local SelectedOption = p3.selectedOption
		
		if GetSduiApiStoreFunction().isInFlight(ConfigKey) then
			return nil
		end
		local BoundSuggestions = readBoundSuggestions(p3.suggestions)
		local SduiClientPageScope = GetSduiClientPageScopeFunction(ConfigKey)
		local Flag = nil
		
		if SelectedOption == "orig" then
			Flag = true
		else
			local SuggestionsForRequest = SduiSearchGuidedPillScopeModule.getSuggestionsForRequest(ConfigKey)
			local BoundSuggestions1 = if SuggestionsForRequest == nil then BoundSuggestions else SuggestionsForRequest
			Flag = false
			
			for _, value in BoundSuggestions1 do
				if value.id == SelectedOption then
					Flag = true
					break
				end
			end
		end
		if Flag then
			local GetResult = SduiClientPageScope.get(Fields.SelectedPill)
			
			if typeof(GetResult) == "string" and GetResult == SelectedOption then
				return nil
			else
				SduiSearchGuidedPillScopeModule.freezeSuggestions(ConfigKey, BoundSuggestions)
				SduiClientPageScope.set(Fields.SelectedPill, SelectedOption)
				
				return GetSduiApiStoreFunction().refreshFromApi({ configKey = ConfigKey, loadTimer = p3.loadTimer }):andThen(function(Result)
					-- upvalues: SduiSearchGuidedPillScopeModule (upval), ConfigKey (copy), PromiseModule (upval)
					if Result == nil then
						SduiSearchGuidedPillScopeModule.clear(ConfigKey)
						
						return PromiseModule.reject("Guided pill refresh released")
					else
						return Result
					end
				end):catch(function(Err)
					-- upvalues: ConfigKey (copy), SelectedOption (copy), GetResult (copy), GetSduiClientPageScopeFunction (upval), Fields (upval), PromiseModule (upval)
					local SduiClientPageScope = GetSduiClientPageScopeFunction(ConfigKey)
					
					if SduiClientPageScope.get(Fields.SelectedPill) == SelectedOption then
						SduiClientPageScope.set(Fields.SelectedPill, GetResult)
						
						if GetResult == nil then
							SduiClientPageScope.set(Fields.Suggestions, nil)
						end
					end
					return PromiseModule.reject(Err)
				end)
			end
		else
			if p3.onUnknownOption then
				p3.onUnknownOption()
			end
			return nil
		end
	end,
	refreshFeed = function(p4)
		-- upvalues: GetSduiApiStoreFunction (copy), SduiSearchGuidedPillScopeModule (copy)
		return if GetSduiApiStoreFunction().isInFlight(p4.configKey) then nil else GetSduiApiStoreFunction().refreshFromApi({ configKey = p4.configKey, loadTimer = p4.loadTimer }):andThen(function(Result)
			-- upvalues: SduiSearchGuidedPillScopeModule (upval), p4 (copy)
			if Result == nil then
				SduiSearchGuidedPillScopeModule.clear(p4.configKey)
			end
			return Result
		end):catch(function() end)
	end
}