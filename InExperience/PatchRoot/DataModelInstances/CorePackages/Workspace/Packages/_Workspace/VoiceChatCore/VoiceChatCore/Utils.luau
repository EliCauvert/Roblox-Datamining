local httpService = game:GetService("HttpService")
local playersService = game:GetService("Players")
local t = {}
t.__index = t

function t.new()
	-- upvalues: t (ref)
	return setmetatable({ listeners = {} }, t)
end

function t:addListener(p0, p1)
	if not self.listeners[p0] then
		self.listeners[p0] = {}
	end
	table.insert(self.listeners[p0], p1)
end

function t:removeListener(p2, p3)
	local var3 = self.listeners[p2]
	
	if not var3 then return end
	local index = table.find(var3, p3)
	
	if index then
		table.remove(var3, index)
		
		if #var3 == 0 then
			self.listeners[p2] = nil
		end
	end
end

function t:removeAllListeners()
	table.clear(self.listeners)
end

function t:emit(p4, ...)
	local var5 = self.listeners[p4]
	
	if not var5 then return end
	for i, v in table.clone(var5) do
		pcall(function(...)
			-- upvalues: v (ref)
			v(...)
			
			return nil
		end, ...)
	end
end

return {
	jsonDecode = function(p5)
		-- upvalues: httpService (ref)
		local ok, status = pcall(function()
			-- upvalues: httpService (copy), p5 (ref)
			return httpService:JSONDecode(p5)
		end)
		
		return if ok and status then status else {}
	end,
	EventEmitter = t,
	shorten = function(p6)
		return "..." .. string.sub(tostring(p6), -4)
	end,
	avoidEmitting = function(p7)
		p7.DescendantAdded:Connect(function(p8)
			if p8:HasTag("RbxDefaultVoiceEmitter") then
				task.defer(function()
					-- upvalues: p8 (ref)
					p8:Destroy()
				end)
			end
		end)
		
		for i, v in p7:GetDescendants() do
			if v:HasTag("RbxDefaultVoiceEmitter") then
				task.defer(function()
					-- upvalues: v (ref)
					v:Destroy()
				end)
			end
		end
	end,
	destroyDefaultEmitter = function(p9)
		-- upvalues: playersService (ref)
		local localPlayer = playersService.LocalPlayer
		
		if not localPlayer then return end
		local character = localPlayer.Character
		
		if not character then return end
		if p9:IsDescendantOf(character) then
			task.defer(function()
				-- upvalues: p9 (ref)
				p9:Destroy()
			end)
		end
	end,
	bind = function(p10, p11)
		return function(...)
			-- upvalues: p10 (ref), p11 (ref)
			return p10[p11](p10, ...)
		end
	end
}