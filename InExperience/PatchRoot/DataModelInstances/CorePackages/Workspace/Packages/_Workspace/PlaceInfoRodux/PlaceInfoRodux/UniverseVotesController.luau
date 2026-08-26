local parent = script:FindFirstAncestor("PlaceInfoRodux").Parent
local promiseModule = require(parent.Promise)
local httpModule = require(parent.Http)
local httpRequestModule = require(parent.HttpRequest)
local _ = require(parent.LuauPolyfill)
local url = httpModule.Url
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: httpRequestModule (ref), t (ref)
	return setmetatable({
		_universeVotes = {},
		_requestImpl = p1 or httpRequestModule.config({
			requestFunction = function(p2, p3, p4)
				-- upvalues: httpRequestModule (copy)
				return httpRequestModule.requestFunctions.HttpRbxApi(p2, p3, p4)
			end
		})
	}, t)
end

function t:upVotes(p1)
	return self:_getVotes(p1, "upVotes")
end

function t:downVotes(p1)
	return self:_getVotes(p1, "downVotes")
end

function t:rating(p1)
	return self:_getVotes(p1, "rating")
end

function t:_fetchUniversesVotes(p1)
	-- upvalues: url (ref)
	return self._requestImpl(string.format("%sv1/games/votes?%s", url.GAME_URL, url:makeQueryString({ universeIds = p1 })), "GET")
end

function t:getUniversesVotes(p1)
	-- upvalues: promiseModule (ref)
	local var1 = promiseModule.new(function(p2, p3)
		-- upvalues: self (ref), p1 (ref)
		self:_fetchUniversesVotes(p1):andThen(function(p4)
			-- upvalues: p2 (ref), self (copy)
			if not p4 or not p4.responseBody then
				p2(nil)
				
				return
			end
			local t = {}
			
			for i, v in p4.responseBody.data do
				local t_1 = {
					universeId = v.id,
					upVotes = v.upVotes,
					downVotes = v.downVotes,
					rating = if v.upVotes + v.downVotes == 0 then 0 else v.upVotes / (v.upVotes + v.downVotes)
				}
				t[v.id] = t_1
				self._universeVotes[v.id] = t_1
			end
			p2(t)
		end):catch(function(p5)
			-- upvalues: p3 (ref)
			p3(p5)
		end)
	end)
	local t = {}
	
	for i, v in p1 do
		if self._universeVotes[v] then
			t[v] = promiseModule.resolve(self._universeVotes[v])
		else
			self._universeVotes[v] = var1:andThen(function(p4)
				-- upvalues: v (ref)
				return p4[v]
			end)
			t[v] = self._universeVotes[v]
		end
	end
	return t
end

function t:_getVotes(p4, p5)
	-- upvalues: promiseModule (ref)
	return if self._universeVotes[p4] and self._universeVotes[p4][p5] then promiseModule.resolve(self._universeVotes[p4][p5]) elseif self._universeVotes[p4] then self._universeVotes[p4]:andThen(function(_)
		-- upvalues: self (ref), p4 (ref), p5 (ref)
		return self._universeVotes[p4][p5]
	end) else self:getUniversesVotes({ p4 })[p4]:andThen(function(p6)
		-- upvalues: p5 (ref)
		return p6[p5]
	end)
end

t.default = t.new()

return t