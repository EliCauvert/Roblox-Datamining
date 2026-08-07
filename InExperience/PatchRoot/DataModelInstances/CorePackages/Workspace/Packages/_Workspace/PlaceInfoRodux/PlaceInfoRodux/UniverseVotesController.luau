local parent = script:FindFirstAncestor("PlaceInfoRodux").Parent
local promiseModule = require(parent.Promise)
local httpModule = require(parent.Http)
local httpRequestModule = require(parent.HttpRequest)
local _ = require(parent.LuauPolyfill)
local url = httpModule.Url
local t = {}
t.__index = t

function t.new(p0) --[[ line: 66 ]]
	-- upvalues: httpRequestModule (ref), t (ref)
	return setmetatable({
		_universeVotes = {},
		_requestImpl = p0 or httpRequestModule.config({
			requestFunction = function(p1, p2, p3) --[[ line: 70 ]]
				-- upvalues: httpRequestModule (copy)
				return httpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
			end
		})
	}, t)
end

function t:upVotes(p4) --[[ line: 81 ]]
	return self:_getVotes(p4, "upVotes")
end

function t:downVotes(p5) --[[ line: 85 ]]
	return self:_getVotes(p5, "downVotes")
end

function t:rating(p6) --[[ line: 89 ]]
	return self:_getVotes(p6, "rating")
end

function t:_fetchUniversesVotes(p7) --[[ line: 95 ]]
	-- upvalues: url (ref)
	return self._requestImpl(string.format("%sv1/games/votes?%s", url.GAME_URL, url:makeQueryString({ universeIds = p7 })), "GET")
end

function t:getUniversesVotes(p8) --[[ line: 108 ]]
	-- upvalues: promiseModule (ref)
	local var4 = promiseModule.new(function(p9, p10) --[[ line: 111 ]]
		-- upvalues: self (ref), p8 (ref)
		self:_fetchUniversesVotes(p8):andThen(function(p12) --[[ line: 113 ]]
			-- upvalues: p9 (ref), self (copy)
			if not p12 or not p12.responseBody then
				p9(nil)
				
				return
			end
			local t = {}
			
			for i, v in p12.responseBody.data do
				local t_1 = {
					universeId = v.id,
					upVotes = v.upVotes,
					downVotes = v.downVotes,
					rating = if v.upVotes + v.downVotes == 0 then 0 else v.upVotes / (v.upVotes + v.downVotes)
				}
				t[v.id] = t_1
				self._universeVotes[v.id] = t_1
			end
			p9(t)
		end):catch(function(p11) --[[ line: 140 ]]
			-- upvalues: p10 (ref)
			p10(p11)
		end)
	end)
	local t = {}
	
	for i, v in p8 do
		if self._universeVotes[v] then
			t[v] = promiseModule.resolve(self._universeVotes[v])
		else
			self._universeVotes[v] = var4:andThen(function(p13) --[[ line: 152 ]]
				-- upvalues: v (ref)
				return p13[v]
			end)
			t[v] = self._universeVotes[v]
		end
	end
	return t
end

function t:_getVotes(p14, p15) --[[ line: 162 ]]
	-- upvalues: promiseModule (ref)
	return if self._universeVotes[p14] and self._universeVotes[p14][p15] then promiseModule.resolve(self._universeVotes[p14][p15]) elseif self._universeVotes[p14] then self._universeVotes[p14]:andThen(function(_) --[[ line: 169 ]]
		-- upvalues: self (ref), p14 (ref), p15 (ref)
		return self._universeVotes[p14][p15]
	end) else self:getUniversesVotes({ p14 })[p14]:andThen(function(p16) --[[ line: 174 ]]
		-- upvalues: p15 (ref)
		return p16[p15]
	end)
end

t.default = t.new()

return t