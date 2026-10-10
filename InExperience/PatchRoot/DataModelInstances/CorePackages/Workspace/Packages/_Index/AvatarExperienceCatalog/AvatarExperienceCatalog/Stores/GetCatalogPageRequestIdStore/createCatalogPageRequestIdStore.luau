local httpService = game:GetService("HttpService")
local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local parent = avatarExperienceCatalog.Parent
local signalsModule = require(parent.Signals)
local normalizeScreenSizeForWire = require(parent.AvatarExperienceCommon).Utils.normalizeScreenSizeForWire
local sendAXCounterV2 = require(parent.AvatarExperienceAnalytics).sendAXCounterV2
local constantsModule = require(avatarExperienceCatalog.Constants)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXSduiBracedPageRequestId = avatarExperienceFlagsModule.FFlagAXSduiBracedPageRequestId
local fFlagAXSduiPageVariantRequestId = avatarExperienceFlagsModule.FFlagAXSduiPageVariantRequestId

local function _(p1, p2)
	-- upvalues: normalizeScreenSizeForWire (ref)
	return `{p1}|{normalizeScreenSizeForWire(p2)}`
end

return function()
	-- upvalues: signalsModule (ref), fFlagAXSduiBracedPageRequestId (ref), httpService (ref), sendAXCounterV2 (ref), constantsModule (ref), normalizeScreenSizeForWire (ref), fFlagAXSduiPageVariantRequestId (ref)
	local var1, var2 = signalsModule.createSignal({})
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	local function _()
		-- upvalues: fFlagAXSduiBracedPageRequestId (copy), httpService (copy)
		return if fFlagAXSduiBracedPageRequestId then httpService:GenerateGUID(true) else httpService:GenerateGUID(false)
	end
	
	local _ = function(value, p1)
		-- upvalues: var1 (ref), var2 (ref)
		local var3 = var1(false)
		
		if var3[value] == p1 then
			return
		end
		local cloned = table.clone(var3)
		cloned[value] = p1
		var2(cloned)
	end
	
	local function recordFetchedVariant(p1, p2, p3)
		-- upvalues: t_2 (ref), sendAXCounterV2 (copy), constantsModule (copy), normalizeScreenSizeForWire (copy)
		local var3 = t_2[p1]
		
		if var3 == nil then
			var3 = {}
			t_2[p1] = var3
		end
		if var3[p2] then return end
		if next(var3) ~= nil then
			sendAXCounterV2(constantsModule.COUNTERS.CatalogPageSecondVariantFetched, {
				identifier = p1,
				screenSize = normalizeScreenSizeForWire(p3)
			})
		end
		var3[p2] = true
	end
	
	local function getOrCreateVariantRequestIdForKey(p1, p2, p3)
		-- upvalues: t (ref), recordFetchedVariant (ref), t_1 (ref), var1 (ref), fFlagAXSduiBracedPageRequestId (copy), httpService (copy), var2 (ref)
		local var3 = t[p2]
		
		if var3 ~= nil then
			return var3
		end
		local var4
		recordFetchedVariant(p1, p2, p3)
		local _ = nil
		
		if t_1[p1] == nil then
			t_1[p1] = p2
			var4 = var1(false)[p1] or (if fFlagAXSduiBracedPageRequestId then httpService:GenerateGUID(true) else httpService:GenerateGUID(false))
		else
			var4 = if fFlagAXSduiBracedPageRequestId then httpService:GenerateGUID(true) else httpService:GenerateGUID(false)
		end
		t[p2] = var4
		
		if t_1[p1] == p2 then
			local var5 = var4
			local var6 = var1(false)
			
			if var6[p1] == var5 then
				return var4
			end
			local cloned = table.clone(var6)
			cloned[p1] = var5
			var2(cloned)
		end
		return var4
	end
	
	local function resetPageRequestId(value)
		-- upvalues: fFlagAXSduiPageVariantRequestId (copy), t_1 (ref), t (ref), var1 (ref), var2 (ref)
		if fFlagAXSduiPageVariantRequestId then
			local var3 = t_1[value]
			
			if var3 ~= nil then
				t[var3] = nil
			end
		end
		local var4 = var1(false)
		
		if var4[value] == nil then return end
		local t_2 = {}
		
		for i, v in var4 do
			if i ~= value then
				t_2[i] = v
			end
		end
		var2(t_2)
	end
	
	return {
		getPageRequestIdMap = var1,
		getOrCreatePageRequestId = function(p1)
			-- upvalues: fFlagAXSduiPageVariantRequestId (copy), t_1 (ref), t (ref), var1 (ref), fFlagAXSduiBracedPageRequestId (copy), httpService (copy), var2 (ref)
			local var5 = nil
			
			if fFlagAXSduiPageVariantRequestId then
				var5 = t_1[p1]
				
				if var5 ~= nil then
					local var6 = t[var5]
					
					if var6 ~= nil then
						return var6
					end
				end
			end
			local var7 = var1(false)
			local var8 = var7[p1]
			
			if var8 ~= nil then
				return var8
			end
			local var9 = if fFlagAXSduiBracedPageRequestId then if fFlagAXSduiBracedPageRequestId then httpService:GenerateGUID(true) else httpService:GenerateGUID(false) else httpService:GenerateGUID(false)
			
			if fFlagAXSduiPageVariantRequestId and var5 ~= nil then
				t[var5] = var9
			end
			local cloned = table.clone(var7)
			cloned[p1] = var9
			var2(cloned)
			
			return var9
		end,
		resetPageRequestId = resetPageRequestId,
		getOrCreatePageVariantRequestId = function(p1, p2)
			-- upvalues: getOrCreateVariantRequestIdForKey (ref), normalizeScreenSizeForWire (copy)
			return getOrCreateVariantRequestIdForKey(p1, `{p1}|{normalizeScreenSizeForWire(p2)}`, p2)
		end,
		activatePageVariant = function(p1, p2)
			-- upvalues: normalizeScreenSizeForWire (copy), getOrCreateVariantRequestIdForKey (ref), t_1 (ref), var1 (ref), var2 (ref)
			local var5 = `{p1}|{normalizeScreenSizeForWire(p2)}`
			local var6 = getOrCreateVariantRequestIdForKey(p1, var5, p2)
			t_1[p1] = var5
			local var7 = var1(false)
			
			if var7[p1] == var6 then
				return var6
			end
			local cloned = table.clone(var7)
			cloned[p1] = var6
			var2(cloned)
			
			return var6
		end,
		resetPageVariantRequestId = function(value, p1)
			-- upvalues: normalizeScreenSizeForWire (copy), t_1 (ref), t (ref), resetPageRequestId (ref)
			local var5 = `{value}|{normalizeScreenSizeForWire(p1)}`
			local var6 = t_1[value]
			t[var5] = nil
			
			if var6 == nil or var6 == var5 then
				resetPageRequestId(value)
			end
		end
	}
end