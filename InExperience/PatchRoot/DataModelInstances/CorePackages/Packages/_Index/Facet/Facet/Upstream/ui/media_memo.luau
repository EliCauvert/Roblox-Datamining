local _ = require("./types")
local self = setmetatable({}, { __mode = "k" })

local function _(p1)
	local Services = p1.config.services
	local ContentProvider = if Services then Services.ContentProvider else nil
	
	return if ContentProvider then ContentProvider else p1.runtime
end

local function remember(p1, p2)
	-- upvalues: self (copy)
	if p2 == "" then return end
	local Services = p1.config.services
	local ContentProvider = if Services then Services.ContentProvider else nil
	local ContentProvider1 = if ContentProvider then ContentProvider else p1.runtime
	local SelfEntry = self[ContentProvider1]
	
	if SelfEntry == nil then
		local config = { count = 0, current = {}, previous = {} }
		SelfEntry = config
		self[ContentProvider1] = config
	end
	local SelfEntry1 = SelfEntry
	
	if SelfEntry1.current[p2] then return end
	if SelfEntry1.count >= 256 then
		SelfEntry1.previous = SelfEntry1.current
		SelfEntry1.current = {}
		SelfEntry1.count = 0
	end
	SelfEntry1.current[p2] = true
	SelfEntry1.count += 1
end

return table.freeze({
	knows = function(p1, p2): boolean
		-- upvalues: self (copy), remember (copy)
		local Services = p1.config.services
		local ContentProvider = if Services then Services.ContentProvider else nil
		local SelfEntry = self[if ContentProvider then ContentProvider else p1.runtime]
		
		if SelfEntry == nil or p2 == "" then
			return false
		elseif SelfEntry.current[p2] then
			return true
		elseif SelfEntry.previous[p2] then
			remember(p1, p2)
			
			return true
		else
			return false
		end
	end,
	remember = remember,
	forget = function(p3, p4)
		-- upvalues: self (copy)
		local Services = p3.config.services
		local ContentProvider = if Services then Services.ContentProvider else nil
		local SelfEntry = self[if ContentProvider then ContentProvider else p3.runtime]
		
		if SelfEntry == nil then return end
		if SelfEntry.current[p4] then
			SelfEntry.current[p4] = nil
			SelfEntry.count -= 1
		end
		SelfEntry.previous[p4] = nil
	end,
	settle = function(p5, p6, Success)
		-- upvalues: remember (copy), self (copy)
		if Success == p5.types.Enum.AssetFetchStatus.Success then
			remember(p5, p6)
			
			return
		end
		local Services = p5.config.services
		local ContentProvider = if Services then Services.ContentProvider else nil
		local SelfEntry = self[if ContentProvider then ContentProvider else p5.runtime]
		
		if SelfEntry == nil then return end
		if SelfEntry.current[p6] then
			SelfEntry.current[p6] = nil
			SelfEntry.count -= 1
		end
		SelfEntry.previous[p6] = nil
	end,
	probe = function(p7, p8): boolean
		-- upvalues: remember (copy), self (copy)
		local Services = p7.config.services
		local ContentProvider = if Services then Services.ContentProvider else nil
		
		if ContentProvider == nil or p8 == "" then
			return false
		end
		local Success, Result = pcall(ContentProvider.GetAssetFetchStatus, ContentProvider, p8)
		
		if not Success then
			return false
		end
		local AssetFetchStatus = p7.types.Enum.AssetFetchStatus
		
		if Result == AssetFetchStatus.Success then
			remember(p7, p8)
			
			return true
		end
		if Result == AssetFetchStatus.Failure or Result == AssetFetchStatus.TimedOut then
			local Services1 = p7.config.services
			local ContentProvider1 = if Services1 then Services1.ContentProvider else nil
			local SelfEntry = self[if ContentProvider1 then ContentProvider1 else p7.runtime]
			
			if SelfEntry ~= nil then
				if SelfEntry.current[p8] then
					SelfEntry.current[p8] = nil
					SelfEntry.count -= 1
				end
				SelfEntry.previous[p8] = nil
			end
		end
		return false
	end
})