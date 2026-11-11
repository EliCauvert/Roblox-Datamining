local Parent = script:FindFirstAncestor("GameDetailRodux").Parent
local PromiseModule = require(Parent.Promise)
local Url = require(Parent.Http).Url
local t = {}

return function(Callback, Key)
	-- upvalues: t (copy), Url (copy), PromiseModule (copy)
	if t[Key] then
		return t[Key]
	else
		t[Key] = Callback(string.format("%sv1/games?universeIds=%s", Url.GAME_URL, (tostring(Key))), "GET"):andThen(function(Result)
			-- upvalues: PromiseModule (upval)
			if not Result.responseBody or not Result.responseBody.data then
				PromiseModule.reject("Unexpected response when fetching game name")
			end
			local Entry = Result.responseBody.data[1]
			
			if not Entry or not Entry.name then
				PromiseModule.reject("Unexpected response when fetching game name, no game info")
			end
			return PromiseModule.resolve({
				Name = Entry.name,
				Description = Entry.description or "",
				Created = Entry.created
			})
		end, function(p1)
			-- upvalues: PromiseModule (upval)
			return PromiseModule.reject(p1)
		end)
		
		return t[Key]
	end
end