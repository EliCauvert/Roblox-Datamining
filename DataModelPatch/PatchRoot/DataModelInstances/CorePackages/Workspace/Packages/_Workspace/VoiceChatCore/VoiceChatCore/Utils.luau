local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Module = {}
Module.__index = Module

function Module.new()
	-- upvalues: Module (copy)
	return (setmetatable({ listeners = {} }, Module))
end

function Module:addListener(p1, p2)
	if not self.listeners[p1] then
		self.listeners[p1] = {}
	end
	table.insert(self.listeners[p1], p2)
end

function Module:removeAllListeners()
	table.clear(self.listeners)
end

function Module:emit(p1, ...)
	local Listener = self.listeners[p1]
	
	if not Listener then return end
	for _, value in table.clone(Listener) do
		pcall(function(...)
			-- upvalues: value (copy)
			value(...)
			
			return nil
		end, ...)
	end
end

return {
	jsonDecode = function(Input)
		-- upvalues: HttpService (copy)
		local Success, Result = pcall(function()
			-- upvalues: HttpService (upval), Input (copy)
			return HttpService:JSONDecode(Input)
		end)
		
		return if Success and Result then Result else {}
	end,
	EventEmitter = Module,
	shorten = function(p2): string
		return "..." .. string.sub(tostring(p2), -4)
	end,
	avoidEmitting = function(Object)
		Object.DescendantAdded:Connect(function(Descendant)
			if Descendant:HasTag("RbxDefaultVoiceEmitter") then
				task.defer(function()
					-- upvalues: Descendant (copy)
					Descendant:Destroy()
				end)
			end
		end)
		
		for _, descendant in Object:GetDescendants() do
			if descendant:HasTag("RbxDefaultVoiceEmitter") then
				task.defer(function()
					-- upvalues: descendant (copy)
					descendant:Destroy()
				end)
			end
		end
	end,
	destroyDefaultEmitter = function(Object)
		-- upvalues: Players (copy)
		local LocalPlayer = Players.LocalPlayer
		
		if not LocalPlayer then return end
		local Character = LocalPlayer.Character
		
		if not Character then return end
		if Object:IsDescendantOf(Character) then
			task.defer(function()
				-- upvalues: Object (copy)
				Object:Destroy()
			end)
		end
	end,
	bind = function(p2, p3)
		return function(...)
			-- upvalues: p2 (copy), p3 (copy)
			return p2[p3](p2, ...)
		end
	end
}