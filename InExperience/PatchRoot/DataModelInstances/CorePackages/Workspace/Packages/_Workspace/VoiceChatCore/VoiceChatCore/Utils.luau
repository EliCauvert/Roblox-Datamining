local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local t = {}
t.__index = t

function t.new() --[[ line: 17 ]]
	-- upvalues: t (ref)
	return setmetatable({ listeners = {} }, t)
end

function t:addListener(p0, p1) --[[ line: 25 ]]
	if not self.listeners[p0] then
		self.listeners[p0] = {}
	end
	table.insert(self.listeners[p0], p1)
end

function t:removeAllListeners() --[[ line: 32 ]]
	table.clear(self.listeners)
end

function t:emit(p2, ...) --[[ line: 36 ]]
	local var3 = self.listeners[p2]
	
	if not var3 then return end
	for i, v in table.clone(var3) do
		pcall(function(...) --[[ line: 44 ]]
			-- upvalues: v (ref)
			v(...)
			
			return nil
		end, ...)
	end
end

return {
	jsonDecode = function(p3) --[[ line: 51 ]]
		-- upvalues: httpService (ref)
		local ok, status = pcall(function() --[[ line: 52 ]]
			-- upvalues: httpService (copy), p3 (ref)
			return httpService:JSONDecode(p3)
		end)
		
		return if ok and status then status else {}
	end,
	EventEmitter = t,
	shorten = function(p4) --[[ line: 62 ]]
		return "..." .. string.sub(tostring(p4), -4)
	end,
	avoidEmitting = function(p5) --[[ line: 66 ]]
		p5.DescendantAdded:Connect(function(p6) --[[ line: 67 | named "prune" ]]
			if p6:HasTag("RbxDefaultVoiceEmitter") then
				task.defer(function() --[[ line: 70 ]]
					-- upvalues: p6 (ref)
					p6:Destroy()
				end)
			end
		end)
		
		for i, v in p5:GetDescendants() do
			if v:HasTag("RbxDefaultVoiceEmitter") then
				task.defer(function() --[[ line: 70 ]]
					-- upvalues: v (ref)
					v:Destroy()
				end)
			end
		end
	end,
	destroyDefaultEmitter = function(p7) --[[ line: 81 ]]
		-- upvalues: playersService (ref)
		local localPlayer = playersService.LocalPlayer
		
		if not localPlayer then return end
		local character = localPlayer.Character
		
		if not character then return end
		if p7:IsDescendantOf(character) then
			task.defer(function() --[[ line: 92 ]]
				-- upvalues: p7 (ref)
				p7:Destroy()
			end)
		end
	end,
	bind = function(p8, p9) --[[ line: 98 ]]
		return function(...) --[[ line: 99 ]]
			-- upvalues: p8 (ref), p9 (ref)
			return p8[p9](p8, ...)
		end
	end
}