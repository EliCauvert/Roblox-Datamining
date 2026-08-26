local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	return setmetatable({ listeners = {} }, t)
end

function t:addListener(p1, p2)
	if not self.listeners[p1] then
		self.listeners[p1] = {}
	end
	table.insert(self.listeners[p1], p2)
end

function t:removeListener(p1, p2)
	local var1 = self.listeners[p1]
	
	if not var1 then return end
	local index = table.find(var1, p2)
	
	if index then
		table.remove(var1, index)
		
		if #var1 == 0 then
			self.listeners[p1] = nil
		end
	end
end

function t:removeAllListeners()
	table.clear(self.listeners)
end

function t:emit(p1, ...)
	local var1 = self.listeners[p1]
	
	if not var1 then return end
	for i, v in table.clone(var1) do
		pcall(function(...)
			-- upvalues: v (ref)
			v(...)
			
			return nil
		end, ...)
	end
end

return {
	jsonDecode = function(p2)
		-- upvalues: httpService (ref)
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), p2 (ref)
			return httpService:JSONDecode(p2)
		end)
		
		return if ok and status then status else {}
	end,
	EventEmitter = t,
	shorten = function(p2)
		return "..." .. string.sub(tostring(p2), -4)
	end,
	avoidEmitting = function(p2)
		p2.DescendantAdded:Connect(function(p3)
			if p3:HasTag("RbxDefaultVoiceEmitter") then
				task.defer(function()
					-- upvalues: p3 (ref)
					p3:Destroy()
				end)
			end
		end)
		
		for i, v in p2:GetDescendants() do
			if v:HasTag("RbxDefaultVoiceEmitter") then
				task.defer(function()
					-- upvalues: v (ref)
					v:Destroy()
				end)
			end
		end
	end,
	destroyDefaultEmitter = function(p3)
		-- upvalues: playersService (ref)
		local localPlayer = playersService.LocalPlayer
		
		if not localPlayer then return end
		local character = localPlayer.Character
		
		if not character then return end
		if p3:IsDescendantOf(character) then
			task.defer(function()
				-- upvalues: p3 (ref)
				p3:Destroy()
			end)
		end
	end,
	bind = function(p3, p4)
		return function(...)
			-- upvalues: p3 (ref), p4 (ref)
			return p3[p4](p3, ...)
		end
	end
}