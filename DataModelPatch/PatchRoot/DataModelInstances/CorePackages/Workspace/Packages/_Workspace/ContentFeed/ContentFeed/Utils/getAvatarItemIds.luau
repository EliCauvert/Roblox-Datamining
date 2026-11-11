local HttpService = game:GetService("HttpService")

return function(Input)
	-- upvalues: HttpService (copy)
	if not Input then
		return nil
	end
	local Success, Result = pcall(function()
		-- upvalues: HttpService (upval), Input (copy)
		return HttpService:JSONDecode(Input)
	end)
	
	if not Success or not Result then
		return nil
	end
	local List = {}
	local t = {}
	
	local function _(List1)
		-- upvalues: t (copy), List (copy)
		for _, value in pairs(List1) do
			if not t[value] then
				table.insert(List, value)
				t[value] = true
			end
		end
	end
	
	if Result.avatarItems then
		for _, avatarItem in pairs(Result.avatarItems) do
			if not t[avatarItem] then
				table.insert(List, avatarItem)
				t[avatarItem] = true
			end
		end
	end
	if Result.userMetadata then
		for _, value in pairs(Result.userMetadata) do
			if value.avatarItems then
				for _, avatarItem1 in pairs(value.avatarItems) do
					if not t[avatarItem1] then
						table.insert(List, avatarItem1)
						t[avatarItem1] = true
					end
				end
			end
		end
	end
	return if next(List) == nil then nil else List
end