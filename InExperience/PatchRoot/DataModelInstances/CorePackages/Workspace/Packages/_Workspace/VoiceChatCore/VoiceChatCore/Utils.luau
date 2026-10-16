local HttpService = game:GetService("HttpService")
local Players = game:GetService("Players")
local Module = {}
Module.__index = Module

function Module.new() --[[ Line: 18 ]]
	-- upvalues: Module (copy)
	return (setmetatable({ listeners = {} }, Module))
end

function Module:addListener(p1, p2) --[[ Line: 26 ]]
	if not self.listeners[p1] then
		self.listeners[p1] = {}
	end
	table.insert(self.listeners[p1], p2)
end

function Module:removeListener(p1, Value) --[[ Line: 33 ]]
	local Listener = self.listeners[p1]
	
	if not Listener then return end
	local FoundIndex: number? = table.find(Listener, Value)
	
	if FoundIndex then
		table.remove(Listener, FoundIndex)
		
		if #Listener == 0 then
			self.listeners[p1] = nil
		end
	end
end

function Module:removeAllListeners() --[[ Line: 48 ]]
	table.clear(self.listeners)
end

function Module:emit(p1, ...) --[[ Line: 52 ]]
	local Listener = self.listeners[p1]
	
	if not Listener then return end
	for _, value in table.clone(Listener) do
		pcall(function(...) --[[ Line: 60 ]]
			-- upvalues: value (copy)
			value(...)
			
			return nil
		end, ...)
	end
end

return {
	jsonDecode = function(Input) --[[ Line: 67 ]]
		-- upvalues: HttpService (copy)
		local Success, Result = pcall(function() --[[ Line: 68 ]]
			-- upvalues: HttpService (upval), Input (copy)
			return HttpService:JSONDecode(Input)
		end)
		
		return if Success and Result then Result else {}
	end,
	EventEmitter = Module,
	shorten = function(p2): string --[[ Line: 78 ]]
		return "..." .. string.sub(tostring(p2), -4)
	end,
	avoidEmitting = function(Object) --[[ Line: 82 ]]
		Object.DescendantAdded:Connect(function(Descendant) --[[ Line: 83 | Named "prune" ]]
			if Descendant:HasTag("RbxDefaultVoiceEmitter") then
				task.defer(function() --[[ Line: 86 ]]
					-- upvalues: Descendant (copy)
					Descendant:Destroy()
				end)
			end
		end)
		
		for _, descendant in Object:GetDescendants() do
			if descendant:HasTag("RbxDefaultVoiceEmitter") then
				task.defer(function() --[[ Line: 86 ]]
					-- upvalues: descendant (copy)
					descendant:Destroy()
				end)
			end
		end
	end,
	destroyDefaultEmitter = function(Object) --[[ Line: 97 ]]
		-- upvalues: Players (copy)
		local LocalPlayer = Players.LocalPlayer
		
		if not LocalPlayer then return end
		local Character = LocalPlayer.Character
		
		if not Character then return end
		if Object:IsDescendantOf(Character) then
			task.defer(function() --[[ Line: 108 ]]
				-- upvalues: Object (copy)
				Object:Destroy()
			end)
		end
	end,
	bind = function(p2, p3) --[[ Line: 114 ]]
		return function(...) --[[ Line: 115 ]]
			-- upvalues: p2 (copy), p3 (copy)
			return p2[p3](p2, ...)
		end
	end
}