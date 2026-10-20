local Parent = script:FindFirstAncestor("PlaceInfoRodux").Parent
local PromiseModule = require(Parent.Promise)
local HttpRequestModule = require(Parent.HttpRequest)
local _ = require(Parent.LuauPolyfill)
local Url = require(Parent.Http).Url
local UniverseVotesController = {}
UniverseVotesController.__index = UniverseVotesController

function UniverseVotesController.new(p1)
	-- upvalues: HttpRequestModule (copy), UniverseVotesController (copy)
	local ConfigResult = HttpRequestModule.config({
		requestFunction = function(p2, p3, p4)
			-- upvalues: HttpRequestModule (upval)
			return HttpRequestModule.requestFunctions.HttpRbxApi(p2, p3, p4)
		end
	})
	
	return (setmetatable({ _universeVotes = {}, _requestImpl = p1 or ConfigResult }, UniverseVotesController))
end

function UniverseVotesController:upVotes(p1)
	return self:_getVotes(p1, "upVotes")
end

function UniverseVotesController:downVotes(p1)
	return self:_getVotes(p1, "downVotes")
end

function UniverseVotesController:rating(p1)
	return self:_getVotes(p1, "rating")
end

function UniverseVotesController:_fetchUniversesVotes(UniverseIds)
	-- upvalues: Url (copy)
	return self._requestImpl(string.format("%sv1/games/votes?%s", Url.GAME_URL, (Url:makeQueryString({ universeIds = UniverseIds }))), "GET")
end

function UniverseVotesController:getUniversesVotes(UniverseIds)
	-- upvalues: PromiseModule (copy)
	local NewPromise = PromiseModule.new(function(Callback, Callback1)
		-- upvalues: self (copy), UniverseIds (copy)
		self:_fetchUniversesVotes(UniverseIds):andThen(function(Result)
			-- upvalues: Callback (copy), self (upval)
			if not Result or not Result.responseBody then
				Callback(nil)
				
				return
			end
			local t = {}
			
			for _, entry in Result.responseBody.data do
				local config = {
					universeId = entry.id,
					upVotes = entry.upVotes,
					downVotes = entry.downVotes,
					rating = if entry.upVotes + entry.downVotes == 0 then 0 else entry.upVotes / (entry.upVotes + entry.downVotes)
				}
				t[entry.id] = config
				self._universeVotes[entry.id] = config
			end
			Callback(t)
		end):catch(function(Err)
			-- upvalues: Callback1 (copy)
			Callback1(Err)
		end)
	end)
	local ResolveResults = {}
	
	for _, universeId in UniverseIds do
		if self._universeVotes[universeId] then
			ResolveResults[universeId] = PromiseModule.resolve(self._universeVotes[universeId])
		else
			self._universeVotes[universeId] = NewPromise:andThen(function(Result)
				-- upvalues: universeId (copy)
				return Result[universeId]
			end)
			ResolveResults[universeId] = self._universeVotes[universeId]
		end
	end
	return ResolveResults
end

function UniverseVotesController._getVotes(p1, p2, p3)
	-- upvalues: PromiseModule (copy)
	return if p1._universeVotes[p2] and p1._universeVotes[p2][p3] then PromiseModule.resolve(p1._universeVotes[p2][p3]) elseif p1._universeVotes[p2] then p1._universeVotes[p2]:andThen(function(_)
		-- upvalues: p1 (copy), p2 (copy), p3 (copy)
		return p1._universeVotes[p2][p3]
	end) else p1:getUniversesVotes({ p2 })[p2]:andThen(function(Result)
		-- upvalues: p3 (copy)
		return Result[p3]
	end)
end

UniverseVotesController.default = UniverseVotesController.new()

return UniverseVotesController