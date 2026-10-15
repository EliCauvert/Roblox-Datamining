local textChatService = game:GetService("TextChatService")
local isHistoricalMessageModule = require(script:FindFirstAncestor("ExpChat").isHistoricalMessage)

local function _(p1, p2)
	local ok, status = pcall(function()
		-- upvalues: p1 (ref)
		return p1.CoreMessageReceived
	end)
	
	if ok and status then
		status:Connect(p2)
		
		return true
	end
	return false
end

local _ = function(p1)
	return pcall(function()
		-- upvalues: p1 (ref)
		p1:ChatIsLoaded()
	end)
end

return function(p1, p2)
	-- upvalues: textChatService (ref), isHistoricalMessageModule (ref)
	local var1
	local var2 = if p2 then p2.service else textChatService
	local var3 = if p2 then p2.defer else function(p3)
		task.defer(p3)
	end
	local t = {}
	local var4 = false
	
	local function flush()
		-- upvalues: var4 (write), t (write), p1 (ref)
		var4 = false
		t = {}
		p1(t)
	end
	
	local var5 = function(p3)
		-- upvalues: isHistoricalMessageModule (copy), t (write), var4 (write), var3 (ref), flush (ref)
		if not isHistoricalMessageModule(p3) or p3.TextSource == nil then return end
		table.insert(t, p3)
		
		if not var4 then
			var4 = true
			var3(flush)
		end
	end
	
	local ok, status = pcall(function()
		-- upvalues: var2 (ref)
		return var2.CoreMessageReceived
	end)
	
	if ok and status then
		status:Connect(var5)
		var1 = true
	else
		var1 = false
	end
	return if var1 then pcall(function()
		-- upvalues: var2 (ref)
		var2:ChatIsLoaded()
	end) else false
end