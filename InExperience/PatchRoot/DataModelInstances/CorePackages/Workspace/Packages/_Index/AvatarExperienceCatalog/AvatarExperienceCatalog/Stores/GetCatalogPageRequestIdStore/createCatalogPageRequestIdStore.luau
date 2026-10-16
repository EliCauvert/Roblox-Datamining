local HttpService = game:GetService("HttpService")
local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Parent = AvatarExperienceCatalog.Parent
local SignalsModule = require(Parent.Signals)
local NormalizeScreenSizeForWireFunction = require(Parent.AvatarExperienceCommon).Utils.normalizeScreenSizeForWire
local SendAXCounterV2Function = require(Parent.AvatarExperienceAnalytics).sendAXCounterV2
local ConstantsModule = require(AvatarExperienceCatalog.Constants)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXSduiBracedPageRequestId = AvatarExperienceFlagsModule.FFlagAXSduiBracedPageRequestId
local FFlagAXSduiPageVariantRequestId = AvatarExperienceFlagsModule.FFlagAXSduiPageVariantRequestId
local FFlagAXSduiPublishRequestIdWithResponse = AvatarExperienceFlagsModule.FFlagAXSduiPublishRequestIdWithResponse

local function _(p1, p2): string --[[ Line: 60 | Named "getVariantKey" ]]
	-- upvalues: NormalizeScreenSizeForWireFunction (copy)
	return `{p1}|{NormalizeScreenSizeForWireFunction(p2)}`
end

