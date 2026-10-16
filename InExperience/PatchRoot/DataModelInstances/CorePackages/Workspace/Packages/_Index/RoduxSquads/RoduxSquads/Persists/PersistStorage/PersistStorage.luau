local MemStorageService = game:GetService("MemStorageService")
local HttpService = game:GetService("HttpService")
local PersistStorageModule = {}
PersistStorageModule.__index = PersistStorageModule

function PersistStorageModule.new(MemStorageKey) --[[ Line: 14 ]]
	-- upvalues: PersistStorageModule (copy)
	return (setmetatable({ memStorageKey = MemStorageKey }, PersistStorageModule))
end

function PersistStorageModule.getItem(p1) --[[ Line: 21 ]]
	-- upvalues: MemStorageService (copy), HttpService (copy)
	local Success, Result = pcall(function() --[[ Line: 22 ]]
		-- upvalues: MemStorageService (upval), p1 (copy), HttpService (upval)
		local Item = MemStorageService:GetItem(p1.memStorageKey)
		
		return if Item and Item ~= "" then HttpService:JSONDecode(Item) else nil
	end)
	
	return if Success then Result else nil
end

function PersistStorageModule.setItem(p1, Input) --[[ Line: 35 ]]
	-- upvalues: MemStorageService (copy), HttpService (copy)
	local Success, _ = pcall(function() --[[ Line: 36 ]]
		-- upvalues: MemStorageService (upval), p1 (copy), Input (copy), HttpService (upval)
		MemStorageService:SetItem(p1.memStorageKey, if Input and Input ~= "" then HttpService:JSONEncode(Input) else "")
	end)
	
	return Success
end

function PersistStorageModule:bindAndFire(Callback) --[[ Line: 42 ]]
	-- upvalues: MemStorageService (copy), HttpService (copy)
	return (MemStorageService:BindAndFire(self.memStorageKey, function(Input) --[[ Line: 43 ]]
		-- upvalues: HttpService (upval), Callback (copy)
		local Data = if Input and Input ~= "" then HttpService:JSONDecode(Input) else nil
		
		if Callback then
			Callback(Data)
		end
	end))
end

return PersistStorageModule