return function() --[[ Line: 64 | Named "createCatalogPageRequestIdStore" ]]
	-- upvalues: SignalsModule (copy), FFlagAXSduiBracedPageRequestId (copy), HttpService (copy), SendAXCounterV2Function (copy), ConstantsModule (copy), NormalizeScreenSizeForWireFunction (copy), FFlagAXSduiPageVariantRequestId (copy), FFlagAXSduiPublishRequestIdWithResponse (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	local Guids = {}
	local Keys = {}
	local t = {}
	local Guids1 = {}
	
	local function _() --[[ Line: 74 | Named "generateRequestId" ]]
		-- upvalues: FFlagAXSduiBracedPageRequestId (upval), HttpService (upval)
		return if FFlagAXSduiBracedPageRequestId then HttpService:GenerateGUID(true) else HttpService:GenerateGUID(false)
	end
	
	local _ = function(Key, p1) --[[ Line: 81 | Named "setIdentifierRequestId" ]]
		-- upvalues: Signal (copy), Signal2 (copy)
		local SignalResult = Signal(false)
		
		if SignalResult[Key] ~= p1 then
			local Copy = table.clone(SignalResult)
			Copy[Key] = p1
			Signal2(Copy)
			
			return
		end
	end
	
	local function recordFetchedVariant(Key, Key1, p1) --[[ Line: 91 ]]
		-- upvalues: t (copy), SendAXCounterV2Function (upval), ConstantsModule (upval), NormalizeScreenSizeForWireFunction (upval)
		local Entry = t[Key]
		
		if Entry == nil then
			Entry = {}
			t[Key] = Entry
		end
		if Entry[Key1] then return end
		if next(Entry) ~= nil then
			SendAXCounterV2Function(ConstantsModule.COUNTERS.CatalogPageSecondVariantFetched, {
				identifier = Key,
				screenSize = NormalizeScreenSizeForWireFunction(p1)
			})
		end
		Entry[Key1] = true
	end
	
	local function getOrCreateVariantRequestIdForKey(Key, Key1, p1) --[[ Line: 109 ]]
		-- upvalues: Guids (copy), recordFetchedVariant (copy), Keys (copy), Signal (copy), FFlagAXSduiBracedPageRequestId (upval), HttpService (upval), Signal2 (copy)
		local Guid = Guids[Key1]
		
		if Guid ~= nil then
			return Guid
		end
		recordFetchedVariant(Key, Key1, p1)
		local SignalResultEntry = nil
		
		if Keys[Key] == nil then
			Keys[Key] = Key1
			SignalResultEntry = Signal(false)[Key] or (if FFlagAXSduiBracedPageRequestId then HttpService:GenerateGUID(true) else HttpService:GenerateGUID(false))
		else
			SignalResultEntry = if FFlagAXSduiBracedPageRequestId then HttpService:GenerateGUID(true) else HttpService:GenerateGUID(false)
		end
		Guids[Key1] = SignalResultEntry
		
		if Keys[Key] == Key1 then
			local Guid1 = SignalResultEntry
			local SignalResult = Signal(false)
			
			if SignalResult[Key] == Guid1 then
				return SignalResultEntry
			end
			local Copy = table.clone(SignalResult)
			Copy[Key] = Guid1
			Signal2(Copy)
		end
		return SignalResultEntry
	end
	
	local function resetPageRequestId(p1) --[[ Line: 164 ]]
		-- upvalues: FFlagAXSduiPageVariantRequestId (upval), Keys (copy), Guids (copy), Signal (copy), Signal2 (copy)
		if FFlagAXSduiPageVariantRequestId then
			local Key = Keys[p1]
			
			if Key ~= nil then
				Guids[Key] = nil
			end
		end
		local SignalResult = Signal(false)
		
		if SignalResult[p1] == nil then return end
		local t = {}
		
		for i, value in SignalResult do
			if i ~= p1 then
				t[i] = value
			end
		end
		Signal2(t)
	end
	
	return {
		getPageRequestIdMap = Signal,
		getOrCreatePageRequestId = function(Key) --[[ Line: 134 ]]
			-- upvalues: FFlagAXSduiPageVariantRequestId (upval), Keys (copy), Guids (copy), Signal (copy), FFlagAXSduiBracedPageRequestId (upval), HttpService (upval), Signal2 (copy)
			local v1 = nil
			
			if FFlagAXSduiPageVariantRequestId then
				v1 = Keys[Key]
				
				if v1 ~= nil then
					local Guid = Guids[v1]
					
					if Guid ~= nil then
						return Guid
					end
				end
			end
			local SignalResult = Signal(false)
			local SignalResultEntry = SignalResult[Key]
			
			if SignalResultEntry ~= nil then
				return SignalResultEntry
			end
			local Guid = if FFlagAXSduiBracedPageRequestId and FFlagAXSduiBracedPageRequestId then HttpService:GenerateGUID(true) else HttpService:GenerateGUID(false)
			
			if FFlagAXSduiPageVariantRequestId and v1 ~= nil then
				Guids[v1] = Guid
			end
			local Copy = table.clone(SignalResult)
			Copy[Key] = Guid
			Signal2(Copy)
			
			return Guid
		end,
		resetPageRequestId = resetPageRequestId,
		getOrCreatePageVariantRequestId = function(Key, p2) --[[ Line: 186 ]]
			-- upvalues: getOrCreateVariantRequestIdForKey (copy), NormalizeScreenSizeForWireFunction (upval)
			return (getOrCreateVariantRequestIdForKey(Key, `{Key}|{NormalizeScreenSizeForWireFunction(p2)}`, p2))
		end,
		activatePageVariant = function(Key, p2) --[[ Line: 190 ]]
			-- upvalues: NormalizeScreenSizeForWireFunction (upval), getOrCreateVariantRequestIdForKey (copy), Keys (copy), Signal (copy), Signal2 (copy)
			local Text: string = `{Key}|{NormalizeScreenSizeForWireFunction(p2)}`
			local OrCreateVariantRequestIdForKey = getOrCreateVariantRequestIdForKey(Key, Text, p2)
			Keys[Key] = Text
			local SignalResult = Signal(false)
			
			if SignalResult[Key] == OrCreateVariantRequestIdForKey then
				return OrCreateVariantRequestIdForKey
			else
				local Copy = table.clone(SignalResult)
				Copy[Key] = OrCreateVariantRequestIdForKey
				Signal2(Copy)
				
				return OrCreateVariantRequestIdForKey
			end
		end,
		resetPageVariantRequestId = function(p2, p3) --[[ Line: 198 ]]
			-- upvalues: NormalizeScreenSizeForWireFunction (upval), Keys (copy), Guids (copy), FFlagAXSduiPublishRequestIdWithResponse (upval), Guids1 (copy), resetPageRequestId (copy)
			local Text: string = `{p2}|{NormalizeScreenSizeForWireFunction(p3)}`
			local Key = Keys[p2]
			Guids[Text] = nil
			
			if FFlagAXSduiPublishRequestIdWithResponse then
				Guids1[Text] = nil
			end
			if Key == nil or Key == Text then
				resetPageRequestId(p2)
			end
		end,
		beginPageVariantRefresh = function(Key, p2) --[[ Line: 211 ]]
			-- upvalues: NormalizeScreenSizeForWireFunction (upval), Guids (copy), getOrCreateVariantRequestIdForKey (copy), FFlagAXSduiBracedPageRequestId (upval), HttpService (upval), Guids1 (copy)
			local Text: string = `{Key}|{NormalizeScreenSizeForWireFunction(p2)}`
			
			if Guids[Text] == nil then
				return (getOrCreateVariantRequestIdForKey(Key, Text, p2))
			else
				local Guid = if FFlagAXSduiBracedPageRequestId then HttpService:GenerateGUID(true) else HttpService:GenerateGUID(false)
				Guids1[Text] = Guid
				
				return Guid
			end
		end,
		getPageVariantRequestIdToSend = function(Key, p2) --[[ Line: 222 ]]
			-- upvalues: NormalizeScreenSizeForWireFunction (upval), Guids1 (copy), getOrCreateVariantRequestIdForKey (copy)
			local Text: string = `{Key}|{NormalizeScreenSizeForWireFunction(p2)}`
			
			return Guids1[Text] or getOrCreateVariantRequestIdForKey(Key, Text, p2)
		end,
		commitPageVariantRequestId = function(Key, p2, p3) --[[ Line: 228 ]]
			-- upvalues: NormalizeScreenSizeForWireFunction (upval), Guids1 (copy), Guids (copy), Keys (copy), Signal (copy), Signal2 (copy)
			local Text: string = `{Key}|{NormalizeScreenSizeForWireFunction(p2)}`
			
			if Guids1[Text] ~= p3 then return end
			Guids1[Text] = nil
			Guids[Text] = p3
			
			if Keys[Key] == Text then
				local SignalResult = Signal(false)
				
				if SignalResult[Key] == p3 then return end
				local Copy = table.clone(SignalResult)
				Copy[Key] = p3
				Signal2(Copy)
			end
		end,
		discardPageVariantRequestId = function(p2, p3, p4) --[[ Line: 240 ]]
			-- upvalues: NormalizeScreenSizeForWireFunction (upval), Guids1 (copy)
			local Text: string = `{p2}|{NormalizeScreenSizeForWireFunction(p3)}`
			
			if Guids1[Text] == p4 then
				Guids1[Text] = nil
			end
		end,
		getPageVariantRequestId = function(p2, p3) --[[ Line: 247 ]]
			-- upvalues: Guids (copy), NormalizeScreenSizeForWireFunction (upval)
			return Guids[`{p2}|{NormalizeScreenSizeForWireFunction(p3)}`]
		end
	}
end